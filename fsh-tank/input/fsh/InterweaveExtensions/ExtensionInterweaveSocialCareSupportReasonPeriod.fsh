Extension: ExtensionInterweaveSocialCareSupportReasonPeriod
Id: Extension-Interweave-SocialCareSupportReasonPeriod
Description: "The period during which the person received support for this support reason."
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "Condition" //R3 is just context

* . ..1
* . ^short = "The period during which the person received support for this support reason."
* . ^definition = "The period during which the person received support for this support reason."

* valuePeriod only Period
* valuePeriod.start 1..1
* valuePeriod ^short = "The period during which the person received support for this support reason."
* valuePeriod ^definition = "The period during which the person received support for this support reason."