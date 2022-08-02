Alias: $ContactStatus = http://hl7.org/fhir/request-status

ValueSet: InterweaveSocialCareContactStatus
Id: Interweave-SocialCareContactStatus
Description: "This valueset uses codes from the STU3 FHIR request-status code system to indicate the status of the contact."
* ^name = "Interweave Social Care Contact Status"

* $ContactStatus#active "Active"
* $ContactStatus#completed "Completed"
* $ContactStatus#cancelled "Cancelled"
* $ContactStatus#entered-in-error "Entered in Error"
