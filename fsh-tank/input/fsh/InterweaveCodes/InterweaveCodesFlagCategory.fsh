ValueSet: InterweaveFlagCategory
Id: Interweave-FlagCategory-1
Description: "Defines the set of codes that can be used to identify the category of flag which has been placed against a patient."
* ^name = "Interweave Flag Category"
* include codes from system Interweave-SocialCareFlagCategory-1


CodeSystem: InterweaveSocialCareFlagCategory
Id: Interweave-SocialCareFlagCategory-1
Description: "The categorisation of social care flags which can be placed against a person."
* ^name = "InterweaveSocialCareFlagCategory"
* ^content = #complete
* ^caseSensitive = true

* #RTO "Risk to other"
* #RTS "Risk to self"
* #SGC "Safeguarding concern"
* #OTH "Other"
