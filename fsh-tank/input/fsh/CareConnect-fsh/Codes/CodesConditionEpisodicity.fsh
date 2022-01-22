ValueSet: CareConnectConditionEpisodicity
Id: CareConnect-ConditionEpisodicity-1
Description: "A ValueSet to identify the episodicity of a condition."
* ^name = "Care Connect Condition Episodicity"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/valueset-map"
* ^extension.valueReference.reference = "https://fhir.hl7.org.uk/STU3/ConceptMap/CareConnect-ConditionEpisodicity-1"
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ConditionEpisodicity-1"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* include codes from system CareConnect-ConditionEpisodicity-1

* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ConditionEpisodicity-1"


CodeSystem: CareConnectConditionEpisodicity
Id: CareConnect-ConditionEpisodicity-1
Description: "A CodeSystem to identify the episodicity of a condition."
* ^name = "Care Connect Condition Episodicity"
* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-ConditionEpisodicity-1"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* ^caseSensitive = true
* ^content = #complete
* #first "First" "The first episode of a condition."
* #new "New" "A new episode of a previously recorded condition."
* #review "Review" "A review of an existing condition episode."
* #end "End" "Marks the end of an existing condition episode."


* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-ConditionEpisodicity-1"