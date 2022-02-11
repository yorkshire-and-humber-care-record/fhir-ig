Profile: CareConnectProcedureRequest1

// !!!!NB!!!
// Procedure Request does not exist in R4!
// Substitute by basing this on ServiceRequest, which replaces it.
// (It is 90% similar, and although there are some significant changes it is close enough for what we need here)
// This is just for us to compile our profiles against. Before publishing this is all swapped back to the "real" STU3 definitions

// (Also note that the original CareConnect profile contains a typo with an extra space at the end of "CareConnect-BodySite-1"
//  So have fixed this in the CareConnectSTU3 folder)

Parent: ServiceRequest

Id: CareConnect-ProcedureRequest-1
Description: "Procedure Request"
* ^status = #draft
* ^date = "2019-10-21"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen on 06/10/2019, see: http://www.interopen.org/careconnect-curation-methodology/"
* ^copyright = "Copyright © 2019 HL7 UK   Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at   http://www.apache.org/licenses/LICENSE-2.0   Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.   HL7® FHIR® standard Copyright © 2011+ HL7   The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at   https://www.hl7.org/fhir/license.html"
* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(CareConnect-Organization-1)
* requisition.assigner only Reference(CareConnect-Organization-1)
* category.coding ^slicing.discriminator.type = #value
* category.coding ^slicing.discriminator.path = "system"
* category.coding ^slicing.rules = #open
* category.coding contains snomedCT 0..*
* category.coding[snomedCT].extension ^slicing.discriminator.type = #value
* category.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* category.coding[snomedCT].extension ^slicing.rules = #open
* category.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* category.coding[snomedCT].system 1..
* category.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* category.coding[snomedCT].version ..0
* category.coding[snomedCT].code 1..
* category.coding[snomedCT].display 1..
* category.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* category.coding[snomedCT].display ^extension.valueBoolean = true
* code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code ^binding.extension.valueString = "ProcedureRequestCode"
* code ^binding.strength = #example
* code ^binding.description = "Codes identifying names of simple observations."
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains snomedCT 0..*
* code.coding[snomedCT].extension ^slicing.discriminator.type = #value
* code.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* code.coding[snomedCT].extension ^slicing.rules = #open
* code.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* code.coding[snomedCT].system 1..
* code.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* code.coding[snomedCT].version ..0
* code.coding[snomedCT].code 1..
* code.coding[snomedCT].display 1..
* code.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* code.coding[snomedCT].display ^extension.valueBoolean = true
* subject only Reference(Group or Device or CareConnect-Patient-1 or CareConnect-Location-1)

// Renamed as "episode" in R4
////* context only Reference(CareConnect-EpisodeOfCare-1 or CareConnect-Encounter-1)

// Combined into a single field in R4
//* requester.agent only Reference(Device or CareConnect-Practitioner-1 or CareConnect-Organization-1)
//* requester.onBehalfOf only Reference(CareConnect-Organization-1)
* requester only Reference(Device or CareConnect-Practitioner-1 or CareConnect-Organization-1 or CareConnect-Organization-1)

* performer only Reference(Device or CareConnect-RelatedPerson-1 or CareConnect-Patient-1 or CareConnect-Organization-1 or CareConnect-Practitioner-1 or CareConnect-HealthcareService-1)
* reasonCode.coding ^slicing.discriminator.type = #value
* reasonCode.coding ^slicing.discriminator.path = "system"
* reasonCode.coding ^slicing.rules = #open
* reasonCode.coding contains snomedCT 0..*
* reasonCode.coding[snomedCT].extension ^slicing.discriminator.type = #value
* reasonCode.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* reasonCode.coding[snomedCT].extension ^slicing.rules = #open
* reasonCode.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* reasonCode.coding[snomedCT].system 1..
* reasonCode.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* reasonCode.coding[snomedCT].version ..0
* reasonCode.coding[snomedCT].code 1..
* reasonCode.coding[snomedCT].display 1..
* reasonCode.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* reasonCode.coding[snomedCT].display ^extension.valueBoolean = true
* reasonReference only Reference(CareConnect-Observation-1 or CareConnect-Condition-1)
* supportingInfo only Reference(CareConnect-Observation-1)
* supportingInfo ^short = "Pre-requisites for test"
* specimen only Reference(CareConnect-Specimen-1)
* bodySite.coding ^slicing.discriminator.type = #value
* bodySite.coding ^slicing.discriminator.path = "system"
* bodySite.coding ^slicing.rules = #open
* bodySite.coding contains snomedCT 0..*
* bodySite.coding[snomedCT] ^binding.strength = #preferred
* bodySite.coding[snomedCT] ^binding.description = "A code from the SNOMED Clinical Terminology UK with the expression (<<442083009 |anatomical or acquired body structure|)."
* bodySite.coding[snomedCT] ^binding.valueSet = CareConnect-BodySite-1
* bodySite.coding[snomedCT].extension ^slicing.discriminator.type = #value
* bodySite.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* bodySite.coding[snomedCT].extension ^slicing.rules = #open
* bodySite.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* bodySite.coding[snomedCT].system 1..
* bodySite.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* bodySite.coding[snomedCT].version ..0
* bodySite.coding[snomedCT].code 1..
* bodySite.coding[snomedCT].display 1..
* bodySite.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* bodySite.coding[snomedCT].display ^extension.valueBoolean = true
* note.author[x] only string or Reference(CareConnect-RelatedPerson-1 or CareConnect-Practitioner-1 or CareConnect-Patient-1)

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-ProcedureRequest-1"