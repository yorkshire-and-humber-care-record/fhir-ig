//NB: There is a bug in the original CareConnect json that I have corrected
//    Have therefore manually adjusted the file in "careconnect-STU3" folder
//    For referencing the ValueSet ObservationInterpretation they have used "fhir.nhs.uk" instead of "fhir.hl7.org.uk"

Profile: CareConnectObservation1
Parent: Observation
Id: CareConnect-Observation-1
Description: "The Observation resource is used for tracking the current and historical observations that have been made for a patient."
* ^meta.lastUpdated = "2017-08-25T14:06:37.813+01:00"
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Observation-1"
* ^version = "1.3"
* ^status = #draft
* ^date = "2021-04-27"
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
* extension contains Extension-CareConnect-ReasonCondition-1 named reason 0..*

* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(CareConnect-Organization-1)

* category.coding ^slicing.discriminator.type = #value
* category.coding ^slicing.discriminator.path = "system"
* category.coding ^slicing.ordered = false
* category.coding ^slicing.rules = #open
* category.coding contains snomedCT 0..1

* category.coding[snomedCT].extension ^slicing.discriminator.type = #value
* category.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* category.coding[snomedCT].extension ^slicing.rules = #open
* category.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* category.coding[snomedCT].system 1..
* category.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* category.coding[snomedCT].version ..0
* category.coding[snomedCT].code 1..
* category.coding[snomedCT].display 1..
* category.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* category.coding[snomedCT].display ^extension.valueBoolean = true

* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.ordered = false
* code.coding ^slicing.rules = #open
* code.coding contains snomedCT 0..1

* code.coding[snomedCT].extension ^slicing.discriminator.type = #value
* code.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* code.coding[snomedCT].extension ^slicing.rules = #open
* code.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* code.coding[snomedCT].system 1..
* code.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* code.coding[snomedCT].version ..0
* code.coding[snomedCT].code 1..
* code.coding[snomedCT].display 1..
* code.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* code.coding[snomedCT].display ^extension.valueBoolean = true

* subject only Reference(Group or Device or CareConnect-Patient-1 or CareConnect-Location-1)
// R4 renames "context" to "encounter" (and removes ability to refer to an Episode of Care)
//* context only Reference(EpisodeOfCare or CareConnect-Encounter-1)
* performer only Reference(RelatedPerson or CareConnect-Patient-1 or CareConnect-Organization-1 or CareConnect-Practitioner-1)

* interpretation ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* interpretation ^binding.extension.valueString = "ObservationInterpretation"
* interpretation ^binding.strength = #extensible
* interpretation ^binding.valueSet = CareConnect-ObservationInterpretation-1

* bodySite.coding ^slicing.discriminator.type = #value
* bodySite.coding ^slicing.discriminator.path = "system"
* bodySite.coding ^slicing.ordered = false
* bodySite.coding ^slicing.rules = #open
* bodySite.coding contains snomedCT 0..1
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

// Removed in R4 (derivedFrom added instead which looks similar)
// Alias: $Sequence = http://hl7.org/fhir/StructureDefinition/Sequence
// * related.target only Reference(QuestionnaireResponse or $Sequence or CareConnect-Observation-1)

* component.code.coding ^slicing.discriminator.type = #value
* component.code.coding ^slicing.discriminator.path = "system"
* component.code.coding ^slicing.ordered = false
* component.code.coding ^slicing.rules = #open
* component.code.coding contains snomedCT 0..1

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
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Observation-1"