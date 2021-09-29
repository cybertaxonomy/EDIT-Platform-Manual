## Convert docx to Markdown

    NAME='Manual-EDIT-Platform-04-Working-with-the-TaxEditor'
    mkdir $NAME
    cd $NAME
    pandoc -f docx -t markdown ../../../$NAME.docx --output=$NAME.md --atx-headers --wrap=none --extract-media="."
    
**export type:**

* markdown (Pandoc markdown) - **preferred**
* markdown_mmd = (MultiMarkdown) 
* 

**export options**

* --reference-links - yields a better layout after exporting, less artifacts from syntax problenms with image attributed like `{width=....}`, bu all links are at the end of the file


## Markdown WYSIWYG TaxEditor

### For pandoc markdown

* https://www.typora.io/ - excellent with few limitations 
    * ToDo Tets
        * image adding 
        * image upload
        * index creation --> pandoc
        * footnotes --> pandoc
    * git integration?
* https://github.com/mb21/panwriter - unusable slow

### simple git ui for windows?

* https://desktop.github.com/
* https://www.sourcetreeapp.com/


