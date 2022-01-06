ValueSet: CareConnectLanguageAbilityProficiency
Id: CareConnect-LanguageAbilityProficiency-1
Description: "A ValueSet to identify the level of proficiency in communicating a language."
* ^name = "Care Connect Language Ability Proficiency"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.5.61"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* include codes from system CareConnect-LanguageAbilityProficiency-1

* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-LanguageAbilityProficiency-1"


CodeSystem: CareConnectLanguageAbilityProficiency
Id: CareConnect-LanguageAbilityProficiency-1
Description: "A CodeSystem to identify the level of proficiency in communicating a language."
* ^name = "Care Connect Language Ability Proficiency"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* ^caseSensitive = true
* ^content = #complete

* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-LanguageAbilityProficiency-1"

* #E "Excellent"
* #F "Fair"
* #G "Good"
* #P "Poor"