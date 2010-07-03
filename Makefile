install :
	cp scala.snippets ~/.vim/snippets/
extract :
	cp ~/.vim/snippets/scala.snippets ./
check :
	cat scala.snippets | ruby bin/check.rb
doc-html :
	cat scala.snippets | ruby bin/smdoc.rb > doc/scala.html
# doc-pdf-* is currently only for OS X - it uses a Ruby Gem called wkpdf.
# see - http://plessl.github.com/wkpdf/
# there is a Linux equivalent called wkhtmltopdf at
# http://code.google.com/p/wkhtmltopdf/
# 
# but, currently, you have to use OS X to render the PDF.
# I would love it if we could have the Makefile patched to support
# wkhtmltopdf as well. Patches welcome, as they say. ;-)
doc-pdf-a4 : doc-html
	wkpdf --source doc/scala.html --format A4 --output doc/scala-a4.pdf
doc-pdf-letter : doc-html
	wkpdf --source doc/scala.html --format LETTER --output doc/scala-letter.pdf
