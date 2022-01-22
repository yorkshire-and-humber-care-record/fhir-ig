Extension: ExtensionCareConnectDischargeMethod1
Id: Extension-CareConnect-DischargeMethod-1
Description: "An extension to the Encounter resource to record the method of discharge from hospital."
* ^meta.lastUpdated = "2018-02-19T16:00:15.942+00:00"
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
//* ^contextType = "resource"
//* ^context = "Encounter.hospitalization"
* . ..1
* . ^short = "An extension to the Encounter resource to record the method of discharge from hospital."

// Hmm, as it comes from CareConnect then it doesn't build. I think the alternative below is basically the same?

/*
* valueCodeableConcept contains valueCodeableConcept 1..1
* valueCodeableConcept[valueCodeableConcept] only CodeableConcept
* valueCodeableConcept[valueCodeableConcept] ^short = "The method of discharge from a Hospital Provider Spell."
* valueCodeableConcept[valueCodeableConcept] ^binding.strength = #required
* valueCodeableConcept[valueCodeableConcept] ^binding.description = "The method of discharge from a Hospital Provider Spell."
* valueCodeableConcept[valueCodeableConcept] ^binding.valueSetReference.reference = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-DischargeMethod-1"
*/

//* valueCodeableConcept contains valueCodeableConcept 1..1
* valueCodeableConcept only CodeableConcept
* valueCodeableConcept ^short = "The method of discharge from a Hospital Provider Spell."
* valueCodeableConcept ^binding.strength = #required
* valueCodeableConcept ^binding.description = "The method of discharge from a Hospital Provider Spell."
* valueCodeableConcept ^binding.valueSet = CareConnect-DischargeMethod-1



//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-DischargeMethod-1"