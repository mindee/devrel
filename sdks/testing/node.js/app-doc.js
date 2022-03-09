const chalk = require('chalk');

const { Client } = require("mindee");
const mindeeClient = new Client();

mindeeClient.invoice.parse ({
    input : "/Users/fharper/Documents/code/mindee/datasets/invoices/120756ca-e4fa-4a28-9dbb-cb767b25345c.pdf",
	//input : "/Users/fharper/Downloads/a74eaa5-c8e283b-sample_invoice.jpeg",
    inputType : 'path',
    filename : undefined,
    cutPdf : true,
    includeWords : false
})
.then((res) => {
	// Document prediction level
	console.log("\n\n");
	console.log(chalk.green("Document prediction level"));
	console.log(res.invoices);

	//Page prediction level
	console.log("\n\n");
	console.log(chalk.green("Page prediction level"));
  	console.log(res.invoices);

	//Full HTTP Response
	//console.log("\n\n");
	//console.log(chalk.green("Full HTTP Response"));
  	//console.log(res.httpResponse);

	//Dates
	console.log("\n\n");
	console.log(chalk.green("Invoice Date"));
	console.log(res.invoice.invoiceDate);

	//Due Date
	console.log("\n\n");
	console.log(chalk.green("Due Date"));
    console.log(res.invoice.dueDate);

	//Invoice Number
	console.log("\n\n");
	console.log(chalk.green("Invoice Number"));
    console.log(res.invoice.invoiceNumber);

	//Locale
	console.log("\n\n");
	console.log(chalk.green("Locale"));
    console.log(res.invoice.locale);

	//Supplier Company Number
	console.log("\n\n");
	console.log(chalk.green("Supplier Company Number"));
    console.log(res.invoice.companyNumber);

	//Supplier Payment Details
	console.log("\n\n");
	console.log(chalk.green("Supplier Payment Details"));
    console.log(res.invoice.paymentDetails);

	//Supplier Name
	console.log("\n\n");
	console.log(chalk.green("Supplier Name"));
    console.log(res.invoice.supplier);

	//Taxes
	console.log("\n\n");
	console.log(chalk.green("Taxes"));
    console.log(res.invoice.taxes);

	//Tests: checklist
	console.log("\n\n");
	console.log(chalk.green("Tests: checklist"));
    console.log(res.invoice.checklist);

	//Total amount including taxes
	console.log("\n\n");
	console.log(chalk.green("Total amount including taxes"));
    console.log(res.invoice.totalIncl);

	//Total amount excluding taxes
	console.log("\n\n");
	console.log(chalk.green("Total amount excluding taxes"));
    console.log(res.invoice.totalExcl);

	//Total taxes
	console.log("\n\n");
	console.log(chalk.green("Total taxes"));
    console.log(res.invoice.totalTax);

	//Customer name
	console.log("\n\n");
	console.log(chalk.green("Customer name"));
    console.log(res.invoice.customerName);

	//Customer Company Registration
	console.log("\n\n");
	console.log(chalk.green("Customer Company Registration"));
    console.log(res.invoice.customerCompanyRegistration);

	//Customer Address
	console.log("\n\n");
	console.log(chalk.green("Customer Address"));
    console.log(res.invoice.customerAddress);

	//Supplier Address
	console.log("\n\n");
	console.log(chalk.green("Supplier Address"));
    console.log(res.invoice.supplierAddress);
})
.catch((err) => {
  console.error(err);
});
