//NB: There is something strange in the original CareConnect json file that causes the IG Builder to fail parsing.
//    Have therefore manually adjusted the file in "careconnect-STU3" folder
//    Have removed the "snapshot" section, leaving only "differential". 
//    Thus allowing the IG Builder to regenerate snapshot itself, which then seems fine
//    (Have tried comparing the difference and there some escaped characters, so maybe that is it?)


Profile: CareConnectCondition1
Parent: Condition
Id: CareConnect-Condition-1
Description: "This Condition resource records detailed information about conditions or diagnoses recognised by a clinician."
* ^meta.lastUpdated = "2018-05-03T12:09:43.472+01:00"
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
* extension contains Extension-CareConnect-ConditionEpisode-1 named episodisity 0..*

* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(CareConnect-Organization-1)

* verificationStatus ..0

* category ^short = "problem-list-item | encounter-diagnosis | presenting-complaint"
* category ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* category ^binding.extension.valueString = "ConditionCategory"
* category ^binding.strength = #extensible
* category ^binding.valueSet = CareConnect-ConditionCategory-1
* category.coding.system 1..
* category.coding.code 1..
* category.coding.display 1..
* category.coding.display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* category.coding.display ^extension.valueBoolean = true

* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.ordered = false
* code.coding ^slicing.rules = #open
* code.coding contains snomedCT 0..1

* code.coding[snomedCT] ^binding.strength = #required
* code.coding[snomedCT] ^binding.description = "A code from the SNOMED Clinical Terminology UK"
* code.coding[snomedCT] ^binding.valueSet = CareConnect-ConditionCode-1
* code.coding[snomedCT].extension ^slicing.discriminator.type = #value
* code.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* code.coding[snomedCT].extension ^slicing.rules = #open
* code.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* code.coding[snomedCT].extension[snomedCTDescriptionID] ^short = "Optional Extensions Element"
* code.coding[snomedCT].extension[snomedCTDescriptionID] ^definition = "Optional Extension Element - found in all resources."
* code.coding[snomedCT].system 1..
* code.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* code.coding[snomedCT].code 1..
* code.coding[snomedCT].display 1..
* code.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* code.coding[snomedCT].display ^extension.valueBoolean = true

* bodySite.coding ^slicing.discriminator.type = #value
* bodySite.coding ^slicing.discriminator.path = "system"
* bodySite.coding ^slicing.ordered = false
* bodySite.coding ^slicing.rules = #open
* bodySite.coding contains snomedCT 0..1

* bodySite.coding[snomedCT] ^binding.strength = #required
* bodySite.coding[snomedCT] ^binding.description = "A code from SNOMED Clinical Terminology UK"
* bodySite.coding[snomedCT] ^binding.valueSet = CareConnect-BodySite-1
* bodySite.coding[snomedCT].extension ^slicing.discriminator.type = #value
* bodySite.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* bodySite.coding[snomedCT].extension ^slicing.rules = #open
* bodySite.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* bodySite.coding[snomedCT].extension[snomedCTDescriptionID] ^short = "Optional Extensions Element"
* bodySite.coding[snomedCT].extension[snomedCTDescriptionID] ^definition = "Optional Extension Element - found in all resources."
* bodySite.coding[snomedCT].system 1..
* bodySite.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* bodySite.coding[snomedCT].code 1..
* bodySite.coding[snomedCT].display 1..
* bodySite.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* bodySite.coding[snomedCT].display ^extension.valueBoolean = true

* subject only Reference(Group or CareConnect-Patient-1)
// Replaced in R4 with new "encounter" field
//* context only Reference(EpisodeOfCare or CareConnect-Encounter-1)
* asserter only Reference(RelatedPerson or CareConnect-Patient-1 or CareConnect-Practitioner-1)

* stage.summary.coding ^slicing.discriminator.type = #value
* stage.summary.coding ^slicing.discriminator.path = "system"
* stage.summary.coding ^slicing.ordered = false
* stage.summary.coding ^slicing.rules = #open
* stage.summary.coding contains snomedCT 0..1

* stage.summary.coding[snomedCT].extension ^slicing.discriminator.type = #value
* stage.summary.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* stage.summary.coding[snomedCT].extension ^slicing.rules = #open
* stage.summary.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* stage.summary.coding[snomedCT].system 1..
* stage.summary.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* stage.summary.coding[snomedCT].code 1..
* stage.summary.coding[snomedCT].display 1..
* stage.summary.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* stage.summary.coding[snomedCT].display ^extension.valueBoolean = true
* stage.assessment only Reference(ClinicalImpression or DiagnosticReport or CareConnect-Observation-1)

* note.author[x] only string or Reference(RelatedPerson or CareConnect-Practitioner-1 or CareConnect-Patient-1)


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Condition-1"