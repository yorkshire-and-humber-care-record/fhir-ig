Profile: CareConnectAllergyIntolerance1
Parent: AllergyIntolerance
Id: CareConnect-AllergyIntolerance-1
Description: "This AllergyIntolerance Resource records Risk of harmful or undesirable, physiological response which is unique to an individual and associated with exposure to a substance."
* ^meta.lastUpdated = "2018-03-28T14:03:26.156+01:00"
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-AllergyIntolerance-1"
* ^version = "1.2.0"
* ^status = #draft
* ^date = "2018-11-05"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/"
* ^copyright = "Copyright © 2016 HL7 UK\r\n\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    encounter-associatedEncounter named encounter 0..1 and
    Extension-CareConnect-AllergyIntoleranceEnd-1 named allergyEnd 0..1 and
    Extension-CareConnect-Evidence-1 named evidence 0..1
* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(CareConnect-Organization-1)
* verificationStatus ^short = "unconfirmed | confirmed"
* verificationStatus ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* verificationStatus ^binding.extension.valueString = "AllergyIntoleranceVerificationStatus"
* verificationStatus ^binding.strength = #required
* verificationStatus ^binding.valueSet = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-AllergyVerificationStatus-1"
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains snomedCT 0..1
* code.coding[snomedCT] ^binding.strength = #example
* code.coding[snomedCT] ^binding.description = "A code from the SNOMED Clinical Terminology UK or a code from the v3 Code System NullFlavor specifying why a valid value is not present."
* code.coding[snomedCT] ^binding.valueSet = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-AllergyCode-1"
* code.coding[snomedCT].extension ^slicing.discriminator.type = #value
* code.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* code.coding[snomedCT].extension ^slicing.rules = #open
* code.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* code.coding[snomedCT].system 1..
* code.coding[snomedCT].code 1..
* code.coding[snomedCT].display 1..
* code.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* code.coding[snomedCT].display ^extension.valueBoolean = true
* patient only Reference(CareConnect-Patient-1)
* onset[x] MS
//renamed as 'RecordedDate' in R4
//* assertedDate 1..
* recorder only Reference(CareConnect-Patient-1 or CareConnect-Practitioner-1)
* asserter only Reference(RelatedPerson or CareConnect-Patient-1 or CareConnect-Practitioner-1)
* note.author[x] only string or Reference(RelatedPerson or CareConnect-Patient-1 or CareConnect-Practitioner-1)
* reaction.substance.coding ^slicing.discriminator.type = #value
* reaction.substance.coding ^slicing.discriminator.path = "system"
* reaction.substance.coding ^slicing.ordered = false
* reaction.substance.coding ^slicing.rules = #open
* reaction.substance.coding contains snomedCT 0..1
* reaction.substance.coding[snomedCT].extension ^slicing.discriminator.type = #value
* reaction.substance.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* reaction.substance.coding[snomedCT].extension ^slicing.rules = #open
* reaction.substance.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* reaction.substance.coding[snomedCT].system 1..
* reaction.substance.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* reaction.substance.coding[snomedCT].code 1..
* reaction.substance.coding[snomedCT].display 1..
* reaction.substance.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* reaction.substance.coding[snomedCT].display ^extension.valueBoolean = true
* reaction.manifestation ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* reaction.manifestation ^binding.extension.valueString = "Manifestation"
* reaction.manifestation ^binding.strength = #extensible
* reaction.manifestation ^binding.valueSet = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-AllergyManifestation-1"
* reaction.manifestation.coding ^slicing.discriminator.type = #value
* reaction.manifestation.coding ^slicing.discriminator.path = "system"
* reaction.manifestation.coding ^slicing.ordered = false
* reaction.manifestation.coding ^slicing.rules = #open
* reaction.manifestation.coding contains snomedCT 0..1
* reaction.manifestation.coding[snomedCT].extension ^slicing.discriminator.type = #value
* reaction.manifestation.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* reaction.manifestation.coding[snomedCT].extension ^slicing.rules = #open
* reaction.manifestation.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* reaction.manifestation.coding[snomedCT].system 1..
* reaction.manifestation.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* reaction.manifestation.coding[snomedCT].code 1..
* reaction.manifestation.coding[snomedCT].display 1..
* reaction.manifestation.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* reaction.manifestation.coding[snomedCT].display ^extension.valueBoolean = true
* reaction.severity ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* reaction.severity ^binding.extension.valueString = "AllergyIntoleranceSeverity"
* reaction.severity ^binding.strength = #required
* reaction.severity ^binding.valueSet = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ReactionEventSeverity-1"
* reaction.exposureRoute ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* reaction.exposureRoute ^binding.extension.valueString = "RouteOfAdministration"
* reaction.exposureRoute ^binding.strength = #example
* reaction.exposureRoute ^binding.valueSet = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-AllergyExposureRoute-1"
* reaction.exposureRoute.coding ^slicing.discriminator.type = #value
* reaction.exposureRoute.coding ^slicing.discriminator.path = "system"
* reaction.exposureRoute.coding ^slicing.ordered = false
* reaction.exposureRoute.coding ^slicing.rules = #open
* reaction.exposureRoute.coding contains snomedCT 0..1
* reaction.exposureRoute.coding[snomedCT].extension ^slicing.discriminator.type = #value
* reaction.exposureRoute.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* reaction.exposureRoute.coding[snomedCT].extension ^slicing.rules = #open
* reaction.exposureRoute.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* reaction.exposureRoute.coding[snomedCT].system 1..
* reaction.exposureRoute.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* reaction.exposureRoute.coding[snomedCT].code 1..
* reaction.exposureRoute.coding[snomedCT].display 1..
* reaction.exposureRoute.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* reaction.exposureRoute.coding[snomedCT].display ^extension.valueBoolean = true
* reaction.note.author[x] only string or Reference(RelatedPerson or CareConnect-Patient-1 or CareConnect-Practitioner-1)