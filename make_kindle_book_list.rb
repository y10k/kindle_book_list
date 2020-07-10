#!/usr/local/bin/ruby
# -*- coding: utf-8 -*-

require 'rexml/document'

pp REXML::Document.new(ARGF.read)

# Local Variables:
# mode: Ruby
# indent-tabs-mode: nil
# End:
