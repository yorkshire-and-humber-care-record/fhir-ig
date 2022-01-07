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
// Copy them across to "fsh-generated-STU3", converting the FHIR Version as we go
fileArrayR4 = fileHelpers.getAllFiles(dirR4);
fileArrayR4.forEach(function(filePathR4) {

       var fileData = fs.readFileSync(filePathR4,'utf8');

      var processContent = true;
      if(filePathR4.includes("menu.xml")) processContent = false;
      if(filePathR4.includes("CareConnect")) processContent = false;

      if(processContent) {

            // Find and replace the FHIR version in all files
            var findString = "4.0.1";
            var escapedFindString=findString.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1");
            fileData = fileData.replace(new RegExp(escapedFindString, 'g'), "3.0.2");


            // Now look in more detail for specific R4 -> STU3 differences in each type of file
            var jsonObject = JSON.parse(fileData);

            // Modify Structure Definitions
            if (jsonObject.resourceType == "StructureDefinition") {
              jsonObject = convertStructureDefinition(jsonObject);
            }

            // Reserialise the JSON
            fileData = JSON.stringify(jsonObject, null, 2)

          } //Process Content


      //Write the output to STU3 folder
      var filePathSTU3 = filePathR4.replace(new RegExp(regexEscapedDirR4, 'g'), dirSTU3);
      fileHelpers.ensureDirectoryExistence(filePathSTU3);
      fs.writeFileSync(filePathSTU3, fileData, 'utf8')

});


console.log( "Completed R4 to STU3 conversion" );



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertStructureDefinition(jsonObject) {

  //Remove an R4 extension about security-category that we don't need
  if(jsonObject.extension){
    var index = jsonObject.extension.findIndex(obj => obj.url=="http://hl7.org/fhir/StructureDefinition/structuredefinition-security-category");
    if(index > -1) {
      jsonObject.extension.splice(index,1);
    }
  }

  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {

    // If the element has a "type" attribute with a "targetProfile" then convert it from an array (R4) to a single value (STU3)
    if(objElement.type) objElement.type.forEach(function(objType) {

        if(objType.targetProfile) {
          objType.targetProfile = objType.targetProfile[0];
        }

        // Also remove an R4 "type" extension that we don't need
        if(objType.extension) delete objType.extension;

      }); // Type


      // If the element has a "binding" attribute then we need to adjust any valueSet
      // R4 has a simple "valueSet" attribute, whereas STU3 has a more baroque "valueSetReference" containing a "reference"
      if(objElement.binding) {
        if(objElement.binding.valueSet) {
       
          var valueSetUrl = objElement.binding.valueSet;
          objElement.binding.valueSetReference = new Object;
          objElement.binding.valueSetReference.reference = valueSetUrl;
          delete objElement.binding.valueSet;
          
        }
      }

  }); //Element

  return jsonObject;
}