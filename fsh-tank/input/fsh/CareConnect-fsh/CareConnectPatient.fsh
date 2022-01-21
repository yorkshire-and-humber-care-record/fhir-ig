Alias: $patient-cadavericDonor = http://hl7.org/fhir/StructureDefinition/patient-cadavericDonor
Alias: $patient-birthTime = http://hl7.org/fhir/StructureDefinition/patient-birthTime

//This appears to actually be a bug in CareConnect - as it should be referencing the standard HL7 extension "patient-birthPlace". 
//However will NOT fix it to remain wire-compatible with CareConnect. To make it build therefore we will create this bogus extension locally.
//(Not that it is unlikely we will ever even use this extension in reality!) 
//Alias: $birthPlace = http://hl7.org/fhir/StructureDefinition/birthPlace


Profile: CareConnectPatient1
Parent: Patient
Id: CareConnect-Patient-1
Description: "The patient resource represents the patient involved in the provision of healthcare related services."
* ^meta.lastUpdated = "2018-03-28T13:59:04.782+01:00"
* ^version = "1.3.0"
* ^status = #draft
* ^date = "2019-05-31"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/"
* ^copyright = "Copyright © 2019 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    Extension-CareConnect-EthnicCategory-1 named ethnicCategory 0..1 and
    Extension-CareConnect-ReligiousAffiliation-1 named religiousAffiliation 0..1 and
    $patient-cadavericDonor named patient-cadavericDonor 0..1 and
    Extension-CareConnect-ResidentialStatus-1 named residentialStatus 0..1 and
    Extension-CareConnect-TreatmentCategory-1 named treatmentCategory 0..1 and
    Extension-CareConnect-NHSCommunication-1 named nhsCommunication 0..* and
    birthPlace named birthPlace 0..1 and
    Extension-CareConnect-NominatedPharmacy-1 named nominatedPharmacy 0..1 and
    Extension-CareConnect-DeathNotificationStatus-1 named deathNotificationStatus 0..1
* extension[residentialStatus] ^short = "The residential status of the patient"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.ordered = false
* identifier ^slicing.rules = #openAtEnd
* identifier contains nhsNumber 0..1
* identifier[nhsNumber] ^short = "The patient's NHS number"
* identifier[nhsNumber].extension ^slicing.discriminator.type = #value
* identifier[nhsNumber].extension ^slicing.discriminator.path = "url"
* identifier[nhsNumber].extension ^slicing.rules = #open
* identifier[nhsNumber].extension contains Extension-CareConnect-NHSNumberVerificationStatus-1 named nhsNumberVerificationStatus 1..1
* identifier[nhsNumber].system 1..
* identifier[nhsNumber].system = "https://fhir.nhs.uk/Id/nhs-number" (exactly)
* identifier[nhsNumber].value 1..
* identifier[nhsNumber].value ^example.label = "General"
* identifier[nhsNumber].value ^example.valueString = "1234567890"
* identifier[nhsNumber].assigner only Reference(CareConnect-Organization-1)
* name ^slicing.discriminator.type = #value
* name ^slicing.discriminator.path = "use"
* name ^slicing.ordered = false
* name ^slicing.rules = #openAtEnd
* name contains official 1..1
* name[official].use 1..
* name[official].use = #official (exactly)
* name[official].use ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* name[official].use ^binding.extension[=].valueString = "NameUse"
* name[official].use ^binding.strength = #required
* name[official].use ^binding.valueSet = CareConnect-NameUse-1
* name[official].family 1..
* telecom.system 1..
* telecom.value 1..
* gender ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* gender ^binding.extension[=].valueString = "AdministrativeGender"
* gender ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* gender ^binding.extension[=].valueBoolean = true
* gender ^binding.strength = #required
* gender ^binding.valueSet = CareConnect-AdministrativeGender-1
* birthDate.extension ^slicing.discriminator.type = #value
* birthDate.extension ^slicing.discriminator.path = "url"
* birthDate.extension ^slicing.rules = #open
* birthDate.extension contains $patient-birthTime named patient-birthTime 0..1
* address.text ^example.label = "General"
* address.text ^example.valueString = "42 Grove Street, Overtown, West Yorkshire, LS21 1PF"
* address.line ^example.label = "General"
* address.line ^example.valueString = "42 Grove Street"
* address.city ^example.label = "General"
* address.city ^example.valueString = "Overtown"
* address.district ^example.label = "General"
* address.district ^example.valueString = "West Yorkshire"
* address.postalCode ^example.label = "General"
* address.postalCode ^example.valueString = "LS21 1PF"
* address.country ^example.label = "General"
* address.country ^example.valueString = "GBR"
* maritalStatus ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* maritalStatus ^binding.extension[=].valueString = "MaritalStatus"
* maritalStatus ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* maritalStatus ^binding.extension[=].valueBoolean = true
* maritalStatus ^binding.strength = #required
* maritalStatus ^binding.valueSet = CareConnect-MaritalStatus-1
* maritalStatus.coding 1..1
* maritalStatus.coding.system 1..
* maritalStatus.coding.system ^example.label = "General"
* maritalStatus.coding.system ^example.valueUri = "http://hl7.org/fhir/v3/MaritalStatus"
* maritalStatus.coding.code 1..
* maritalStatus.coding.display 1..
* maritalStatus.coding.display ^extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-translatable"
* maritalStatus.coding.display ^extension.valueBoolean = true
* contact.name 1..
* contact.name.use 1..
* contact.address.text ^example.label = "General"
* contact.address.text ^example.valueString = "120, Grove Street, Overtown, West Yorkshire, LS21 1PT"
* contact.address.line ^example.label = "General"
* contact.address.line ^example.valueString = "120, Grove Street"
* contact.address.city ^example.label = "General"
* contact.address.city ^example.valueString = "Overtown"
* contact.address.district ^example.label = "General"
* contact.address.district ^example.valueString = "West Yorkshire"
* contact.address.postalCode ^example.label = "General"
* contact.address.postalCode ^example.valueString = "LS21 1PT"
* contact.address.country ^example.label = "General"
* contact.address.country ^example.valueString = "GBR"
* contact.gender ^binding.extension[0].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* contact.gender ^binding.extension[=].valueString = "AdministrativeGender"
* contact.gender ^binding.extension[+].url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-isCommonBinding"
* contact.gender ^binding.extension[=].valueBoolean = true
* contact.gender ^binding.strength = #required
* contact.gender ^binding.valueSet = CareConnect-AdministrativeGender-1
* contact.organization only Reference(CareConnect-Organization-1)
// (Not in R4)
//* animal ..0
//* animal ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-explicit-type-name"
//* animal ^extension.valueString = "Animal"
* communication ..0
* generalPractitioner only Reference(CareConnect-Organization-1 or CareConnect-Practitioner-1)
* managingOrganization only Reference(CareConnect-Organization-1)
* link.other only Reference(RelatedPerson or CareConnect-Patient-1)

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Patient-1"