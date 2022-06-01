import json
from mindee import Client
from simple_chalk import chalk

INVOICE_FILE = "/Users/fharper/Documents/code/mindee/datasets/invoices/a167899f-5e27-4f0f-bab4-aeac83243f9c.pdf"
PASSPORT_FILE = "/Users/fharper/Documents/code/mindee/datasets/passports/b8cbe647_958e45e9_carole-arnault-11513195971239.jpg"
RECEIPT_FILE = "/Users/fharper/Documents/code/mindee/datasets/receipts/America/20ee4a00-f96b-4e42-a44a-e2b8ebc00ebf.jpg"
CUSTOM_API_FILE = "/Users/fharper/Documents/code/mindee/datasets/w9s/VICTOR_KRUM.pdf"

"""
###########
# Invoice #
###########

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

# Supplier Name
print(chalk.green("\nSupplier Name"))
print(invoice_data.invoice.supplier.value)

# Supplier Address
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

###########
# Receipt #
###########

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

############
# Passport #
############

mindee_client = Client().config_passport()
passport_data = mindee_client.doc_from_path(PASSPORT_FILE).parse("passport")

print(chalk.green("\n--------"))
print(chalk.green("PASSPORT"))
print(chalk.green("--------\n"))

print(chalk.green("\nDocument Level Prediction"))
print(passport_data.passport)

print(chalk.green("\nPage Level Prediction"))
for passport in passport_data.passports:
    print(passport)

print(chalk.green("\nHTTP Response"))
print(json.dumps(passport_data.http_response, indent=4, sort_keys=True))

print(chalk.green("\nDate of birth"))
print(passport_data.passport.birth_date.value)

print(chalk.green("\nPlace of birth"))
print(passport_data.passport.birth_place.value)

print(chalk.green("\nCountry"))
print(passport_data.passport.country.value)

print(chalk.green("\nExpiration Date"))
print(passport_data.passport.expiry_date.value)

print(chalk.green("\nGender"))
print(passport_data.passport.gender.value)

print(chalk.green("\nGiven Names"))
given_names = passport_data.passport.given_names
print("Given names: ")
for given_name in given_names:
   name = given_name.value
print(name)

print(chalk.green("\nPassport ID"))
print(passport_data.passport.id_number.value)

print(chalk.green("\nIssuance Date"))
print(passport_data.passport.issuance_date.value)

print(chalk.green("\nMachine Readable Zone - First line"))
print(passport_data.passport.mrz1.value)

print(chalk.green("\nMachine Readable Zone - Second line"))
print(passport_data.passport.mrz2.value)

print(chalk.green("\nMachine Readable Zone - Reconstructed"))
print(passport_data.passport.mrz.value)

print(chalk.green("\nSurname"))
print(passport_data.passport.surname.value)
"""

##########################################
# API BUILDER: CUSTOM API - W9 documents #
##########################################

#
# If you want to use this testing app, you either need to create your own W9s
# custom API using the API Builder and the same data model.
#
# If you want to adapt this to your own custom API, you need to change the
# config_custom_doc call with your own parameters: check
# https://developers.mindee.com/docs/python-api-builder for more details.
#
# You will also have to change every field name from the place where I print
# the city, and put your own properties extracted in the document based on your data model.
#

print(chalk.green("\n-------"))
print(chalk.green("API BUILDER: CUSTOM API"))
print(chalk.green("-------\n"))

mindee_client = Client().config_custom_doc(
    document_type="wsnine", #It's the API Name, we will fix that in a future version of the SDK
    singular_name="w9",
    plural_name="w9s",
    account_name="fharper",
    version="1"
)

loaded_doc = mindee_client.doc_from_path(CUSTOM_API_FILE)
w9_data = loaded_doc.parse("wsnine")

print(chalk.green("\nDocument Level Prediction"))
print(w9_data.w9)

print(chalk.green("\nPage Level Prediction"))
for w9 in w9_data.w9s:
    print(w9)

print(chalk.green("\nHTTP Response"))
print(json.dumps(w9_data.http_response, indent=4, sort_keys=True))

print(chalk.green("\nCity"))
for city in w9_data.w9.city["values"]:
    print(city["content"])

print(chalk.green("\nName"))
for name in w9_data.w9.name["values"]:
    print(name["content"])

print(chalk.green("\nSocial Security Number"))
for social_security_number in w9_data.w9.social_security_number["values"]:
    print(social_security_number["content"])

print(chalk.green("\nState"))
for state in w9_data.w9.state["values"]:
    print(state["content"])

print(chalk.green("\nStreet Address"))
for street_address in w9_data.w9.street_address["values"]:
    print(street_address["content"])

print(chalk.green("\nZip Code"))
for zip_code in w9_data.w9.zip_code["values"]:
    print(zip_code["content"])
