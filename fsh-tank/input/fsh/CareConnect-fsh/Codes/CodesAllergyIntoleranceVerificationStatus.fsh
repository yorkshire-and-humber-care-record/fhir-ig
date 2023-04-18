Alias: $allergy-verification-status = http://hl7.org/fhir/allergy-verification-status

ValueSet: AllergyIntoleranceVerificationStatus
Id: CareConnect-AllergyVerificationStatus-1
Description: "Assertion about certainty associated with a propensity, or potential risk, of a reaction to the identified substance."
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/valueset-map"
* ^extension[=].valueReference.reference = "https://fhir.hl7.org.uk/STU3/ConceptMap/CareConnect-AllergyVerificationStatus-1"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/valueset-sourceReference"
* ^extension[=].valueUri = "http://hl7.org/fhir/ValueSet/allergy-verification-status"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #pc
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 3
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-ballot-status"
* ^extension[=].valueString = "Informative"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.3.115"
* ^version = "3.0.1"
* ^status = #active
* ^date = "2017-04-19T07:44:47+10:00"
* ^publisher = "HL7 (FHIR Project)"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://hl7.org/fhir"
* ^copyright = "Copyright © HL7.org 2011+"
* $allergy-verification-status#unconfirmed "Unconfirmed"
* $allergy-verification-status#confirmed "Confirmed"