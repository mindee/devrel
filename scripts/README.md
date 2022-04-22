# Scripts

Here a list of scripts we are using to make our life easier.

> ⚠️ **Warning**
>
> Please note that those scripts aren't bulletproof nor do they have the best code we could have done: they were created quickly (we plan to make them better at some point—meaning probably never), so you are using them at your own risk

## [addBlankPages.sh](addBlankPages.sh)
Add 10 blank pages to all PDF in the specific folder

## [convert-heic.sh](convert-heic.sh)
Convert `.heic` (Apple propriatery version of the **H**igh-**E**fficiency **I**mage **F**ile format) to `.jpg` in batch

## [create-all-doc-issues.sh](create-all-doc-issues.sh)
Create an issue for all documentation pages. Not useful anymore, but worth keeping for the code example we may need in the future.

## [create-jira-issues.zsh](create-jira-issues.zsh)
Create an issue in Jira. Right now it's not bulletproof and was created to add a very specific type of issue. Worth updating in the future.

## [deleteBadPDF.sh](deleteBadPDF.sh)
Delete PDFs with wrong MIME type in the specified folder.

## [deleteSendGridBounce.sh](deleteSendGridBounce.sh)
Delete the boucing emails from our Newsletter contact list on SendGrid.

## [detectProtectedPDF.sh](detectProtectedPDF.sh)
Detect password protected PDFs from the desired folder.

## [fake-data.rb](fake-data.rb)
A small Ruby app that generate some fake data:

- France Bank Informations
    - Account Number
    - IBAN
    - Routing Number
    - Swift Number
- US
    - Company Registration Number (EIN)

Need to install [faker](https://github.com/faker-ruby/faker) by doing `gem install faker`.

## [generate-invoice.sh](generate-invoice.sh)
Generate a fake invoice in PDF format using the information in the [invoice.json](invoice.json) file.

## [getPDFsPages.sh](getPDFsPages.sh)
Get the number of pages for each PDFs from the desired folder.

## [github-stars](github-stars.sh)
Get the latest number of stars on our public repositories.
