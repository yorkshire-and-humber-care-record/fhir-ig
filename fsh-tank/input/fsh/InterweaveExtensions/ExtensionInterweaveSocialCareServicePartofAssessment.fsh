Extension: ExtensionInterweaveSocialCareServicePartofAssessment
Id: Extension-Interweave-SocialCareServicePartofAssessment
Description: "Reference to an assessment in which this particular need has been identified."
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "Condition" //R3 is just context

* . ..1
* . ^short = "Reference to an assessment in which this particular need has been identified."
* . ^definition = "Reference to an assessment in which this particular need has been identified."

* valueReference only Reference(Interweave-SocialCareAssessment)
* valueReference ^short = "Reference to an assessment in which this particular need has been identified."
* valueReference ^definition = "Reference to an assessment in which this particular need has been identified."