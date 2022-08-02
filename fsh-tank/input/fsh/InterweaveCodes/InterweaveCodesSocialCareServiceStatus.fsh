Alias: $EoCStatus = http://hl7.org/fhir/episode-of-care-status

ValueSet: InterweaveSocialCareServiceStatus
Id: Interweave-SocialCareServiceStatus
Description: "This valueset uses codes from the STU3 FHIR episode-of-care-status code system to indicate the status of the service."
* ^name = "Interweave Social Care Service Status"

* $EoCStatus#planned "Planned"
* $EoCStatus#active "Active"
* $EoCStatus#onhold "On Hold"
* $EoCStatus#finished "Finished"
* $EoCStatus#entered-in-error "Entered in Error"