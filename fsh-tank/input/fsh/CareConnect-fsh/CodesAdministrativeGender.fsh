ValueSet: AdministrativeGender
Id: CareConnect-AdministrativeGender-1
Description: "The gender of a person used for administrative purposes."
* ^name = "Administrative Gender"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/valueset-map"
* ^extension[=].valueReference.reference = "https://fhir.hl7.org.uk/STU3/ConceptMap/AdministrativeGender-1"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/valueset-sourceReference"
* ^extension[=].valueUri = "http://hl7.org/fhir/ValueSet/administrative-gender"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #pc
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 5
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-ballot-status"
* ^extension[=].valueString = "Informative"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.3.1"
* ^version = "3.0.1"
* ^status = #draft
* ^date = "2017-04-19T07:46:00+10:00"
* ^publisher = "HL7 (FHIR Project)"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "http://hl7.org/fhir"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "fhir@lists.hl7.org"
* ^copyright = "Copyright © HL7.org 2011+"

* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-AdministrativeGender-1"

* AdministrativeGender#male "Male"
* AdministrativeGender#female "Female"
* AdministrativeGender#other "Other"
* AdministrativeGender#unknown "Unknown"


/*
Instance: AdministrativeGenderConceptMap
InstanceOf: ConceptMap
Usage: #definition

* url = "https://fhir.hl7.org.uk/STU3/ConceptMap/CareConnect-AdministrativeGender-1"
* version = "1.0.0"
* name = "Concept Map - Care Connect Administrative Gender"
* status = #active
* date = "2017-08-01T00:00:00+00:00"
* publisher = "HL7 UK"
* description = "A Concept Map from ValueSet Administrative Gender to NHS Data Dictionary Person Stated Gender to aid interpretation."
* copyright = "Copyright © 2016 HL7 UK"
* sourceUri = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-AdministrativeGender-1"
* targetUri = "https://fhir.nhs.uk/STU3/ValueSet/NHSDataDictionary-PersonStatedGender-1"
* group.source = "http://hl7.org/fhir/administrative-gender"
* group.target = "https://fhir.nhs.uk/STU3/CodeSystem/NHSDataDictionary-PersonStatedGender-1"
* group.element[0].code = #male
* group.element[=].display = "Male"
* group.element[=].target.code = #1
* group.element[=].target.display = "Male"
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #female
* group.element[=].display = "Female"
* group.element[=].target.code = #2
* group.element[=].target.display = "Female"
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #other
* group.element[=].display = "Other"
* group.element[=].target.code = #9
* group.element[=].target.display = "Indeterminate (unable to be classified as either male or female)"
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #unknown
* group.element[=].display = "Unknown"
* group.element[=].target.code = #X
* group.element[=].target.display = "Not Known (not recorded)"
* group.element[=].target.equivalence = #equivalent
*/
