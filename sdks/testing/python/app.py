import json
from mindee import Client
from simple_chalk import chalk

INVOICE_FILE = "/Users/fharper/Documents/code/mindee/documentation/fake-data/invoice.pdf"
PASSPORT_FILE = "/Users/fharper/Documents/code/mindee/datasets/passports/b8cbe647_958e45e9_carole-arnault-11513195971239.jpg"
RECEIPT_FILE = "/Users/fharper/Downloads/6882f91-receipt23.png"

mindee_client = Client().config_invoice()
invoice_data = mindee_client.doc_from_path(INVOICE_FILE).parse("invoice")

print(chalk.green("\n-------"))
print(chalk.green("INVOICE"))
print(chalk.green("-------\n"))

print(chalk.green("\nDocument Level Prediction"))
print(invoice_data.invoice)

print(chalk.green("\nPage Level Prediction"))
for receipt in invoice_data.invoices:
    print(receipt)

print(chalk.green("\nRaw HTTP Response"))
print(json.dumps(invoice_data.http_response, indent=4))

# Company Registration Numbers
print(chalk.green("\nCompany Registration Numbers"))
company_registration_numbers = invoice_data.invoice.company_number

for company_number in company_registration_numbers:
    # To get the type of number
    company_number_type = company_number.type
    print (chalk.green("\nCompany Number Type"))
    print (company_number_type)

    # To get the company number
    company_number_value = company_number.value
    print (chalk.green("\nCompany Number"))
    print (company_number_value)

# Customer Name
print(chalk.green("\nCustomer Name"))
print(invoice_data.invoice.customer_name.value)

# Customer Address
print(chalk.green("\nCustomer Address"))
print(invoice_data.invoice.customer_address.value)

# Customer Company Registration
print(chalk.green("\nCustomer Company Registration"))
customer_company_registrations = invoice_data.invoice.customer_company_registration

print (invoice_data.invoice.customer_company_registration.value)
for customer_company_registration in customer_company_registrations:
    # To get the type of number
    customer_company_registration_number_type = customer_company_registration.type
    print (chalk.green("\nCustomer Company Registration Type"))
    print (customer_company_registration_number_type)

    # To get the company number
    customer_company_registration_number_value = customer_company_registration.value
    print (chalk.green("\nCustomer Company Registration Number"))
    print (customer_company_registration_number_value)

# Invoice Date
print(chalk.green("\nDate"))
print(invoice_data.invoice.invoice_date.value)

# Invoice Due Date
print(chalk.green("\nDue Date"))
print(invoice_data.invoice.due_date.value)

# Locale
print(chalk.green("\nLocale"))
print(invoice_data.invoice.locale.value)

# Currency
print(chalk.green("\nCurrency"))
print(invoice_data.invoice.locale.currency)

# Payment Details
print(chalk.green("\nPayment Details"))
payment_details = invoice_data.invoice.payment_details

# Loop on each object
for payment_detail in payment_details:
    # To get the IBAN
    print(chalk.green("\nIBAN"))
    print(payment_detail.iban)

    # To get the swift
    print(chalk.green("\nSWIFT"))
    print(payment_detail.swift)

    # To get the routing number
    print(chalk.green("\nRouting Number"))
    print(payment_detail.routing_number)

    # To get the account_number
    print(chalk.green("\nAccount Number"))
    print(payment_detail.account_number)

# Customer Name
print(chalk.green("\nSupplier Name"))
print(invoice_data.invoice.supplier.value)

# Customer Address
print(chalk.green("\nSupplier Address"))
print(invoice_data.invoice.supplier_address.value)

# Taxes
print(chalk.green("\nTaxes"))
taxes = invoice_data.invoice.taxes

# Loop on each Tax field
for tax in taxes:
    # To get the tax amount
    print(chalk.green("\nTax Amount"))
    print(tax.value)

    # To get the tax code for from a tax object
    print(chalk.green("\nTax Code"))
    print(tax.code)

    # To get the tax rate
    print(chalk.green("\nTax Code"))
    print(tax.rate)

print(chalk.green("\nTotal including taxes"))
print(invoice_data.invoice.total_incl.value)

print(chalk.green("\nTotal excluding taxes"))
print(invoice_data.invoice.total_excl.value)

print(chalk.green("\nTotal taxes"))
print(invoice_data.invoice.total_tax.value)

"""
mindee_client = Client().config_passport()
passport_data = mindee_client.doc_from_path(PASSPORT_FILE).parse("passport"))
print(passport_data.passport)
"""

print(chalk.green("\n-------"))
print(chalk.green("RECEIPT"))
print(chalk.green("-------\n"))

mindee_client = Client().config_receipt()
receipt_data = mindee_client.doc_from_path(RECEIPT_FILE).parse("receipt")

print(chalk.green("\nDocument Level Prediction"))
print(receipt_data.receipt)

print(chalk.green("\nPage Level Prediction"))
for receipt in receipt_data.receipts:
    print(receipt)

print(chalk.green("\nRaw HTTP Response"))
print(json.dumps(receipt_data.http_response, indent=4))

print(chalk.green("\nCategory"))
print(receipt_data.receipt.category.value)

print(chalk.green("\nDate"))
print(receipt_data.receipt.date.value)

print(chalk.green("\nLocale"))

print(chalk.green("\nLanguage & Country Code"))
print(receipt_data.receipt.locale.value)

print(chalk.green("\nLanguage Code"))
print(receipt_data.receipt.locale.language)

print(chalk.green("\nCurrency Code"))
print(receipt_data.receipt.locale.currency)

print(chalk.green("\nCountry Code"))
print(receipt_data.receipt.locale.country)

print(chalk.green("\nSupplier Information"))
print(receipt_data.receipt.merchant_name.value)

print(chalk.green("\nTaxes"))
# To get the list of taxes
taxes = receipt_data.receipt.taxes

print(chalk.green("\nTaxes"))

for tax in taxes:
    print(chalk.green("\nTax"))
    print(tax.value)

    print(chalk.green("\nTax Code"))
    print(tax.code)

    print(chalk.green("\nTax Rate"))
    print(tax.rate)

print(chalk.green("\nTime"))
print(receipt_data.receipt.time.value)

print(chalk.green("\nTotal Including Taxes"))
print(receipt_data.receipt.total_incl.value)

print(chalk.green("\nTotal Excluding Taxes"))
print(receipt_data.receipt.total_excl.value)

print(chalk.green("\nTotal Taxes"))
print(receipt_data.receipt.total_tax.value)
