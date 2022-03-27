Extension: ExtensionInterweaveSexualOrientation
Id: Extension-Interweave-SexualOrientation
Description: "An extension to add Sexual Orientation to the Patient."
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "Patient" //R3 is just context

* . ..1
* . ^short = "Sexual Orientation"
* . ^definition = "Sexual Orientation, as per NHS Data Dictionary: Person Stated Sexual Orientation Code"

* valueCodeableConcept only CodeableConcept
* valueCodeableConcept ^short = "Sexual Orientation, as per NHS Data Dictionary: Person Stated Sexual Orientation Code"

* valueCodeableConcept from Interweave-SexualOrientation-1 (required)
* insert Ruleset-CodingWithSystemCodeDisplay(valueCodeableConcept)