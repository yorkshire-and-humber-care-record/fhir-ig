Profile: CareConnectCareTeam1
Parent: CareTeam
Id: CareConnect-CareTeam-1
Description: "The Care Team includes all the people and organizations who plan to participate in the coordination and delivery of care for a patient."
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "NHS Digital"
* ^contact.name = "Interoperability Team"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "interoperabilityteam@nhs.net"
* ^contact.telecom.use = #work
* ^purpose = "[NOT CURATED BY INTEROPEN see: http://www.interopen.org/careconnect-curation-methodology/] Initial development for the Digital Maternity programme"
* ^copyright = "Copyright © 2016 HL7 UK    Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at    http://www.apache.org/licenses/LICENSE-2.0    Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.    HL7® FHIR® standard Copyright © 2011+ HL7    The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at    https://www.hl7.org/fhir/license.html"
* identifier.assigner only Reference(CareConnect-Organization-1)
* subject only Reference(Group or CareConnect-Patient-1)
//context becomes encounter in R4
//* context only Reference(CareConnect-EpisodeOfCare-1 or CareConnect-Encounter-1)
* participant.member only Reference(CareConnect-Organization-1 or CareConnect-Patient-1 or CareConnect-Practitioner-1 or CareConnect-RelatedPerson-1 or CareConnect-CareTeam-1)
* participant.onBehalfOf only Reference(CareConnect-Organization-1)
* reasonReference only Reference(CareConnect-Condition-1)
* managingOrganization only Reference(CareConnect-Organization-1)
* note.author[x] only string or Reference(CareConnect-Patient-1 or CareConnect-Practitioner-1 or CareConnect-RelatedPerson-1)

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-CareTeam-1"