## Convert docx to Markdown


**from docx**

    NAME='Manual-EDIT-Platform-04-Working-with-the-TaxEditor'
    mkdir $NAME
    cd $NAME
    pandoc -f docx -t markdown ../../../$NAME.docx --output=$NAME.md --markdown-headings=atx --wrap=none --extract-media="."

**from odt**

    NAME='Manual-EDIT-Platform-04-Working-with-the-TaxEditor'
    mkdir $NAME
    cd $NAME
    pandoc -f odt -t markdown ../../../$NAME.odt --output=$NAME.odt.md --markdown-headings=atx --wrap=none --extract-media="."
    
==> this path yields better results as compared with using docx as source format, e.g. cross-references are not lost! The **odt must be produced with MS Word**  via the "save as ..." function since LibreOffice introduces a couple of problems 
    
    
**export type:**

* markdown (Pandoc markdown) - **preferred**
* markdown_mmd = (MultiMarkdown) 
* 

**export options**

* --reference-links - yields a better layout after exporting, less artifacts from syntax problenms with image attributed like `{width=....}`, bu all links are at the end of the file

## Creating publications (pdf, etc.)

https://learnbyexample.github.io/customizing-pandoc/
https://opensource.com/article/18/9/pandoc-research-paper

### install dependencies

see /usr/share/doc/pandoc/README.Debian

    apt-get install pandoc pandoc-citeproc texlive-latex-extra texlive-xetex texlive-fonts-extra texlive-lang-arabic

### export as pdf


     pandoc Manual-EDIT-Platform-04-Working-with-the-TaxEditor.md -f markdown --pdf-engine=xelatex  -V 'mainfont:Arial Unicode MS' -V geometry:a4paper  -V geometry:margin=2cm \
     --toc  --number-sections \
     --titlepage=true --titlepage-color=FFFFFF --titlepage-background=../layout/Title-A4.png\
     --template=../templates/eisvogel-2.0.0/eisvogel.latex \
     -o Manual-EDIT-Platform-04-Working-with-the-TaxEditor.pdf

NOTES: 

* `-V 'mainfont:Arial Unicode MS'` : need to use "Arial Unicode MS" as mainfont for full unicode support. Otherwise Dingbats characters like ❶ will ne missing.
  * see also https://tex.stackexchange.com/questions/234786/how-to-set-a-font-family-with-pandoc
* Using the 'eisvogel-2.0.0' template allows us to 
* --number-sections --toc
* coloring links: https://pandoc.org/MANUAL.html#links

TODO

* cross-references
    * https://github.com/lierdakil/pandoc-crossref
    * https://opensource.com/article/18/9/pandoc-research-paper


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
* https://www.writage.com/ - unusable with pandoc markdown

### simple git ui for windows?

* https://gitextensions.github.io/ <-- Empfehlung AM & KL
* https://desktop.github.com/
* https://www.sourcetreeapp.com/


## Templates

* https://github.com/Wandmalfarbe/pandoc-latex-template



