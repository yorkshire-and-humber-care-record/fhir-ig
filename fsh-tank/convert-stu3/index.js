#!/usr/bin/env node

//*******************************************************************
//** A limitiation of fsh is that it outputs only R4 files
//** This script tweaks them to be STU3, ready for the fhir publisher tool
//*******************************************************************

console.log( "Beginning R4 to STU3 conversion" );

var fs = require('fs');
var path = require('path');
var fileHelpers = require('./FileHelpers');

var dirR4 = path.resolve(__dirname, '..') + '\\fsh-generated';
var dirSTU3 = path.resolve(__dirname, '..') + '\\fsh-generated-STU3';
var regexEscapedDirR4=dirR4.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1");

// Clean out and recreate the STU3 output folder
  if (fs.existsSync(dirSTU3)) {
     fs.rmdirSync(dirSTU3, { recursive: true });
  }
fs.mkdirSync(dirSTU3);

// Go through all the R4 files output by fsh to the "fsh-generated" folder
// Copy them across to "fsh-generated-STU3", replacing the fhirVersion as we go
fileArrayR4 = fileHelpers.getAllFiles(dirR4);
fileArrayR4.forEach(function(filePathR4) {
  var filePathSTU3 = filePathR4.replace(new RegExp(regexEscapedDirR4, 'g'), dirSTU3);
  fileHelpers.replaceStringInFile(filePathR4, filePathSTU3, '4.0.1', '3.0.2');
});


//***********************************************************************************
//** The differences between R4 and STU3 are generally minor
//** So in many cases this simple tweak of the version number may be all that is needed
//** However it is possible that for some resources there will be further adjustments needed
//** In which case further manipulation of the STU3 copies can be added here.
//** (This could be simple search and replace (eg using "replaceStringInFile"), or if needed then more complex json manipulation)
//*************************************************************************************

// ** (Nothing yet) **
/* TODO - for extensions... the old way that we need is... (although not needed for CareConnect as overcopy)

          "valueSetReference": {
            "reference": "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-EthnicCategory-1"
          }

    "contextType": "resource",
  "context": [
    "Patient"
  ],


FOR PROFILES
Remove spurious security-category extension in structure definitions...
Also fix profiles array

  */


console.log( "Completed R4 to STU3 conversion" );









