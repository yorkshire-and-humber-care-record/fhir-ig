Alias: $Status = http://hl7.org/fhir/stu3/codesystem-task-status

ValueSet: InterweaveSocialCareAssessmentStatus
Id: Interweave-SocialCareAssessmentStatus
Description: "This valueset uses codes from the STU3 FHIR task-status code system to indicate the status of the assessment."
* ^name = "Interweave Social Care Assessment Status"

* $Status#accepted "Accepted"
* $Status#in-progress "In Progress"
* $Status#completed "Completed"
* $Status#entered-in-error "Entered in Error"
