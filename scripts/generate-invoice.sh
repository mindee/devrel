#!/bin/zsh

# API reference: https://invoice-generator.com/developers#api-reference
curl https://invoice-generator.com -H "Content-Type: application/json" -d @invoice.json --output invoice.pdf