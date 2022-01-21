Profile: CareConnectPractitioner1
Parent: Practitioner
Id: CareConnect-Practitioner-1
Description: "The Practitioner resource represents the healthcare professional directly or indirectly involved in the provision of healthcare related services."

* ^meta.lastUpdated = "2018-02-19T12:02:38.726+00:00"
* ^version = "1.1.0"
* ^status = #draft
* ^date = "2018-11-05"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/"
* ^copyright = "Copyright © 2016 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"
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
    sdsRoleProfileID 0..*

* identifier[sdsUserID].system 1..
* identifier[sdsUserID].system = "https://fhir.nhs.uk/Id/sds-user-id" (exactly)
* identifier[sdsUserID].value 1..
* identifier[sdsUserID].assigner only Reference(CareConnect-Organization-1)

* identifier[sdsRoleProfileID].system 1..
* identifier[sdsRoleProfileID].system = "https://fhir.nhs.uk/Id/sds-role-profile-id" (exactly)
* identifier[sdsRoleProfileID].value 1..
* identifier[sdsRoleProfileID].assigner only Reference(CareConnect-Organization-1)

* gender ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* gender ^binding.extension[=].valueString = "AdministrativeGender"
* gender ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* gender ^binding.extension[=].valueBoolean = true
* gender ^binding.strength = #required
* gender ^binding.valueSet = CareConnect-AdministrativeGender-1

* qualification.identifier.assigner only Reference(CareConnect-Organization-1)
* qualification.issuer only Reference(CareConnect-Organization-1)
* communication ..0

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Practitioner-1"