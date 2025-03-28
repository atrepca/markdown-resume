include defaults.mk

init:
	mkdir -p files
	sed 's/$$address/$(address)/;s/\$$email/$(email)/g;s/\$$phone_number/$(phone_number)/g;s/\$$linkedin/$(linkedin)/g;s/\$$github/$(github)/g' resume.md > files/resume.md
download-css: init
	curl -s https://raw.githubusercontent.com/MacDownApp/macdown/master/MacDown/Resources/Styles/GitHub2.css -o files/GitHub2.css
generate-html: download-css
	pandoc -c GitHub2.css -s files/resume.md -o files/resume.html -M pagetitle:'Alex Trepca Resume'
generate-pdf: generate-html
	wkhtmltopdf --enable-local-file-access --encoding utf-8 files/resume.html files/alex-trepca-resume.pdf
