# Documentation

Here are some guidelines for writing the Mindee documentation and using README.io. For anything Markdown specific, please follow the [Markdown guidelines](markdown.md).

- [Categories](#categories)
- [Headers](#headers)
- [How to Modify the Documentation](#how-to-modify-the-documentation)
- [Markdown Code Block Syntax Highlight](#markdown-code-block-syntax-highlight)
- [Template for integration documentation](#template-for-integration-documentation)

## Categories
README.io has a bug where it's impossible to reorder a category outside of the current viewport, which makes it difficult for us since we have sections, like the one with the use cases that have a lot of pages. I was able to do it with Safari on macOS only.

## Headers
We can't use H1 header in the markdown as it's reserved for the page title.

## How to Modify the Documentation
If you have ideas, suggestions, issues or new things to add to the documentation, please:

- Create an issue in the [documentation repository](https://github.com/mindee/documentation/issues)

Alternatively, if you want to do it yourself

- Create a PR in the [documentation repository](https://github.com/mindee/documentation)
- Once the PR is approved and merged, it will be automatically updated on README.io within a couple of minutes.

It's that simple!

> 🚧 **Warning**
>
> Do not modify the documentation from README.io directly, the only exceptions are for special README blocks like **code with tabs** or **uploading images on their server**.

## Markdown Code Block Syntax Highlight
Since are using README.io for now, we can only use the [languages supported by them](https://rdmd.readme.io/docs/code-blocks#language-support).

## Template for Integration Documentation

Below is a guide for creating an integration documentation

- Introduction to the integration
- Benefits (why do users need to use the integration) Optionally, this can be merged with the introduction if its not long
- Prerequisite(if any)
- How to install/Create account (Getting Started)
- Code demo (or how to use if no or low code)(add screenshots where needed)
- Troubleshoot/ Error management(if any)
- Resources/References
