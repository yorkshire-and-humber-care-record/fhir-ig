Profile: CareConnectCarePlan1
Parent: CarePlan
Id: CareConnect-CarePlan-1
Description: "Describes the intention of how one or more practitioners intend to deliver care for a particular patient, group or community for a period of time, possibly limited to care for a specific condition or set of conditions."
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-CarePlan-1"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "NHS Digital"
* ^contact.name = "Interoperability Team"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "interoperabilityteam@nhs.net"
* ^contact.telecom.use = #work
* ^purpose = "NOT CURATED BY INTEROPEN see: http://www.interopen.org/careconnect-curation-methodology/] Initial development for the Digital Maternity programme"
* ^copyright = "Copyright © 2016 HL7 UK    Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at    http://www.apache.org/licenses/LICENSE-2.0    Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.    HL7® FHIR® standard Copyright © 2011+ HL7    The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at    https://www.hl7.org/fhir/license.html"
* identifier.assigner only Reference(CareConnect-Organization-1)
* basedOn only Reference(CareConnect-CarePlan-1)
* replaces only Reference(CareConnect-CarePlan-1)
* partOf only Reference(CareConnect-CarePlan-1)
* subject only Reference(Group or CareConnect-Patient-1)

// Renamed as Encounter in R4
//* context only Reference(CareConnect-EpisodeOfCare-1 or CareConnect-Encounter-1)

* author only Reference(CareConnect-Organization-1 or CareConnect-Patient-1 or CareConnect-Practitioner-1 or CareConnect-CareTeam-1 or CareConnect-RelatedPerson-1)
* careTeam only Reference(CareConnect-CareTeam-1)
* addresses only Reference(CareConnect-Condition-1)
* activity.progress.author[x] only string or Reference(CareConnect-Patient-1 or CareConnect-Practitioner-1 or CareConnect-RelatedPerson-1)

// Referral request does not exist in R4!
//* activity.reference only Reference(Appointment or CommunicationRequest or DeviceRequest or NutritionOrder or Task or ReferralRequest or VisionPrescription or RequestGroup or CareConnect-ProcedureRequest-1 or CareConnect-MedicationRequest-1)

* activity.detail.reasonReference only Reference(CareConnect-Condition-1)
* activity.detail.location only Reference(CareConnect-Location-1)
* activity.detail.performer only Reference(CareConnect-Organization-1 or CareConnect-Patient-1 or CareConnect-Practitioner-1 or CareConnect-CareTeam-1 or CareConnect-RelatedPerson-1)
* activity.detail.product[x] only CodeableConcept or Reference(Substance or CareConnect-Medication-1)
* note.author[x] only string or Reference(CareConnect-Patient-1 or CareConnect-Practitioner-1 or CareConnect-RelatedPerson-1)

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-CarePlan-1"