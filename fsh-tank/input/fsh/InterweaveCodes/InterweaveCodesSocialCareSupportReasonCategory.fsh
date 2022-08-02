ValueSet: InterweaveSocialCareSupportReasonCategory
Id: Interweave-InterweaveSocialCareSupportReasonCategory-1
Description: "Defines the set of codes that can be used to identify the category of support reason."
* ^name = "Interweave Social Care Support Reason Category"

// Include the standard care connect codes
* include codes from valueset https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ConditionCategory-1
* include codes from system Interweave-SocialCareSupportReasonCategory-1


CodeSystem: InterweaveSocialCareSupportReasonCategory
Id: Interweave-SocialCareSupportReasonCategory-1
Description: "The categorisation of the social care support reason."
* ^name = "InterweaveSocialCareSupportReasonCategory"
* ^content = #complete
* ^caseSensitive = true

* #LDS "Learning Disability Support"
* #MHS "Mental Health Support"
* #PS "Physical Support"
* #SMC "Support with Memory and Cognition"
* #SOS "Social Support"
* #SS "Sensory Support"
* #UNK "PSR Not Known"
