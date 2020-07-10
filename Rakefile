# -*- coding: utf-8 -*-

KINDLE_SYNC_METADATA_CACHE = ENV['METADATA'] || '/mnt/c/Users/username/AppData/Local/Amazon/Kindle/Cache/KindleSyncMetadataCache.xml'

task :dump do
  ruby 'make_kindle_book_list.rb', KINDLE_SYNC_METADATA_CACHE
end

# Local Variables:
# mode: Ruby
# indent-tabs-mode: nil
# End:
