Extension: ExtensionCareConnectNHSNumberVerificationStatus1
Id: Extension-CareConnect-NHSNumberVerificationStatus-1
Description: "This extension is constrained to represent the NHS Number Verification Status."
* ^meta.lastUpdated = "2017-08-25T15:18:00.585+01:00"
* ^version = "0.0.1"
* ^status = #draft
* ^date = "2017-06-05T17:21:09.3604748+01:00"
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK\r\n\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"
//* ^contextType = "resource"
//* ^context = "Patient.identifier"
* . ^short = "NHS number verification status"
* . ^definition = "The verification/tracing status of the NHS number."
* valueCodeableConcept 1..
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept ^sliceName = "valueCodeableConcept"
* valueCodeableConcept ^short = "Verification status of the NHS number"
* valueCodeableConcept ^definition = "Verification status of the NHS number."
* valueCodeableConcept ^binding.strength = #required
* valueCodeableConcept ^binding.description = "NHS Number Verification Status"
* valueCodeableConcept ^binding.valueSet = CareConnect-NHSNumberVerificationStatus-1

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-NHSNumberVerificationStatus-1"