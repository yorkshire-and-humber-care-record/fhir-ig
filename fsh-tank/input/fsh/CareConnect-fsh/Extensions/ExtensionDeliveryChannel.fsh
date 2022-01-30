Extension: ExtensionCareConnectDeliveryChannel1
Id: Extension-CareConnect-DeliveryChannel-1
Description: "An extension to record the delivery channel of a scheduled appointment."
* ^meta.lastUpdated = "2019-11-28T12:11:49.056+01:00"
* ^version = "1.0.0"
* ^date = "2019-11-28"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/ "
* ^copyright = "Copyright © 2019 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"
//* ^contextType = "resource"
//* ^context[0] = "Slot"
//* ^context[+] = "Appointment"
* . ..1
* . ^short = "An extension to record the delivery channel of a scheduled Appointment"
* . ^definition = "An extension to record the delivery channel of a scheduled Appointment."

// Hmm, as it comes from CareConnect then it doesn't build. I think the alternative below is basically the same?

/*
* valueCode contains valueCode 0..1
* valueCode[valueCode] only code
* valueCode[valueCode] ^short = "The delivery channel of the Appointment"
* valueCode[valueCode] ^definition = "The delivery channel of the Appointment."
* valueCode[valueCode] ^binding.strength = #extensible
* valueCode[valueCode] ^binding.description = "A ValueSet that identifies the delivery channel of an Appointment."
* valueCode[valueCode] ^binding.valueSetReference.reference = CareConnect-DeliveryChannel-1
*/

//* valueCode contains valueCode 0..1
* valueCode only code
* valueCode ^short = "The delivery channel of the Appointment"
* valueCode ^definition = "The delivery channel of the Appointment."
* valueCode ^binding.strength = #extensible
* valueCode ^binding.description = "A ValueSet that identifies the delivery channel of an Appointment."
* valueCode ^binding.valueSet = CareConnect-DeliveryChannel-1


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-DeliveryChannel-1"