const { Client } = require("mindee");
const fs = require("fs");
var appRoot = require('app-root-path');

const path = appRoot.path.substring(0, appRoot.path.lastIndexOf("/"));
const mindeeClient = new Client({
    expense_receipt_token: "INSERT_YOUR_API_KEY_HERE",
    invoice_token: "INSERT_YOUR_API_KEY_HERE",
    passport_token: "INSERT_YOUR_API_KEY_HERE"
});

function readFile(documentType, file, input, inputType, cutPDF) {
  let callAPI;

  switch (documentType) {
    case "invoice":
      callAPI = mindeeClient.invoice.parse({ input : input, inputType : inputType, cutPdf : cutPDF});
      break;
    case "receipt":
      callAPI = mindeeClient.receipt.parse({ input : input, inputType : inputType, cutPdf : cutPDF});
      break;;
    case "finance":
      callAPI = mindeeClient.financialDocument.parse({ input : input, inputType : inputType, cutPdf : cutPDF});
      break;
    default:
      console.log("Please add either 'invoice', 'receipt' or 'finance' as the first parameter indicating the type of document you want to process");
      process.exit(1);
  }

  callAPI.then((res) => {
    console.log("------------------------------------------------------------------------------------------------------------------------");
    console.log(`Processing ${file}...`)
    console.log("------------------------------------------------------------------------------------------------------------------------");

    switch (documentType) {
      case "invoice":
        console.log(res.invoice);
        break;
      case "receipt":
        console.log(res.receipt);
        break;;
      case "finance":
        console.log(res.financialDocument);
        break;
    }
  })
  .catch((err) => {
    console.log("------------------------------------------------------------------------------------------------------------------------");
    console.log(`Processing ${file}...`)
    console.log("------------------------------------------------------------------------------------------------------------------------");
    console.error(err);
  });
}

function readFileAsStream(documentType, file, cutPDF) {
  const stream = fs.createReadStream(file);
  readFile(documentType, file, stream, 'stream', cutPDF);
}

function readFileAsBase64(documentType, file, cutPDF) {
  const base64String = fs.readFileSync(file, {encoding: 'base64'});
  readFile(documentType, file, base64String, 'base64', cutPDF);
}

function readFileAsFile(documentType, file, cutPDF) {
  readFile(documentType, file, file, 'path', cutPDF);
}

function sleep(ms) {
  return new Promise((resolve) => {
    setTimeout(resolve, ms);
  });
}

/**
 * First argument
 *
 * file - read a file (default)
 * stream - create a ReadableStream from a file
 * base64 - create a base64 encoded string from a file
 *
 * Second argument
 *
 * loop - must be use with the first argument: if set, will loop to all PDFs from the PDF folder
 */
async function main() {
  //Skip the two first args since it's node and file name
  const arguments = process.argv.slice(2);
  let cutPDF = false;

  if ((arguments[2] != null && arguments[2] === "cutPDF") || (arguments[3] != null && arguments[3] === "cutPDF")) {
    cutPDF = true;
  }

  switch (arguments[1]) {
    case "stream":
      if (arguments[2] != null && arguments[2] === "loop") {
        const directoryPDFs = fs.opendirSync(`${path}PDFs`)
        let file;

        while ((file = directoryPDFs.readSync()) !== null) {
          readFileAsStream(arguments[0], `${path}PDFs/${file.name}`, cutPDF);
          await sleep(1000);
        }
        directoryPDFs.closeSync()
      }
      else {
        readFileAsStream(arguments[0], `${path}/Fac.pdf`, cutPDF);
      }
      break;
    case "base64":
      if (arguments[2] != null && arguments[2] === "loop") {
        const directoryPDFs = fs.opendirSync(`${path}PDFs`)
        let file;

        while ((file = directoryPDFs.readSync()) !== null) {
          readFileAsBase64(arguments[0], `${path}PDFs/${file.name}`, cutPDF);
          await sleep(1000);
        }
        directoryPDFs.closeSync()
      }
      else {
        readFileAsBase64(arguments[0], `${path}FACC.pdf`, cutPDF);
      }
      break;
    case "file":
    default:
      if (arguments[2] != null && arguments[2] === "loop") {
        const directoryPDFs = fs.opendirSync(`${path}PDFs`)
        let file;

        while ((file = directoryPDFs.readSync()) !== null) {
          readFileAsFile(arguments[0], `${path}PDFs/${file.name}`, cutPDF);
          await sleep(1000);
        }
        directoryPDFs.closeSync()
      }
      else {
        readFileAsFile(arguments[0], `${path}FACC.pdf`, cutPDF);
      }
      break;
  }
}

main();
