Extension: ExtensionCareConnectReferralRequestMethod1
Id: Extension-CareConnect-ReferralRequestMethod-1
Description: "This extension is constrained to represent the method used to send or receive a Referral Request."
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2019-07-17"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/ "
* ^copyright = "Copyright © 2019 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"
//* ^contextType = "resource"
//* ^context = "ReferralRequest"
* . ^short = "The method used to communicate the referral such as fax, NHS e-Referral Service, secure email, etc..."
* . ^definition = "The method used to send or receive a Referral Request."


//* valueCodeableConcept contains valueCodeableConcept 1..1
* valueCodeableConcept[valueCodeableConcept] only CodeableConcept
* valueCodeableConcept[valueCodeableConcept] ^binding.strength = #required
* valueCodeableConcept[valueCodeableConcept] ^binding.description = "The form in which a referral is sent and received"
* valueCodeableConcept[valueCodeableConcept] ^binding.valueSet = CareConnect-ReferralRequestMethod-1

* valueCodeableConcept[valueCodeableConcept].coding ..1
* valueCodeableConcept[valueCodeableConcept].coding ^binding.strength = #required
* valueCodeableConcept[valueCodeableConcept].coding ^binding.description = "The method used to send or receive a Referral Request"
* valueCodeableConcept[valueCodeableConcept].coding ^binding.valueSet = CareConnect-ReferralRequestMethod-1
* valueCodeableConcept[valueCodeableConcept].coding.system = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-ReferralRequestMethod-1" (exactly)
* valueCodeableConcept[valueCodeableConcept].coding.version ..0
* valueCodeableConcept[valueCodeableConcept].coding.userSelected ..0

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-ReferralRequestMethod-1"