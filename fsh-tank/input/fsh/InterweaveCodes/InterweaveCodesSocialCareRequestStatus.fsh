Alias: $RequestStatus = http://hl7.org/fhir/request-status

ValueSet: InterweaveSocialCareRequestStatus
Id: Interweave-SocialCareRequestStatus
Description: "This valueset uses codes from the STU3 FHIR request-status code system to indicate the status of the request."
* ^name = "Interweave Social Care Request Status"


* $RequestStatus#draft "Draft"
* $RequestStatus#active "Active"
* $RequestStatus#cancelled "Cancelled"
* $RequestStatus#completed "Completed"
* $RequestStatus#entered-in-error "Entered in Error"