include defaults.mk

.PHONY: init download-css generate-html generate-pdf

OUTDIR = files
CSS_URL = https://raw.githubusercontent.com/MacDownApp/macdown/master/MacDown/Resources/Styles/GitHub2.css

init:
	@mkdir -p $(OUTDIR)
	sed 's/\$$address/$(address)/g;s/\$$email/$(email)/g;s/\$$phone_number/$(phone_number)/g;s/\$$linkedin/$(linkedin)/g;s/\$$github/$(github)/g' resume.md > $(OUTDIR)/resume.md

download-css: init
	curl -s $(CSS_URL) -o $(OUTDIR)/GitHub2.css

generate-html: download-css
	pandoc -c GitHub2.css -s $(OUTDIR)/resume.md -o $(OUTDIR)/resume.html -M pagetitle:'Alex Trepca Resume'

generate-pdf: generate-html
	wkhtmltopdf --enable-local-file-access --encoding utf-8 $(OUTDIR)/resume.html $(OUTDIR)/alex-trepca-resume.pdf
