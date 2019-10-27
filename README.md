## My Markdown Resume

This converts a Markdown resume to HTML using [pandoc](https://pandoc.org/), then from HTML to PDF using [wkhtmltopdf](https://wkhtmltopdf.org/).

### Requirements
**MacOS:** To install requirements run `brew bundle`. You can get `brew` from [brew.sh](https://brew.sh/), if you don't have it.

### Usage
The Resume file is [`resume.md`](resume.md); make edits as desired, then generate PDF using:  
```
make generate-pdf
```
