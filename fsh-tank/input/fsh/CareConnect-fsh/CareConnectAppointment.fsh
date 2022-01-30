Profile: CareConnectAppointment1
Parent: Appointment
Id: CareConnect-Appointment-1
Description: "CareConnect Appointment profile."
* ^version = "1.1.0"
* ^status = #draft
* ^date = "2019-12-09"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/ on the 23rd October 2019."
* ^copyright = "Copyright © 2019 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    Extension-CareConnect-DeliveryChannel-1 named deliveryChannel 0..1 and
    Extension-CareConnect-AppointmentCancellationReason-1 named appointmentCancellationReason 0..1 and
    Extension-CareConnect-BookingOrganisation-1 named bookingOrganisation 0..1

* identifier ^short = "External Ids for this item."

* serviceCategory ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* serviceCategory ^binding.extension.valueString = "service-category"
* serviceCategory ^binding.strength = #extensible
* serviceCategory ^binding.description = "A ValueSet that contains a set of codes that identify the Practitioner of a scheduled Appointment."
* serviceCategory ^binding.valueSet = CareConnect-SDSJobRoleName-1


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Appointment-1"