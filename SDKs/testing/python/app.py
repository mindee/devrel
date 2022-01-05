"""This app is to test the Mindee Python SDK."""
"""run pip install -e PATH_TO_PYTHON_SDK to use the local SDK gi repo"""

import json
from mindee import Client

mindee_client = Client(
    expense_receipt_token="INSERT_YOUR_API_KEY_HERE",
    invoice_token="INSERT_YOUR_API_KEY_HERE",
    passport_token="INSERT_YOUR_API_KEY_HERE",
    raise_on_error=True
)

# Parse a receipt
receipt_data = mindee_client.parse_receipt("receipt.pdf", "path", "3", True, False, 3)

# Fix because we don't return valid JSON
print(json.dumps(receipt_data.http_response))

# Parse an invoice
#invoice_data = mindee_client.parse_invoice("/path/to/file")

# Parse a passport
#passport_data = mindee_client.parse_passport("/path/to/file")
