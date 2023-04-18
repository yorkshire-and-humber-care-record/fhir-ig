Alias: $unitsofmeasure = http://unitsofmeasure.org

ValueSet: VitalSignsUnits
Id: ucum-vitals-common
Title: "Vital Signs Units"
Description: "Common UCUM units for recording Vital Signs"
* ^name = "Vital Signs Units"
* ^meta.lastUpdated = "2022-05-28T12:47:40.239+10:00"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/valueset-extensible"
* ^extension[=].valueBoolean = true
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #oo
//* ^url = "http://hl7.org/fhir/ValueSet/ucum-vitals-common"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.3.955"
* ^version = "4.3.0"
* ^status = #draft
* ^experimental = false
* ^publisher = "FHIR Project"
* ^copyright = "UCUM is Copyright © 1999-2013 Regenstrief Institute, Inc. and The UCUM Organization, Indianapolis, IN. All rights reserved. See http://unitsofmeasure.org/trac//wiki/TermsOfUse for details"
* $unitsofmeasure#% "percent"
* $unitsofmeasure#cm "centimeter"
* $unitsofmeasure#[in_i] "inch (international)"
* $unitsofmeasure#kg "kilogram"
* $unitsofmeasure#g "gram"
* $unitsofmeasure#[lb_av] "pound (US and British)"
* $unitsofmeasure#Cel "degree Celsius"
* $unitsofmeasure#[degF] "degree Fahrenheit"
* $unitsofmeasure#mm[Hg] "millimeter of mercury"
* $unitsofmeasure#/min "per minute"
* $unitsofmeasure#kg/m2 "kilogram / (meter ^ 2)"
* $unitsofmeasure#m2 "square meter"

//Add correct Care Connect URL
* ^url = "http://hl7.org/fhir/stu3/valueset-ucum-vitals-common.html"