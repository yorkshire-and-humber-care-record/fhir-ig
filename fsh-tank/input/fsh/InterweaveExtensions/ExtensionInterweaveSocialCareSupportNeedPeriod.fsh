Extension: ExtensionInterweaveSocialCareSupportNeedPeriod
Id: Extension-Interweave-SocialCareSupportNeedPeriod
Description: "The period during which the person's needs were identified for support."
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "Condition" //R3 is just context

* . ..1
* . ^short = "The period during which the person's needs were identified for support."
* . ^definition = "The period during which the person's needs were identified for support."

* valuePeriod only Period
* valuePeriod.start 1..1
* valuePeriod ^short = "The period during which the person's needs were identified for support."
* valuePeriod ^definition = "The period during which the person's needs were identified for support."