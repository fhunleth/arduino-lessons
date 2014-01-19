#!/bin/sh

# $1 is the markdown file

BASE=`basename -s .md "$1"`
DIRNAME=`dirname "$1"`
MARKDOWN="markdown_github+header_attributes+yaml_metadata_block+inline_code_attributes"

PANDOC=$HOME/.cabal/bin/pandoc
OUTPUT_PDF=${DIRNAME}/${BASE}.pdf
OUTPUT_HTML=${DIRNAME}/${BASE}.html

echo Creating $OUTPUT_PDF...
$PANDOC -f $MARKDOWN -t html5 -s --highlight-style pygments --section-divs -o "$OUTPUT_HTML" "$1"
wkhtmltopdf -s letter "$OUTPUT_HTML" "$OUTPUT_PDF"
