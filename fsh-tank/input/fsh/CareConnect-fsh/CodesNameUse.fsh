ValueSet: NameUse
Id: CareConnect-NameUse-1
Description: "The use of a human name"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/valueset-map"
* ^extension[=].valueReference.reference = "https://fhir.hl7.org.uk/STU3/ConceptMap/CareConnect-PersonNameType-1"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/valueset-sourceReference"
* ^extension[=].valueUri = "http://hl7.org/fhir/ValueSet/name-use"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #fhir
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 0
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-ballot-status"
* ^extension[=].valueString = "Informative"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.3.58"
* ^version = "3.0.1"
* ^status = #draft
* ^date = "2017-04-19T07:44:47+10:00"
* ^publisher = "HL7 (FHIR Project)"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://hl7.org/fhir"
* ^copyright = "Copyright © HL7.org 2011+"

* NameUse#usual "Usual"
* NameUse#official "Official"
* NameUse#temp "Temp"
* NameUse#nickname "Nickname"
* NameUse#anonymous "Anonymous"
* NameUse#old "Old"
* NameUse#maiden "Name changed for Marraige"

* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-NameUse-1"