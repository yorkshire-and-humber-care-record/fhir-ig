//Extension: Extension-CareConnect-EthnicCategory-1
Extension: ExtensionCareConnectEthnicCategory1
Id: Extension-CareConnect-EthnicCategory-1
Description: "This extension is constrained to represent the ethnic category for a patient."
* ^meta.lastUpdated = "2017-08-25T14:39:53.917+01:00"
* ^version = "0.0.1"
* ^status = #draft
* ^date = "2017-06-07T16:18:30.4727546+01:00"
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK\r\n\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"
//* ^contextType = "resource"
//* ^context = "Patient"
* . ^short = "Ethnic category"
* . ^definition = "The ethnicity of the subject."
* valueCodeableConcept 1..
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept ^sliceName = "valueCodeableConcept"
* valueCodeableConcept ^short = "A code classifying the person's ethnicity"
* valueCodeableConcept ^definition = "A code classifying the person's ethnicity."
* valueCodeableConcept ^binding.strength = #required
* valueCodeableConcept ^binding.description = "A code classifying the person's ethnicity."
//* valueCodeableConcept ^binding.valueSetReference.reference = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-EthnicCategory-1"
* valueCodeableConcept ^binding.valueSet = CareConnect-EthnicCategory-1

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-EthnicCategory-1"



//FYI - a neater way to define this extension in fsh could have been as below
//But... for simplicity, stick with the code as reverse-engineered by go-fsh, and don't try to tidy up
//* value[x] only CodeableConcept
//* valueCodeableConcept from CareConnect-EthnicCategory-1 (required)
