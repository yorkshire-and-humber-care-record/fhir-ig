Extension: ExtensionCareConnectNHSCommunication1
Id: Extension-CareConnect-NHSCommunication-1
Description: "This extension is constrained to support the communication preferences for a resource in the NHS."
* ^meta.lastUpdated = "2017-07-19T10:17:46.026+01:00"
* ^version = "0.0.1"
* ^status = #draft
* ^date = "2017-06-07T15:55:24.330896+01:00"
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK\r\n\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"
//* ^contextType = "resource"
//* ^context[0] = "Patient"
//* ^context[+] = "Practitioner"
* . ^short = "NHS communication preferences for a resource"
* . ^definition = "Communication preferences including a list of Languages which may be used for communication"
* extension contains
    language 1..1 and
    preferred 0..1 and
    modeOfCommunication 0..* and
    communicationProficiency 0..1 and
    interpreterRequired 0..1
* extension[language] ^short = "Languages which may be used for communication"
* extension[language] ^definition = "Languages which may be used for communication."
* extension[language].valueCodeableConcept 1..
* extension[language].valueCodeableConcept only CodeableConcept
* extension[language].valueCodeableConcept ^sliceName = "valueCodeableConcept"
* extension[language].valueCodeableConcept ^short = "Languages which may be used for communication"
* extension[language].valueCodeableConcept ^definition = "Languages which may be used for communication."
* extension[language].valueCodeableConcept ^binding.strength = #required
* extension[language].valueCodeableConcept ^binding.description = "Human Language"
* extension[language].valueCodeableConcept ^binding.valueSet = CareConnect-HumanLanguage-1
* extension[preferred].value[x] 1..
* extension[preferred].value[x] only boolean
* extension[preferred].value[x] ^short = "Indicates whether or not this language is preferred (over other languages up a certain level)"
* extension[preferred].value[x] ^definition = "Indicates whether or not this language is preferred (over other languages up a certain level)"
* extension[modeOfCommunication].valueCodeableConcept 1..
* extension[modeOfCommunication].valueCodeableConcept only CodeableConcept
* extension[modeOfCommunication].valueCodeableConcept ^sliceName = "valueCodeableConcept"
* extension[modeOfCommunication].valueCodeableConcept ^short = "A valueset to describe the mode the patient can communicate in, representing the method of expression of the language."
* extension[modeOfCommunication].valueCodeableConcept ^definition = "A valueset to describe the mode the patient can communicate in, representing the method of expression of the language.."
* extension[modeOfCommunication].valueCodeableConcept ^binding.strength = #required
* extension[modeOfCommunication].valueCodeableConcept ^binding.description = "Language Ability Mode"
* extension[modeOfCommunication].valueCodeableConcept ^binding.valueSet = CareConnect-LanguageAbilityMode-1
* extension[communicationProficiency].valueCodeableConcept 1..
* extension[communicationProficiency].valueCodeableConcept only CodeableConcept
* extension[communicationProficiency].valueCodeableConcept ^sliceName = "valueCodeableConcept"
* extension[communicationProficiency].valueCodeableConcept ^short = "A valueset to describe the level of proficiency in communicating a language"
* extension[communicationProficiency].valueCodeableConcept ^definition = "A valueset to describe the level of proficiency in communicating a language."
* extension[communicationProficiency].valueCodeableConcept ^binding.strength = #required
* extension[communicationProficiency].valueCodeableConcept ^binding.description = "Language Ability Proficiency"
* extension[communicationProficiency].valueCodeableConcept ^binding.valueSet = CareConnect-LanguageAbilityProficiency-1
* extension[interpreterRequired].value[x] 1..
* extension[interpreterRequired].value[x] only boolean
* extension[interpreterRequired].value[x] ^short = "Indicates whether an interpreter is required for communication purposes"
* extension[interpreterRequired].value[x] ^definition = "Indicates whether an interpreter is required for communication purposes- True / False?"

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-NHSCommunication-1"
