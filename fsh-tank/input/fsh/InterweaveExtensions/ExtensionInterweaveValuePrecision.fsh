Extension: ExtensionInterweaveValuePrecision
Id: Extension-Interweave-ValuePrecision
Description: "Explicit precision of the number. This is the number of significant decimal places after the decimal point, irrespective of how many are actually present in the explicitly represented decimal."
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[=].valueCode = #fhir
* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 1
* ^version = "4.3.0"
* ^status = #draft
* ^experimental = false
* ^date = "2015-02-28"
* ^publisher = "Health Level Seven, Inc. - FHIR Core WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://hl7.org/special/committees/FHIR"
* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "decimal" //R3 is just context
* . 0..1
* . ^short = "Explicit precision (number of significant decimal places)"
* . ^definition = "Explicit precision of the number. This is the number of significant decimal places after the decimal point, irrespective of how many are actually present in the explicitly represented decimal."
* . ^comment = "The presence of this extension does not change conformance expectations with regard to rendering and calculations that use the number - these are still based on the raw decimal value. Applications that perform calculations SHALL ensure that this extension is removed or updated to the correct precision value if the number is changed. Applications should consider using the exponential form (e.g. 2.10e3) on the raw decimal to manage significant figures, but should be mindful of human display when doing so."
* value[x] 1..
* value[x] only integer

Mapping: v2
Id: v2
Title: "HL7 v2 Mapping"
Source: ExtensionInterweaveValuePrecision
Target: "http://hl7.org/v2"
* -> "N/A"