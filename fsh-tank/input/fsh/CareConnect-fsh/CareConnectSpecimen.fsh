Profile: CareConnectSpecimen1
Parent: Specimen
Id: CareConnect-Specimen-1
Description: "Specimen"
* ^version = "1.1.0"
* ^status = #draft
* ^date = "2019-06-19"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^copyright = "Copyright © 2019 HL7 UK   Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at   http://www.apache.org/licenses/LICENSE-2.0   Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.   HL7® FHIR® standard Copyright © 2011+ HL7   The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at   https://www.hl7.org/fhir/license.html"
* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(CareConnect-Organization-1)
* accessionIdentifier.assigner only Reference(CareConnect-Organization-1)
* type.coding ^slicing.discriminator.type = #value
* type.coding ^slicing.discriminator.path = "system"
* type.coding ^slicing.rules = #open
* type.coding contains snomedCT 0..*
* type.coding[snomedCT] ^binding.strength = #extensible
* type.coding[snomedCT] ^binding.description = "A code from the SNOMED Clinical Terminology UK"
* type.coding[snomedCT] ^binding.valueSet = CareConnect-SpecimenType-1
* type.coding[snomedCT].extension ^slicing.discriminator.type = #value
* type.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* type.coding[snomedCT].extension ^slicing.rules = #open
* type.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* type.coding[snomedCT].system 1..
* type.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* type.coding[snomedCT].version ..0
* type.coding[snomedCT].code 1..
* type.coding[snomedCT].display 1..
* type.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* type.coding[snomedCT].display ^extension.valueBoolean = true
* subject only Reference(Group or Device or Substance or CareConnect-Patient-1)
* parent only Reference(CareConnect-Specimen-1)
* request only Reference(CareConnect-ProcedureRequest-1)
* collection.extension ^slicing.discriminator.type = #value
* collection.extension ^slicing.discriminator.path = "url"
* collection.extension ^slicing.rules = #open
* collection.extension contains Extension-CareConnect-FastingStatus-1 named fastingStatus 0..1
* collection.collector only Reference(CareConnect-Practitioner-1)
* collection.bodySite.coding ^slicing.discriminator.type = #value
* collection.bodySite.coding ^slicing.discriminator.path = "system"
* collection.bodySite.coding ^slicing.rules = #open
* collection.bodySite.coding contains snomedCT 0..1
* collection.bodySite.coding[snomedCT] ^binding.strength = #extensible
* collection.bodySite.coding[snomedCT] ^binding.description = "A code from the SNOMED Clinical Terminology UK"
* collection.bodySite.coding[snomedCT] ^binding.valueSet = CareConnect-SpecimenBodySite-1
* collection.bodySite.coding[snomedCT].extension ^slicing.discriminator.type = #value
* collection.bodySite.coding[snomedCT].extension ^slicing.discriminator.path = "url"
* collection.bodySite.coding[snomedCT].extension ^slicing.rules = #open
* collection.bodySite.coding[snomedCT].extension contains Extension-coding-sctdescid named snomedCTDescriptionID 0..1
* collection.bodySite.coding[snomedCT].system 1..
* collection.bodySite.coding[snomedCT].system = "http://snomed.info/sct" (exactly)
* collection.bodySite.coding[snomedCT].version ..0
* collection.bodySite.coding[snomedCT].code 1..
* collection.bodySite.coding[snomedCT].display 1..
* collection.bodySite.coding[snomedCT].display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* collection.bodySite.coding[snomedCT].display ^extension.valueBoolean = true
* container.identifier.assigner only Reference(CareConnect-Organization-1)
* note ..1
* note.author[x] only string or Reference(CareConnect-Practitioner-1 or CareConnect-Patient-1)


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Specimen-1"