#!/bin/zsh

#
# Script to test the Python SDK CLI
#
# zsh cli-tests.zsh
#
# TODO: the -p parameter, -i with file, base64 & bytes
#
# Note: a better way to do that would be with a loop on all parameters possibilities!
#

# Configure this section
SDK_PATH=/Users/fharper/Documents/code/mindee/sdk-python
INVOICE=/Users/fharper/Documents/code/mindee/datasets/invoices/1008e67d-01d5-41c8-9791-4a21892fb717.pdf
RECEIPT=/Users/fharper/Documents/code/mindee/datasets/receipts/America/013cff9e-10f1-467c-9f8d-fee04200b43f.jpg
FINANCE_PDF=/Users/fharper/Documents/code/mindee/datasets/invoices/1008e67d-01d5-41c8-9791-4a21892fb717.pdf
FINANCE_JPEG=/Users/fharper/Documents/code/mindee/datasets/receipts/Europe/00dcedbe-f0a6-434d-8ac1-caebdbf6a5d1.jpeg
PASSPORT=/Users/fharper/Documents/code/mindee/datasets/passports/01972ca6_eed809a1_audrey-acker-11521561275534.jpg
# End of configuration section

if [[ $ZSH_EVAL_CONTEXT == 'toplevel' ]]; then

bold=$(tput bold)
normal=$(tput sgr0)
green="\e[32m"
nocolor="\e[39m"

function title {
	read
	echo "\n${bold}${green}$1${nocolor}${normal}"
}

cd ${SDK_PATH}

echo "${bold}${green}"
echo "------------------------"
echo "| Python SDK CLI Tests |"
echo "------------------------${nocolor}${normal}"

title "Summary: Invoice using path"
./mindee-cli.sh invoice -o summary -i path ${INVOICE}
title "Summary: Receipt using path"
./mindee-cli.sh receipt -o summary -i path ${RECEIPT}
title "Summary: Financial document PDF using path"
./mindee-cli.sh financial -o summary -i path  ${FINANCE_PDF}
title "Summary: Financial document JPEG using path"
./mindee-cli.sh financial -o summary -i path ${FINANCE_JPEG}
title "Summary: Passport using path"
./mindee-cli.sh passport -o summary -i path ${PASSPORT}

title "Raw: Invoice using path"
./mindee-cli.sh invoice -o raw -i path  ${INVOICE}
title "Raw: Receipt using path"
./mindee-cli.sh receipt -o raw -i path ${RECEIPT}
title "Raw: Financial document PDF using path"
./mindee-cli.sh financial -o raw -i path  ${FINANCE_PDF}
title "Raw: Financial document JPEG using path"
./mindee-cli.sh financial -o raw -i path ${FINANCE_JPEG}
title "Raw: Passport using path"
./mindee-cli.sh passport -o raw -i path ${PASSPORT}

title "Raw: Invoice using path with words"
./mindee-cli.sh invoice -w -o raw -i path  ${INVOICE}
title "Raw: Receipt using path with words"
./mindee-cli.sh receipt -w -o raw -i path ${RECEIPT}
title "Raw: Financial document PDF using path with words"
./mindee-cli.sh financial -w -o raw -i path  ${INVOICE}
title "Raw: Financial document JPEG using path with words"
./mindee-cli.sh financial -w -o raw -i path ${FINANCE_JPEG}
# Passport doesn't have with words option

title "Parsed: Invoice using path"
./mindee-cli.sh invoice -o parsed -i path  ${INVOICE}
title "Parsed: Receipt using path"
./mindee-cli.sh receipt -o parsed -i path ${RECEIPT}
title "Parsed: Financial document PDF using path"
./mindee-cli.sh financial -o parsed -i path  ${FINANCE_PDF}
title "Parsed: Financial document JPEG using path"
./mindee-cli.sh financial -o parsed -i path ${FINANCE_JPEG}
title "Parsed: Passport using path"
./mindee-cli.sh passport -o parsed -i path ${PASSPORT}

title "Summary: Invoice using path no cutPDF"
./mindee-cli.sh invoice -C -o summary -i path ${INVOICE}
title "Summary: Receipt using path no cutPDF"
./mindee-cli.sh receipt -C -o summary -i path ${RECEIPT}
title "Summary: Financial document PDF using path no cutPDF"
./mindee-cli.sh financial -C -o summary -i path  ${FINANCE_PDF}
title "Summary: Financial document JPEG using path no cutPDF"
./mindee-cli.sh financial -C -o summary -i path ${FINANCE_JPEG}
title "Summary: Passport using path no cutPDF"
./mindee-cli.sh passport -C -o summary -i path ${PASSPORT}

title "Raw: Invoice using path no cutPDF"
./mindee-cli.sh invoice -C -o raw -i path  ${INVOICE}
title "Raw: Receipt using path no cutPDF"
./mindee-cli.sh receipt -C -o raw -i path ${RECEIPT}
title "Raw: Financial document PDF using path no cutPDF"
./mindee-cli.sh financial -C -o raw -i path  ${FINANCE_PDF}
title "Raw: Financial document JPEG using path no cutPDF"
./mindee-cli.sh financial -C -o raw -i path ${FINANCE_JPEG}
title "Raw: Passport using path no cutPDF"
./mindee-cli.sh passport -C -o raw -i path ${PASSPORT}

title "Raw: Invoice using path with words no cutPDF"
./mindee-cli.sh invoice -C -w -o raw -i path  ${INVOICE}
title "Raw: Receipt using path with words no cutPDF"
./mindee-cli.sh receipt -C -w -o raw -i path ${RECEIPT}
title "Raw: Financial document PDF using path with words no cutPDF"
./mindee-cli.sh financial -C -w -o raw -i path  ${FINANCE_PDF}
title "Raw: Financial document JPEG using path with words no cutPDF"
./mindee-cli.sh financial -C -w -o raw -i path ${FINANCE_JPEG}
# Passport doesn't have with words option

title "Parsed: Invoice using path no cutPDF"
./mindee-cli.sh invoice -C -o parsed -i path  ${INVOICE}
title "Parsed: Receipt using path no cutPDF"
./mindee-cli.sh receipt -C -o parsed -i path ${RECEIPT}
title "Parsed: Financial document PDF using path no cutPDF"
./mindee-cli.sh financial -C -o parsed -i path  ${FINANCE_PDF}
title "Parsed: Financial document JPEG using path no cutPDF"
./mindee-cli.sh financial -C -o parsed -i path ${FINANCE_JPEG}
title "Parsed: Passport using path no cutPDF"
./mindee-cli.sh passport -C -o parsed -i path ${PASSPORT}

else
	echo "Please do not source this script"
fi
