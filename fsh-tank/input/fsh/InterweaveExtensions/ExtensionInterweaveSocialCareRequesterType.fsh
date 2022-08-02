Extension: ExtensionInterweaveSocialCareRequesterType
Id: Extension-Interweave-SocialCareRequesterType
Description: "An extension to add a the type of person contacting/make a request to, social care."
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "InterweaveSocialCareContact" //R3 is just context

* . ..1
* . ^short = "Social Care Requester Type"
* . ^definition = "Social Care Support Requester: The type of person who has either placed a request or made contact with social care"

* valueCodeableConcept only CodeableConcept
* valueCodeableConcept ^short = "The type of person who has either placed a request or made contact with social care"

* valueCodeableConcept from Interweave-SocialCareRequesterType-1 (extensible)
* insert Ruleset-CodingWithSystemCodeDisplay(valueCodeableConcept)