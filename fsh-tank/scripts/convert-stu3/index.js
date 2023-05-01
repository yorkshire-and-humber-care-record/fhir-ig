#!/usr/bin/env node

//*******************************************************************
//** A limitiation of fsh is that it outputs only R4 files
//** This script tweaks them to be STU3, ready for the fhir publisher tool
//*******************************************************************

console.log( "Beginning R4 to STU3 conversion" );

var fs = require('fs');
var path = require('path');
var fileHelpers = require('./FileHelpers');

var dirR4 = path.resolve(__dirname, '..\\..') + '\\fsh-generated';
var dirSTU3 = path.resolve(__dirname, '..\\..') + '\\fsh-generated-STU3';
var dirCCSTU3 = path.resolve(__dirname, '..\\..') + '\\careconnect-STU3';
var regexEscapedDirR4=dirR4.replace(/([.*+?^=!:><${}()|\[\]\/\\])/g, "\\$1");


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
            var escapedFindString=findString.replace(/([.*+?^=><!:${}()|\[\]\/\\])/g, "\\$1");
            fileData = fileData.replace(new RegExp(escapedFindString, 'g'), "3.0.2");


            // Now look in more detail for specific R4 -> STU3 differences in each type of file
            var jsonObject = JSON.parse(fileData);

            // Convert Structure Definitions
            if (jsonObject.resourceType == "StructureDefinition") {
              
              jsonObject = convertStructureDefinition(jsonObject);

              if(jsonObject.id == "Interweave-Encounter" || jsonObject.id == "Interweave-EncounterGrouping") {
                jsonObject = convertInterweaveEncounterStructureDefinition(jsonObject);
              }

              if(jsonObject.id == "Interweave-DocumentReference") {
                jsonObject = convertInterweaveDocumentReferenceStructureDefinition(jsonObject);
              }

              if(jsonObject.id == "Interweave-Appointment") {
                jsonObject = convertInterweaveAppointmentStructureDefinition(jsonObject);
              }

              if(jsonObject.id == "Interweave-Condition") {
                jsonObject = convertInterweaveConditionStructureDefinition(jsonObject);
              }

              if(jsonObject.id == "Interweave-Procedure") {
                jsonObject = convertInterweaveProcedureStructureDefinition(jsonObject);
              }

              if(jsonObject.id == "Interweave-AllergyIntolerance") {
                jsonObject = convertInterweaveAllergyIntoleranceStructureDefinition(jsonObject);
              }

              if(jsonObject.id == "Interweave-Medication") {
                jsonObject = convertInterweaveMedicationStructureDefinition(jsonObject);
              }

              if(jsonObject.id == "Interweave-MedicationRequest") {
                jsonObject = convertInterweaveMedicationRequestStructureDefinition(jsonObject);
              }
              // TODO: Refactor Obs functions 
              if(jsonObject.id == "Interweave-Observation") {
                jsonObject = convertInterweaveObservationStructureDefinition(jsonObject);
              }

              if(jsonObject.id == "Interweave-Observation-HeartRate") {
                jsonObject = convertInterweaveObservationHeartRateStructureDefinition(jsonObject);
              }

              if(jsonObject.id == "Interweave-Observation-RespiratoryRate") {
                jsonObject = convertInterweaveObservationRespiratoryRateStructureDefinition(jsonObject);
              }

              if(jsonObject.id == "Interweave-Observation-VitalSigns") {
                jsonObject = convertInterweaveObservationVitalSignsStructureDefinition(jsonObject);
              }

              if(jsonObject.id == "Interweave-Observation-ACVPU") {
                jsonObject = convertInterweaveObservationACVPUStructureDefinition(jsonObject);
              }

              if(jsonObject.id == "Interweave-Observation-BloodPressure") {
                jsonObject = convertInterweaveObservationBloodPressureStructureDefinition(jsonObject);
              }

              if(jsonObject.id == "Interweave-Observation-BodyTemperature") {
                jsonObject = convertInterweaveObservationBodyTemperatureStructureDefinition(jsonObject);
              }

              if(jsonObject.id == "Interweave-DiagnosticReport") {
                jsonObject = convertInterweaveDiagnosticReportStructureDefinition(jsonObject);
              }

              if(jsonObject.id == "Interweave-SocialCareEquipmentProvision"){
                jsonObject = convertInterweaveSocialCareDeviceRequestStructureDefinition(jsonObject);
              }

              if(jsonObject.id == "Interweave-SocialCareSupportReason"){
                jsonObject = convertInterweaveSocialCareSupportReasonStructureDefinition(jsonObject);
              }
            
              if(jsonObject.id == "Interweave-SocialCareAssessment"){
                jsonObject = convertInterweaveSocialCareAssessmentStructureDefinition(jsonObject);
              }
              
              if(jsonObject.id == "Interweave-SocialCareContact"){
                //Need to replace all occurrences of ServiceRequest with ReferralRequest
                jsonObject = JSON.parse(JSON.stringify(jsonObject).replace(/ServiceRequest/g, "ReferralRequest"));
                jsonObject = convertInterweaveSocialCareContactStructureDefinition(jsonObject);
              } 

              if(jsonObject.id == "Interweave-ReferralRequest"){
                //Need to replace all occurrences of ServiceRequest with ReferralRequest
                jsonObject = JSON.parse(JSON.stringify(jsonObject).replace(/ServiceRequest/g, "ReferralRequest"));
                jsonObject = convertInterweaveReferralRequestStructureDefinition(jsonObject);
              } 
            }

            // Convert various types of instances
            if (jsonObject.resourceType == "Location") {
              jsonObject = convertLocationInstance(jsonObject);
            }

            if (jsonObject.resourceType == "Encounter") {
              jsonObject = convertEncounterInstance(jsonObject);
            }
            
            if (jsonObject.resourceType == "DocumentReference") {
              jsonObject = convertDocumentReferenceInstance(jsonObject);
            }

            if (jsonObject.resourceType == "Appointment") {
              jsonObject = convertAppointmentInstance(jsonObject);
            }
			
			      if (jsonObject.resourceType == "Observation") {
              jsonObject = convertObservationInstance(jsonObject);
            }

            if (jsonObject.resourceType == "AllergyIntolerance") {
              jsonObject = convertAllergyIntoleranceInstance(jsonObject);
            }

            if (jsonObject.resourceType == "Procedure") {
              jsonObject = convertProcedureInstance(jsonObject);
            }
            if (jsonObject.resourceType == "DiagnosticReport") {
              jsonObject = convertDiagnosticReportInstance(jsonObject);
            }
            
            if (jsonObject.resourceType == "Condition") {
              if (jsonObject.id.includes("InterweaveSocialCareSupportReason")){
                jsonObject = convertSocialCareSupportReasonInstance(jsonObject);
              }
              else
              {
               jsonObject = convertConditionInstance(jsonObject);
              }
            }

            if (jsonObject.resourceType == "RelatedPerson") {
              jsonObject = convertRelatedPersonInstance(jsonObject);
            }
           
            //InterweaveSocialCareDeviceRequest
            if((jsonObject.resourceType == "DeviceRequest" )
                && (jsonObject.id.includes("InterweaveSocialCareDeviceRequest"))){
                  jsonObject = convertSocialCareDeviceRequestInstance(jsonObject);
            }
            
            //InterweaveSocialCareAssessment
            if((jsonObject.resourceType == "Task")
              && (jsonObject.id.includes("InterweaveSocialCareAssessment"))){
              jsonObject = convertSocialCareAssessmentInstance(jsonObject);
            }
            /*
            if((jsonObject.resourceType == "ServiceRequest")
              && (jsonObject.id.includes("InterweaveSocialCareContact"))){
              //Need to replace all occurrences of ServiceRequest with ReferralRequest
              jsonObject = JSON.parse(JSON.stringify(jsonObject).replace(/ServiceRequest/g, "ReferralRequest"));
              jsonObject = convertSocialCareContactInstance(jsonObject);
            }
            */
            // Convert also any Contained instances! (realistically only Location and maybe Practitioner)
            if (jsonObject.contained) {
              jsonObject.contained.forEach(function(jsonContained) {
             
                  if (jsonContained.resourceType == "Location") {
                    jsonContained = convertLocationInstance(jsonContained);
                  }

                }) //foreach contained
            }

            // Reserialise the JSON
            fileData = JSON.stringify(jsonObject, null, 2)

          } //Process Content
          

      //Write the output to STU3 folder
      var filePathSTU3 = filePathR4.replace(new RegExp(regexEscapedDirR4, 'g'), dirSTU3);
      //filePathSTU3 = filePathSTU3.replace("ServiceRequest-","ReferralRequest-"); //rename service request to referral request
      fileHelpers.ensureDirectoryExistence(filePathSTU3);
      fs.writeFileSync(filePathSTU3, fileData, 'utf8')

});

console.log( "Completed R4 to STU3 conversion" );

function convertStructureDefinition(jsonObject) {

  //Remove an R4 extension about security-category that we don't need
  if(jsonObject.extension){
    var index = jsonObject.extension.findIndex(obj => obj.url=="http://hl7.org/fhir/StructureDefinition/structuredefinition-security-category");
    if(index > -1) {
      jsonObject.extension.splice(index,1);
    }
  }

  // For extensions then "context" is done differently
  if(jsonObject.type == "Extension") {
    if(jsonObject.context) {

      jsonObject.contextType = "resource";

      var newContextArray = new Array()
      jsonObject.context.forEach(function (objContext) {
        newContextArray.push(objContext.expression);
      })
      jsonObject.context = newContextArray;

    }
  }

  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {

    // If the element has a "type" attribute with a "targetProfile" then convert it from an array (R4) to a single value (STU3)
    
      if(objElement.type) objElement.type.forEach(function(objType) {

          if(objType.targetProfile) {
            objType.targetProfile = objType.targetProfile[0];
          }

          if(objType.profile) {
            objType.profile = objType.profile[0];
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


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveEncounterStructureDefinition(jsonObject) {
 
  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {


    // Convert "basedOn" to "incomingReferral"
    if(objElement.id.includes("Encounter.basedOn"))  {
      objElement.id = objElement.id.replace("Encounter.basedOn", "Encounter.incomingReferral");
      objElement.path = objElement.id;
    };
      

    // Make class mandatory. (It already is in R4, so not considered a "differential" otherwise!)
    if(objElement.id == "Encounter.class")  {
      objElement.min = 1;
    } // Encounter.diagnosis
    

    // Convert "diagnosis.use" to "diagnosis.role"
    if(objElement.id == "Encounter.diagnosis")  {
      if(objElement.slicing) {
        objElement.slicing.discriminator[0].path = "role";
        //console.log(objElement);
      }
    } // Encounter.diagnosis


    if(objElement.id.includes("Encounter.diagnosis.use"))  {
      objElement.id = objElement.id.replace("Encounter.diagnosis.use", "Encounter.diagnosis.role");
      objElement.path = objElement.id;
    };

    if(objElement.id == "Encounter.diagnosis:chiefComplaint.use")  {
      objElement.id = "Encounter.diagnosis:chiefComplaint.role";
      objElement.path = "Encounter.diagnosis.role";
    }; // Encounter.diagnosis.use

    //NB! This one is slighlty different due to the slicing!
    if(objElement.id.includes("Encounter.diagnosis:chiefComplaint.use"))  {
      objElement.id = objElement.id.replace("Encounter.diagnosis:chiefComplaint.use", "Encounter.diagnosis:chiefComplaint.role");
      objElement.path = objElement.path.replace("Encounter.diagnosis.use", "Encounter.diagnosis.role");
    };


    // Convert "reasonCode" to "reason"
    if(objElement.id.includes("Encounter.reasonCode"))  {
      objElement.id = objElement.id.replace("Encounter.reasonCode", "Encounter.reason");
      objElement.path = objElement.id;
  };


  }); //Element

  return jsonObject;
}



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveDocumentReferenceStructureDefinition(jsonObject) {

  // The "created" field does not exist in R4! Add text to the STU3 profile to indicate this
  objCreated = new Object;
  objCreated.id = "DocumentReference.created";
  objCreated.path = "DocumentReference.created";
  objCreated.short = "DISCOURAGED - deprecated in R4";
  jsonObject.differential.element.push(objCreated);


  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {

        // Convert "date" to "indexed"
        if(objElement.id.includes("DocumentReference.date"))  {
          objElement.id = objElement.id.replace("DocumentReference.date", "DocumentReference.indexed");
          objElement.path = objElement.id;

      };


  }); //Element

  return jsonObject;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveAppointmentStructureDefinition(jsonObject) {
 
  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {

    // Convert "reasonCode" to "reason"
    if(objElement.id.includes("Appointment.reasonCode"))  {
        objElement.id = objElement.id.replace("Appointment.reasonCode", "Appointment.reason");
        objElement.path = objElement.id;
    };

  // Convert "reasonReference" to "indication"
  if(objElement.id.includes("Appointment.reasonReference"))  {
    objElement.id = objElement.id.replace("Appointment.reasonReference", "Appointment.indication");
      objElement.path = objElement.id;
    };
  
    // Convert "basedOn" to "incomingReferral"
    if(objElement.id.includes("Appointment.basedOn"))  {
      objElement.id = objElement.id.replace("Appointment.basedOn", "Appointment.incomingReferral");
      objElement.path = objElement.id;
    };     


  }); //Element

  return jsonObject;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveConditionStructureDefinition(jsonObject) {
 
  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {

    // Convert "encounter" to "context"
    if(objElement.id.includes("Condition.encounter"))  {
      objElement.id = objElement.id.replace("Condition.encounter", "Condition.context");
      objElement.path = objElement.id;
    };
      

  // Convert "recordedDate" to "assertedDate"      
  if(objElement.id.includes("Condition.recordedDate"))  {
    objElement.id = objElement.id.replace("Condition.recordedDate", "Condition.assertedDate");
    objElement.path = objElement.id;
  };

  }); //Element

  return jsonObject;
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveProcedureStructureDefinition(jsonObject) {
 
  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {


    // Convert "encounter" to "context"
    if(objElement.id.includes("Procedure.encounter"))  {
      objElement.id = objElement.id.replace("Procedure.encounter", "Procedure.context");
      objElement.path = objElement.id;
    };     
    

  }); //Element

  return jsonObject;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveObservationStructureDefinition(jsonObject) {
  related = new Object;
  related.id = "Observation.related";
  related.path = "Observation.related";
  related.min = 0;
  related.max = "*";
  related.short = "Resources related to this observation";
  jsonObject.differential.element.push(related);

  relatedType = new Object;
  relatedType.id = "Observation.related.type";
  relatedType.path = "Observation.related.type";
  relatedType.min = 1;
  relatedType.max = "1";
  relatedType.fixedCode = "derived-from"
  relatedType.mustSupport = true;
  jsonObject.differential.element.push(relatedType);

  var reference = {
    "code": "Reference",
    "targetProfile": "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Observation-1"
  }

  relatedTarget = new Object;
  relatedTarget.id = "Observation.related.target";
  relatedTarget.path = "Observation.related.target";
  relatedTarget.min = 1;
  relatedTarget.max = "1";
  relatedTarget.mustSupport = true;
  relatedTarget.short = "we limit the related field’s usage to only allow links to observation resources, from which the primary observation’s value was derived. E.g. An observation may have a value which is a score, and that score may have been derived from several other observations."
  relatedTarget.type = []
  relatedTarget.type.push(reference);
  jsonObject.differential.element.push(relatedTarget);

  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {
    //console.log(objElement);
    // Convert "encounter" to "context"
    if(objElement.id.includes("Observation.encounter"))  {
      objElement.id = objElement.id.replace("Observation.encounter", "Observation.context");
      objElement.path = objElement.id;
    };     
    
    if(objElement.id.includes("Observation.note"))  {
      objElement.id = objElement.id.replace("Observation.note", "Observation.comment");
      objElement.path = objElement.id;
    };

  }); //Element

  return jsonObject;
}

function convertInterweaveDiagnosticReportStructureDefinition(jsonObject) {
 
  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {


    // Convert "encounter" to "context"
    if(objElement.id.includes("DiagnosticReport.encounter"))  {
      objElement.id = objElement.id.replace("DiagnosticReport.encounter", "DiagnosticReport.context");
      objElement.path = objElement.id;
    };     
    

    // Convert "media" to "image"
    if(objElement.id.includes("DiagnosticReport.media"))  {
      objElement.id = objElement.id.replace("DiagnosticReport.media", "DiagnosticReport.image");
      objElement.path = objElement.id;
    };     

  }); //Element

  return jsonObject;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveSocialCareDeviceRequestStructureDefinition(jsonObject) {
   
  // * The following fields are removed and are deprecated in R4
   jsonObject = insertDeprectatedR4Field(jsonObject, "DeviceRequest.definition");
   jsonObject = insertDeprectatedR4Field(jsonObject, "DeviceRequest.context");

  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {

    //convert requester to requester.agent   
    if(objElement.id.includes("DeviceRequest.requester"))  {
      objElement.id = objElement.id.replace("DeviceRequest.requester", "DeviceRequest.requester.agent");
      objElement.path = objElement.id;   
    };   
    
    if(objElement.id.includes("DeviceRequest.requester.reference"))  {
      objElement.id = objElement.id.replace("DeviceRequest.requester.reference", "DeviceRequest.requester.agent.reference");
      objElement.path = objElement.id;   
    };   

    if(objElement.id.includes("DeviceRequest.requester.identifier"))  {
      objElement.id = objElement.id.replace("DeviceRequest.requester.identifier", "DeviceRequest.requester.agent.identifier");
      objElement.path = objElement.id;   
    };   

    if(objElement.id.includes("DeviceRequest.requester.display"))  {
      objElement.id = objElement.id.replace("DeviceRequest.requester.display", "DeviceRequest.requester.agent.display");
      objElement.path = objElement.id;   
    };   

  });
  
  return jsonObject;
}

////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveSocialCareSupportReasonStructureDefinition(jsonObject) {
   
  // * context 0..0 doesnt exist in R4
  jsonObject = insertDeprectatedR4Field(jsonObject, "Condition.context");
  
  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {

    //convert recordedDate to assertedDate
    if(objElement.id.includes("Condition.recordedDate"))  {
      objElement.id = objElement.id.replace("Condition.recordedDate", "Condition.assertedDate");
      objElement.path = objElement.id;
    };           
  }); 
  return jsonObject;
}
////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveSocialCareAssessmentStructureDefinition(jsonObject) {
  // * definition 0..0 doesnt exist in R4
  jsonObject = insertDeprectatedR4Field(jsonObject, "Task.definition[x]");

  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {
   //convert reasonCode to reason
   if(objElement.id.includes("Task.reasonCode"))  {
    objElement.id = objElement.id.replace("Task.reasonCode", "Task.reason");
    objElement.path = objElement.id;
  };     
   //convert encounter to context
    if(objElement.id.includes("Task.encounter"))  {
      objElement.id = objElement.id.replace("Task.encounter", "Task.context");
      objElement.path = objElement.id;
    };     
  }); 

  return jsonObject;
}
////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveSocialCareContactStructureDefinition(jsonObject) {
  
  /* This section inserts the fields which have been deprecated in R4 */
  jsonObject = insertDeprectatedR4Field(jsonObject, "ReferralRequest.definition");
  jsonObject = insertDeprectatedR4Field(jsonObject, "ReferralRequest.groupIdentifier");
  jsonObject = insertDeprectatedR4Field(jsonObject, "ReferralRequest.specialty");
  jsonObject = insertDeprectatedR4Field(jsonObject, "ReferralRequest.recipient");
  /************************************************************************* */

 //type MS TODO
 
 // Loop through the elements
 jsonObject.differential.element.forEach(function(objElement) {

  //convert requester to requester.agent
  if(objElement.id.includes("ReferralRequest.requester"))  {
    objElement.id = objElement.id.replace("ReferralRequest.requester", "ReferralRequest.requester.agent");
    objElement.path = objElement.id;
  };     
  
  //convert patientInstruction to description
  if(objElement.id.includes("ReferralRequest.patientInstruction"))  {
      objElement.id = objElement.id.replace("ReferralRequest.patientInstruction", "ReferralRequest.description");
      objElement.path = objElement.id;
    }; 
    
  //convert encounter to context
  if(objElement.id.includes("ReferralRequest.encounter"))  {
      objElement.id = objElement.id.replace("ReferralRequest.encounter", "ReferralRequest.context");
      objElement.path = objElement.id;
    }; 
});

  return jsonObject;
}
////////////////////////////////////////////////////////////////////////////////////////

function convertLocationInstance(jsonObject) {

  // Convert the location "type" from an array (R4) to a single value (STU3)
  if(jsonObject.type) {
    jsonObject.type = jsonObject.type[0];
  }

  return jsonObject;
}

function convertObservationInstance(jsonObject) {

  if(jsonObject.note) {   
    jsonObject.comment = jsonObject.note[0].text;
    delete jsonObject.note;
  }

  if(jsonObject.encounter) {
    jsonObject.context = jsonObject.encounter;
    delete jsonObject.encounter;
  }

  return jsonObject;
}

function convertAllergyIntoleranceInstance(jsonObject) {
  if(jsonObject.recordedDate) {
    jsonObject.assertedDate = jsonObject.recordedDate;
    delete jsonObject.recordedDate;
  }

  //Clinical status is just a simple code (not codableconcept) in STU3
  if(jsonObject.clinicalStatus) {
    jsonObject.clinicalStatus = jsonObject.clinicalStatus.coding[0].code;
  }

  //verification status is just a simple code (not codableconcept) in STU3
  if(jsonObject.verificationStatus) {
    jsonObject.verificationStatus = jsonObject.verificationStatus.coding[0].code;
  }
  
  return jsonObject;
}

function convertEncounterInstance(jsonObject) {

  if(jsonObject.basedOn) {
    jsonObject.incomingReferral = jsonObject.basedOn;
    delete jsonObject.basedOn;
  }

  if(jsonObject.reasonCode) {
    jsonObject.reason = jsonObject.reasonCode;
    delete jsonObject.reasonCode;
  }

  if(jsonObject.diagnosis) jsonObject.diagnosis.forEach(function(objDiagnosis) {
    objDiagnosis.role = objDiagnosis.use;
    delete objDiagnosis.use;
  });
 
  if(jsonObject.appointment) {
    jsonObject.appointment = jsonObject.appointment[0];
  }

  return jsonObject;
}


function convertDocumentReferenceInstance(jsonObject) {

  // Convert the "date" field into "indexed"
  if(jsonObject.date) {
    jsonObject.indexed = jsonObject.date;
    delete jsonObject.date;
  }

  if(jsonObject.context && jsonObject.context.encounter) {
    jsonObject.context.encounter = jsonObject.context.encounter[0];
  }

  return jsonObject;
}


function convertAppointmentInstance(jsonObject) {

  if(jsonObject.basedOn) {
    jsonObject.incomingReferral = jsonObject.basedOn;
    delete jsonObject.basedOn;
  }

  if(jsonObject.reasonCode) {
    jsonObject.reason = jsonObject.reasonCode;
    delete jsonObject.reasonCode;
  }

  if(jsonObject.reasonReference) {
    jsonObject.indication = jsonObject.reasonReference;
    delete jsonObject.reasonReference;
  }

  return jsonObject;
}


function convertConditionInstance(jsonObject) {

  if(jsonObject.encounter) {
    jsonObject.context = jsonObject.encounter;
    delete jsonObject.encounter;
  }

  if(jsonObject.recordedDate) {
    jsonObject.assertedDate = jsonObject.recordedDate;
    delete jsonObject.recordedDate;
  }

  //Clinical status is just a simple code (not codableconcept) in STU3
  if(jsonObject.clinicalStatus) {
    jsonObject.clinicalStatus = jsonObject.clinicalStatus.coding[0].code;
  }

  return jsonObject;
}


function convertProcedureInstance(jsonObject) {

  if(jsonObject.encounter) {
    jsonObject.context = jsonObject.encounter;
    delete jsonObject.encounter;
  }

  return jsonObject;
}


function convertDiagnosticReportInstance(jsonObject) {

  if(jsonObject.encounter) {
    jsonObject.context = jsonObject.encounter;
    delete jsonObject.encounter;
  }

  if(jsonObject.media) {
    jsonObject.image = jsonObject.media;
    delete jsonObject.media;
  }

  // Convert from an array in R4 to a single value in STU3
  if(jsonObject.category) {
    jsonObject.category = jsonObject.category[0];
  }

  return jsonObject;
}

function convertRelatedPersonInstance(jsonObject) {
  // Convert from an array in R4 to a single value in STU3
  if(jsonObject.relationship) {
    jsonObject.relationship = jsonObject.relationship[0];
  }
  return jsonObject;
}

function convertSocialCareDeviceRequestInstance(jsonObject) {
  
  if(jsonObject.requester) {
    jsonObject.requester.agent = jsonObject.requester;
    delete jsonObject.requester;
  }
  return jsonObject;
}

function convertSocialCareSupportReasonInstance(jsonObject) {
  if(jsonObject.recordedDate) {
    jsonObject.assertedDate = jsonObject.recordedDate;
    delete jsonObject.recordedDate;
  }
  return jsonObject;
}

function convertSocialCareAssessmentInstance(jsonObject) {
    //convert reasonCode to reason
    if(jsonObject.reasonCode) {
      jsonObject.reason = jsonObject.reasonCode;
      delete jsonObject.reasonCode;
    }
    //convert encounter to context
    if(jsonObject.encounter) {
      jsonObject.context = jsonObject.encounter;
      delete jsonObject.encounter;
    } 
  return jsonObject;
}

function convertSocialCareContactInstance(jsonObject) {
    //convert requester to requester.agent
    if(jsonObject.requester) {
      jsonObject.requester.agent = jsonObject.requester;
      delete jsonObject.requester;
    }
    //convert patientInstruction to description
    if(jsonObject.patientInstruction) {
      jsonObject.requester.description = jsonObject.patientInstruction;
      delete jsonObject.patientInstruction;
    }    
    //convert encounter to context
    if(jsonObject.encounter) {
      jsonObject.requester.context = jsonObject.encounter;
      delete jsonObject.encounter;
    }  
  return jsonObject;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveMedicationStructureDefinition(jsonObject) {
   
  // * The following fields are removed and are deprecated in R4
   jsonObject = insertDeprectatedR4Field(jsonObject, "Medication.isBrand");
   jsonObject = insertDeprectatedR4Field(jsonObject, "Medication.isOverTheCounter");
   jsonObject = insertDeprectatedR4Field(jsonObject, "Medication.package");
   jsonObject = insertDeprectatedR4Field(jsonObject, "Medication.image");
   jsonObject = insertDeprectatedR4Field(jsonObject, "Medication.ingredient.amount");

   return jsonObject;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveMedicationRequestStructureDefinition(jsonObject) {
   
  // * The following fields are removed and are deprecated in R4
  jsonObject = insertDeprectatedR4Field(jsonObject, "MedicationRequest.definition");
  //jsonObject = insertDeprectatedR4Field(jsonObject, "MedicationRequest.requester.onBehalfOf");
  
   // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {    
    // Convert "encounter" to "context"
    if(objElement.id.includes("MedicationRequest.encounter"))  {      
      objElement.id = objElement.id.replace("MedicationRequest.encounter", "MedicationRequest.context");
      objElement.path = objElement.id;      
    };

    if(objElement.id.includes("MedicationRequest.requester"))  {      
      objElement.id = objElement.id.replace("MedicationRequest.requester", "MedicationRequest.requester.agent");
      objElement.path = objElement.id;      
    };

  }); //Element
   return jsonObject;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveObservationBodyTemperatureStructureDefinition(jsonObject) {
  
  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {    
    // Convert "encounter" to "context"
    if(objElement.id.includes("Observation.encounter"))  {      
      objElement.id = objElement.id.replace("Observation.encounter", "Observation.context");
      objElement.path = objElement.id;      
    };
    
    if(objElement.id.includes("Observation.note"))  {
      objElement.id = objElement.id.replace("Observation.note", "Observation.comment");
      objElement.path = objElement.id;
    };

  }); //Element

  return jsonObject;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveObservationACVPUStructureDefinition(jsonObject) {
  related = new Object;
  related.id = "Observation.related";
  related.path = "Observation.related";
  related.min = 0;
  related.max = "*";
  related.short = "Resources related to this observation";
  jsonObject.differential.element.push(related);

  relatedType = new Object;
  relatedType.id = "Observation.related.type";
  relatedType.path = "Observation.related.type";
  relatedType.min = 1;
  relatedType.max = "1";
  relatedType.short = "Fixed value: derived-from";
  relatedType.mustSupport = true;
  jsonObject.differential.element.push(relatedType);

  var reference = {
    "code": "Reference",
    "targetProfile": "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Observation-1"
  }

  relatedTarget = new Object;
  relatedTarget.id = "Observation.related.target";
  relatedTarget.path = "Observation.related.target";
  relatedTarget.min = 1;
  relatedTarget.max = "1";
  relatedTarget.mustSupport = true;
  relatedTarget.short = "we limit the related field’s usage to only allow links to observation resources, from which the primary observation’s value was derived. E.g. An observation may have a value which is a score, and that score may have been derived from several other observations."
  relatedTarget.type = []
  relatedTarget.type.push(reference);
  jsonObject.differential.element.push(relatedTarget);

  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {    
    // Convert "encounter" to "context"
    if(objElement.id.includes("Observation.encounter"))  {      
      objElement.id = objElement.id.replace("Observation.encounter", "Observation.context");
      objElement.path = objElement.id;      
    };
    
    if(objElement.id.includes("Observation.note"))  {
      objElement.id = objElement.id.replace("Observation.note", "Observation.comment");
      objElement.path = objElement.id;
    };

  }); //Element

  return jsonObject;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveObservationBloodPressureStructureDefinition(jsonObject) {
  related = new Object;
  related.id = "Observation.related";
  related.path = "Observation.related";
  related.min = 0;
  related.max = "*";
  related.short = "Resources related to this observation";
  jsonObject.differential.element.push(related);

  relatedType = new Object;
  relatedType.id = "Observation.related.type";
  relatedType.path = "Observation.related.type";
  relatedType.min = 1;
  relatedType.max = "1";
  relatedType.short = "Fixed value: derived-from";
  relatedType.mustSupport = true;
  jsonObject.differential.element.push(relatedType);

  var reference = {
    "code": "Reference",
    "targetProfile": "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Observation-1"
  }

  relatedTarget = new Object;
  relatedTarget.id = "Observation.related.target";
  relatedTarget.path = "Observation.related.target";
  relatedTarget.min = 1;
  relatedTarget.max = "1";
  relatedTarget.mustSupport = true;
  relatedTarget.short = "we limit the related field’s usage to only allow links to observation resources, from which the primary observation’s value was derived. E.g. An observation may have a value which is a score, and that score may have been derived from several other observations."
  relatedTarget.type = []
  relatedTarget.type.push(reference);
  jsonObject.differential.element.push(relatedTarget);

  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {    
    // Convert "encounter" to "context"
    if(objElement.id.includes("Observation.encounter"))  {      
      objElement.id = objElement.id.replace("Observation.encounter", "Observation.context");
      objElement.path = objElement.id;      
    };     
    
    if(objElement.id.includes("Observation.note"))  {
      objElement.id = objElement.id.replace("Observation.note", "Observation.comment");
      objElement.path = objElement.id;
    };

  }); //Element

  return jsonObject;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveObservationHeartRateStructureDefinition(jsonObject) {
  
  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {    
    // Convert "encounter" to "context"
    if(objElement.id.includes("Observation.encounter"))  {      
      objElement.id = objElement.id.replace("Observation.encounter", "Observation.context");
      objElement.path = objElement.id;      
    };     
    
    if(objElement.id.includes("Observation.note"))  {
      objElement.id = objElement.id.replace("Observation.note", "Observation.comment");
      objElement.path = objElement.id;
    };

    // Make class mandatory. (It already is in R4, so not considered a "differential" otherwise!)
    if(objElement.id == "Observation.basedOn")  {
      objElement.min = 0;
    } 

  }); //Element

  return jsonObject;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveObservationRespiratoryRateStructureDefinition(jsonObject) {
  
  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {    
    // Convert "encounter" to "context"
    if(objElement.id.includes("Observation.encounter"))  {      
      objElement.id = objElement.id.replace("Observation.encounter", "Observation.context");
      objElement.path = objElement.id;      
    };     
    
    if(objElement.id.includes("Observation.note"))  {
      objElement.id = objElement.id.replace("Observation.note", "Observation.comment");
      objElement.path = objElement.id;
    };

  }); //Element

  return jsonObject;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveObservationVitalSignsStructureDefinition(jsonObject) {
  related = new Object;
  related.id = "Observation.related";
  related.path = "Observation.related";
  related.min = 0;
  related.max = "*";
  related.short = "Resources related to this observation";
  jsonObject.differential.element.push(related);

  relatedType = new Object;
  relatedType.id = "Observation.related.type";
  relatedType.path = "Observation.related.type";
  relatedType.min = 1;
  relatedType.max = "1";
  relatedType.short = "Fixed value: derived-from";
  relatedType.mustSupport = true;
  jsonObject.differential.element.push(relatedType);

  var reference = {
    "code": "Reference",
    "targetProfile": "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Observation-1"
  }

  relatedTarget = new Object;
  relatedTarget.id = "Observation.related.target";
  relatedTarget.path = "Observation.related.target";
  relatedTarget.min = 1;
  relatedTarget.max = "1";
  relatedTarget.mustSupport = true;
  relatedTarget.short = "we limit the related field’s usage to only allow links to observation resources, from which the primary observation’s value was derived. E.g. An observation may have a value which is a score, and that score may have been derived from several other observations."
  relatedTarget.type = []
  relatedTarget.type.push(reference);
  jsonObject.differential.element.push(relatedTarget);

  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {    
    // Convert "encounter" to "context"
    if(objElement.id.includes("Observation.encounter"))  {      
      objElement.id = objElement.id.replace("Observation.encounter", "Observation.context");
      objElement.path = objElement.id;      
    };     
    
    if(objElement.id.includes("Observation.note"))  {
      objElement.id = objElement.id.replace("Observation.note", "Observation.comment");
      objElement.path = objElement.id;
    };

  }); //Element

  return jsonObject;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveAllergyIntoleranceStructureDefinition(jsonObject) {
  
  // Loop through the elements
  jsonObject.differential.element.forEach(function(objElement) {    
    // Convert "recordedDate" to "context"
    if(objElement.id.includes("AllergyIntolerance.recordedDate"))  {      
      objElement.id = objElement.id.replace("AllergyIntolerance.recordedDate", "AllergyIntolerance.assertedDate");
      objElement.path = objElement.id;      
    };

  }); //Element

  return jsonObject;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function insertDeprectatedR4Field(jsonObject, fieldId){
  field = new Object;
  field.id = fieldId;
  field.path = fieldId;
  field.min = 0;
  field.max = "0";
  field.short = "REMOVED - deprecated in R4";
  jsonObject.differential.element.push(field);
  return jsonObject;
}

////////////////////////////////////////////////////////////////////////////////////////

function convertInterweaveReferralRequestStructureDefinition(jsonObject) {
  
  /* This section inserts the fields which have been deprecated in R4 */
  jsonObject = insertDeprectatedR4Field(jsonObject, "ReferralRequest.definition");
  jsonObject = insertDeprectatedR4Field(jsonObject, "ReferralRequest.groupIdentifier");
  jsonObject = insertDeprectatedR4Field(jsonObject, "ReferralRequest.specialty");
  jsonObject = insertDeprectatedR4Field(jsonObject, "ReferralRequest.recipient");
  /************************************************************************* */

 //type MS TODO
 
 // Loop through the elements
 jsonObject.differential.element.forEach(function(objElement) {

  //convert requester to requester.agent
  if(objElement.id.includes("ReferralRequest.requester"))  {
    objElement.id = objElement.id.replace("ReferralRequest.requester", "ReferralRequest.requester.agent");
    objElement.path = objElement.id;
  };     
  
  // //convert patientInstruction to description
  // if(objElement.id.includes("ReferralRequest.patientInstruction"))  {
  //     objElement.id = objElement.id.replace("ReferralRequest.patientInstruction", "ReferralRequest.description");
  //     objElement.path = objElement.id;
  //   }; 
    
  //convert encounter to context
  if(objElement.id.includes("ReferralRequest.encounter"))  {
      objElement.id = objElement.id.replace("ReferralRequest.encounter", "ReferralRequest.context");
      objElement.path = objElement.id;
    }; 
});

  return jsonObject;
}
////////////////////////////////////////////////////////////////////////////////////////
