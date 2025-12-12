Extension: ExtensionInterweaveFlagNotes
Id: Extension-Interweave-FlagNotes
Description: "Captures the additional information for an adjustment within a Reasonable Adjustment Flag."
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "Flag" //R3 is just context

* . ..1
* . ^short = "Extension for Flag Adjustment Notes"
* . ^definition = "Captures the additional information for an adjustment within a Reasonable Adjustment Flag."

* valueAnnotation only Annotation
* valueAnnotation ^short = "Captures the additional information for an adjustment within a Reasonable Adjustment Flag."
* valueAnnotation ^definition = "Captures the additional information for an adjustment within a Reasonable Adjustment Flag."