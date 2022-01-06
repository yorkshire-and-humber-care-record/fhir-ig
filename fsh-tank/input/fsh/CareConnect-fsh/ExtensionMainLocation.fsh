//Extension: Extension-CareConnect-MainLocation-1
Extension: ExtensionCareConnectMainLocation1
Id: Extension-CareConnect-MainLocation-1
Description: "This extension is constrained to represent a reference to the main location for an organization."
* ^meta.lastUpdated = "2017-08-25T14:45:08.472+01:00"
* ^version = "0.0.1"
* ^status = #draft
* ^date = "2017-07-07T11:02:45.1835312+01:00"
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK\r\n\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"
//* ^contextType = "resource"
//* ^context = "Organization"
* . ^short = "Main location"
* . ^definition = "The main location of the organization."
* valueReference 1..
* valueReference only Reference(CareConnect-Location-1)
* valueReference ^sliceName = "valueReference"
* valueReference ^short = "Main location"
* valueReference ^definition = "Reference to the main location for an organization."

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-MainLocation-1"