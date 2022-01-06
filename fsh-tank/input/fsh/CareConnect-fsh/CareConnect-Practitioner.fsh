Profile: CareConnectPractitioner1
Parent: Practitioner
Id: CareConnect-Practitioner-1
Description: "The Practitioner resource represents the healthcare professional directly or indirectly involved in the provision of healthcare related services."
* ^meta.lastUpdated = "2017-11-17T08:56:20.574+00:00"
* ^version = "0.0.1"
* ^status = #draft
* ^date = "2017-07-10T14:36:23.9915286+01:00"
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK\r\n\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"
* . ^short = "A person with a formal responsibility in the provisioning of healthcare or related services"

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains Extension-CareConnect-NHSCommunication-1 named nhsCommunication 0..*

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.ordered = false
* identifier ^slicing.rules = #openAtEnd
* identifier contains
    sdsUserID 0..1 and
    sdsRoleProfileID 0..* and
    localIdentifier 0..1

* identifier[sdsUserID].use ..0
* identifier[sdsUserID].type ..0
* identifier[sdsUserID].system 1..
* identifier[sdsUserID].system = "https://fhir.nhs.uk/Id/sds-user-id" (exactly)
* identifier[sdsUserID].value 1..
* identifier[sdsUserID].period ..0
* identifier[sdsUserID].assigner ..0

* identifier[sdsRoleProfileID].use ..0
* identifier[sdsRoleProfileID].type ..0
* identifier[sdsRoleProfileID].system 1..
* identifier[sdsRoleProfileID].system = "https://fhir.nhs.uk/Id/sds-role-profile-id" (exactly)
* identifier[sdsRoleProfileID].value 1..
* identifier[sdsRoleProfileID].period ..0
* identifier[sdsRoleProfileID].assigner ..0

* identifier[localIdentifier].system 1..
* identifier[localIdentifier].system = "https://fhir.nhs.uk/Id/local-practitioner-identifier" (exactly)
* identifier[localIdentifier].value 1..
* identifier[localIdentifier].assigner only Reference(CareConnect-Organization-1)


* name 1..1
* name.text ..0
* address.state ..0

* gender ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* gender ^binding.extension[=].valueString = "AdministrativeGender"
* gender ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* gender ^binding.extension[=].valueBoolean = true
* gender ^binding.strength = #required
* gender ^binding.valueSet = CareConnect-AdministrativeGender-1

* birthDate ^short = "The date on which the practitioner was born"
* qualification.identifier.assigner only Reference(CareConnect-Organization-1)
* qualification.issuer only Reference(CareConnect-Organization-1)
* communication ..0

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Practitioner-1"