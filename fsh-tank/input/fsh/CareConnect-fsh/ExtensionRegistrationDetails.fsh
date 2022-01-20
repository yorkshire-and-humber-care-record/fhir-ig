//NB This extension is slighly out of date, however just left it for now as we don't even use it.
// (As usual, the complication outputs are overwritten with the latest actual CareConnect files anyway)

Extension: ExtensionCareConnectRegistrationDetails1
Id: Extension-CareConnect-RegistrationDetails-1
Description: "This extension is constrained to represent the additional registration information for a patient."
* ^meta.lastUpdated = "2017-10-18T11:40:38.363+01:00"
* ^version = "0.0.1"
* ^status = #draft
* ^date = "2017-06-07T16:23:42.3286782+01:00"
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK\r\n\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"
// * ^contextType = "resource"
// * ^context = "Patient"
* . ^short = "Additional registration information for the Patient resource"
* . ^definition = "Additional registration information for the Patient resource."
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    registrationPeriod 0..1 and
    registrationType 0..1 and
    registrationStatus 0..1 and
    preferredBranchSurgery 0..1
* extension[registrationPeriod] ^short = "The period of time during which the Patient registration applies"
* extension[registrationPeriod] ^definition = "The period of time during which the Patient registration applies."
* extension[registrationPeriod].valuePeriod 1..
* extension[registrationPeriod].valuePeriod only Period
* extension[registrationPeriod].valuePeriod ^sliceName = "valuePeriod"
* extension[registrationPeriod].valuePeriod ^short = "The period of time during which the Patient registration applies."
* extension[registrationPeriod].valuePeriod ^definition = "The period of time during which the Patient registration applies."
* extension[registrationType] ^short = "The type of patient registration at the healthcare organisation"
* extension[registrationType] ^definition = "The type of patient registration at the healthcare organisation."
* extension[registrationType].valueCodeableConcept 1..
* extension[registrationType].valueCodeableConcept only CodeableConcept
* extension[registrationType].valueCodeableConcept ^sliceName = "valueCodeableConcept"
* extension[registrationType].valueCodeableConcept ^short = "The type of registration for a patient at a healthcare organisation."
* extension[registrationType].valueCodeableConcept ^definition = "The type of registration for a patient at a healthcare organisation.."
* extension[registrationType].valueCodeableConcept ^binding.strength = #required
* extension[registrationType].valueCodeableConcept ^binding.description = "Registration Type"
* extension[registrationType].valueCodeableConcept ^binding.valueSet = CareConnect-RegistrationType-1
* extension[registrationStatus] ^short = "The registration status for this patient at the healthcare organisation"
* extension[registrationStatus] ^definition = "The registration status for this patient at the healthcare organisation."
* extension[registrationStatus].valueCodeableConcept 1..
* extension[registrationStatus].valueCodeableConcept only CodeableConcept
* extension[registrationStatus].valueCodeableConcept ^sliceName = "valueCodeableConcept"
* extension[registrationStatus].valueCodeableConcept ^short = "The status of registration for a patient at the healthcare organisation"
* extension[registrationStatus].valueCodeableConcept ^definition = "The status of registration for a patient at the healthcare organisation."
* extension[registrationStatus].valueCodeableConcept ^binding.strength = #required
* extension[registrationStatus].valueCodeableConcept ^binding.description = "Registration Status"
* extension[registrationStatus].valueCodeableConcept ^binding.valueSet = CareConnect-RegistrationStatus-1
* extension[preferredBranchSurgery].valueReference only Reference(CareConnect-Location-1)
* extension[preferredBranchSurgery].valueReference ^sliceName = "valueReference"
* extension[preferredBranchSurgery].valueReference ^short = "Location of usual branch surgery"
* extension[preferredBranchSurgery].valueReference ^definition = "Location of usual branch surgery."

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-RegistrationDetails-1"