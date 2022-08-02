Extension: ExtensionInterweaveSocialCareServiceTrigger
Id: Extension-Interweave-SocialCareServiceTrigger
Description: "Reference to an assessment which triggered the start of the service."
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "EpisodeOfCare" //R3 is just context

* . ..1
* . ^short = "Reference to an assessment which triggered the start of the service."
* . ^definition = "Reference to an assessment which triggered the start of the service."

* valueReference only Reference(CareConnect-Task-1)
* valueReference ^short = "Reference to an assessment which triggered the start of the service."
* valueReference ^definition = "Reference to an assessment which triggered the start of the service."