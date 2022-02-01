# Markdown Guidelines

Here a list of guidelines for any type of content created with markdown.

- [Callouts](#callouts)
	- [Types](#Types)
- [Code Block](#code-block)
- [Headers](#headers)
- [Images](#images)
	- [ALT Description & Caption](#alt-description--caption)
	- [Tips In Writing ALT Description](#tips-in-writing-alt-description)
	- [Copyrights](#copyrights)
	- [Quality](#quality)
- [Lists](#lists)
	- [Ordered](#ordered)
	- [Unordered](#unordered)
- [Text Formatting](#text-formatting)
	- [Bold](#bold)
	- [Italic](#italic)

## Callouts
Callouts are a great method to attract additional attention to specific ideas or to make it obvious that some information is optional or only important in certain situations.

Here is an example of how you can write a callout:

```
> 📘 **Info**
>
> Vitae reprehenderit at aliquid error voluptates eum dignissimos.
```
### Types
There are four different types of callouts we use: `success`, `info`, `warning`, `error`.

> 👍 **Success**
>
> Vitae reprehenderit at aliquid error voluptates eum dignissimos.

> 📘 **Info**
>
> Vitae reprehenderit at aliquid error voluptates eum dignissimos.

> 🚧 **Warning**
>
> Vitae reprehenderit at aliquid error voluptates eum dignissimos.

> ❗ **Error**
>
> Vitae reprehenderit at aliquid error voluptates eum dignissimos.


## Code Block
When displaying code examples, if you don't want to show the full code or the full output, you can add ellipses as shown below.

![](../../img/code-top.png)
![](../../img/code-bottom.png)
![](../../img/code-top-bottom.png)

## Headers
Do not leave any empty line between the header and the content after it.

## Images
You’ll need a feature image: the image will be used on the front page, and as the hero image on your blog post. The size needs to be around 2:1 (twice larger than the height) to fit our WordPress template. The size of the images in the article doesn’t matter, but always use the highest possible quality: they will be automatically optimized using a lossless encoding.

### ALT Description & Caption
Always add a text for the ALT description and a caption to all of the images.

`![this is where your alt text needs to be](myimage.png "this is where the caption goes")`

Write in such a way that someone could totally understand without needing images. Consider the image as an addition for visual people, but not as a primary item that needs to be there, so people can understand what you want them to do or understand. In other words, you can remove the images completely and understand the tutorial or documentation. Doing this ensure that there is no difference in terms of information that visual capable people have vs the others. 

#### Tips In Writing ALT Description
1. Be as descriptive as you can but moderate: ask yourself how you would like someone to describe them to you if you were blind. Try to find a good balance between adding enough information vs having something way too long, since people using screen reader already have a lot of “reading” happening on the page, but add enough context so people understand. Avoid adding words like pictures or photos. For example:

![](../../img/pexels-alexandr-podvalny-321552.jpg)
- **Bad**: picture of a monkey
- **Good**: a monkey eating a banana

2. For screenshot, focus on what we want to show on the image, not everything, for example: a screenshoot of the signup page where we want the user to see which checkbox to check could be something like _“the terms and services checkbox under the password textfield”_.
3. For diagram or anything with data, a quick summary, like a caption, with something that points to a summary of the data: not all details, but enough for someone to understand.

### Copyrights
When using images from external parties, always be sure that we have the commercial right to use them. If it's not specified, do not use them. If you aren't sure, ask @fharper.

Always add the credit of images that aren't ours under the image itself. You can either simply put the link to the image page where the copyright information is listed, or write down the author or company owning the image.

### Quality
Always use the highest possible quality for images, no matter if the file size is huge. They will be optimized using [Shortpixel](https://shortpixel.com/online-image-compression) and a glossy compression level to minimize the file size, but keep a high quality.

## Lists

### Ordered
[Markdown standard](https://daringfireball.net/projects/markdown/) let you write ordered list by either numbering them correctly or just making them all items 1

```
1. item 1
2. item 2
3. item 3
```

and

```
1. item 1
1. item 2
1. item 3
```

will both render

1. item 1
2. item 2
3. item 3

The second way is more easy to manage when you have to reorder your list, but to ensure a better readability of the Markdown files when not rendered, we use the correct numbers for our list items.

### Unordered
[Markdown standard](https://daringfireball.net/projects/markdown/) let you write unordered list using `*`, `+` and `-`: always use hyphens.

## Table of Content
Some Markdown parser will gebnerate a table of content (toc) automatically for you (i.e GitHub), but you should always write them manually. There is no guarantee that your content will be viewed with a tool that will do the same.

## Text Formatting

### Bold
[Markdown standard](https://daringfireball.net/projects/markdown/) accepts double asterisks or double underscores to make text bold. We use the double asterisk version for bold text.

`**my bold text**`

### Italic
Same as bold text, [Markdown standard](https://daringfireball.net/projects/markdown/) accepts a single asterisk or single underscore to make your text italic. To ensure a better readability of the Markdown files when not rendered, we use the underscore version so it's easier to distinguish from the bold text.
