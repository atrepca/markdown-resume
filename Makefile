include defaults.mk

.PHONY: init generate-html generate-pdf clean

OUTDIR = files
CSS_URL = https://raw.githubusercontent.com/MacDownApp/macdown/master/MacDown/Resources/Styles/GitHub2.css

init:
	@mkdir -p $(OUTDIR)
	export address='$(address)' email='$(email)' phone_number='$(phone_number)' linkedin='$(linkedin)' github='$(github)'; \
	envsubst < resume.md > $(OUTDIR)/resume.md

$(OUTDIR)/GitHub2.css: init
	curl -s $(CSS_URL) -o $(OUTDIR)/GitHub2.css
	printf '\n@media print { body { width: 854px; margin: 0 auto; } }\n' >> $(OUTDIR)/GitHub2.css

generate-html: $(OUTDIR)/GitHub2.css
	pandoc -c GitHub2.css -s $(OUTDIR)/resume.md -o $(OUTDIR)/resume.html -M pagetitle:'Alex Trepca Resume'

generate-pdf: generate-html
	"/Applications/Brave Browser.app/Contents/MacOS/Brave Browser" \
	  --headless --disable-gpu --no-pdf-header-footer \
	  --print-to-pdf=$(OUTDIR)/alex-trepca-resume.pdf \
	  $(OUTDIR)/resume.html

clean:
	rm -rf $(OUTDIR)
