#!/usr/bin/env node

//*******************************************************************
//** This script tweaks the website, 
//   Specifically to delete all ttl.html files as they are not displayed in the front end
//*******************************************************************

// (For useful help, see https://www.w3schools.com/js/js_htmldom_collections.asp)

console.log( "Starting to add missing files." );

var fs = require('fs');
var path = require('path');
var fileHelpers = require('./FileHelpers');
const { Console } = require('console');


var dirOutput = path.resolve(__dirname, '..\\..\\..') + '\\temp\\pages\\_includes';

// // ////////////////////////////////////////
// // // Add missing files
// // ////////////////////////////////////////

fileArrayOutput = fileHelpers.getAllFiles(dirOutput);

fileArrayOutput.forEach(function(filePathOutput) { 
  if(filePathOutput.includes("snapshot.") 
    || filePathOutput.includes("summary.") 
    || filePathOutput.includes("snapshot-by-key.")
    || filePathOutput.includes("diff.")
  ){            
    copyFiles(filePathOutput);        
}
});

console.log('added missing files.');

function copyFiles(filePathOutput){

  fs.copyFile(filePathOutput, dirOutput + '\\' +  path.parse(filePathOutput).name + '-all' + path.parse(filePathOutput).ext,(err) => {
    if (err) {
        console.error('Error copying file:', err);
    }
});  
}