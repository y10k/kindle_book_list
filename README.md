Kindle for PCの管理情報からKindleの蔵書リストを抽出する
=======================================================

```sh
$ rake -T
rake csv     # make Kindle book list CSV => /mnt/c/Users/toki/Documents/Kindle.csv
rake dump    # for debug
rake readme  # make README.html from markdown source
$ rake
ruby make_kindle_book_list.rb /mnt/c/Users/username/AppData/Local/Amazon/Kindle/Cache/KindleSyncMetadataCache.xml >/mnt/c/Users/username/Documents/Kindle.csv
```
