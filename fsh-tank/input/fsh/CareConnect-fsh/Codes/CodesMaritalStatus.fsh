Alias: $MaritalStatus = http://hl7.org/fhir/v3/MaritalStatus
Alias: $NullFlavor = http://hl7.org/fhir/v3/NullFlavor

ValueSet: MaritalStatusCodes
Id: CareConnect-MaritalStatus-1
Description: "This value set defines the set of codes that can be used to indicate the marital status of a person."
* ^name = "Marital Status Codes"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/valueset-map"
* ^extension[=].valueReference.reference = "https://fhir.hl7.org.uk/STU3/ConceptMap/CareConnect-MaritalStatus-1"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/valueset-sourceReference"
* ^extension[=].valueUri = "http://hl7.org/fhir/ValueSet/marital-status"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #pa
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 5
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-ballot-status"
* ^extension[=].valueString = "Informative"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.3.28"
* ^version = "3.0.1"
* ^status = #draft
* ^date = "2017-04-19T07:44:47+10:00"
* ^publisher = "HL7 (FHIR Project)"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://hl7.org/fhir"
* ^copyright = "Copyright © HL7.org 2011+"
//* ^extensible = true (removed in R4)
* $MaritalStatus#A "Annulled"
* $MaritalStatus#D "Divorced"
* $MaritalStatus#I "Interlocutory"
* $MaritalStatus#L "Legally Separated"
* $MaritalStatus#M "Married"
* $MaritalStatus#P "Polygamous"
* $MaritalStatus#S "Never Married"
* $MaritalStatus#T "Domestic partner"
* $MaritalStatus#U "unmaried"
* $MaritalStatus#W "Widowed"
* $NullFlavor#UNK "unknown"


//Add correct CareConnect URL
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-MaritalStatus-1"