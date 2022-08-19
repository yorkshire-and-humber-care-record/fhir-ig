Extension: ExtensionInterweaveSocialCareServiceCategory
Id: Extension-Interweave-SocialCareServiceCategory
Description: "An extension to add a categorisation to the type of service that a person is receiving"
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "InterweaveSocialCareServiceCategory" //R3 is just context

* . ..1
* . ^short = "Social Care Service Category"
* . ^definition = "Social Care Support Service Category: A categorisation of the type of service that a person is receiving."

* valueCodeableConcept only CodeableConcept
* valueCodeableConcept ^short = "A categorisation of the type of service that a person is receiving."

* valueCodeableConcept from Interweave-SocialCareServiceCategory-1 (required)
* insert Ruleset-CodingWithSystemCodeDisplay(valueCodeableConcept)