ValueSet: InterweaveFlagCategory
Id: Interweave-FlagCategory-1
Description: "Defines the set of codes that can be used to identify the category of flag which has been placed against a patient."
* ^name = "Interweave Flag Category"

//SNOMED concepts to include:
* include codes from system SNOMED_CT where concept is-a #8625004 //Legal status
//Locally defined codes:
* include codes from system Interweave-SocialCareFlagCategory-1
//* include codes from system England-FlagCategoryRA


CodeSystem: InterweaveSocialCareFlagCategory
Id: Interweave-SocialCareFlagCategory-1
Description: "The categorisation of social care flags which can be placed against a person."
* ^name = "InterweaveSocialCareFlagCategory"
* ^content = #complete
* ^caseSensitive = true

* #RTO "Risk to other"
* #RTS "Risk to self"
* #RSO "Risk to self & others"
* #SGC "Safeguarding concern"
* #OTH "Other"

// CodeSystem: EnglandFlagCategoryRA
// Id: England-FlagCategoryRA
// Title: "England Flag Category RA"
// Description: "A CodeSystem to identify the category of the adjustments required"
// * ^version = "0.4.0"
// * ^status = #draft
// * ^experimental = false
// * ^date = "2024-02-14"
// * ^publisher = "NHS England"
// * ^contact.name = "NHS England"
// * ^contact.telecom.system = #email
// * ^contact.telecom.value = "interoperabilityteam@nhs.net"
// * ^contact.telecom.use = #work
// * ^contact.telecom.rank = 1
// * ^copyright = "Copyright © 2024+ NHS England Licensed under the Apache License, Version 2.0 (the \\\"License\\\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \\\"AS IS\\\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License. HL7® FHIR® standard Copyright © 2011+ HL7 The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html."
// * ^caseSensitive = true
// * ^content = #complete
// * ^count = 11
// * #communication-support "Communication support"
// * #requires-communication-professional "Requires communication professional"
// * #requires-specific-contact-method "Requires specific contact method"
// * #requires-specific-information-format "Requires specific information format"
// * #additional-communication-needs-and-support "Additional communication needs and support"
// * #community-language-support "Community Language Support"
// * #adjustments-for-providing-additional-support-to-patients "Adjustments for providing Additional Support to patients"
// * #adjustments-for-individual-care-requirements "Adjustments for Individual Care Requirements"
// * #adjustments-in-relation-to-the-environment-of-care "Adjustments in relation to the environment of care"
// * #adjustments-to-support-additional-needs "Adjustments to support Additional needs"
// * #bespoke-reasonable-adjustments "Bespoke Reasonable adjustments"

// * ^url = "https://fhir.nhs.uk/England/CodeSystem/England-FlagCategoryRA"