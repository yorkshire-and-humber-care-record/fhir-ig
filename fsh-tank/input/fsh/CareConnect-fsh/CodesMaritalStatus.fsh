Alias: $MaritalStatus = http://hl7.org/fhir/v3/MaritalStatus
Alias: $NullFlavor = http://hl7.org/fhir/v3/NullFlavor

ValueSet: Care_Connect_Marital_Status
Id: CareConnect-MaritalStatus-1
Description: "This value set defines the set of codes that can be used to indicate the marital status of a person."
* ^name = "Care Connect Marital Status"
* ^meta.lastUpdated = "2016-08-03T00:00:00+01:00"

// NB! There is a lot of stuff here which FSH doesn't seem to be able to cope with
// So have just removed it
// (Remember that we overwrite the complied outputs the "real" origional CareConnect file anyway, so not vital
//   as long as good enough for compling the rest of our work here)


/*****************************
* ^contained.resourceType = "ConceptMap"
* ^contained.id = "map"
* ^contained.name = "NHS Data Model and Dictionary Mapping"
* ^contained.status = #draft
* ^contained.sourceReference.reference = "https://fhir.hl7.org.uk/ValueSet/CareConnect-MaritalStatus-1"
* ^contained.targetReference.reference = "https://fhir.hl7.org.uk/ValueSet/CareConnect-MaritalStatus-DDMAP-1"
* ^contained.element[0].codeSystem = "http://hl7.org/fhir/marital-status"
* ^contained.element[=].code = "U"
* ^contained.element[=].target.code = "S"
* ^contained.element[=].target.equivalence = "equivalent"
* ^contained.element[+].codeSystem = "http://hl7.org/fhir/v3/MaritalStatus"
* ^contained.element[=].code = "D"
* ^contained.element[=].target.code = "D"
* ^contained.element[=].target.equivalence = "equivalent"
* ^contained.element[+].codeSystem = "http://hl7.org/fhir/v3/MaritalStatus"
* ^contained.element[=].code = "L"
* ^contained.element[=].target.code = "P"
* ^contained.element[=].target.equivalence = "equivalent"
* ^contained.element[+].codeSystem = "http://hl7.org/fhir/v3/MaritalStatus"
* ^contained.element[=].code = "M"
* ^contained.element[=].target.code = "M"
* ^contained.element[=].target.equivalence = "equivalent"
* ^contained.element[+].codeSystem = "http://hl7.org/fhir/v3/MaritalStatus"
* ^contained.element[=].code = "S"
* ^contained.element[=].target.code = "S"
* ^contained.element[=].target.equivalence = "equivalent"
* ^contained.element[+].codeSystem = "http://hl7.org/fhir/v3/MaritalStatus"
* ^contained.element[=].code = "W"
* ^contained.element[=].target.code = "W"
* ^contained.element[=].target.equivalence = "equivalent"
* ^contained.element[+].codeSystem = "http://hl7.org/fhir/v3/NullFlavor"
* ^contained.element[=].code = "UNK"
* ^contained.element[=].target.code = "N"
* ^contained.element[=].target.equivalence = "equivalent"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/valueset-map"
* ^extension[=].valueReference.reference = "#map"
****************************************/
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/valueset-oid"
* ^extension[=].valueUri = "urn:oid:2.16.840.1.113883.4.642.2.19"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 1
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
//* ^requirements = "The codes listed in this FHIR ValueSet are a restricted set of the FHIR Marital Status set of codes. This FHIR ValueSet has a 'Required' binding; for conformance the Marital Status element SHALL include a code listed below."
* ^copyright = "Copyright © 2016+ HL7 UK\r\n\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"
//* ^codeSystem.extension.url = "http://hl7.org/fhir/StructureDefinition/valueset-oid"
//* ^codeSystem.extension.valueUri = "urn:oid:2.16.840.1.113883.4.642.1.19"
//* ^codeSystem.system = "http://hl7.org/fhir/marital-status"
//* ^codeSystem.caseSensitive = true
//* ^codeSystem.concept.code = "U"
//* ^codeSystem.concept.display = "Unmarried"
//* ^codeSystem.concept.definition = "The person is not presently married. The marital history is not known or stated."

* $MaritalStatus#D "Divorced"
* $MaritalStatus#L "Legally Separated"
* $MaritalStatus#M "Married"
* $MaritalStatus#S "Never Married"
* $MaritalStatus#W "Widowed"
* $NullFlavor#UNK "unknown"


//Add correct CareConnect URL
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-MaritalStatus-1"