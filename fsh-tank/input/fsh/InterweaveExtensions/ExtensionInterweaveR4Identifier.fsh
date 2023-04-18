Extension: ExtensionInterweaveR4Identifier
Id: Extension-Interweave-R4Identifier
Description: "Business identifier for this resource"
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "Medication" //R3 is just context

* . 0..*
* . ^short = "Business identifier for this resource."
* . ^definition = "Business identifier for this resource."

* valueIdentifier only Identifier