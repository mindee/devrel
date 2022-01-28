# Markdown Guidelines

Here a list of guidelines for any type of content created with markdown.

## Bold
[Markdown standard](https://daringfireball.net/projects/markdown/) accepts double asterisks or double underscores to make text bold. We use the double asterisk version for bold text.

`**my bold text**`

## Code
When displaying code examples, if you don't want to show the full code or the full output, you can add ellipses as shown below.

![](../../img/code-top.png)
![](../../img/code-bottom.png)
![](../../img/code-top-bottom.png)

## Headers
Do not leave any empty line between the header and the content after it.

## Images
You’ll need a feature image: the image will be used on the front page, and as the hero image on your blog post. The size needs to be around 2:1 (twice larger than the height) to fit our WordPress template. The size of the images in the article doesn’t matter, but always use the highest possible quality: they will be automatically optimized using a lossless encoding.

### ALT Description & Caption
Always add a text for the ALT description (see below) and a caption to all of the images.

`![this is where your alt text needs to be](myimage.png "this is where the caption goes")`

Be as descriptive as you can: ask yourself how you would like someone to describe them to you if you were blind. Try to find a good balance between adding enough information vs having something way too long. Avoid adding words like pictures or photos. For example:

![](../../img/pexels-alexandr-podvalny-321552.jpg)
- **Bad**: picture of a monkey
- **Good**: a monkey eating a banana

### Quality
Always use the highest possible quality for images, no matter if the file size is huge. They will be optimized using [Shortpixel](https://shortpixel.com/online-image-compression) and a glossy compression level to minimize the file size, but keep a high quality.

## Italic Text
Same as bold text, [Markdown standard](https://daringfireball.net/projects/markdown/) accepts a single asterisk or single underscore to make your text italic. To ensure a better readability of the Markdown files when not rendered, we use the underscore version so it's easier to distinguish from the bold text.

## Ordered list
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

## Callout
Callouts are a great method to attract additional attention to specific ideas or to make it obvious that some information is optional or only important in certain situations.

Here is an example of how you to write a callout:

```
> 📘 **Info**
> 
> Vitae reprehenderit at aliquid error voluptates eum dignissimos.
```
### Callout Types
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
