require 'bundler'
Bundler.require(:default)
require 'mindee'
require 'colorize'
require 'base64'

INVOICE_FILE = "/Users/fharper/Documents/code/mindee/datasets/invoices/a167899f-5e27-4f0f-bab4-aeac83243f9c.pdf"
RECEIPT_FILE = "/Users/fharper/Documents/code/mindee/datasets/receipts/America/20ee4a00-f96b-4e42-a44a-e2b8ebc00ebf.jpg"
PASSPORT_FILE = "/Users/fharper/Documents/code/mindee/datasets/passports/b8cbe647_958e45e9_carole-arnault-11513195971239.jpg"
CUSTOM_API_FILE = "/Users/fharper/Documents/code/mindee/datasets/w9s/VICTOR_KRUM.pdf"

## TODO: test file object, base64, bytes


################
# Invoices API #
################

mindee_client = Mindee::Client.new.config_invoice()

# Path
api_response = mindee_client.doc_from_path(INVOICE_FILE).parse("invoice")

=begin
# File Object
api_response = nil
File.open(INVOICE_FILE, 'rb') do |fo|
    api_response = mindee_client.doc_from_file(fo, "invoice").parse("invoice")
end

# Base64
#INVOICE_FILE_BASE64 = Base64.encode64(File.open(INVOICE_FILE, "rb").read)
#api_response = mindee_client.doc_from_b64string(INVOICE_FILE_BASE64, "invoice.pdf").parse("invoice")


# Binary
raw_bytes = File.binread INVOICE_FILE
api_response = mindee_client.doc_from_bytes(raw_bytes, "invoice.pdf").parse("invoice")
=end

puts "\n-------".colorize(:green)
puts "Invoice".colorize(:green)
puts "-------".colorize(:green)

# Document Level Prediction
puts "\nDocument Level Prediction".colorize(:green)
puts api_response.document

#Page Level Prediction
puts "\nPage Level Prediction".colorize(:green)
api_response.pages.each do |page|
  # as object, complete
  puts "\nPage Level Prediction: Object".colorize(:green)
  pp page

  # as string, summary
  puts "\nPage Level Prediction: Summary".colorize(:green)
  puts page
end

#Raw HTTP Response
puts "\nHTTP Response".colorize(:green)
puts api_response.http_response

# Orientation
puts "\nOrientation".colorize(:green)
puts api_response.pages[0].orientation.degrees

# Customer Information
puts "\nCustomer Information".colorize(:green)

# Customer Information: Name
puts "\nCustomer Information: Name".colorize(:green)
puts api_response.document.customer_name.value

# Customer Information: Address
puts "\nCustomer Information: Address".colorize(:green)
puts api_response.document.customer_address.value

# Customer Information: Company Registration
puts "\nCustomer Information: Company Registration".colorize(:green)
puts api_response.document.customer_company_registration

# Dates
puts "\nDates".colorize(:green)

# Dates: Invoice
puts "\nDates: Invoice".colorize(:green)
puts api_response.document.date.value

# Dates: Due
puts "\nDates: Due".colorize(:green)
puts api_response.document.due_date.value

# Locale
puts "\nLocale".colorize(:green)
puts api_response.document.locale

# Locale: language
puts "\nLocale: language".colorize(:green)
puts api_response.document.locale.language

# Locale: currency
puts "\nLocale: currency".colorize(:green)
puts api_response.document.locale.currency

# Locale: country
puts "\nLocale: country".colorize(:green)
puts api_response.document.locale.country

# Payment Information
puts "\nPayment Information".colorize(:green)
puts api_response.document.payment_details

# Supplier Information
puts "\nSupplier Information".colorize(:green)

# Supplier Information: Company Registration
puts "\nSupplier Information: Company Registration".colorize(:green)
puts api_response.document.company_registration

# Supplier Information: Company Registration
puts "\nSupplier Information: Name".colorize(:green)
puts api_response.document.supplier.value

# Supplier Information: Address
puts "\nSupplier Information: Address".colorize(:green)
puts api_response.document.supplier_address.value

# Taxes
puts "\nTaxes".colorize(:green)
puts api_response.document.taxes

# Total Amounts
puts "\nTotal Amounts".colorize(:green)

# Total Amounts: Including Taxes
puts "\nTotal Amounts: Including Taxes".colorize(:green)
puts api_response.document.total_incl.value

# Total Amounts: Excluding Taxes
puts "\nTotal Amounts: Excluding Taxes".colorize(:green)
puts api_response.document.total_excl.value

# Total Amounts: Total Taxes
puts "\nTotal Amounts: Total Taxes".colorize(:green)
puts api_response.document.total_tax.value

=begin
################
# Receipts API #
################

mindee_client = Mindee::Client.new.config_receipt()
api_response = mindee_client.doc_from_path(RECEIPT_FILE).parse("receipt")

puts "\n-------".colorize(:green)
puts "Receipt".colorize(:green)
puts "-------".colorize(:green)

# Document Level Prediction
puts "\nDocument Level Prediction".colorize(:green)
puts api_response.document

#Page Level Prediction
puts "\nPage Level Prediction".colorize(:green)
api_response.pages.each do |page|
  # as object, complete
  puts "\nPage Level Prediction: Object".colorize(:green)
  pp page

  # as string, summary
  puts "\nPage Level Prediction: Summary".colorize(:green)
  puts page
end

#Raw HTTP Response
puts "\nHTTP Response".colorize(:green)
puts api_response.http_response

# Orientation
puts "\nOrientation".colorize(:green)
puts api_response.pages[0].orientation.degrees

# Category
puts "\nCategory".colorize(:green)
puts api_response.document.category.value

# Date
puts "\nDate".colorize(:green)
puts api_response.document.date.value

# Locale
puts "\nLocale".colorize(:green)
puts api_response.document.locale

# Locale: language
puts "\nLocale: language".colorize(:green)
puts api_response.document.locale.language

# Locale: currency
puts "\nLocale: currency".colorize(:green)
puts api_response.document.locale.currency

# Locale: country
puts "\nLocale: country".colorize(:green)
puts api_response.document.locale.country

# Supplier Information
puts "\nSupplier Information".colorize(:green)
puts api_response.document.supplier.value

# Taxes
puts "\nTaxes".colorize(:green)
puts api_response.document.taxes

# Time
puts "\nTime".colorize(:green)
puts api_response.document.time.value

# Total Amounts
puts "\nTotal Amounts".colorize(:green)

# Total Amounts: Including Taxes
puts "\nTotal Amounts: Including Taxes".colorize(:green)
puts api_response.document.total_incl.value

# Total Amounts: Excluding Taxes
puts "\nTotal Amounts: Excluding Taxes".colorize(:green)
puts api_response.document.total_excl.value

# Total Amounts: Total Taxes
puts "\nTotal Amounts: Total Taxes".colorize(:green)
puts api_response.document.total_tax.value


#################
# Passports API #
#################

mindee_client = Mindee::Client.new.config_passport()
api_response = mindee_client.doc_from_path(PASSPORT_FILE).parse("passport")

puts "\n-------".colorize(:green)
puts "Passport".colorize(:green)
puts "-------".colorize(:green)

# Document Level Prediction
puts "\nDocument Level Prediction".colorize(:green)
puts api_response.document

#Page Level Prediction
puts "\nPage Level Prediction".colorize(:green)
api_response.pages.each do |page|
  # as object, complete
  puts "\nPage Level Prediction: Object".colorize(:green)
  pp page

  # as string, summary
  puts "\nPage Level Prediction: Summary".colorize(:green)
  puts page
end

#Raw HTTP Response
puts "\nHTTP Response".colorize(:green)
puts api_response.http_response

# Orientation
puts "\nOrientation".colorize(:green)
puts api_response.pages[0].orientation.degrees

# Birth Place
puts "\nBirth Place".colorize(:green)
puts api_response.document.birth_place.value

# Country
puts "\nCountry".colorize(:green)
puts api_response.document.country.value

#Dates
puts "\nDates".colorize(:green)

# Expiry Date
puts "\nExpiry Date".colorize(:green)
puts api_response.document.expiry_date.value

# Issuance Date
puts "\nIssuance Date".colorize(:green)
puts api_response.document.issuance_date.value

# Birth Date
puts "\nBirth Date".colorize(:green)
puts api_response.document.birth_date.value

# Gender
puts "\nGender".colorize(:green)
puts api_response.document.gender.value

# Given Names
puts "\nGiven Names".colorize(:green)
puts api_response.document.given_names

# ID
puts "\nID".colorize(:green)
puts api_response.document.id_number.value

# Machine Readable Zone
puts "\nMachine Readable Zone".colorize(:green)

# MRZ1
puts "\nMRZ1".colorize(:green)
puts api_response.document.mrz1.value

# MRZ2
puts "\nMRZ2".colorize(:green)
puts api_response.document.mrz2.value

# MRZ
puts "\nMRZ".colorize(:green)
puts api_response.document.mrz.value

# Surname
puts "\nSurname".colorize(:green)
puts api_response.document.surname.value

##############
# Custom API #
##############

mindee_client = Mindee::Client.new.config_custom_doc(
    "wsnine", #It's the API Name, we will fix that in a future version of the SDK
    "fharper"
)
api_response = mindee_client.doc_from_path(CUSTOM_API_FILE).parse("wsnine")

puts "\n---------------".colorize(:green)
puts "Custom API: W9S".colorize(:green)
puts "---------------".colorize(:green)

# Document level prediction
puts "\nDocument Level Prediction".colorize(:green)

# as object, complete
puts "\nDocument Level Prediction: Object".colorize(:green)
pp api_response.document

# as string, summary
puts "\nDocument Level Prediction: Summary".colorize(:green)
puts api_response.document

puts "\nPage Level Prediction".colorize(:green)
api_response.pages.each do |page|
  # as object, complete
  puts "\nPage Level Prediction: Object".colorize(:green)
  pp page

  # as string, summary
  puts "\nPage Level Prediction: Summary".colorize(:green)
  puts page
end

#Raw HTTP Response
puts "\nHTTP Response".colorize(:green)
puts api_response.http_response

# Name
puts "\nName".colorize(:green)
puts api_response.document.name.to_s

# Street Address
puts "\nStreet Address".colorize(:green)
puts api_response.document.street_address.to_s

# City
puts "\nCity".colorize(:green)
puts api_response.document.city.to_s

# State
puts "\nState".colorize(:green)
puts api_response.document.state.to_s

# Zip Code
puts "\nZip Code".colorize(:green)
puts api_response.document.zip_code.to_s

# Social Security Number
puts "\nSocial Security Number".colorize(:green)
puts api_response.document.social_security_number.to_s
=end
