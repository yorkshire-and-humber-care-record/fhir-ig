Extension: ExtensionCareConnectFastingStatus1
Id: Extension-CareConnect-FastingStatus-1
Description: "This Extension resource is constrained to support a code value to support the fasting status of the patient at the time the specimen was collected."
* ^meta.lastUpdated = "2018-02-27T12:06:00.185+00:00"
* ^version = "1.0.1"
* ^status = #draft
* ^date = "2017-07-13T10:41:53.9272632+01:00"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/"
* ^copyright = "Copyright © 2016 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"

//* ^contextType = "resource"
//* ^context = "Specimen.collection"

* . ^short = "A coded value of the fasting status when the specimen was collected."
* . ^definition = "A coded value of the fasting status when the specimen was collected."
* value[x] only CodeableConcept or Duration
* value[x] ^short = "A coded value that inidcates the fasting status of the patient at the time the sample was collected."
* value[x] ^definition = "A coded value that inidcates the fasting status of the patient at the time the sample was collected."
* value[x] ^binding.strength = #extensible
* value[x] ^binding.description = " v2 Relevant Clincial Information"
* value[x] ^binding.valueSet = "http://terminology.hl7.org/ValueSet/v2-0916"

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-FastingStatus-1"