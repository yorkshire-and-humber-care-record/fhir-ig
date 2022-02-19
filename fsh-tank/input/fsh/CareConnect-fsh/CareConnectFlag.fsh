Profile: CareConnectFlag1
Parent: Flag
Id: CareConnect-Flag-1
Description: "Prospective warnings of potential issues when providing care to the patient."
* ^meta.lastUpdated = "2017-08-25T14:01:50.858+01:00"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2019-06-14"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/"
* ^copyright = "Copyright © 2019 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"

* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(CareConnect-Organization-1)
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.ordered = false
* code.coding ^slicing.rules = #open
* code.coding contains snomedCT 0..1
* code.coding[snomedCT] ^short = "SNOMED CT representation identifying specific flagged issues"
* code.coding[snomedCT] ^definition = "SNOMED CT representation identifying specific flagged issues."
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
* subject only Reference(Group or PlanDefinition or CareConnect-Procedure-1 or CareConnect-Patient-1 or CareConnect-Organization-1 or CareConnect-Practitioner-1 or CareConnect-Location-1 or CareConnect-Medication-1)
* encounter only Reference(CareConnect-Encounter-1)
* author only Reference(Device or CareConnect-Patient-1 or CareConnect-Organization-1 or CareConnect-Practitioner-1)


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Flag-1"