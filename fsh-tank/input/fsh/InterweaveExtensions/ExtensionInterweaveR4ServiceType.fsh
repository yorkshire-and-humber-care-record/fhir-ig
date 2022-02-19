Extension: ExtensionYhcrR4EncounterServiceType
Id: Extension-Yhcr-R4EncounterServiceType
Description: "An extension to add Service Type to the Encounter. This is pre-adopting a field that is missing in STU3 but added in R4"
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "Encounter" //R3 is just context

* . ..1
* . ^short = "Specific type of service (pre-adopted from R4)"
* . ^definition = "Broad categorization of the service that is to be provided (e.g. cardiology). This is missing on the Encounter in STU3, but added in R4."

* valueCodeableConcept only CodeableConcept
* valueCodeableConcept ^short = "Specific type of service (pre-adopted from R4)"
// We also want to pre-adopt this value set from UK Core which is better than the original FHIR suggestion
// (More relevant to UK and better coverage of social care)
// It is based on SNOMED refset 1127531000000102: Services Simple Reference Set
* valueCodeableConcept from Yhcr-UkCoreCareSettingType (required)
* insert Ruleset-CodingWithSystemCodeDisplay(valueCodeableConcept)

