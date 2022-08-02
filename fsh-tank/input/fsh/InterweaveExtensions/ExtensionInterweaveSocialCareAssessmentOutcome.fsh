Extension: ExtensionInterweaveSocialCareAssessmentOutcome
Id: Extension-Interweave-SocialCareAssessmentOutcome
Description: "An extension to add a coded value for the outcome of an assessment."
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "InterweaveSocialCareAssessment" //R3 is just context

* . ..1
* . ^short = "Social Care Assessment Outcome"
* . ^definition = "Social Care Assessment Outcome: The outcome of the assessment."

* valueCodeableConcept only CodeableConcept
* valueCodeableConcept ^short = "The outcome of the assessment"

* valueCodeableConcept from Interweave-SocialCareAssessmentOutcome-1 (extensible)
* insert Ruleset-CodingWithSystemCodeDisplay(valueCodeableConcept)