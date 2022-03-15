require 'faker'

# Faker documentation
# https://github.com/faker-ruby/faker#default

# France
puts "France Bank"
puts "IBAN: " + Faker::Bank.iban(country_code: 'fr')
puts "Routing: " + Faker::Bank.routing_number
puts "Account: " + Faker::Bank.account_number(digits: 11)
puts "Swift: " + Faker::Bank.swift_bic

# US
puts
puts "US Company"
puts "Company Registration Number (EIN): " + Faker::Company.ein
