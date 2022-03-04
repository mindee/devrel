from mindee import Client
import json

""" mindee_client = Client().config_receipt()
receipt_data = mindee_client.doc_from_path("/Users/fharper/Documents/code/mindee/datasets/receipts/Europe/0aa55ac5-7499-4f97-b94a-8aea44b9bbf0.jpg").parse("receipt")
print(receipt_data.receipt) """


mindee_client = Client().config_invoice()
invoice_data = mindee_client.doc_from_path("/Users/fharper/Documents/code/mindee/datasets/invoices/995b49c5-acc4-4272-a01a-2e44e99ff704.pdf").parse("invoice")

# Company Registration Numbers
print("\nCompany Registration Numbers")
company_registration_numbers = invoice_data.invoice.company_number

for company_number in company_registration_numbers:
    # To get the type of number
    company_number_type = company_number.type
    print ("\nCompany Number Type")
    print (company_number_type)

    # To get the company number
    company_number_value = company_number.value
    print ("\nCompany Number")
    print (company_number_value)

# Customer Name
print("\nCustomer Name")
print(invoice_data.invoice.customer_name.value)

# Customer Address
print("\nCustomer Address")
print(invoice_data.invoice.customer_address.value)

# Customer Company Registration
print("\nCustomer Company Registration")
print(invoice_data.invoice.customer_company_registration.value)

# Invoice Date
print("\nDate")
print(invoice_data.invoice.invoice_date.value)

# Invoice Due Date
print("\nDue Date")
print(invoice_data.invoice.due_date.value)

# Locale
print("\nLocale")
print(invoice_data.invoice.locale.value)

# Currency
print("\nCurrency")
print(invoice_data.invoice.locale.currency)

# Payment Details
print("\nPayment Details")
payment_details = invoice_data.invoice.payment_details

# Loop on each object
for payment_detail in payment_details:
   # To get the IBAN
   print("\nIBAN")
   print(payment_detail.iban)

   # To get the swift
   print("\nSWIFT")
   print(payment_detail.swift)

   # To get the routing number
   print("\nRouting Number")
   print(payment_detail.routing_number)

   # To get the account_number
   print("\nAccount Number")
   print(payment_detail.account_number)

# Customer Name
print("\nSupplier Name")
print(invoice_data.invoice.supplier.value)

# Customer Address
print("\nSupplier Address")
print(invoice_data.invoice.supplier_address.value)

# Taxes
print("\nTaxes")
taxes = invoice_data.invoice.taxes

# Loop on each Tax field
for tax in taxes:
   # To get the tax amount
   print("\nTax Amount")
   print(tax.value)

   # To get the tax code for from a tax object
   print("\nTax Code")
   print(tax.code)

   # To get the tax rate
   print("\nTax Code")
   print(tax.rate)

print("\nTotal including taxes")
print(invoice_data.invoice.total_incl.value)

print("\nTotal excluding taxes")
print(invoice_data.invoice.total_excl.value)

print("\nTotal taxes")
print(invoice_data.invoice.total_tax.value)

""" mindee_client = Client().config_passport()
passport_data = mindee_client.doc_from_path("/Users/fharper/Documents/code/mindee/datasets/passports/b8cbe647_958e45e9_carole-arnault-11513195971239.jpg").parse("passport")
print(passport_data.passport) """
