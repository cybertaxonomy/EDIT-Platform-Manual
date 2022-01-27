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

* --reference-links - yields a better layout after exporting, less artifacts from syntax problems with image attributed like `{width=....}`, bu all links are at the end of the file

## Creating publications (pdf, etc.)

https://learnbyexample.github.io/customizing-pandoc/
https://opensource.com/article/18/9/pandoc-research-paper

### install dependencies

see /usr/share/doc/pandoc/README.Debian

    apt-get install pandoc pandoc-citeproc
    apt-get install texlive-latex-extra texlive-xetex texlive-fonts-extra texlive-lang-arabic

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
* better handling of images at page breaks


## Markdown WYSIWYG TaxEditor

### For pandoc markdown

* Atom  (see sub-chapter below)
    * install: https://flight-manual.atom.io/getting-started/sections/installing-atom/#platform-windows
    * plugins:
        * https://atom.io/packages/document-outline
        * https://flight-manual.atom.io/using-atom/sections/github-package/
        * https://atom.io/packages/pandoc   
    * guides:
        * https://www.portent.com/blog/content/atom-markdown.htm
* https://www.typora.io/ - excellent with few limitations (see sub-chapter below)
    * ToDo Tets
        * image adding
        * image upload
        * index creation --> pandoc
        * footnotes --> pandoc
    * git integration?
* https://github.com/mb21/panwriter - unusable slow
* https://www.writage.com/ - unusable with pandoc markdown

#### Atom Editor

* Sharing and synchronizing settings and packages: https://stackoverflow.com/questions/30877289/how-to-share-transfer-an-atom-installation-packages-and-settings-from-one-mac#30972738

**Packages**

* https://flight-manual.atom.io/using-atom/sections/github-package/
* toolbar 
    * https://atom.io/packages/command-toolbar
    * https://atom.io/packages/flex-tool-bar <-- better!!!
* https://atom.io/packages/markdown-preview-plus
* https://atom.io/packages/pandoc
* working with images
    * https://atom.io/packages/atom-image-resize 
    * https://atom.io/packages/markdown-image-assistant -  drag and drop and copy/paste support for images to markdown files
    * https://atom.io/packages/markdown-image-paste
    

**Shortcuts**

* `CTRL ,` : Open settings
* `CTRL SHIFT p` : Open command palette

#### Working with Typora

* !!! **use proper presets* !!! --> ask Andreas
* **DO NOT USE** the zoom image function as this will transform  markdown images `![]()` to html images `<img ...>` which will not work in our setup. --> see https://github.com/typora/typora-issues/issues/249

### git

**!!!!!**

~~~
 git config --global pull.rebase true
~~~


### simple git ui for windows?

* https://gitextensions.github.io/ <-- Empfehlung AM & KL
* https://desktop.github.com/
* https://www.sourcetreeapp.com/


## Templates

* https://github.com/Wandmalfarbe/pandoc-latex-template
