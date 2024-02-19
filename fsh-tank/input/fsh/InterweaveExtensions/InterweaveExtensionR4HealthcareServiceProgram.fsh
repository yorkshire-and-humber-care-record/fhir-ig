Extension: ExtensionInterweaveR4HealthcareServiceProgram
Id: Extension-Interweave-R4HealthcareServiceProgram
Description: "Programs that this service is applicable to. This is pre-adopting a field that is missing in STU3 but added in R4."
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "HealthcareService" //R3 is just context

* . ..1
* . ^short = "This extension defines an example set of codes that could be can be used to classify groupings of service-types/specialties. (pre-adopted from R4)"
* . ^definition = "This extension defines an example set of codes that could be can be used to classify groupings of service-types/specialties. This is pre-adopting a field that is missing in STU3 but added in R4."

* valueCodeableConcept only CodeableConcept
* valueCodeableConcept ^short = "The coded reason for the appointment being cancelled (pre-adopted from R4)"
* valueCodeableConcept from Interweave-R4HealthcareServiceProgram (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(valueCodeableConcept)
