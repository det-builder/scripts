# This command will copy the EXIF Create date to the Create & Modify Date fields for ALL jpg's in directory.
exiftool '-MDItemFSCreationDate<DateTimeOriginal' '-FileModifyDate<DateTimeOriginal' -overwrite_original_in_place -P -ext jpg -ext jpeg .

# This command will show the properties and their values for a given image.
exiftool -s image.jpg

# This command will change the model of the camera that took the photo to something else while preserving last modify date.
exiftool -P -Model='iPhone XS Max' image.jpg

# This command creates a csv named "list.csv" in the current directory of the jpg's in the current diretory.
exiftool -csv -FileModifyDate -FileAccessDate -FileCreateDate -MDItemFSCreationDate -ModifyDate -DateTimeOriginal -CreateDate *.jpg > list.csv

# This command will parse through current directory and all it's subdirectories and set the files create & modify date
# to the EXIF date for all files with the "JPG" extension.
exiftool -d %Y%m%d "-filename<datetimeoriginal" "-filemodifydate<datetimeoriginal#" -ext jpg -r .

# Misc Links
https://exiftool.org/TagNames/
https://exiftool.org/TagNames/MacOS.html
https://exiftool.org/TagNames/EXIF.html

# Note: These attributes can't be changed:
# FileAccessDate                  : 2019:12:10 20:28:12-05:00
# FileInodeChangeDate             : 2019:12:10 20:27:03-05:00

