Profile: CareConnectMedicationRequest1
Parent: MedicationRequest
Id: CareConnect-MedicationRequest-1
Description: "This MedicationRequest Resource represents an order for both supply of the medication and the instructions for administration of the medication to a patient. "
* ^meta.lastUpdated = "2018-03-06T14:43:14.908+00:00"
* ^version = "1.1.0"
* ^status = #draft
* ^date = "2018-11-05"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/"
* ^copyright = "Copyright © 2016 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    Extension-CareConnect-MedicationRepeatInformation-1 named repeatInformation 0..1 and
    Extension-CareConnect-MedicationStatusReason-1 named statusReason 0..1 and
    Extension-CareConnect-PrescriptionType-1 named prescriptionType 0..1
* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(CareConnect-Organization-1)

// ProcedureRequest and ReferralRequest don't exist in R4!
//* basedOn only Reference(CarePlan or ProcedureRequest or ReferralRequest or CareConnect-MedicationRequest-1)

* groupIdentifier.assigner only Reference(CareConnect-Organization-1)
//* medicationReference contains medicationReference 1..1
* medicationReference[medicationReference] only Reference(CareConnect-Medication-1)
* medicationReference[medicationReference] ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* medicationReference[medicationReference] ^binding.extension.valueString = "MedicationCode"
* medicationReference[medicationReference] ^binding.strength = #example
* medicationReference[medicationReference] ^binding.valueSet = "http://hl7.org/fhir/ValueSet/medication-codes"
* subject only Reference(Group or CareConnect-Patient-1)

// Renambed to encounter in R4
//* context only Reference(EpisodeOfCare or CareConnect-Encounter-1)

//These fields combined in R4
//* requester.agent only Reference(RelatedPerson or Device or CareConnect-Organization-1 or CareConnect-Patient-1 or CareConnect-Practitioner-1)
//* requester.onBehalfOf only Reference(CareConnect-Organization-1)
* requester only Reference(RelatedPerson or Device or CareConnect-Organization-1 or CareConnect-Patient-1 or CareConnect-Practitioner-1 or CareConnect-Organization-1)


* recorder only Reference(CareConnect-Practitioner-1)
* reasonReference only Reference(CareConnect-Condition-1 or CareConnect-Observation-1)
* note.author[x] only string or Reference(RelatedPerson or CareConnect-Patient-1 or CareConnect-Practitioner-1)
* dosageInstruction.additionalInstruction.coding ^slicing.discriminator.type = #value
* dosageInstruction.additionalInstruction.coding ^slicing.discriminator.path = "system"
* dosageInstruction.additionalInstruction.coding ^slicing.ordered = false
* dosageInstruction.additionalInstruction.coding ^slicing.rules = #open
* dosageInstruction.additionalInstruction.coding contains snomedCT 0..1
* dosageInstruction.additionalInstruction.coding[snomedCT].extension ^slicing.discriminator.type = #value
* dosageInstruction.additionalInstruction.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* dosageInstruction.additionalInstruction.coding[snomedCT].extension ^slicing.rules = #open
* dosageInstruction.additionalInstruction.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* dosageInstruction.additionalInstruction.coding[snomedCT].system 1..
* dosageInstruction.additionalInstruction.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* dosageInstruction.additionalInstruction.coding[snomedCT].code 1..
* dosageInstruction.additionalInstruction.coding[snomedCT].display 1..
* dosageInstruction.additionalInstruction.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* dosageInstruction.additionalInstruction.coding[snomedCT].display ^extension.valueBoolean = true
* dosageInstruction.route.coding ^slicing.discriminator.type = #value
* dosageInstruction.route.coding ^slicing.discriminator.path = "system"
* dosageInstruction.route.coding ^slicing.ordered = false
* dosageInstruction.route.coding ^slicing.rules = #open
* dosageInstruction.route.coding contains snomedCT 0..1
* dosageInstruction.route.coding[snomedCT] ^binding.strength = #preferred
* dosageInstruction.route.coding[snomedCT] ^binding.description = "A code from the SNOMED Clinical Terminology UK coding system that describes the e-Prescribing route of administration."
* dosageInstruction.route.coding[snomedCT] ^binding.valueSet = CareConnect-MedicationDosageRoute-1
* dosageInstruction.route.coding[snomedCT].extension ^slicing.discriminator.type = #value
* dosageInstruction.route.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* dosageInstruction.route.coding[snomedCT].extension ^slicing.rules = #open
* dosageInstruction.route.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* dosageInstruction.route.coding[snomedCT].system 1..
* dosageInstruction.route.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* dosageInstruction.route.coding[snomedCT].code 1..
* dosageInstruction.route.coding[snomedCT].display 1..
* dosageInstruction.route.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* dosageInstruction.route.coding[snomedCT].display ^extension.valueBoolean = true
* dispenseRequest.quantity.extension ^slicing.discriminator.type = #value
* dispenseRequest.quantity.extension ^slicing.discriminator.path = "url"
* dispenseRequest.quantity.extension ^slicing.rules = #open
* dispenseRequest.quantity.extension contains Extension-CareConnect-MedicationQuantityText-1 named quantityText 0..1
* dispenseRequest.expectedSupplyDuration.value 1..
* dispenseRequest.expectedSupplyDuration.system 1..
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org" (exactly)
* dispenseRequest.expectedSupplyDuration.code 1..
* dispenseRequest.expectedSupplyDuration.code ^binding.strength = #required
* dispenseRequest.expectedSupplyDuration.code ^binding.description = "A unit of time (units from UCUM)."
* dispenseRequest.expectedSupplyDuration.code ^binding.valueSet = "http://hl7.org/fhir/ValueSet/units-of-time"
* dispenseRequest.performer only Reference(CareConnect-Organization-1)
* priorPrescription only Reference(CareConnect-MedicationRequest-1)


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-MedicationRequest-1"