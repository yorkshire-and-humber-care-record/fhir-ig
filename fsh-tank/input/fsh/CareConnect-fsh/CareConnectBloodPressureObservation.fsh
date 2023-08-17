Profile: CareConnectBloodPressureObservation1
Parent: Observation
Id: CareConnect-BloodPressure-Observation-1
Description: "A Vital Signs profile to carry blood pressure information that contains at least one component for systolic and/or diastolic pressure."
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-BloodPressure-Observation-1"
* ^version = "1.1.0"
* ^status = #draft
* ^date = "2019-06-17"
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2019 HL7 UK\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"
* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(CareConnect-Organization-1)
* basedOn only Reference(CareConnect-CarePlan-1 or DeviceRequest or ImmunizationRecommendation or CareConnect-MedicationRequest-1 or NutritionOrder or CareConnect-ReferralRequest-1 or CareConnect-ProcedureRequest-1)
* status = #final (exactly)
* status MS
* status ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-display-hint"
* status ^extension.valueString = "default: final"
* category 1.. MS
* category ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* category ^binding.extension.valueString = "ObservationCategory"
* category ^binding.strength = #required
* category.coding 1..1
* category.coding ^mustSupport = false
* category.coding.system 1..
* category.coding.system = "http://hl7.org/fhir/observation-category" (exactly)
* category.coding.system ^mustSupport = false
* category.coding.version ..0
* category.coding.code 1..
* category.coding.code = #vital-signs (exactly)
* category.coding.display = "Vital Signs" (exactly)
* category.coding.display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* category.coding.display ^extension.valueBoolean = true
* code MS
* code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* code ^binding.extension.valueString = "ObservationCode"
* code ^binding.strength = #extensible
* code ^binding.description = "This value set indicates the allowed vital sign result types."
* code ^binding.valueSet = "http://hl7.org/fhir/ValueSet/observation-vitalsignresult"
* code.coding 1..
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "code"
* code.coding ^slicing.ordered = false
* code.coding ^slicing.rules = #open
* code.coding contains
    loinc 1..1 and
    snomedCT 1..1
* code.coding[loinc] ^binding.strength = #extensible
* code.coding[loinc] ^binding.description = "This value set indicates the allowed vital sign result types"
* code.coding[loinc] ^binding.valueSet = "http://hl7.org/fhir/ValueSet/observation-vitalsignresult"
* code.coding[loinc].system 1..
* code.coding[loinc].system = "http://loinc.org" (exactly)
* code.coding[loinc].code 1..
* code.coding[loinc].code = #85354-9 (exactly)
* code.coding[snomedCT].extension ^slicing.discriminator.type = #value
* code.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* code.coding[snomedCT].extension ^slicing.rules = #open
* code.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* code.coding[snomedCT].system 1..
* code.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* code.coding[snomedCT].version ..0
* code.coding[snomedCT].code 1..
* code.coding[snomedCT].code = #75367002 (exactly)
* code.coding[snomedCT].display 1..
* code.coding[snomedCT].display = "Blood pressure" (exactly)
* code.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* code.coding[snomedCT].display ^extension.valueBoolean = true
* subject 1.. MS
* subject only Reference(CareConnect-Patient-1)
// R4 renames "context" to "encounter" (and removes ability to refer to an Episode of Care)
//* context only Reference(CareConnect-EpisodeOfCare-1 or CareConnect-Encounter-1)
* effective[x] 1.. MS
* effective[x] ^short = "Clinically relevant time/time-period for the observation"
* performer only Reference(CareConnect-RelatedPerson-1 or CareConnect-Practitioner-1 or CareConnect-Organization-1 or CareConnect-Patient-1)
// * valueQuantity contains valueQuantity 0..0 MS
* valueQuantity[valueQuantity] only Quantity
* valueQuantity[valueQuantity] ^short = "Vital Sign Value recorded with UCUM"
* valueQuantity[valueQuantity].value 1.. MS
* valueQuantity[valueQuantity].unit 1.. MS
* valueQuantity[valueQuantity].unit ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* valueQuantity[valueQuantity].unit ^extension.valueBoolean = true
* valueQuantity[valueQuantity].system 1.. MS
* valueQuantity[valueQuantity].system = "http://unitsofmeasure.org" (exactly)
* valueQuantity[valueQuantity].code 1.. MS
* valueQuantity[valueQuantity].code ^binding.strength = #required
* valueQuantity[valueQuantity].code ^binding.description = "A value set for common UCUM units for recording vital signs"
* valueQuantity[valueQuantity].code ^binding.valueSet = ucum-vitals-common
* dataAbsentReason MS
* dataAbsentReason.coding.code ^mustSupport = false
* bodySite.coding ^slicing.discriminator.type = #value
* bodySite.coding ^slicing.discriminator.path = "system"
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
// * related MS
// * related.type 1.. MS
// * related.type = #has-member (exactly)
// * related.target only Reference(CareConnect-Observation-1 or QuestionnaireResponse or Sequence or CareConnect-VitalSigns-Observation-1)
// * related.target MS
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^short = "Used when reporting systolic and diastolic blood pressure."
* component contains
    systolicComponent 0..* and
    diastolicComponent 0..*
* component[systolicComponent].code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* component[systolicComponent].code ^binding.extension.valueString = "ObservationCode"
* component[systolicComponent].code ^binding.strength = #extensible
* component[systolicComponent].code ^binding.description = "This value set indicates the allowed vital sign result types."
* component[systolicComponent].code ^binding.valueSet = "http://hl7.org/fhir/ValueSet/observation-vitalsignresult"
* component[systolicComponent].code.coding ^slicing.discriminator.type = #value
* component[systolicComponent].code.coding ^slicing.discriminator.path = "code"
* component[systolicComponent].code.coding ^slicing.rules = #open
* component[systolicComponent].code.coding contains
    loinc 1..1 and
    snomedCT 1..1
* component[systolicComponent].code.coding[loinc] ^short = "Systolic Blood Pressure"
* component[systolicComponent].code.coding[loinc] ^binding.strength = #extensible
* component[systolicComponent].code.coding[loinc] ^binding.description = "This value set indicates the allowed vital sign result types"
* component[systolicComponent].code.coding[loinc] ^binding.valueSet = "http://hl7.org/fhir/ValueSet/observation-vitalsignresult"
* component[systolicComponent].code.coding[loinc].system 1..
* component[systolicComponent].code.coding[loinc].system = "http://loinc.org" (exactly)
* component[systolicComponent].code.coding[loinc].code 1..
* component[systolicComponent].code.coding[loinc].code = #8480-6 (exactly)
* component[systolicComponent].code.coding[snomedCT] ^short = "Systolic Blood Pressure"
* component[systolicComponent].code.coding[snomedCT].extension ^slicing.discriminator.type = #value
* component[systolicComponent].code.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* component[systolicComponent].code.coding[snomedCT].extension ^slicing.rules = #open
* component[systolicComponent].code.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* component[systolicComponent].code.coding[snomedCT].system 1..
* component[systolicComponent].code.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* component[systolicComponent].code.coding[snomedCT].version ..0
* component[systolicComponent].code.coding[snomedCT].code 1..
//* component[systolicComponent].code.coding[snomedCT].code = #72313002 (exactly)
* component[systolicComponent].code.coding[snomedCT].display 1..
//* component[systolicComponent].code.coding[snomedCT].display = "Systolic arterial pressure" (exactly)
* component[systolicComponent].code.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* component[systolicComponent].code.coding[snomedCT].display ^extension.valueBoolean = true
// * component[systolicComponent].valueQuantity contains valueQuantity 0..1
* component[systolicComponent].valueQuantity[valueQuantity] only Quantity
* component[systolicComponent].valueQuantity[valueQuantity] ^short = "Vital Sign Value recorded with UCUM"
* component[systolicComponent].valueQuantity[valueQuantity] ^binding.strength = #required
* component[systolicComponent].valueQuantity[valueQuantity] ^binding.description = "A value set describing common UCUM units for recording vital signs"
* component[systolicComponent].valueQuantity[valueQuantity] ^binding.valueSet = ucum-vitals-common
* component[systolicComponent].valueQuantity[valueQuantity].value 1..
* component[systolicComponent].valueQuantity[valueQuantity].unit 1..
* component[systolicComponent].valueQuantity[valueQuantity].unit ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* component[systolicComponent].valueQuantity[valueQuantity].unit ^extension.valueBoolean = true
* component[systolicComponent].valueQuantity[valueQuantity].system 1..
* component[systolicComponent].valueQuantity[valueQuantity].system = "http://unitsofmeasure.org" (exactly)
* component[systolicComponent].valueQuantity[valueQuantity].code 1..
* component[systolicComponent].valueQuantity[valueQuantity].code = #mm[Hg] (exactly)
* component[systolicComponent].valueQuantity[valueQuantity].code ^short = "Coded responses from the common UCUM units for vital signs value set."
* component[diastolicComponent].code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* component[diastolicComponent].code ^binding.extension.valueString = "ObservationCode"
* component[diastolicComponent].code ^binding.strength = #extensible
* component[diastolicComponent].code ^binding.description = "This value set indicates the allowed vital sign result types"
* component[diastolicComponent].code ^binding.valueSet = "http://hl7.org/fhir/ValueSet/observation-vitalsignresult"
* component[diastolicComponent].code.coding ^slicing.discriminator.type = #value
* component[diastolicComponent].code.coding ^slicing.discriminator.path = "code"
* component[diastolicComponent].code.coding ^slicing.rules = #open
* component[diastolicComponent].code.coding contains
    loinc 1..1 and
    snomedCT 1..1
* component[diastolicComponent].code.coding[loinc] ^short = "Diastolic Blood Pressure"
* component[diastolicComponent].code.coding[loinc] ^binding.strength = #extensible
* component[diastolicComponent].code.coding[loinc] ^binding.description = "This value set indicates the allowed vital sign result types"
* component[diastolicComponent].code.coding[loinc] ^binding.valueSet = "http://hl7.org/fhir/ValueSet/observation-vitalsignresult"
* component[diastolicComponent].code.coding[loinc].system 1..
* component[diastolicComponent].code.coding[loinc].system = "http://loinc.org" (exactly)
* component[diastolicComponent].code.coding[loinc].code 1..
* component[diastolicComponent].code.coding[loinc].code = #8462-4 (exactly)
* component[diastolicComponent].code.coding[snomedCT] ^short = "Diastolic Blood Pressure"
* component[diastolicComponent].code.coding[snomedCT].extension ^slicing.discriminator.type = #value
* component[diastolicComponent].code.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* component[diastolicComponent].code.coding[snomedCT].extension ^slicing.rules = #open
* component[diastolicComponent].code.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* component[diastolicComponent].code.coding[snomedCT].system 1..
* component[diastolicComponent].code.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* component[diastolicComponent].code.coding[snomedCT].version ..0
* component[diastolicComponent].code.coding[snomedCT].code 1..
//* component[diastolicComponent].code.coding[snomedCT].code = #1091811000000102 (exactly)
* component[diastolicComponent].code.coding[snomedCT].display 1..
//* component[diastolicComponent].code.coding[snomedCT].display = "Diastolic arterial pressure" (exactly)
* component[diastolicComponent].code.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* component[diastolicComponent].code.coding[snomedCT].display ^extension.valueBoolean = true
// * component[diastolicComponent].valueQuantity contains valueQuantity 0..1
* component[diastolicComponent].valueQuantity[valueQuantity] only Quantity
* component[diastolicComponent].valueQuantity[valueQuantity] ^short = "Vital Sign Value recorded with UCUM"
* component[diastolicComponent].valueQuantity[valueQuantity] ^binding.strength = #required
* component[diastolicComponent].valueQuantity[valueQuantity] ^binding.description = "A value set describing common UCUM units for recording vital signs"
* component[diastolicComponent].valueQuantity[valueQuantity] ^binding.valueSet = ucum-vitals-common
* component[diastolicComponent].valueQuantity[valueQuantity].value 1..
* component[diastolicComponent].valueQuantity[valueQuantity].unit 1..
* component[diastolicComponent].valueQuantity[valueQuantity].unit ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* component[diastolicComponent].valueQuantity[valueQuantity].unit ^extension.valueBoolean = true
* component[diastolicComponent].valueQuantity[valueQuantity].system 1..
* component[diastolicComponent].valueQuantity[valueQuantity].system = "http://unitsofmeasure.org" (exactly)
* component[diastolicComponent].valueQuantity[valueQuantity].code 1..
* component[diastolicComponent].valueQuantity[valueQuantity].code = #mm[Hg] (exactly)
* component[diastolicComponent].valueQuantity[valueQuantity].code ^short = "Coded responses from the common UCUM units for vital signs value set."

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-BloodPressure-Observation-1"