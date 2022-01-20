
Extension: ExtensionCareConnectbirthPlace
Id: birthPlace
Description: "The registered place of birth of the patient. A sytem may use the address.text if they don't store the birthPlace address in discrete elements."
* ^meta.lastUpdated = "2017-10-19T09:07:15.893+01:00"
* ^url = "http://hl7.org/fhir/StructureDefinition/birthPlace"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2017-10-19T09:04:08.958+01:00"
* ^publisher = "HL7 UK"
//* ^contextType = "resource"
//* ^context = "Patient"
* . ..1
* . ^short = "Birth Place: The registered place of birth of the patient."
* . ^definition = "Birth Place: The registered place of birth of the patient. A sytem may use the address.text if they don't store the birthPlace address in discrete elements."
* url = "http://hl7.org/fhir/StructureDefinition/birthPlace" (exactly)
* valueAddress only Address
* valueAddress ^sliceName = "valueAddress"
* valueAddress ^short = "Birth Place: The registered place of birth of the patient."
* valueAddress ^definition = "Birth Place: The registered place of birth of the patient. A sytem may use the address.text if they don't store the birthPlace address in discrete elements."

//THIS IS A BUG IN CARE CONNECT
//They should have used the standard HL7 extension patient-birthPlace
//But instead they have used the URL below which doesn't actually exist
//Need to recreate this bug to get their Patient structure to build however
* ^url = "http://hl7.org/fhir/StructureDefinition/birthPlace"
