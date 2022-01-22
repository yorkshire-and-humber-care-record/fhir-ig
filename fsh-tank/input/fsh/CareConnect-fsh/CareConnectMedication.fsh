Profile: CareConnectMedication1
Parent: Medication
Id: CareConnect-Medication-1
Description: "This Medication Resource is primarily used for the identification and definition of a medication."
* ^meta.lastUpdated = "2018-02-26T10:49:54.72+00:00"
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

* code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code ^binding.extension.valueString = "MedicationFormalRepresentation"
* code ^binding.strength = #required
* code ^binding.description = "A code from the SNOMED Clinical Terminology UK coding system that describes a medication from the VTM/VMP/VMPP/AMP/AMPP subsets from the dm+d terminology"
* code ^binding.valueSet = CareConnect-MedicationCode-1

* code.coding.extension ^slicing.discriminator.type = #value
* code.coding.extension ^slicing.discriminator.path = "url"
* code.coding.extension ^slicing.rules = #open
* code.coding.extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1

* manufacturer only Reference(CareConnect-Organization-1)

* form ^short = "Codes that describe a medication dose form"
* form ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* form ^binding.extension.valueString = "MedicationForm"
* form ^binding.strength = #required
* form ^binding.description = "A code from the SNOMED Clinical Terminology UK coding system that describes a medication dose form"
* form ^binding.valueSet = CareConnect-MedicationForm-1

* form.coding.extension ^slicing.discriminator.type = #value
* form.coding.extension ^slicing.discriminator.path = "url"
* form.coding.extension ^slicing.rules = #open
* form.coding.extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1

* form.coding.system 1..
* form.coding.system = "http://snomed.info/sct" (exactly)
* form.coding.code 1..
* form.coding.display 1..
* form.coding.display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* form.coding.display ^extension.valueBoolean = true

* ingredient.item[x] only CodeableConcept or Reference(Substance or CareConnect-Medication-1)
//Not in R4
//* package.content.item[x] only CodeableConcept or Reference(CareConnect-Medication-1)


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Medication-1"