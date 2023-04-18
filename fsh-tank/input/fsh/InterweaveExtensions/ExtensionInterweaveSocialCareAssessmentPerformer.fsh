Extension: ExtensionInterweaveSocialCareAssessmentPerformer
Id: Extension-Interweave-SocialCareAssessmentPerformer
Description: "A reference to an practitioner which either performed, is performing or is going to perform the assessment."
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "Task" //R3 is just context

* . ..1
* . ^short = "Reference to a practioner performing the assessment."
* . ^definition = "A reference to an practitioner which either performed, is performing or is going to perform the assessment."

* valueReference only Reference(CareConnect-Practitioner-1)
* valueReference ^short = "Reference to a practioner performing the assessment."
* valueReference ^definition = "A reference to an practitioner which either performed, is performing or is going to perform the assessment."