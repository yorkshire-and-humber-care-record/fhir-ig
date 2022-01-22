Extension: ExtensionCareConnectAnaestheticIssues1
Id: Extension-CareConnect-AnaestheticIssues-1
Description: "An Extension to record details of any adverse reaction to any anaesthetic agents including local anaesthesia. Problematic intubation, transfusion reaction, etc."
* ^meta.lastUpdated = "2018-05-02T14:49:51.654+01:00"
* ^version = "1.1.0"
* ^status = #draft
* ^date = "2018-11-05"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/ "
* ^copyright = "Copyright © 2016 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"
//* ^contextType = "resource"
//* ^context = "Procedure"

* . ..1
* . ^short = "Details of any adverse reaction to any anaesthetic agents"
* . ^definition = "Details of any adverse reaction to any anaesthetic agents."
* value[x] only CodeableConcept or Reference(CareConnect-Condition-1)
* value[x] ^short = "Snomed Concept or a link to the Condition resource"
* value[x] ^definition = "Snomed Concept or a link to Condition resource."
* value[x] ^binding.strength = #required
* value[x] ^binding.description = "A code from the SNOMED Clinical Terminology UK"
* value[x] ^binding.valueSet = CareConnect-ConditionCode-1

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-AnaestheticIssues-1"