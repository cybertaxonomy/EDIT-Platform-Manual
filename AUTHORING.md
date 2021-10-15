# Authors guide

This guide is dedicated to authors contributing to the "EDIT Platform manuals".

## General publishing workflow

The manuals are written in markdown, a lightweight markup language for creating formatted text using a plain-text editor. All markdown files, screenshot images and illustrations are hosted at github in [cybertaxonomy/EDIT-Platform-Manual](https://github.com/cybertaxonomy/EDIT-Platform-Manual).

The markdown documents can converted by pandoc, an a universal document converter, to PDF files or other formats like eBook or HTML. For this conversion style templates can be applied to provide a consistent an appealing layout. 

This conversion process has been automated. Once changes to the source documents are pushed to git hub the EDIT continuous integration server will pick up the changes to create new PDFs which will be uploaded to the download section of the EDIT Platform: [https://cybertaxonomy.eu/download/platform/manual/](https://cybertaxonomy.eu/download/platform/manual/). This process should not take longer than 5 minutes so that the result of changes applied by an author are quickly made public.

The markdown documents can be edited in the github site, where new images also can be uploaded.

For a more comfortable editing experience you can use [Typora](https://www.typora.io/) a markdown editor (see next chapter)

## Tools

For easily editing the platform manuals offline we recommend using the following tools.

### Typora

Typora will support you while editing the manuals by providing an editable preview of the documents. The preview does not reproduce the resulting layout perfectly but you might find it much more comfortable than editing the plain markdown.

### Installation

Download the Typora for [https://www.typora.io/#windows](Windows), [Mac](https://www.typora.io/download/Typora.dmg) or [Linux](https://www.typora.io/#linux)



**IMPORTANT**

* **DO NOT USE** the zoom image function as this will transform  markdown images `![]()` to html images `<img ...>` which will not work in our setup.

### GitHub Desktop 

https://desktop.github.com/

GitHub Desktop makes it easy to push your changes to git hub and to keep track of the modifications that have been applied by others.
