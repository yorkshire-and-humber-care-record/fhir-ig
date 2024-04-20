ValueSet: InterweaveFlagCategory
Id: Interweave-FlagCategory-1
Description: "Defines the set of codes that can be used to identify the category of flag which has been placed against a patient."
* ^name = "Interweave Flag Category"

//SNOMED concepts to include:
* include codes from system SNOMED_CT where concept is-a #303186005 //Legal status of patient
//Locally defined codes:
* include codes from system Interweave-SocialCareFlagCategory-1


CodeSystem: InterweaveSocialCareFlagCategory
Id: Interweave-SocialCareFlagCategory-1
Description: "The categorisation of social care flags which can be placed against a person."
* ^name = "InterweaveSocialCareFlagCategory"
* ^content = #complete
* ^caseSensitive = true

* #RTO "Risk to other"
* #RTS "Risk to self"
* #RSO "Risk to self & others"
* #SGC "Safeguarding concern"
* #OTH "Other"
