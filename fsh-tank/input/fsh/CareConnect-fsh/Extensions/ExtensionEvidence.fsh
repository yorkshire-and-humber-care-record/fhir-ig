Extension: ExtensionCareConnectEvidence1
Id: Extension-CareConnect-Evidence-1
Description: "This Extension resource is constrained to support a reference to results of investigations that confirmed the certainty of the diagnosis. Examples might include results of skin prick allergy tests."
* ^meta.lastUpdated = "2018-02-27T12:06:00.185+00:00"
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-Evidence-1"
* ^version = "1.1.0"
* ^status = #draft
* ^date = "2018-11-05"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/"
* ^copyright = "Copyright © 2016 HL7 UK\r\n\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"
// * ^contextType = "resource"
// * ^context = "AllergyIntolerance"
// * . ^short = "A reference to results of investigations that confirmed the certainty of the diagnosis"
// * . ^definition = "A reference to results of investigations that confirmed the certainty of the diagnosis."
//* valueReference contains valueReference 0..1
* valueReference[valueReference] only Reference(DiagnosticReport)
* valueReference[valueReference] ^short = "A reference to results of investigations that confirmed the certainty of the diagnosis"
* valueReference[valueReference] ^definition = "A reference to results of investigations that confirmed the certainty of the diagnosis."

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-Evidence-1"