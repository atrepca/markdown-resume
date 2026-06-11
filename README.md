## My Markdown Resume

This project converts a Markdown resume to HTML using [pandoc](https://pandoc.org/), and then from HTML to PDF using a Chromium-based browser in headless mode (e.g. Brave, Chrome).

### Requirements

**MacOS:**  
Run `brew bundle` to install requirements. If you don't have Homebrew, get it from [brew.sh](https://brew.sh/).

A Chromium-based browser (Brave, Chrome, Chromium, etc.) must be installed. The Makefile defaults to Brave — update the `generate-pdf` target if you use a different browser.

### Usage

1. Edit resume in [`resume.md`](resume.md).
2. Generate the HTML and PDF with:

    ```sh
    make generate-pdf
    ```

The Makefile will handle downloading the main CSS and running all conversion steps.

To force a CSS refresh from the source:

    ```sh
    make clean && make generate-pdf
    ```

### Output

- The generated HTML will be saved as `files/resume.html`.
- The generated PDF will be saved as `files/alex-trepca-resume.pdf`.
