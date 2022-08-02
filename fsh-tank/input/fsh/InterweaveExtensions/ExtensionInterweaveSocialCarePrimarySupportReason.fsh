Extension: ExtensionInterweaveSocialCarePrimarySupportReason
Id: Extension-Interweave-SocialCarePrimarySupportReason
Description: "Flag to indicate whether this is the primary support reason"
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "Condition" //R3 is just context

* . ..1
* . ^short = "Flag to indicate whether this is the primary support reason"
* . ^definition = "Flag to indicate whether this is the primary support reason"

* valueBoolean only boolean
* valueBoolean ^short = "Flag to indicate whether this is the primary support reason"
* valueBoolean ^definition = "Flag to indicate whether this is the primary support reason"