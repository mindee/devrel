require 'bundler'
Bundler.require(:default)
require 'mindee'

INVOICE_FILE = "/Users/fharper/Documents/code/mindee/datasets/invoices/a167899f-5e27-4f0f-bab4-aeac83243f9c.pdf"
RECEIPT_FILE = "/Users/fharper/Documents/code/mindee/datasets/receipts/America/20ee4a00-f96b-4e42-a44a-e2b8ebc00ebf.jpg"
PASSPORT_FILE = "/Users/fharper/Documents/code/mindee/datasets/passports/b8cbe647_958e45e9_carole-arnault-11513195971239.jpg"
CUSTOM_API_FILE = "/Users/fharper/Documents/code/mindee/datasets/w9s/VICTOR_KRUM.pdf"

=begin
mindee_client = Mindee::Client.new.config_invoice()
api_response = mindee_client.doc_from_path(INVOICE_FILE).parse("invoice")
puts api_response.document

mindee_client = Mindee::Client.new.config_receipt()
api_response = mindee_client.doc_from_path(RECEIPT_FILE).parse("receipt")
puts api_response.document

mindee_client = Mindee::Client.new.config_passport()
api_response = mindee_client.doc_from_path(PASSPORT_FILE).parse("passport")
puts api_response.document
=end

mindee_client = Mindee::Client.new.config_custom_doc(
	"fharper",
    "wsnine", #It's the API Name, we will fix that in a future version of the SDK
    "w9",
    "w9s"
)

# Load a file from disk and parse it
api_response = mindee_client.doc_from_path(CUSTOM_API_FILE).parse("wsnine")

# Print a brief summary of the parsed data
  puts api_response.document