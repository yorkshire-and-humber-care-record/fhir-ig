Alias: $QuestionnaireResponseStatus = http://hl7.org/fhir/questionnaire-answers-status

ValueSet: InterweaveCodesQuestionnaireResponseStatus
Id: Interweave-CodesQuestionnaireResponseStatus-1
Description: "Defines the set of codes that defines the lifecycle status of the questionnaire response."
* ^name = "Interweave Questionnaire Response Status"

* $QuestionnaireResponseStatus#completed "Completed"
* $QuestionnaireResponseStatus#amended "Amended"
* $QuestionnaireResponseStatus#entered-in-error "Entered in Error"