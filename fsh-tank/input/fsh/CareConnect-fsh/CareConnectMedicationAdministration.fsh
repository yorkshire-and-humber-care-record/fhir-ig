Profile: CareConnectMedicationAdministration1
Parent: MedicationAdministration
Id: CareConnect-MedicationAdministration-1
Description: "Describes the event of a patient consuming or otherwise being administered a medication."
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2019-04-05T13:31:31.094+01:00"
* ^publisher = "NHS Digital"
* ^contact.name = "Interoperability Team"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "interoperabilityteam@nhs.net"
* ^contact.telecom.use = #work
* ^purpose = "[NOT CURATED BY INTEROPEN see: http://www.interopen.org/careconnect-curation-methodology/] Initial development for the Digital Maternity programme"
* ^copyright = "Copyright © 2016 HL7 UK\r \r Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r \r http://www.apache.org/licenses/LICENSE-2.0\r \r Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r \r HL7® FHIR® standard Copyright © 2011+ HL7\r \r The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r \r https://www.hl7.org/fhir/license.html"
* identifier.assigner only Reference(CareConnect-Organization-1)
* partOf only Reference(CareConnect-Procedure-1 or CareConnect-MedicationAdministration-1)
* medicationReference only Reference(Medication or CareConnect-Medication-1)
* medicationReference ^sliceName = "medicationReference"
* subject only Reference(Group or CareConnect-Patient-1)
* context only Reference(CareConnect-Encounter-1 or CareConnect-EpisodeOfCare-1)
* performer.actor only Reference(Device or CareConnect-Patient-1 or CareConnect-RelatedPerson-1 or CareConnect-Practitioner-1)
//* performer.onBehalfOf only Reference(CareConnect-Organization-1)
* reasonReference only Reference(CareConnect-Condition-1 or CareConnect-Observation-1)
//* prescription only Reference(CareConnect-MedicationRequest-1)
* note.author[x] only string or Reference(CareConnect-Patient-1 or CareConnect-RelatedPerson-1 or CareConnect-Practitioner-1)
* dosage.route.coding ^slicing.discriminator.type = #value
* dosage.route.coding ^slicing.discriminator.path = "system"
* dosage.route.coding ^slicing.rules = #open
* dosage.route.coding contains snomedCT 0..1
* dosage.route.coding[snomedCT] ^binding.strength = #example
* dosage.route.coding[snomedCT] ^binding.description = "A code from the SNOMED Clinical Terminology UK coding system that describes the e-Prescribing route of administration."
* dosage.route.coding[snomedCT] ^binding.valueSet = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-MedicationDosageRoute-1"
* dosage.route.coding[snomedCT].extension ^slicing.discriminator.type = #value
* dosage.route.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* dosage.route.coding[snomedCT].extension ^slicing.rules = #open
* dosage.route.coding[snomedCT].extension contains Extension-coding-sctdescid named SnomedCTDescriptionId 0..1
* dosage.route.coding[snomedCT].extension[SnomedCTDescriptionId] ^short = "The SNOMED CT Description ID for the display"
* dosage.route.coding[snomedCT].extension[SnomedCTDescriptionId] ^definition = "The SNOMED CT Description ID for the display."
* dosage.route.coding[snomedCT].system 1..
* dosage.route.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* dosage.route.coding[snomedCT].code 1..
* dosage.route.coding[snomedCT].display 1..
* dosage.route.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* dosage.route.coding[snomedCT].display ^extension.valueBoolean = true

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-MedicationAdministration-1"