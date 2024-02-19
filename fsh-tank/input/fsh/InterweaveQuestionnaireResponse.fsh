Profile: InterweaveQuestionnaireResponse
Parent: CareConnect-QuestionnaireResponse-1
Id: Interweave-QuestionnaireResponse
Description: "Interweave QuestionnaireResponse resource profile - DRAFT."
* ^status = #draft

* insert Ruleset-InterweaveBaseFields

///////////////////////////////////////
// --- MANDATORY FIELDS ---
///////////////////////////////////////
// restricting the required values by removing 'in-progress' and 'stopped'
//https://chat.fhir.org/#narrow/stream/179166-implementers/topic/Constraining.20Required.20value.20sets

* status 1..1 MS 
* status from InterweaveCodesQuestionnaireResponseStatus (required)
* status ^short = "completed | amended | entered-in-error"

* subject 1..1 MS 
// We only want Patients - not Groups
* subject only Reference(Interweave-Patient)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)

* authored 1..1 MS
* author 1..1 MS
///////////////////////////////////////
// --- MUST SUPPORT FIELDS ---
///////////////////////////////////////
// Context: (MS)
//   A reference to the Encounter for which the response of the questionnaire has been received.
//   This is likely to be very useful and should be provided if at all possible.
* encounter MS  // R4 encounter -> STU3 Context
* encounter only Reference(CareConnect-Encounter-1)
* insert Ruleset-ReferenceWithReferenceOnly(encounter)

* item MS
* item.text 1..1 MS
///////////////////////////////////////
// --- OPTIONAL FIELDS ---
///////////////////////////////////////

///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////


///////////////////////////////////////
// --- Discouraged fields ---
///////////////////////////////////////
// * partOf 0..*
// * partOf ^short = "DISCOURAGED - We are expecting the simple flat structure "

// *************************************************************************************************************************
// EXAMPLES
// *************************************************************************************************************************
