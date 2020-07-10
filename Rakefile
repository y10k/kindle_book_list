# -*- coding: utf-8 -*-

require 'etc'

USERDATA                   = ENV['USERDATA'] ||
                             "/mnt/c/Users/#{Etc.getlogin}"
DEST                       = ENV['DEST'] ||
                             "#{USERDATA}/Documents"
KINDLE_SYNC_METADATA_CACHE = ENV['METADATA'] ||
                             "#{USERDATA}/AppData/Local/Amazon/Kindle/Cache/KindleSyncMetadataCache.xml"

task :default => :csv

desc "make Kindle book list CSV => #{DEST}/Kindle.csv"
task :csv do
  ruby "make_kindle_book_list.rb #{KINDLE_SYNC_METADATA_CACHE} >#{DEST}/Kindle.csv"
end

desc 'for debug'
task :dump do
  ruby 'make_kindle_book_list.rb', KINDLE_SYNC_METADATA_CACHE
end

# Local Variables:
# mode: Ruby
# indent-tabs-mode: nil
# End:
