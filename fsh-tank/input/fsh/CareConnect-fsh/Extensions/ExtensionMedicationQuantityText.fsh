Extension: ExtensionCareConnectMedicationQuantityText1
Id: Extension-CareConnect-MedicationQuantityText-1
Description: "This Extension resource is constrained to support the textual representation of a medication structured quantity."
* ^meta.lastUpdated = "2018-02-28T13:47:52.236+00:00"
* ^version = "1.2.0"
* ^status = #draft
* ^date = "2018-11-05"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/"
* ^copyright = "Copyright © 2016 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at-  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"
//* ^contextType = "resource"
//* ^context[0] = "MedicationRequest.dispenseRequest.quantity"
//* ^context[+] = "MedicationDispense.quantity"
* . ^short = "Quantity representation"
* . ^definition = "Quantity representation."
//* valueString contains valueString 0..1
* valueString[valueString] only string
* valueString[valueString] ^short = "Quantity representation"
* valueString[valueString] ^definition = "Quantity representation."


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-MedicationQuantityText-1"