Profile: CareConnectProcedure1
Parent: Procedure
Id: CareConnect-Procedure-1
Description: "An action that is or was performed on a patient."
* ^meta.lastUpdated = "2018-05-04T13:02:22.74+01:00"
* ^version = "1.1.0"
* ^status = #draft
* ^date = "2018-11-05"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/ "
* ^copyright = "Copyright © 2016 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains Extension-CareConnect-AnaestheticIssues-1 named anaestheticIssues 0..1

* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(CareConnect-Organization-1)

* partOf only Reference(MedicationAdministration or CareConnect-Procedure-1 or CareConnect-Observation-1)

* code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code ^binding.extension.valueString = "ProcedureCode"
* code ^binding.strength = #preferred
* code ^binding.description = "A code to identify a specific procedure."
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.ordered = false
* code.coding ^slicing.rules = #open
* code.coding contains snomedCT 0..1

* code.coding[snomedCT] ^binding.strength = #extensible
* code.coding[snomedCT] ^binding.description = "A code from the SNOMED Clinical Terminology UK."
* code.coding[snomedCT] ^binding.valueSet = CareConnect-ProcedureCode-1
* code.coding[snomedCT].extension ^slicing.discriminator.type = #value
* code.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* code.coding[snomedCT].extension ^slicing.rules = #open
* code.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* code.coding[snomedCT].system 1..
* code.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* code.coding[snomedCT].code 1..
* code.coding[snomedCT].display 1..
* code.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* code.coding[snomedCT].display ^extension.valueBoolean = true

* subject only Reference(Group or CareConnect-Patient-1)
//In R4 replaced with "encounter"
//* context only Reference(EpisodeOfCare or CareConnect-Encounter-1)
* performer.actor only Reference(RelatedPerson or Device or CareConnect-Organization-1 or CareConnect-Patient-1 or CareConnect-Practitioner-1)
* performer.onBehalfOf only Reference(CareConnect-Organization-1)
* location only Reference(CareConnect-Location-1)
* reasonReference only Reference(CareConnect-Observation-1 or CareConnect-Condition-1)

* bodySite.coding ^slicing.discriminator.type = #value
* bodySite.coding ^slicing.discriminator.path = "system"
* bodySite.coding ^slicing.ordered = false
* bodySite.coding ^slicing.rules = #open
* bodySite.coding contains snomedCT 0..1

* bodySite.coding[snomedCT] ^binding.strength = #extensible
* bodySite.coding[snomedCT] ^binding.description = "A code from the SNOMED Clinical Terminology UK."
* bodySite.coding[snomedCT] ^binding.valueSet = CareConnect-BodySite-1
* bodySite.coding[snomedCT].extension ^slicing.discriminator.type = #value
* bodySite.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* bodySite.coding[snomedCT].extension ^slicing.rules = #open
* bodySite.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* bodySite.coding[snomedCT].system 1..
* bodySite.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* bodySite.coding[snomedCT].code 1..
* bodySite.coding[snomedCT].display 1..
* bodySite.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* bodySite.coding[snomedCT].display ^extension.valueBoolean = true

* complication.coding ^slicing.discriminator.type = #value
* complication.coding ^slicing.discriminator.path = "system"
* complication.coding ^slicing.ordered = false
* complication.coding ^slicing.rules = #open
* complication.coding contains snomedCT 0..1

* complication.coding[snomedCT] ^binding.strength = #required
* complication.coding[snomedCT] ^binding.description = "A code from the SNOMED Clinical Terminology UK."
* complication.coding[snomedCT] ^binding.valueSet = CareConnect-ConditionCode-1
* complication.coding[snomedCT].extension ^slicing.discriminator.type = #value
* complication.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* complication.coding[snomedCT].extension ^slicing.rules = #open
* complication.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* complication.coding[snomedCT].system 1..
* complication.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* complication.coding[snomedCT].code 1..
* complication.coding[snomedCT].display 1..
* complication.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* complication.coding[snomedCT].display ^extension.valueBoolean = true

* complicationDetail only Reference(CareConnect-Condition-1)
* note.author[x] only string or Reference(RelatedPerson or CareConnect-Patient-1 or CareConnect-Practitioner-1)
* usedReference only Reference(Device or Substance or CareConnect-Medication-1)


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Procedure-1"