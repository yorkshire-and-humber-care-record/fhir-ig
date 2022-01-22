Profile: CareConnectDocumentReference1
Parent: DocumentReference
Id: CareConnect-DocumentReference-1
Description: "The DocumentReference resource is used to describe a document that is made available to a healthcare system."
* ^version = "1.1.0"
* ^status = #draft
* ^date = "2019-08-07"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/ on the 5th July 2019."
* ^copyright = "Copyright © 2019 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"

* masterIdentifier.system 1..
* masterIdentifier.value 1..
* masterIdentifier.assigner only Reference(CareConnect-Organization-1)

* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(CareConnect-Organization-1)

* type ^short = "Type of document"
* type ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* type ^binding.extension.valueString = "DocumentC80Type"
* type ^binding.strength = #preferred
* type ^binding.description = "SNOMED CT UK document type"
* type ^binding.valueSet = CareConnect-DocumentType-1
* type.coding.system 1..
* type.coding.version ..0
* type.coding.code 1..
* type.coding.display 1..
* type.coding.display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* type.coding.display ^extension.valueBoolean = true

* subject only Reference(Group or Device or CareConnect-Practitioner-1 or CareConnect-Patient-1)
// Not in R4!
//* created ^definition = "When the document was created. Creation/Edit datetime of the document - event date"
// (Also note that although not mentioned here STU3 "class" -> R4 "category")
* author only Reference(Device or CareConnect-RelatedPerson-1 or CareConnect-Practitioner-1 or CareConnect-Patient-1 or CareConnect-Organization-1)
* authenticator only Reference(CareConnect-Practitioner-1 or CareConnect-Organization-1)
* custodian only Reference(CareConnect-Organization-1)
* relatesTo.target only Reference(CareConnect-DocumentReference-1)
* context.encounter only Reference(CareConnect-Encounter-1)

* context.practiceSetting ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* context.practiceSetting ^binding.extension.valueString = "DocumentC80PracticeSetting"
* context.practiceSetting ^binding.strength = #preferred
* context.practiceSetting ^binding.description = "Care setting type of the document"
* context.practiceSetting ^binding.valueSet = CareConnect-CareSettingType-1
* context.sourcePatientInfo only Reference(CareConnect-Patient-1)
* context.related.identifier.assigner only Reference(CareConnect-Organization-1)


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-DocumentReference-1"