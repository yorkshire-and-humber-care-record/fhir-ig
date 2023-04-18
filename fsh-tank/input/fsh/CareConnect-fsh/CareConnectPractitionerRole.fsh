Profile: CareConnectPractitionerRole1
Parent: PractitionerRole
Id: CareConnect-PractitionerRole-1
Description: "The PractitionerRole resource represents a specific set of Roles/Locations/specialties/services that a practitioner may perform at an organization for a period of time."
* ^meta.lastUpdated = "2018-02-19T11:07:26.859+00:00"
* ^version = "1.1.0"
* ^status = #draft
* ^date = "2018-11-05"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/"
* ^copyright = "Copyright © 2016 HL7 UK\r\n\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"
* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(CareConnect-Organization-1)
* practitioner only Reference(CareConnect-Practitioner-1)
* practitioner ^short = "Practitioner that is able to provide the defined services for the organisation"
* practitioner ^definition = "Practitioner that is able to provide the defined services for the organisation."
* organization only Reference(CareConnect-Organization-1)
* code ^slicing.discriminator.type = #value
* code ^slicing.discriminator.path = "coding.system"
* code ^slicing.ordered = false
* code ^slicing.rules = #openAtEnd
* code contains sdsJobRoleName 0..1
* code[sdsJobRoleName] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code[sdsJobRoleName] ^binding.extension.valueString = "PractitionerRole"
* code[sdsJobRoleName] ^binding.strength = #required
* code[sdsJobRoleName] ^binding.valueSet = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-SDSJobRoleName-1"
* code[sdsJobRoleName].coding 1..1
* code[sdsJobRoleName].coding.system 1..
* code[sdsJobRoleName].coding.system = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-SDSJobRoleName-1" (exactly)
* code[sdsJobRoleName].coding.code 1..
* code[sdsJobRoleName].coding.display 1..
* code[sdsJobRoleName].coding.display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* code[sdsJobRoleName].coding.display ^extension.valueBoolean = true
* location only Reference(CareConnect-Location-1)

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-PractitionerRole-1"