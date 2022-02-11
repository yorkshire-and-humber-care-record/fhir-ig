Profile: CareConnectReferralRequest1

// !!!!NB!!!
// Referral Request does not exist in R4!
// Substitute by basing this on ServiceRequest, which replaces it.
// (It is 90% similar, and although there are some significant changes it is close enough for what we need here)
// This is just for us to compile our profiles against. Before publishing this is all swapped back to the "real" STU3 definitions
Parent: ServiceRequest

Id: CareConnect-ReferralRequest-1
Description: "Used to record and send details about a request for referral service or transfer of a patient to the care of another provider or provider organization."
* ^status = #draft
* ^date = "2019-08-07"
* ^publisher = "NHS Digital"
* ^contact.name = "Interoperability Team"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "interoperabilityteam@nhs.net"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/ on the 5th July 2019."
* ^copyright = "Copyright © 2019 HL7 UK    Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at    http://www.apache.org/licenses/LICENSE-2.0    Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.    HL7® FHIR® standard Copyright © 2011+ HL7    The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at    https://www.hl7.org/fhir/license.html"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open


* extension contains
    Extension-CareConnect-ReferralRequestMethod-1 named referralRequestMethod 0..1 and
    Extension-CareConnect-SourceOfReferral-1 named sourceOfReferral 0..1

* identifier.system 1..
* identifier.value 1..
* identifier.assigner only Reference(CareConnect-Organization-1)
* basedOn only Reference(CareConnect-CarePlan-1 or CareConnect-ProcedureRequest-1 or CareConnect-ReferralRequest-1)
* replaces only Reference(CareConnect-ReferralRequest-1)

// Renamed to "requisition" in R4
//* groupIdentifier.assigner only Reference(CareConnect-Organization-1)

* subject only Reference(Group or CareConnect-Patient-1)

// Renamed to "episode" in R4
//* context only Reference(CareConnect-Encounter-1 or CareConnect-EpisodeOfCare-1)

// These are combined into a single field in R4
//* requester.agent only Reference(Device or CareConnect-Organization-1 or CareConnect-Patient-1 or CareConnect-RelatedPerson-1 or CareConnect-Practitioner-1)
//* requester.onBehalfOf only Reference(CareConnect-Organization-1)
* requester only Reference(Device or CareConnect-Organization-1 or CareConnect-Patient-1 or CareConnect-RelatedPerson-1 or CareConnect-Practitioner-1 or CareConnect-Organization-1)

// Renamed to "performer" in R4
//* recipient only Reference(CareConnect-Organization-1 or CareConnect-Practitioner-1 or CareConnect-HealthcareService-1)

* reasonReference only Reference(CareConnect-Condition-1 or CareConnect-Observation-1)
* note.author[x] only string or Reference(CareConnect-Patient-1 or CareConnect-RelatedPerson-1 or CareConnect-Practitioner-1)


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-ReferralRequest-1"