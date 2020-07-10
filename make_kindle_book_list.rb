#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-

require 'csv'
require 'rexml/document'
require 'set'
require 'time'

def format_if_datetime(text)
  case (text)
  when /\A \d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d\d \b/x
    t = Time.parse(text)
    t.localtime.strftime('%Y-%m-%d %H:%M:%S')
  else
    text
  end
end

def get_content(name, value, attrs)
  row = {}
  row[name] = format_if_datetime(value)
  for attr_name, attr_value in attrs
    row[name + '#' + attr_name] = format_if_datetime(attr_value)
  end

  row
end

records = []

doc = REXML::Document.new(ARGF.read)
add_update_list = doc.elements['//response/add_update_list']
for meta_data in add_update_list
  row = {}
  for column in meta_data
    if (column.has_elements?) then
      column.elements.each_with_index do |subcolumn, i|
        subcol_name = subcolumn.name
        subcol_name += '[%d]' % (i + 1) if (i > 0)
        row.update(get_content(subcol_name, subcolumn.text, subcolumn.attributes))
      end
    elsif (column.text.nil?) then
      # skip
    else
      row.update(get_content(column.name, column.text, column.attributes))
    end
  end
  records << row
end

column_name_set = [].to_set
for row in records
  row.each_key do |name|
    column_name_set << name
  end
end

column_name_list = column_name_set.to_a.sort_by{|name|
  if (name =~ /#/) then
    column_name = $`
    attr_name = $'
  else
    column_name = name
    attr_name = ''
  end

  if (column_name =~ /\[(\d+)\] \z/x) then
    column_name = $`
    index = $1.to_i
  else
    index = 0
  end

  [ column_name, index, attr_name ]
}

puts CSV.generate{|csv|
  csv << column_name_list
  for row in records
    csv << column_name_list.map{|name| row[name] }
  end
}.encode('shift_jis', invalid: :replace, undef: :replace) # for Excel on Japanese Locale

# Local Variables:
# mode: Ruby
# indent-tabs-mode: nil
# End:
