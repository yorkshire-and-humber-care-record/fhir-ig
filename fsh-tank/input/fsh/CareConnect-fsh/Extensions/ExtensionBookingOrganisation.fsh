Extension: ExtensionCareConnectBookingOrganisation1
Id: Extension-CareConnect-BookingOrganisation-1
Description: "An extension to record the organisation booking the appointment."
* ^meta.lastUpdated = "2019-12-04T19:08:15.812+00:00"
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
* . ^short = "An extension to record the organisation booking the appointment"
* . ^definition = "An extension to record the organisation booking the appointment."

// Hmm, as it comes from CareConnect then it doesn't build. I think the alternative below is basically the same?

/*
* valueReference contains valueReference 0..1
* valueReference[valueReference] only Reference(CareConnect-Organization-1)
* valueReference[valueReference] ^short = "The organisation booking the appointment"
* valueReference[valueReference] ^definition = "The organisation booking the appointment."
*/


// * valueReference contains valueReference 0..1
* valueReference only Reference(CareConnect-Organization-1)
* valueReference ^short = "The organisation booking the appointment"
* valueReference ^definition = "The organisation booking the appointment."


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-BookingOrganisation-1"