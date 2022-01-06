Alias: $organization-period = http://hl7.org/fhir/StructureDefinition/organization-period

Profile: CareConnectOrganization1
Parent: Organization
Id: CareConnect-Organization-1
Description: "The Organization resource represents the organisation that employs the healthcare professional."
* ^meta.lastUpdated = "2017-08-25T14:09:04.552+01:00"
* ^version = "0.0.1"
* ^status = #draft
* ^date = "2017-07-07T09:11:24.3271864+01:00"
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK\r\n\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"

* . ^slicing.discriminator.type = #value
* . ^slicing.discriminator.path = "url"
* . ^slicing.rules = #open
* extension contains
    Extension-CareConnect-MainLocation-1 named mainLocation 0..1 and
    $organization-period named organization-period 0..1

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.ordered = false
* identifier ^slicing.rules = #openAtEnd
* identifier contains
    odsOrganisationCode 0..1 and
    odsSiteCode 0..1 and
    localIdentifier 0..*

* identifier[odsOrganisationCode] ^short = "Organisation Data Service code"
* identifier[odsOrganisationCode] ^definition = "Identifier code supplier by the Organisation Data Service"
* identifier[odsOrganisationCode].use ..0
* identifier[odsOrganisationCode].type ..0
* identifier[odsOrganisationCode].system 1..
* identifier[odsOrganisationCode].system = "https://fhir.nhs.uk/Id/ods-organization-code" (exactly)
* identifier[odsOrganisationCode].value 1..
* identifier[odsOrganisationCode].period ..0
* identifier[odsOrganisationCode].assigner ..0

* identifier[odsSiteCode] ^short = "ODS Site code to identify the organisation at site level"
* identifier[odsSiteCode] ^definition = "ODS Site code to identify the organisation at site level"
* identifier[odsSiteCode].use ..0
* identifier[odsSiteCode].type ..0
* identifier[odsSiteCode].system 1..
* identifier[odsSiteCode].system = "https://fhir.nhs.uk/Id/ods-site-code" (exactly)
* identifier[odsSiteCode].value 1..
* identifier[odsSiteCode].period ..0
* identifier[odsSiteCode].assigner ..0

* identifier[localIdentifier].system 1..
* identifier[localIdentifier].system = "https://fhir.nhs.uk/Id/local-organization-code" (exactly)
* identifier[localIdentifier].system ^short = "The local or system suppliers identifier namespace"
* identifier[localIdentifier].value 1..
* identifier[localIdentifier].assigner only Reference(CareConnect-Organization-1)


* type ..1
* name 1..
* address.state ..0
* partOf only Reference(CareConnect-Organization-1)
* contact.name.family 1..
* contact.address.state ..0

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Organization-1"