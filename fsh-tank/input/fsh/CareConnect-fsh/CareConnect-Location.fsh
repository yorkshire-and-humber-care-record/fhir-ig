
Profile: CareConnectLocation1
Parent: Location
Id: CareConnect-Location-1
Description: "The Location resource provides information and details on the physical location and the services provided."

* ^meta.lastUpdated = "2018-02-05T14:49:28.409+00:00"
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

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.ordered = false
* identifier ^slicing.rules = #openAtEnd
* identifier contains odsSiteCode 0..1

* identifier[odsSiteCode] ^short = "ODS Site code to identify the organisation at site level"
* identifier[odsSiteCode] ^definition = "ODS Site code to identify the organisation at site level."
* identifier[odsSiteCode].system 1..
* identifier[odsSiteCode].system = "https://fhir.nhs.uk/Id/ods-site-code" (exactly)
* identifier[odsSiteCode].system ^short = "ODS Code"
* identifier[odsSiteCode].value 1..
* identifier[odsSiteCode].value ^short = "The ODS Site code name, to reflect the code used"
* identifier[odsSiteCode].assigner only Reference(CareConnect-Organization-1)

* managingOrganization only Reference(CareConnect-Organization-1)
* partOf only Reference(CareConnect-Location-1)

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Location-1"
