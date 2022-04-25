const chalk = require('chalk');
const fs = require("fs");
const { Client } = require("mindee");
const mindeeClient = new Client();

mindeeClient.invoice.parse ({
    input : "/Users/fharper/Documents/code/mindee/datasets/invoices/a167899f-5e27-4f0f-bab4-aeac83243f9c.pdf",
	//input : "/Users/fharper/Downloads/a74eaa5-c8e283b-sample_invoice.jpeg",
    inputType : 'path',
    filename : undefined,
    cutPdf : true,
    includeWords : false
})
.then((res) => {
	// Document prediction level
	console.log("\n");
	console.log(chalk.green("Document prediction level"));
	console.log(res.invoices);

	//Page prediction level
	console.log("\n");
	console.log(chalk.green("Page prediction level"));
  	console.log(res.invoices);

	//Full HTTP Response
	console.log("\n");
	console.log(chalk.green("Full HTTP Response"));
  	console.log(res.httpResponse);

	//Dates
	console.log("\n");
	console.log(chalk.green("Invoice Date"));
	console.log(res.invoice.invoiceDate.value);

	//Due Date
	console.log("\n");
	console.log(chalk.green("Due Date"));
    console.log(res.invoice.dueDate.value);

	//Invoice Number
	console.log("\n");
	console.log(chalk.green("Invoice Number"));
    console.log(res.invoice.invoiceNumber.value);

	//Language
	console.log("\n");
	console.log(chalk.green("Language"));
    console.log(res.invoice.locale.language);

	//Country
	console.log("\n");
	console.log(chalk.green("Country"));
    console.log(res.invoice.locale.country);

	//Currency
	console.log("\n");
	console.log(chalk.green("Currency"));
	console.log(res.invoice.locale.currency);

	//Supplier Company Number
	console.log("\n");
	console.log(chalk.green("Supplier Company Number"));
    console.log(res.invoice.companyNumber.value);

	//Supplier Payment Details
	console.log("\n");
	console.log(chalk.green("Supplier Payment Details"));

	//Supplier Payment Details - IBAN
	console.log("\n");
	console.log(chalk.green("Supplier Payment Details - IBAN"));
    console.log(res.invoice.paymentDetails.iban);

	//Supplier Payment Details - SWIFT
	console.log("\n");
	console.log(chalk.green("Supplier Payment Details - SWIFT"));
    console.log(res.invoice.paymentDetails.swift);

	//Supplier Payment Details - Routing Number
	console.log("\n");
	console.log(chalk.green("Supplier Payment Details - Routing Number"));
    console.log(res.invoice.paymentDetails.routingNumber);

	//Supplier Name
	console.log("\n");
	console.log(chalk.green("Supplier Name"));
    console.log(res.invoice.supplier.value);

	//Taxes
	console.log("\n");
	console.log(chalk.green("Taxes"));

	//Taxes Value
	console.log("\n");
	console.log(chalk.green("Value"));
    console.log(res.invoice.taxes.value);
	
	//Taxes Rate
	console.log("\n");
	console.log(chalk.green("Rate"));
    console.log(res.invoice.taxes.rate);

	//Taxes Code
	console.log("\n");
	console.log(chalk.green("Code"));
    console.log(res.invoice.taxes.code);

	//Tests: checklist - Taxes Match Total including Taxes
	console.log("\n");
	console.log(chalk.green("Tests: checklist"));

	//Taxes Match Total including Taxes
	console.log("\n");
	console.log(chalk.green("Taxes Match Total including Taxes"));
    console.log(res.invoice.checklist.taxesMatchTotalIncl);

	//Taxes Match Total excluding Taxes
	console.log("\n");
	console.log(chalk.green("Taxes Match Total excluding Taxes"));
    console.log(res.invoice.checklist.taxesMatchTotalExcl);

	//Taxes + Total excluding Taxes Match Total including Taxes
	console.log("\n");
	console.log(chalk.green("Taxes + Total excluding Taxes Match Total including Taxes"));
    console.log(res.invoice.checklist.taxesPlusTotalExclMatchTotalIncl);

	//Total amount including taxes
	console.log("\n");
	console.log(chalk.green("Total amount including taxes"));
    console.log(res.invoice.totalIncl.value);

	//Total amount excluding taxes
	console.log("\n");
	console.log(chalk.green("Total amount excluding taxes"));
    console.log(res.invoice.totalExcl.value);

	//Total taxes
	console.log("\n");
	console.log(chalk.green("Total taxes"));
    console.log(res.invoice.totalTax.value);

	//Customer name
	console.log("\n");
	console.log(chalk.green("Customer name"));
    console.log(res.invoice.customerName.value);

	//Customer Company Registration Type
	console.log("\n\n");
	console.log(chalk.green("Customer Company Registration Type"));
    console.log(res.invoice.customerCompanyRegistration.type);

	//Customer Company Registration
	console.log("\n\n");
	console.log(chalk.green("Customer Company Registration"));
    console.log(res.invoice.customerCompanyRegistration.value);

	//Customer Address
	console.log("\n");
	console.log(chalk.green("Customer Address"));
    console.log(res.invoice.customerAddress.value);

	//Supplier Address
	console.log("\n");
	console.log(chalk.green("Supplier Address"));
    console.log(res.invoice.supplierAddress.value);
