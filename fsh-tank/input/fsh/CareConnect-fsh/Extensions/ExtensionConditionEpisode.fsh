Extension: ExtensionCareConnectConditionEpisode1
Id: Extension-CareConnect-ConditionEpisode-1
Description: "The episodicity status of a condition."
* ^meta.lastUpdated = "2018-05-04T13:04:57.812+01:00"
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-ConditionEpisode-1"
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
//* ^context = "Condition"
* . ^short = "Episodicity of condition"
* . ^definition = "Episodicity of condition."
* url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-ConditionEpisode-1" (exactly)

// Hmm, as it comes from CareConnect then it doesn't build. I think the alternative below is basically the same?

/*
* valueCode contains valueCode 1..1
* valueCode[valueCode] only code
* valueCode[valueCode] ^short = "first | new | review | flare | end"
* valueCode[valueCode] ^definition = "Specifies the episodicity of a condition."
* valueCode[valueCode] ^binding.strength = #required
* valueCode[valueCode] ^binding.description = "Specifies the episodicity of a condition."
* valueCode[valueCode] ^binding.valueSet = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ConditionEpisodicity-1"
*/

//* valueCode contains valueCode 1..1
* valueCode only code
* valueCode ^short = "first | new | review | flare | end"
* valueCode ^definition = "Specifies the episodicity of a condition."
* valueCode ^binding.strength = #required
* valueCode ^binding.description = "Specifies the episodicity of a condition."
* valueCode ^binding.valueSet = CareConnect-ConditionEpisodicity-1


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-ConditionEpisode-1"