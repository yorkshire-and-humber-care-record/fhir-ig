Extension: ExtensionCareConnectAppointmentCancellationReason1
Id: Extension-CareConnect-AppointmentCancellationReason-1
Description: "This Extension resource is constrained to represent the appointment cancellation reason."
* ^meta.lastUpdated = "2019-12-04T19:09:51.19+00:00"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2019-12-04"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/ on the 23rd October 2019."
* ^copyright = "Copyright © 2019 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"
//* ^contextType = "resource"
//* ^context = "Appointment"
* . ..1
* . ^short = "The reason the appointment was cancelled"
* . ^definition = "The reason the appointment was cancelled."


// Hmm, as it comes from CareConnect then it doesn't build. I think the alternative below is basically the same?
/*
* valueString contains valueString 1..1
* valueString[valueString] only string
* valueString[valueString] ^short = "The reason the appointment was cancelled"
* valueString[valueString] ^definition = "The reason the appointment was cancelled."
*/


// * valueString contains valueString 1..1
* valueString only string
* valueString ^short = "The reason the appointment was cancelled"
* valueString ^definition = "The reason the appointment was cancelled."


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-AppointmentCancellationReason-1"
