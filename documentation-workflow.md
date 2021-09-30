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

## Creating publications (pdf, etc.)

https://learnbyexample.github.io/customizing-pandoc/

### install dependencies

see /usr/share/doc/pandoc/README.Debian

    apt-get install texlive-latex-extra texlive-xetex

### export as pdf


     pandoc Manual-EDIT-Platform-04-Working-with-the-TaxEditor.md -f markdown --pdf-engine=xelatex  -V 'mainfont:Arial Unicode MS' -V geometry:a4paper  -V geometry:margin=2cm \
     --toc  --number-sections \
     --titlepage=true --titlepage-color=FFFFFF --titlepage-background=../layout/Title-A4.png\
     --template=../templates/eisvogel-2.0.0/eisvogel.latex \
     -o Manual-EDIT-Platform-04-Working-with-the-TaxEditor.pdf


NOTES: 

* `-V 'mainfont:Arial Unicode MS'` : need to use "Arial Unicode MS" as mainfont for full unicode support. Otherwise Dingbats characters like ❶ will ne missing.
* Using the 'eisvogel-2.0.0' template allows us to 
* --number-sections --toc



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


## Templates

* https://github.com/Wandmalfarbe/pandoc-latex-template

