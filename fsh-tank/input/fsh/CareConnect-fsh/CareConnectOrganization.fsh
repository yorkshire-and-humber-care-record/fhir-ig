Alias: $organization-period = http://hl7.org/fhir/StructureDefinition/organization-period

Profile: CareConnectOrganization1
Parent: Organization
Id: CareConnect-Organization-1
Description: "The Organization resource represents the organisation that employs the healthcare professional."
* ^meta.lastUpdated = "2018-02-05T14:49:01.808+00:00"
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

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    Extension-CareConnect-MainLocation-1 named mainLocation 0..1 and
    $organization-period named organization-period 0..1

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.ordered = false
* identifier ^slicing.rules = #openAtEnd
* identifier contains
    odsOrganisationCode 0..1 and
    odsSiteCode 0..1

* identifier[odsOrganisationCode] ^short = "Organisation Data Service code"
* identifier[odsOrganisationCode] ^definition = "Identifier code supplier by the Organisation Data Service"
* identifier[odsOrganisationCode].system 1..
* identifier[odsOrganisationCode].system = "https://fhir.nhs.uk/Id/ods-organization-code" (exactly)
* identifier[odsOrganisationCode].value 1..
* identifier[odsOrganisationCode].assigner only Reference(CareConnect-Organization-1)

* identifier[odsSiteCode] ^short = "ODS Site code to identify the organisation at site level"
* identifier[odsSiteCode] ^definition = "ODS Site code to identify the organisation at site level"
* identifier[odsSiteCode].system 1..
* identifier[odsSiteCode].system = "https://fhir.nhs.uk/Id/ods-site-code" (exactly)
* identifier[odsSiteCode].value 1..
* identifier[odsSiteCode].assigner only Reference(CareConnect-Organization-1)

* partOf only Reference(CareConnect-Organization-1)
* contact.name.family 1..

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Organization-1"