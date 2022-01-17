# This app is to test the Mindee Python SDK
# run pip install -e PATH_TO_PYTHON_SDK to use the local SDK git repo

from mindee import Client
import os.path
import sys

def helpmsg(message):
    print(message + "\n");
    print("Correct parameters lists are: [document type] [relative or full path for the PDF file to read]");
    #print("Correct parameters lists are: [document type] [input type: how to read the file] [using cutPDF] [looping through the PDFs in the PDFs folder] [relative or full path for the PDF file to read]");
    print("with those values [invoice, receipt, finance, passport, license_plate]\n");
    #print("with those values [invoice, receipt, finance, license_plate] [file, stream, base64] [true, false] [true, false] [filePath]\n");
    print("example: python app.py invoice myPDF.pdf\n")
    #print("example: python app.py invoice file true false myPDF.pdf\n");
    #print("Please note that if 'loop' is true, do not provide a filePath");

mindee_client = Client(
    expense_receipt_token="",
    invoice_token="",
    passport_token="",
    license_plate_token="",
    raise_on_error=True
)
documentTypes = ["invoice", "receipt", "finance", "passport", "license_plate"]
#inputTypes = ["file", "stream", "base64"]
#boolTypes = ["true", "false"]

arguments = sys.argv
nb_arguments = len(arguments)

if (nb_arguments < 3):
    helpmsg("Here's how to use this testing app")
elif (nb_arguments > 3):
    helpmsg("Too many arguments")
elif (arguments[1] not in documentTypes):
    helpmsg("Please add use 'invoice', 'receipt', 'finance' or 'passport' as the type of document you want to use")
elif (arguments[2] and not os.path.isfile(arguments[2])):
    helpmsg("The file doesn't exist or the path you provided isn't the right one")
elif (arguments[1] == "receipt"):
    receipt_data = mindee_client.parse_receipt(arguments[2], "path", "3", True)
    print(receipt_data.receipt)
elif (arguments[1] == "invoice"):
    invoice_data = mindee_client.parse_invoice(arguments[2], "path", "2", True)
    print(invoice_data.invoice)
elif (arguments[1] == "finance"):
    finance_data = mindee_client.parse_financial_document(arguments[2], "path", True)
    print(finance_data.financial_document)
elif (arguments[1] == "passport"):
    passport_data = mindee_client.parse_passport(arguments[2], "path", "1", True)
    print(passport_data.passport)
elif (arguments[1] == "license_plate"):
    license_data = mindee_client.parse_license_plate(arguments[2], "path", "1", True)
    print(license_data.license_plate)
