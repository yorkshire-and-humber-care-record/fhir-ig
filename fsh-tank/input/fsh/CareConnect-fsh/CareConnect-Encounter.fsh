Profile: CareConnectEncounter1
Parent: Encounter
Id: CareConnect-Encounter-1
Description: "The encounter resource represents an encounter between a care professional and the patient (or patient's record)."
* ^meta.lastUpdated = "2017-08-25T13:57:57.508+01:00"
* ^version = "0.0.1"
* ^status = #draft
* ^date = "2017-07-10T15:06:13.594979+01:00"
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK\r\n\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"
* . ^slicing.discriminator.type = #value
* . ^slicing.discriminator.path = "url"
* . ^slicing.rules = #open
* extension contains Extension-CareConnect-EncounterTransport-1 named encounterTransport 0..1
* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(CareConnect-Organization-1)
* class ^short = "Classification of the encounter"
* class ^definition = "Classification of the encounter."
* classHistory.class ^short = "Classification of the encounter"
* classHistory.class ^definition = "Classification of the encounter."
* type.coding ^slicing.discriminator.type = #value
* type.coding ^slicing.discriminator.path = "system"
* type.coding ^slicing.ordered = false
* type.coding ^slicing.rules = #open
* type.coding contains snomedCT 0..1
* type.coding[snomedCT] ^binding.strength = #required
* type.coding[snomedCT] ^binding.description = "A code from the SNOMED Clinical Terminology UK coding system that describes an encounter between a care professional and the patient (or patient's record)."
* type.coding[snomedCT] ^binding.valueSet = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-EncounterType-1"
* . ^slicing.discriminator.type = #value
* . ^slicing.discriminator.path = "url"
* . ^slicing.rules = #open
* type.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* type.coding[snomedCT].system 1..
* type.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* type.coding[snomedCT].version ..0
* type.coding[snomedCT].code 1..
* type.coding[snomedCT].display 1..
* type.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* type.coding[snomedCT].display ^extension.valueBoolean = true
* subject only Reference(Group or CareConnect-Patient-1)
* participant.individual only Reference(RelatedPerson or CareConnect-Practitioner-1)
//NB: **** In R4 then "reason" becomes "reasonCode" ***

* reasonCode.coding ^slicing.discriminator.type = #value
* reasonCode.coding ^slicing.discriminator.path = "system"
* reasonCode.coding ^slicing.ordered = false
* reasonCode.coding ^slicing.rules = #open
* reasonCode.coding contains snomedCT 0..*
* . ^slicing.discriminator.type = #value
* . ^slicing.discriminator.path = "url"
* . ^slicing.rules = #open
* reasonCode.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* reasonCode.coding[snomedCT].system 1..
* reasonCode.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* reasonCode.coding[snomedCT].version ..0
* reasonCode.coding[snomedCT].code 1..
* reasonCode.coding[snomedCT].display 1..
* reasonCode.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* reasonCode.coding[snomedCT].display ^extension.valueBoolean = true
* hospitalization.preAdmissionIdentifier.system 1..
* hospitalization.preAdmissionIdentifier.value 1..
* hospitalization.preAdmissionIdentifier.assigner only Reference(CareConnect-Organization-1)
* hospitalization.origin only Reference(CareConnect-Location-1)
* hospitalization.reAdmission.coding ^slicing.discriminator.type = #value
* hospitalization.reAdmission.coding ^slicing.discriminator.path = "system"
* hospitalization.reAdmission.coding ^slicing.ordered = false
* hospitalization.reAdmission.coding ^slicing.rules = #open
* hospitalization.reAdmission.coding contains snomedCT 0..1
* . ^slicing.discriminator.type = #value
* . ^slicing.discriminator.path = "url"
* . ^slicing.rules = #open
* hospitalization.reAdmission.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* hospitalization.reAdmission.coding[snomedCT].system 1..
* hospitalization.reAdmission.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* hospitalization.reAdmission.coding[snomedCT].version ..0
* hospitalization.reAdmission.coding[snomedCT].code 1..
* hospitalization.reAdmission.coding[snomedCT].display 1..
* hospitalization.reAdmission.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* hospitalization.reAdmission.coding[snomedCT].display ^extension.valueBoolean = true
* hospitalization.dietPreference ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* hospitalization.dietPreference ^binding.extension.valueString = "PatientDiet"
* hospitalization.dietPreference ^binding.strength = #extensible
* hospitalization.destination only Reference(CareConnect-Location-1)
* hospitalization.dischargeDisposition ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* hospitalization.dischargeDisposition ^binding.extension.valueString = "DischargeDisp"
* hospitalization.dischargeDisposition ^binding.strength = #preferred
* location.location only Reference(CareConnect-Location-1)
* serviceProvider only Reference(CareConnect-Organization-1)
* partOf only Reference(CareConnect-Encounter-1)

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Encounter-1"