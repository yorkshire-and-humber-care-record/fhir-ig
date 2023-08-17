Alias: $loinc = http://loinc.org

ValueSet: VitalSigns
Id: observation-vitalsignresult
Description: "This value set indicates the allowed vital sign result types.   The concept Vitals signs panel (85353-1) is a grouping structure for a set of vital signs and includes related links (with type=has-member) to the Observations in this set (e.g. respiratory rate, heart rate, BP).  The Blood pressure panel (85354-9) is used to group the component observations Systolic blood pressure (8480-6) and Diastolic blood pressure (8462-4)."
* ^name = "Vital Signs"
* ^meta.lastUpdated = "2019-10-24T11:53:00+11:00"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-ballot-status"
* ^extension[=].valueString = "Informative"
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 0
* ^url = "http://hl7.org/fhir/ValueSet/observation-vitalsignresult"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.3.88.12.80.62"
* ^version = "3.0.2"
* ^status = #active
* ^experimental = true
* ^date = "2019-10-24T11:53:00+11:00"
* ^publisher = "FHIR project team"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://hl7.org/fhir"
* ^copyright = "This content from LOINC® is copyright © 1995 Regenstrief Institute, Inc. and the LOINC Committee, and available at no cost under the license at http://loinc.org/terms-of-use"
* $loinc#85353-1
* $loinc#9279-1
* $loinc#8867-4
* $loinc#59408-5
* $loinc#8310-5
* $loinc#8302-2
* $loinc#8306-3
* $loinc#8287-5
* $loinc#29463-7
* $loinc#39156-5
* $loinc#85354-9
* $loinc#8480-6
* $loinc#8462-4
* $loinc#8478-0

//Add correct Care Connect URL
//* ^url = "http://hl7.org/fhir/ValueSet/observation-vitalsignresult"