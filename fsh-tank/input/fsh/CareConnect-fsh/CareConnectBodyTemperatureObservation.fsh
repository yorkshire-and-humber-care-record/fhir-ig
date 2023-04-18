Profile: CareConnectBodyTemperatureObservation1
Parent: Observation
Id: CareConnect-BodyTemperature-Observation-1
Description: "A Vital Signs profile to carry a patient's body temperature."
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
* code ^binding.valueSet = observation-vitalsignresult
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
* code.coding[loinc] ^binding.valueSet = observation-vitalsignresult
* code.coding[loinc].system 1..
* code.coding[loinc].system = "http://loinc.org" (exactly)
* code.coding[loinc].code 1..
* code.coding[loinc].code = #8310-5 (exactly)
* code.coding[snomedCT].extension ^slicing.discriminator.type = #value
* code.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* code.coding[snomedCT].extension ^slicing.rules = #open
* code.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* code.coding[snomedCT].system 1..
* code.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* code.coding[snomedCT].version ..0
* code.coding[snomedCT].code 1..
* code.coding[snomedCT].code = #276885007 (exactly)
* code.coding[snomedCT].display 1..
* code.coding[snomedCT].display = "Core body temperature" (exactly)
* code.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* code.coding[snomedCT].display ^extension.valueBoolean = true
* subject 1.. MS
* subject only Reference(CareConnect-Patient-1)
// R4 renames "context" to "encounter" (and removes ability to refer to an Episode of Care)
//* context only Reference(CareConnect-EpisodeOfCare-1 or CareConnect-Encounter-1)
* effective[x] 1.. MS
* performer only Reference(CareConnect-RelatedPerson-1 or CareConnect-Practitioner-1 or CareConnect-Organization-1 or CareConnect-Patient-1)
//* valueQuantity contains valueQuantity 0..1 MS
* valueQuantity[valueQuantity] only Quantity
* valueQuantity[valueQuantity] ^binding.strength = #required
* valueQuantity[valueQuantity] ^binding.description = "Common UCUM units for recording Vital Signs"
* valueQuantity[valueQuantity] ^binding.valueSet = ucum-vitals-common
* valueQuantity[valueQuantity].value 1.. MS
* valueQuantity[valueQuantity].unit 1.. MS
* valueQuantity[valueQuantity].unit ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* valueQuantity[valueQuantity].unit ^extension.valueBoolean = true
* valueQuantity[valueQuantity].system 1.. MS
* valueQuantity[valueQuantity].system = "http://unitsofmeasure.org" (exactly)
* valueQuantity[valueQuantity].code 1.. MS
* valueQuantity[valueQuantity].code = #Cel (exactly)
* valueQuantity[valueQuantity].code ^short = "Coded responses from the common UCUM units for vital signs value set."
* valueQuantity[valueQuantity].code ^binding.strength = #required
* valueQuantity[valueQuantity].code ^binding.description = "UCUM units for recording Body Temperature"
* valueQuantity[valueQuantity].code ^binding.valueSet = "http://hl7.org/fhir/ValueSet/ucum-bodytemp"
* dataAbsentReason MS
* dataAbsentReason ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* dataAbsentReason ^binding.extension.valueString = "ObservationValueAbsentReason"
* dataAbsentReason ^binding.strength = #extensible
* dataAbsentReason ^binding.description = "This value set defines the set of codes for identifying the reason why the expected result in Observation.value[x] is missing."
* dataAbsentReason.coding.code ^mustSupport = false
* interpretation ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* interpretation ^binding.extension.valueString = "ObservationInterpretation"
* interpretation ^binding.strength = #extensible
* interpretation ^binding.description = "This value set defines the set of codes that can be used to indicate the meaning/use of a reference range."
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
// * related MS
// * related.type 1.. MS
// * related.type = #has-member (exactly)
// * related.target only Reference(CareConnect-VitalSigns-Observation-1)
// * related.target MS
* component MS
* component.code MS
* component.code ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* component.code ^binding.extension.valueString = "ObservationCode"
* component.code ^binding.strength = #extensible
* component.code ^binding.description = "This value set indicates the allowed vital sign result types."
* component.code ^binding.valueSet = observation-vitalsignresult
* component.code.coding.system ^mustSupport = false
* component.code.coding.code ^mustSupport = false
//* component.valueQuantity contains valueQuantity 0..1 MS
* component.valueQuantity[valueQuantity] only Quantity
* component.valueQuantity[valueQuantity] ^binding.strength = #required
* component.valueQuantity[valueQuantity] ^binding.description = "Common UCUM units for recording Vital Signs"
* component.valueQuantity[valueQuantity] ^binding.valueSet = ucum-vitals-common
* component.valueQuantity[valueQuantity].value 1.. MS
* component.valueQuantity[valueQuantity].unit 1.. MS
* component.valueQuantity[valueQuantity].unit ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* component.valueQuantity[valueQuantity].unit ^extension.valueBoolean = true
* component.valueQuantity[valueQuantity].system 1.. MS
* component.valueQuantity[valueQuantity].system = "http://unitsofmeasure.org" (exactly)
* component.valueQuantity[valueQuantity].code 1.. MS
* component.dataAbsentReason MS
* component.dataAbsentReason.coding ^mustSupport = false
* component.dataAbsentReason.coding.code ^mustSupport = false

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-BodyTemperature-Observation-1"