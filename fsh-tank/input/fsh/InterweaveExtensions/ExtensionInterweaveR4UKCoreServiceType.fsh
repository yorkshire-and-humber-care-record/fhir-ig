Extension: ExtensionInterweaveR4UKCoreServiceType
Id: Extension-Interweave-R4UKCoreServiceType
Description: "An extension to add UK Core Service Type to the resource. This is pre-adopting a field that is missing in STU3 but added in R4"
* ^status = #draft

//* ^context[+].type = #element   // R3 is contextType = resource
//* ^context[=].expression = "Encounter" //R3 is just context

* . ..1
* . ^short = "Specific type of service (pre-adopted from R4)"
* . ^definition = "Broad categorization of the service that is to be provided (e.g. cardiology). This is missing in STU3, but added in R4."

* valueCodeableConcept only CodeableConcept
* valueCodeableConcept ^short = "Specific type of service (pre-adopted from R4)"
// We also want to pre-adopt this value set from UK Core which is better than the original FHIR suggestion
// (More relevant to UK and better coverage of social care)
// It is based on SNOMED refset 1127531000000102: Services Simple Reference Set
* valueCodeableConcept from Interweave-UkCoreCareSettingType (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(valueCodeableConcept)