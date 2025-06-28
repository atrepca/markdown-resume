## My Markdown Resume

This project converts a Markdown resume to HTML using [pandoc](https://pandoc.org/), and then from HTML to PDF using [wkhtmltopdf](https://wkhtmltopdf.org/).

### Requirements

**MacOS:**  
Run `brew bundle` to install requirements. If you don't have Homebrew, get it from [brew.sh](https://brew.sh/).

**Note:**  
As of 12/16/2024, the Homebrew cask for wkhtmltopdf is deprecated. You must install wkhtmltopdf from the [official website](https://wkhtmltopdf.org/downloads.html).

### Usage

1. Edit resume in [`resume.md`](resume.md).
2. Generate the HTML and PDF with:

    ```sh
    make generate-pdf
    ```

The Makefile will handle downloading the main CSS and running all conversion steps.  

### Output

- The generated HTML will be saved as `files/resume.html`.
- The generated PDF will be saved as `files/alex-trepca-resume.pdf`.

---
For more details or customization, see comments in the Makefile.
