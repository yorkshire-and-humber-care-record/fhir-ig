Profile: CareConnectDiagnosticReport1
Parent: DiagnosticReport
Id: CareConnect-DiagnosticReport-1
Description: "A test report for National Pathology that contains data on the pathology tests performed on patients specimens populated by the performing organisation. "
* ^version = "1.1.0"
* ^status = #draft
* ^date = "2019-06-18"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/"
* ^copyright = "Copyright © 2019 HL7 UK   Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at   http://www.apache.org/licenses/LICENSE-2.0   Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.   HL7® FHIR® standard Copyright © 2011+ HL7   The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at   https://www.hl7.org/fhir/license.html"
* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(CareConnect-Organization-1)
* basedOn only Reference(CareConnect-CarePlan-1 or CareConnect-MedicationRequest-1 or CareConnect-ReferralRequest-1 or CareConnect-ProcedureRequest-1)
* category ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* category ^binding.extension.valueString = "DiagnosticServiceSection"
* category ^binding.strength = #preferred
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
* category.coding[snomedCT].code 1..
* category.coding[snomedCT].display 1..
* category.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* category.coding[snomedCT].display ^extension.valueBoolean = true
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains snomedCT 0..*
* code.coding[snomedCT] ^binding.strength = #extensible
* code.coding[snomedCT] ^binding.description = "A code from the SNOMED Clinical Terminology UK"
* code.coding[snomedCT] ^binding.valueSet = CareConnect-ReportCodeSnCT-1
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
* subject 1..
* subject only Reference(Group or Device or CareConnect-Patient-1 or CareConnect-Location-1)

// Renamed as encounter in R4
//* context only Reference(CareConnect-Encounter-1)

// In R4 then just "performer"
//* performer.actor only Reference(CareConnect-Organization-1 or CareConnect-Practitioner-1)
* performer only Reference(CareConnect-Organization-1 or CareConnect-Practitioner-1)

* specimen only Reference(CareConnect-Specimen-1)
* result only Reference(CareConnect-Observation-1)


// In R4 "codedDiagnosis" becomes "conclusionCode"
* conclusionCode ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* conclusionCode ^binding.extension.valueString = "AdjunctDiagnosis"
* conclusionCode ^binding.strength = #preferred
* conclusionCode ^binding.description = "A SNOMED Coded finding for the test report."
* conclusionCode ^binding.valueSet = CareConnect-FindingCode-1
* conclusionCode.coding ^slicing.discriminator.type = #value
* conclusionCode.coding ^slicing.discriminator.path = "system"
* conclusionCode.coding ^slicing.rules = #open
* conclusionCode.coding contains snomedCT 0..*
* conclusionCode.coding[snomedCT] ^binding.strength = #extensible
* conclusionCode.coding[snomedCT] ^binding.description = "A code from the SNOMED Clinical Terminology UK"
* conclusionCode.coding[snomedCT] ^binding.valueSet = CareConnect-FindingCode-1
* conclusionCode.coding[snomedCT].extension ^slicing.discriminator.type = #value
* conclusionCode.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* conclusionCode.coding[snomedCT].extension ^slicing.rules = #open
* conclusionCode.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* conclusionCode.coding[snomedCT].system 1..
* conclusionCode.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* conclusionCode.coding[snomedCT].code 1..
* conclusionCode.coding[snomedCT].display 1..
* conclusionCode.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* conclusionCode.coding[snomedCT].display ^extension.valueBoolean = true


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-DiagnosticReport-1"