ValueSet: CareConnectLanguageAbilityMode
Id: CareConnect-LanguageAbilityMode-1
Description: "A ValueSet that identifies the mode the patient can communicate in, representing the method of expression of the language."
* ^name = "Care Connect Language Ability Mode"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.5.60"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* include codes from system CareConnect-LanguageAbilityMode-1

* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-LanguageAbilityMode-1"


CodeSystem: CareConnectLanguageAbilityMode
Id: CareConnect-LanguageAbilityMode-1
Description: "A CodeSystem that identifies the mode the patient can communicate in, representing the method of expression of the language."
* ^name = "Care Connect Language Ability Mode"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* ^caseSensitive = true
* ^content = #complete

* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-LanguageAbilityMode-1"

* #ESGN "Expressed signed"
* #ESP "Expressed spoken"
* #EWR "Expressed written"
* #RSGN "Received signed"
* #RSP "Received spoken"
* #RWR "Received written"