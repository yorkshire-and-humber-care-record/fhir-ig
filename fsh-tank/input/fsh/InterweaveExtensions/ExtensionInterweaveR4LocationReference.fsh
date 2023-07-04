Extension: ExtensionInterweaveR4LocationReference
Id: Extension-Interweave-R4LocationReference
Description: "Reference to the patient’s requested location."
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "ReferralRequest" //R3 is just context

* . ..1
* . ^short = "Reference to the patient’s requested location."
* . ^definition = "Reference to the patient’s requested location."

* valueReference only Reference(CareConnect-Location-1)
* valueReference ^short = "Reference to the patient’s requested location."
* valueReference ^definition = "Reference to the patient’s requested location."