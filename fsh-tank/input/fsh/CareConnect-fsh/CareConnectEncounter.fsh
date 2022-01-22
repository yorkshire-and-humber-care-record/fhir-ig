Profile: CareConnectEncounter1
Parent: Encounter
Id: CareConnect-Encounter-1
Description: "The encounter resource represents an encounter between a care professional and the patient (or patient's record)."
* ^meta.lastUpdated = "2018-02-20T08:24:06.177+00:00"
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
* extension contains
    Extension-CareConnect-EncounterTransport-1 named encounterTransport 0..1 and
    Extension-CareConnect-OutcomeOfAttendance-1 named outcomeOfAttendance 0..1 and
    Extension-CareConnect-EmergencyCareDischargeStatus-1 named emergencyCareDischargeStatus 0..1

* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(CareConnect-Organization-1)

* class ^short = "Classification of the encounter"
* class ^definition = "Classification of the encounter."
* classHistory.class ^short = "Classification of the encounter"
* classHistory.class ^definition = "Classification of the encounter."

* type.coding ..1
* type.coding ^slicing.discriminator.type = #value
* type.coding ^slicing.discriminator.path = "system"
* type.coding ^slicing.ordered = false
* type.coding ^slicing.rules = #open

// Bug! There is only 1 coding allowed, so how can it contain multiple slices of snomedCT?!
//* type.coding contains snomedCT 0..*
* type.coding contains snomedCT 0..1

* type.coding[snomedCT] ^binding.strength = #extensible
* type.coding[snomedCT] ^binding.description = "A code from the SNOMED Clinical Terminology UK coding system that describes an encounter between a care professional and the patient (or patient's record)."
* type.coding[snomedCT] ^binding.valueSet = CareConnect-EncounterType-1
* type.coding[snomedCT].extension ^slicing.discriminator.type = #value
* type.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* type.coding[snomedCT].extension ^slicing.rules = #open
* type.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* type.coding[snomedCT].system 1..
* type.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
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
* reasonCode.coding contains snomedCT 0..1

* reasonCode.coding[snomedCT].extension ^slicing.discriminator.type = #value
* reasonCode.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* reasonCode.coding[snomedCT].extension ^slicing.rules = #open
* reasonCode.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* reasonCode.coding[snomedCT].system 1..
* reasonCode.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* reasonCode.coding[snomedCT].code 1..
* reasonCode.coding[snomedCT].display 1..
* reasonCode.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* reasonCode.coding[snomedCT].display ^extension.valueBoolean = true


* diagnosis.condition only Reference(CareConnect-Procedure-1 or CareConnect-Condition-1)

* hospitalization.extension ^slicing.discriminator.type = #value
* hospitalization.extension ^slicing.discriminator.path = "url"
* hospitalization.extension ^slicing.rules = #open
* hospitalization.extension contains
    Extension-CareConnect-AdmissionMethod-1 named admissionMethod 0..1 and
    Extension-CareConnect-DischargeMethod-1 named dischargeMethod 0..1

* hospitalization.preAdmissionIdentifier.system 1..
* hospitalization.preAdmissionIdentifier.value 1..
* hospitalization.preAdmissionIdentifier.assigner only Reference(CareConnect-Organization-1)
* hospitalization.origin only Reference(CareConnect-Location-1)

* hospitalization.admitSource ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* hospitalization.admitSource ^binding.extension.valueString = "AdmitSource"
* hospitalization.admitSource ^binding.strength = #preferred
* hospitalization.admitSource ^binding.description = "The source of admission to a Hospital Provider Spell or a Nursing Episode when the Patient is in a Hospital Site or a Care Home."
* hospitalization.admitSource ^binding.valueSet = CareConnect-SourceOfAdmission-1

* hospitalization.reAdmission.coding ^slicing.discriminator.type = #value
* hospitalization.reAdmission.coding ^slicing.discriminator.path = "system"
* hospitalization.reAdmission.coding ^slicing.ordered = false
* hospitalization.reAdmission.coding ^slicing.rules = #open
* hospitalization.reAdmission.coding contains snomedCT 0..1

* hospitalization.reAdmission.coding[snomedCT].extension ^slicing.discriminator.type = #value
* hospitalization.reAdmission.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* hospitalization.reAdmission.coding[snomedCT].extension ^slicing.rules = #open
* hospitalization.reAdmission.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* hospitalization.reAdmission.coding[snomedCT].system 1..
* hospitalization.reAdmission.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
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
* hospitalization.dischargeDisposition ^binding.strength = #example
* hospitalization.dischargeDisposition ^binding.description = "The destination of a Patient on completion of a Hospital Provider Spell, or a note that the Patient died or was a still birth."
* hospitalization.dischargeDisposition ^binding.valueSet = CareConnect-DischargeDestination-1

* location.location only Reference(CareConnect-Location-1)
* serviceProvider only Reference(CareConnect-Organization-1)
* partOf only Reference(CareConnect-Encounter-1)

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Encounter-1"

