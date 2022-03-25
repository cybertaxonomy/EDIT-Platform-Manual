#!/bin/bash -e

exit 1

FILE_NAME='Manual-EDIT-Platform-DataPortal'
mkdir -p $FILE_NAME
cd $FILE_NAME
pandoc -f docx -t markdown ../../../$FILE_NAME.docx --output=$FILE_NAME.md --markdown-headings=atx --wrap=none --extract-media="."
 
