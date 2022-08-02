Extension: ExtensionInterweaveSocialCareSupportRole
Id: Extension-Interweave-SocialCareSupportRole
Description: "An extension to add a social care support role to a RelatedPerson."
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "RelatedPerson" //R3 is just context

* . ..1
* . ^short = "Social Care Support Role"
* . ^definition = "Social Care Support Role: The role which a person plays in a service user's support"

* extension contains
   supportRoleType 1..1 MS and
   supportRolePeriod 0..1

* extension[supportRoleType].valueCodeableConcept only CodeableConcept
* extension[supportRoleType].valueCodeableConcept ^sliceName = "valueCodeableConcept"
* extension[supportRoleType].valueCodeableConcept from Interweave-SocialCareSupportRole (required)
* extension[supportRoleType] ^short = "The role which a person plays in a service user's support"
* extension[supportRoleType] ^definition = "Social Care Support Role"

* extension[supportRolePeriod].valuePeriod only Period
* extension[supportRolePeriod].valuePeriod ^sliceName = "valuePeriod"
* extension[supportRolePeriod] ^short = "The period during which the support role is active"
* extension[supportRolePeriod] ^definition = "Support role period."
