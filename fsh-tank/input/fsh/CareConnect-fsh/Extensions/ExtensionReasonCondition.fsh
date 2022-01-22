Extension: ExtensionCareConnectReasonCondition1
Id: Extension-CareConnect-ReasonCondition-1
Description: "The reason why a resource was added/performed/given. This may be due to a Condition, may be coded entity of some type, or may simply be present as text."
* ^meta.lastUpdated = "2018-05-04T13:07:15.671+01:00"
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-ReasonCondition-1"
* ^version = "0.0.2"
* ^status = #draft
* ^date = "2017-07-12T10:48:31.4895265+01:00"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/"
* ^copyright = "Copyright © 2016 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"
//* ^contextType = "resource"
//* ^context = "Observation"

* . ^short = "Reason resource added/performed/given"
* . ^definition = "Reason resource added/performed/given."
* url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-ReasonCondition-1" (exactly)

* value[x] 1..
* value[x] only CodeableConcept or Reference(CareConnect-Condition-1)
* value[x] ^short = "Reason resource added/performed/given"
* value[x] ^definition = "Reason resource added/performed/given."


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-ReasonCondition-1"