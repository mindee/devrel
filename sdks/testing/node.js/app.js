const { Client } = require("mindee");
const fs = require("fs");
var appRoot = require('app-root-path');

const path = appRoot.path;
const mindeeClient = new Client();
const documentTypes = ["invoice", "receipt", "finance"];
const inputTypes = ["file", "stream", "base64"];
const boolTypes = ["true", "false"];

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
 * How to use
 * node app.js invoice file true false myPDF.pdf
 *
 * Type of document
 * invoice, receipt, finance
 *
 * How to read the file or files
 * file, stream, base64
 *
 * Using cutPDF
 * true, false
 *
 * Looping all PDFs from the PDFs folder
 * true, false
 *
 * PDF document path (if loop is false)
 * relative or full path to the file you want to test
 *
 */
async function main() {
  //Skip the two first args since it's node and app file name
  const arguments = process.argv.slice(2);

  //Check if all arguments are there. There is an issue if...
  if (arguments[0] === "--help") {
    help("Here's how to use this testing app\n");
  }
  else if (arguments.length > 5) {
    help("Too many arguments");
  }
  else if (arguments.length < 5 && arguments[3] === "false") {
      help("Missing the PDF file path");
  }
  else if (arguments.length > 4 && arguments[3] === "true") {
    help("Looping through the directory, but you provided a file to use: please choose one or another");
  }
  else if (!documentTypes.includes(arguments[0])) {
    help("Please add use 'invoice', 'receipt' or 'finance' as the type of document you want to use");
  }
  else if (!inputTypes.includes(arguments[1])) {
    help("Please add use 'file', 'stream' or 'base64' as the input type of your document");
  }
  else if (!boolTypes.includes(arguments[2])) {
    help("Please use 'true' or 'false' for the cutPDF argument");
  }
  else if (!boolTypes.includes(arguments[3])) {
    help("Please use 'true' or 'false' for the loop argument");
  }
  else if (arguments[4] != null && !fs.existsSync(arguments[4])) {
    help("The file doesn't exist or the path you provided isn't the right one");
  }
  else {
    let documentType = arguments[0];
    let readingType = arguments[1];
    let cutPDF = (arguments[2] === 'true');
    let loop = (arguments[3] === 'true');
    let file = arguments[4] !== null ? arguments[4] : null;

    switch (readingType) {
      case "stream":
        if (loop) {
          const directoryPDFs = fs.opendirSync(`${path}/PDFs`)
          let file;

          while ((file = directoryPDFs.readSync()) !== null) {
            if (file.name.toLowerCase().endsWith(".pdf")) {
              readFileAsStream(documentType, `${path}/PDFs/${file.name}`, cutPDF);
              await sleep(1000);
            }
          }
          directoryPDFs.closeSync()
        }
        else {
          readFileAsStream(documentType, file, cutPDF);
        }
        break;
      case "base64":
        if (loop) {
          const directoryPDFs = fs.opendirSync(`${path}/PDFs`)
          let file;

          while ((file = directoryPDFs.readSync()) !== null) {
            if (file.name.toLowerCase().endsWith(".pdf")) {
              readFileAsBase64(documentType, `${path}/PDFs/${file.name}`, cutPDF);
              await sleep(1000);
            }
          }
          directoryPDFs.closeSync()
        }
        else {
          readFileAsBase64(documentType, file, cutPDF);
        }
        break;
      case "file":
      default:
        if (loop) {
          const directoryPDFs = fs.opendirSync(`${path}/PDFs`)
          let file;

          while ((file = directoryPDFs.readSync()) !== null) {
            if (file.name.toLowerCase().endsWith(".pdf")) {
              readFileAsFile(documentType, `${path}/PDFs/${file.name}`, cutPDF);
              await sleep(1000);
            }
          }
          directoryPDFs.closeSync()
        }
        else {
          readFileAsFile(documentType, file, cutPDF);
        }
        break;
    }
  }
}

async function help(message) {
  console.log(`${message}\n`);
  console.log("Correct parameters lists are: [document type] [input type: how to read the file] [using cutPDF] [looping through the PDFs in the PDFs folder] [relative or full path for the PDF file to read]");
  console.log("with those values [invoice, receipt, finance] [file, stream, base64] [true, false] [true, false] [filePath]\n");
  console.log("example: node app.js invoice file true false myPDF.pdf\n");
  console.log("Please note that if 'loop' is true, do not provide a filePath");
}

main();
