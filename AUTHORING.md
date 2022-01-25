# Authors guide

This guide is dedicated to authors contributing to the "EDIT Platform manuals".

## General publishing workflow

The manuals are written in markdown, a lightweight markup language for creating formatted text using a plain-text editor. All markdown files, screenshot images and illustrations are hosted at github in [cybertaxonomy/EDIT-Platform-Manual](https://github.com/cybertaxonomy/EDIT-Platform-Manual).

The markdown documents can converted by pandoc, an a universal document converter, to PDF files or other formats like eBook or HTML. For this conversion style templates can be applied to provide a consistent and appealing layout. 

This conversion process has been automated. Once changes to the source documents are pushed to the github repository ([cybertaxonomy/EDIT-Platform-Manual](https://github.com/cybertaxonomy/EDIT-Platform-Manual)) the EDIT continuous integration server will pick up the changes to create new PDFs, which subsequently will be uploaded to the download section of the EDIT Platform: [https://cybertaxonomy.eu/download/platform/manual/](https://cybertaxonomy.eu/download/platform/manual/). This process should not take longer than 5 minutes so that the result of changes applied by an author are quickly made public.

The markdown documents can be edited in the github site, where new images also can be uploaded.

For a more comfortable editing experience you can use [Typora](https://www.typora.io/) a markdown editor (see next chapter)

## Tools

For easily editing the platform manuals offline we recommend using two tools:

* Typora
* Atom editor

The Atom editor has the advantage of being a fully integrated solution of a markdown editor with a preview view and the tool set to work with the git repository.

Typora has no built in git support but impresses with a WYSIWYG markdown editor for the pandoc markdown syntax. The image scaling feature of the pandoc markdown ( e.g.: `![](./image.png){width="12.3cm"}`) is not supported so that it can be hard to stay on top of things when working with many images which are not sized perfectly. 

The latter problem losing overview does not exist in Typora, since markdown and preview can be viewed side by side.

### Typora

**NOTE:** Using Typora is no longer fee of charge. You only can get 15 days free trial. After that you need to purchase the application for $ 14.99.

Typora will support you while editing the manuals by providing an editable preview of the documents. The preview does not reproduce the resulting layout perfectly but you might find it much more comfortable than editing the plain markdown.

Since Typora has no built in git support, you may also want to install a user friendly git application like GitHub Desktop.

#### Installation and setup

Download the Typora for [https://www.typora.io/#windows](Windows), [Mac](https://www.typora.io/download/Typora.dmg) or [Linux](https://www.typora.io/#linux) and install the application.

It is highly recommended to adjust the setting before you start editing the EDIT Platform manual:

Open the *Preferences* via the main menu: *File > Preferences ...*:

**Appearance:**

![](typora-prefs-appearance.png)


**Editor:**

![](typora-prefs-editor.png)

**Image**

These settings are EXTREMELY IMPORTANT!!!

![](typora-prefs-image.png)

**Editor:**

![](typora-prefs-markdown.png)


#### Authoring in Typora

After opening a EDIT Manual markdown file like `./EDIT-Platform-Manual/Manual-EDIT-Platform-04-Working-with-the-TaxEditor/Manual-EDIT-Platform-04-Working-with-the-TaxEditor.md` you will see the document in the WYSIWIG editor in the right part of the application window and the **Overview** on the document structure in the left hand pane:

![](typora-editing-overview.png)

The actual content is preceded by a document header (blue rectangle). In this header document metadata are defined as well as important configuration parameters for the final layout. This header must not be modified expect you exactly know what you are doing.


##### Images

Images for a specific manual like `Manual-EDIT-Platform-04-Working-with-the-TaxEditor` need to be stored in the according `./media/`-sub-folder and are references in the markdown by the relative file path: `![](./media/my-image.png){width="10cm"}`. Therefor it is im portant to configure Typora so that it always uses this relative path (see above). 
The `width` property in curly brackets can be used to scale the image to a fixed with (e.g.: `{width="10cm"}`) or relative to the page width (`{width="33%"}`).

**IMPORTANT**

* **YOU NEVER MUST USE** the **zoom image** function as this will transform  markdown images `![]()` to html images `<img ...>` which will not work in our setup.

### GitHub Desktop 

https://desktop.github.com/

GitHub Desktop makes it easy to push your changes to git hub and to keep track of the modifications that have been applied by others.
