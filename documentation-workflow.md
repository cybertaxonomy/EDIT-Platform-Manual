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

~~~
apt-get install pandoc pandoc-citeproc
apt-get install texlive-latex-extra texlive-xetex texlive-fonts-extra texlive-lang-arabic
~~~

### export as pdf

~~~
pandoc Manual-EDIT-Platform-04-Working-with-the-TaxEditor.md -f markdown --pdf-engine=xelatex  -V 'mainfont:Arial Unicode MS' -V geometry:a4paper  -V geometry:margin=2cm \
--toc  --number-sections \
--titlepage=true --titlepage-color=FFFFFF --titlepage-background=../layout/Title-A4.png\
--template=../templates/eisvogel-2.0.0/eisvogel.latex \
-o Manual-EDIT-Platform-04-Working-with-the-TaxEditor.pdf
~~~

**NOTES**:

* `-V 'mainfont:Arial Unicode MS'` : need to use "Arial Unicode MS" as mainfont for full unicode support. Otherwise Dingbats characters like ❶ will ne missing.
  * see also https://tex.stackexchange.com/questions/234786/how-to-set-a-font-family-with-pandoc
* Using the 'eisvogel-2.0.0' template allows us to
* --number-sections --toc
* coloring links: https://pandoc.org/MANUAL.html#links

**TODO**

See sub-folder `./test/` for the , resuting [test.pdf](./test/test.pdf) on test cases and experiments.

* cross-references
    * https://github.com/lierdakil/pandoc-crossref
    * https://opensource.com/article/18/9/pandoc-research-paper
* better handling of images at page breaks

## Pandoc Templates

* https://github.com/Wandmalfarbe/pandoc-latex-template --> Eisvogel !!! see `./templates/eisvogel-2.0.0/`

## Pandoc filters

### pandoc-wrapfig

A pandoc filter for pdf/LaTeX export with the wrapfig package, which brings [latex wrapfig](https://www.ctan.org/tex-archive/macros/latex/contrib/wrapfig) for pandoc.

Original from https://github.com/scotthartley/pandoc-wrapfig forked to https://github.com/akohlbecker/pandoc-wrapfig/ and improved by wrapping the image by a rasisebox.

Cloned to `./pandoc-filters/pandoc-wrapfig` as [git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules)

To be activated in pandoc markdown by adding to the header:

~~~
header-includes:
- \usepackage{wrapfig}
~~~

and executing pandoc with the filter option:

~~~
--filter $FILTERS_FOLDER/pandoc-wrapfig/pandoc-wrapfig.py
~~~

**Trouble shooting**:

* https://tex.stackexchange.com/questions/56176/handling-of-wrapfig-pictures-in-latex#56177
* vertical align wrapfig with text
  * https://tex.stackexchange.com/questions/415398/adjust-intextsep-for-wrapfigure-only - this solution is being used by now. 
  * https://tex.stackexchange.com/questions/365753/wrap-figure-vertical-alignment-of-text#365764

## Markdown WYSIWYG TaxEditor

### For pandoc markdown

* Atom - see chapter below
* Typora - see chapter below
* https://github.com/mb21/panwriter - unusable slow
* https://www.writage.com/ - unusable with pandoc markdown

#### Atom Editor

* Sharing and synchronizing settings and packages: https://stackoverflow.com/questions/30877289/how-to-share-transfer-an-atom-installation-packages-and-settings-from-one-mac#30972738

**Packages**

Guides onm using Atom as pandoc mardown editor:

* [https://www.andbible.com/post/atom-markdown-editor/](https://www.andbible.com/post/atom-markdown-editor/)
* [https://kofler.info/atom-als-markdownpandoc-editor/](https://kofler.info/atom-als-markdownpandoc-editor/)
* [https://www.portent.com/blog/content/atom-markdown.htm](https://www.portent.com/blog/content/atom-markdown.htm)

Packages:

* https://flight-manual.atom.io/using-atom/sections/github-package/
* toolbar
    * https://atom.io/packages/flex-tool-bar
* git
    * https://atom.io/packages/git-controlhub <-- git commands via toolbar
* https://atom.io/packages/document-outline
* https://atom.io/packages/markdown-preview-plus
* [~~markdown-scroll-sync~~](https://github.com/vincentcn/markdown-scroll-sync) -  no longer compatible with markdown preview plus
* https://atom.io/packages/pandoc - not needed as markdown-preview-plus provides the same function
   * https://atom.io/packages/markdown-file-linker
* working with images
    * https://atom.io/packages/atom-image-resize
    * https://atom.io/packages/markdown-image-assistant -  drag and drop and copy/paste support for images to markdown files
    * https://atom.io/packages/markdown-image-paste

**Shortcuts**

* `CTRL ,` : Open settings
* `CTRL SHIFT p` : Open command palette

**TODO Tests**

* image adding - OK
* image upload - OK
* index creation --> pandoc - OK, see eisvogel template

#### Working with Typora

* !!! **use proper presets* !!! --> ask Andreas
* **DO NOT USE** the zoom image function as this will transform  markdown images `![]()` to html images `<img ...>` which will not work in our setup. --> see https://github.com/typora/typora-issues/issues/249

### simple git ui for windows?

* https://gitextensions.github.io/ <-- Empfehlung AM & KL
* https://desktop.github.com/
* https://www.sourcetreeapp.com/
