Profile: CareConnectLocation1
Parent: Location
Id: CareConnect-Location-1
Description: "The Location resource provides information and details on the physical location and the services provided."
* ^meta.lastUpdated = "2017-08-25T14:09:09.153+01:00"
* ^version = "0.0.1"
* ^status = #draft
* ^date = "2017-07-07T10:01:21.9650443+01:00"
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK\r\n\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.ordered = false
* identifier ^slicing.rules = #openAtEnd

* identifier contains
    odsSiteCode 0..1 and
    localIdentifier 0..1
* identifier[odsSiteCode] ^short = "ODS Site code to identify the organisation at site level"
* identifier[odsSiteCode] ^definition = "ODS Site code to identify the organisation at site level."
* identifier[odsSiteCode].use ..0
* identifier[odsSiteCode].type ..0
* identifier[odsSiteCode].system 1..
* identifier[odsSiteCode].system = "https://fhir.nhs.uk/Id/ods-site-code" (exactly)
* identifier[odsSiteCode].system ^short = "ODS Code"
* identifier[odsSiteCode].value 1..
* identifier[odsSiteCode].value ^short = "The ODS Site code name, to reflect the code used"
* identifier[odsSiteCode].period ..0
* identifier[odsSiteCode].assigner ..0

* identifier[localIdentifier].system 1..
* identifier[localIdentifier].system = "https://fhir.nhs.uk/Id/local-location-identifier" (exactly)
* identifier[localIdentifier].value 1..
* identifier[localIdentifier].value ^short = "The Local Location Identifier code name, to reflect the code used"
* identifier[localIdentifier].assigner only Reference(CareConnect-Organization-1)

* address.state ..0
* managingOrganization only Reference(CareConnect-Organization-1)
* partOf only Reference(CareConnect-Location-1)

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Location-1"
