Profile: CareConnectACVPUObservation1
Parent: Observation
Id: CareConnect-ACVPU-Observation-1
Description: "This profile is used to carry alert, new-onset or worsening confusion, voice, pain, and unresponsiveness observations for a patient."
* ^meta.lastUpdated = "2017-08-25T14:06:37.813+01:00"
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-ACVPU-Observation-1"
* ^version = "1.1.0"
* ^status = #draft
* ^date = "2019-06-17"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^copyright = "Copyright © 2018 HL7 UK\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"
* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(CareConnect-Organization-1)
* basedOn only Reference(CareConnect-CarePlan-1 or DeviceRequest or ImmunizationRecommendation or NutritionOrder or CareConnect-ReferralRequest-1 or CareConnect-MedicationRequest-1 or CareConnect-ProcedureRequest-1)
* status = #final (exactly)
* status ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-display-hint"
* status ^extension.valueString = "default: final"
* category ^short = "Classification of  type of observation."
* code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code ^binding.extension.valueString = "ObservationCode"
* code ^binding.strength = #required
* code ^binding.description = "A code from SNOMED Clinical Terminology UK"
//* code ^binding.valueSetUri = "http://snomed.info/sct"
* code.coding 1..1
* code.coding.system 1..
* code.coding.system = "http://snomed.info/sct" (exactly)
* code.coding.version ..0
* code.coding.code 1..
* code.coding.code = #1104441000000107 (exactly)
* code.coding.display 1..
* code.coding.display = "ACVPU (Alert Confusion Voice Pain Unresponsive) scale score" (exactly)
* code.coding.display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* code.coding.display ^extension.valueBoolean = true
* subject only Reference(Group or CareConnect-Patient-1)
// R4 renames "context" to "encounter" (and removes ability to refer to an Episode of Care)
//* context only Reference(CareConnect-EpisodeOfCare-1 or CareConnect-Encounter-1)
//* context ^short = "Healthcare event during which this observation is made."
* performer only Reference(RelatedPerson or CareConnect-Patient-1 or CareConnect-Organization-1 or CareConnect-Practitioner-1)
//* valueCodeableConcept contains valueCodeableConcept 0..1
//* valueCodeableConcept[valueCodeableConcept] only CodeableConcept
//* valueCodeableConcept[valueCodeableConcept] ^binding.strength = #required
//* valueCodeableConcept[valueCodeableConcept] ^binding.description = "A code from the SNOMED Clinical Terminology UK coding system which describes whether a patient is mentally alert, unresponsive, responds to voice, responds to pain or is acutely confused."
//* valueCodeableConcept[valueCodeableConcept] ^binding.valueSet = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ACVPU-1"
//* valueCodeableConcept[valueCodeableConcept].coding 1..1
//* valueCodeableConcept[valueCodeableConcept].coding.system 1..
//* valueCodeableConcept[valueCodeableConcept].coding.system = "http://snomed.info/sct" (exactly)
//* valueCodeableConcept[valueCodeableConcept].coding.version ..0
//* valueCodeableConcept[valueCodeableConcept].coding.code 1..
//* valueCodeableConcept[valueCodeableConcept].coding.display 1..
//* valueCodeableConcept[valueCodeableConcept].coding.display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
//* valueCodeableConcept[valueCodeableConcept].coding.display ^extension.valueBoolean = true
* bodySite.coding ^slicing.discriminator.type = #value
* bodySite.coding ^slicing.discriminator.path = "system"
* bodySite.coding ^slicing.ordered = false
* bodySite.coding ^slicing.rules = #open
* bodySite.coding contains snomedCT 0..1
* bodySite.coding[snomedCT] ^binding.strength = #preferred
* bodySite.coding[snomedCT] ^binding.description = "A code from the SNOMED Clinical Terminology UK with the expression (<<442083009 |anatomical or acquired body structure|)."
* bodySite.coding[snomedCT] ^binding.valueSet = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-BodySite-1"
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

* method.coding ^slicing.discriminator.type = #value
* method.coding ^slicing.discriminator.path = "system"
* method.coding ^slicing.ordered = false
* method.coding ^slicing.rules = #open
* method.coding contains snomedCT 0..1
* method.coding[snomedCT] ^binding.strength = #preferred
* method.coding[snomedCT] ^binding.description = "A code from SNOMED Clinical Terminology UK"
* method.coding[snomedCT] ^binding.valueSet = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ObservationMethod-1"
* method.coding[snomedCT].extension ^slicing.discriminator.type = #value
* method.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* method.coding[snomedCT].extension ^slicing.rules = #open
* method.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* method.coding[snomedCT].system 1..
* method.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* method.coding[snomedCT].version ..0
* method.coding[snomedCT].code 1..
* method.coding[snomedCT].display 1..
* method.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"

* method.coding[snomedCT].display ^extension.valueBoolean = true
* specimen only Reference(CareConnect-Specimen-1)

//* related.target only Reference or Reference or Reference
* component.code.coding ^slicing.discriminator.type = #value
* component.code.coding ^slicing.discriminator.path = "code"
* component.code.coding ^slicing.ordered = false
* component.code.coding ^slicing.rules = #open
* component.code.coding contains snomedCT 0..1
* component.code.coding[snomedCT] ^binding.strength = #extensible
* component.code.coding[snomedCT] ^binding.description = "A code from the SNOMED Clinical Terminology UK coding system describing a type of observation"
* component.code.coding[snomedCT] ^binding.valueSet = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ObservationType-1"
* component.code.coding[snomedCT].extension ^slicing.discriminator.type = #value
* component.code.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* component.code.coding[snomedCT].extension ^slicing.rules = #open
* component.code.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* component.code.coding[snomedCT].system 1..
* component.code.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* component.code.coding[snomedCT].version ..0
* component.code.coding[snomedCT].code 1..
* component.code.coding[snomedCT].display 1..
* component.code.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* component.code.coding[snomedCT].display ^extension.valueBoolean = true

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-ACVPU-Observation-1"