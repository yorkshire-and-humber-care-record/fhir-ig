Profile: InterweaveSocialCareAssessment
Parent: CareConnect-Task-1
Id: Interweave-SocialCareAssessment
Description: "Interweave Social Care Assessment resource profile (modelled using FHIR Task)"
* ^status = #active

* insert Ruleset-InterweaveBaseFields

///////////////////////////////////////
// --- EXTENSIONS ---
///////////////////////////////////////

* extension contains Extension-Interweave-SocialCareAssessmentOutcome named outcome 0..* MS
* extension[Extension-Interweave-SocialCareAssessmentOutcome] ^short = "The outcome of the assessment."

* extension contains Extension-Interweave-SocialCareAssessmentPerformer named performer 0..1 MS
* extension[Extension-Interweave-SocialCareAssessmentPerformer] ^short = "The practitioner performing the assessment."

///////////////////////////////////////
// --- MANDATORY FIELDS ---
///////////////////////////////////////
* status 1..1 MS
* status from InterweaveSocialCareAssessmentStatus (required)
* status ^short = "A mandatory flag to indicate the status of the assessment."

* intent 1..1 MS
* intent = #plan (exactly)
* intent ^short = "Not relevant to Social Care but is mandated by FHIR therefore we default to Plan"

* code 1..1 MS
* code from InterweaveSocialCareAssessmentType (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(code)
* code.text 1..1 MS
* code ^short = "The type of assessment."

// Every assessment MUST be linked to a patient
* for 1..1 MS 
// Ensure we only have patients referenced here
* for only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(for)
* for ^short = "The person which is subject of the assessment."

* authoredOn 1..1 MS
* authoredOn ^short = "The date that the assessment was first entered in to the source system."

* lastModified 1..1 MS
* lastModified ^short = "The date that the assessment was last updated."

* owner 1..1 MS
* owner only Reference(Interweave-OrganizationalTeam)
* owner ^short = "A reference to the Organizational team which is performing the assessment."


///////////////////////////////////////
// --- MUST SUPPORT FIELDS ---
///////////////////////////////////////

//TODO: limit basedOn to only ref a contact or referral request.
* basedOn 0..1 MS
* basedOn ^short = "The assessment (task resource) or contact (referral request resource) which triggered this assesment."


* executionPeriod 0..1 MS
* executionPeriod.start ^short = "The date/time that the assessment commenced (Or is due to commence should the assessment be in a planned status)"
* executionPeriod.end ^short = "The date/time that the assessment completed."


///////////////////////////////////////
// --- OPTIONAL FIELDS ---
///////////////////////////////////////
* insert Ruleset-AddIdentifierSlicing
* insert Ruleset-AddLocalIdentifierOptional(socialcareassessment)

* description ^short = "An additional description of the assessment over and above the name."

// TODO: this field is named context in STU3 and had a choice to ref both EoC and Encounter resources
* encounter only Reference (CareConnect-Encounter-1)
* encounter ^short = "Optional link to an Encounter resource which maybe associated with the assessment"

* output.value[x] only Reference(CareConnect-DocumentReference-1) // TODO: limit to document reference only
* output.type from InterweaveSocialCareAssessmentOutputType (required)
* output.type.coding.code = #DOC (exactly)


///////////////////////////////////////
// --- Discouraged fields ---
///////////////////////////////////////

//None


///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////


* groupIdentifier 0..0

* partOf 0..0

* statusReason 0..0

* businessStatus 0..0

* priority 0..0

* focus 0..0

* requester 0..0

* performerType 0..0

* note 0..0

* relevantHistory 0..0

* restriction 0..0

* input 0..0

* extension[Extension-CareConnect-IncrementNumber-1] 0..0

* extension[Extension-CareConnect-FailsafeRuleVersion-1] 0..0

* reasonCode 0..0 

// * definition 0..0 - TODO: deprecated in R4 

/* For reference - these fields are in R4 but not STU3
* location 0..0 
* reasonCode 0..0 
* reasonReference 
* insurance 0..0 
* instantiatesCanonical 0..0
* instantiatesUri 0..0
*/

// *************************************************************************************************************************
// EXAMPLES -
// *************************************************************************************************************************
/*
Instance: InterweaveSocialCareAssessmentExample-MS
InstanceOf: InterweaveSocialCareAssessment
Description: "Interweave Social Care Assessment example - Must Support"

* insert Ruleset-ExampleMetaForSocialCare(SocialCareAssessment)
//Add care connect profile manually
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Task-1"

* basedOn = Reference(InterweaveSocialCareAssessmentExample-HD)

* status = http://hl7.org/fhir/stu3/codesystem-task-status#completed "Completed"

* intent = http://hl7.org/fhir/request-intent#plan "Plan"

* code = Interweave-SocialCareAssessmentType-1#RA "Reablement Assessment"
* code.text = "First Reablement Team Assessment"

* for = Reference(InterweavePatientExample-MustSupport) 
* for.display = "Mr Fred BLOGGS"

* executionPeriod.start = "2022-07-09T09:00:00Z" 
* executionPeriod.end = "2022-07-09T11:00:00Z" 

* authoredOn = "2022-07-10T09:00:00Z" 

* lastModified = "2022-07-10T09:00:00Z" 

* owner = Reference(InterweaveSocialCareOrganisationalTeamExampleMS) 
* owner.display = "The reablement team"

* extension[Extension-Interweave-SocialCareAssessmentOutcome].valueCodeableConcept =  Interweave-SocialCareAssessmentOutcome-1#PRO-RASS "Progress to Re-assessment"

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: InterweaveSocialCareAssessmentExample-HD
InstanceOf: InterweaveSocialCareAssessment
Description: "Interweave Social Care Assessment example - Hospital Discharge"

* insert Ruleset-ExampleMetaForSocialCare(SocialCareAssessment)
//Add care connect profile manually
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Task-1"

//* text.status = https://www.hl7.org/fhir/STU3/codesystem-narrative-status.html#empty "Empty"
//* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Text Not Provided</div>"
 
//* basedOn = Reference(InterweaveSocialCareContactExample-Full) TODO

* status = http://hl7.org/fhir/stu3/codesystem-task-status#completed "Completed"

* intent = http://hl7.org/fhir/request-intent#plan "Plan"

* code = Interweave-SocialCareAssessmentType-1#HD	"Hospital Discharge Assessment"
* code.text = "Hospital Discharge Assessment"

* for = Reference(InterweavePatientExample-MustSupport) 
* for.display = "Mr Fred BLOGGS"

* executionPeriod.start = "2022-07-07T09:00:00Z" 
* executionPeriod.end = "2022-07-07T11:00:00Z" 

* authoredOn = "2022-07-08T09:00:00Z" 

* lastModified = "2022-07-10T09:00:00Z" 

* owner = Reference(InterweaveSocialCareOrganisationalTeamExampleMS) 
* owner.display = "The reablement team"

* extension[Extension-Interweave-SocialCareAssessmentOutcome].valueCodeableConcept =  Interweave-SocialCareAssessmentOutcome-1#PRO-R "Progress to Reablement/ST-Max"



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: InterweaveSocialCareAssessmentExample-Full
InstanceOf: InterweaveSocialCareAssessment
Description: "Interweave Social Care Assessment example - Full"

* insert Ruleset-ExampleMetaForSocialCare(SocialCareAssessment)
//Add care connect profile manually
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Task-1"

* insert Ruleset-ExampleLocalId(SocialCareAssessment, XXX.ASS-ABC123)

* basedOn = Reference(InterweaveSocialCareAssessmentExample-HD)

* status = http://hl7.org/fhir/stu3/codesystem-task-status#completed "Completed"

* intent = http://hl7.org/fhir/request-intent#plan "Plan"

* code = Interweave-SocialCareAssessmentType-1#RA "Reablement Assessment"
* code.text = "First Reablement Team Assessment"

* description = "Reablement assessment with OT and daughter present."

* for = Reference(InterweavePatientExample-MustSupport) 
* for.display = "Mr Fred BLOGGS"

// context in STU3
* encounter = Reference(InterweaveEncounterExample-MaturityLevel1) 

* executionPeriod.start = "2022-07-09T09:00:00Z" 
* executionPeriod.end = "2022-07-09T11:00:00Z" 

* authoredOn = "2022-07-10T09:00:00Z" 

* lastModified = "2022-07-11T11:15:00Z" 

* owner = Reference(InterweaveSocialCareOrganisationalTeamExampleMS) 
* owner.display = "The reablement team"

* performer = Reference(InterweavePractitionerExample)

//* output[0] = Reference(TODO reference to a document) 
//* output[0].type = Interweave-SocialCareAssessmentOutputType-1#DOC "DocumentReference"

* extension[Extension-Interweave-SocialCareAssessmentOutcome].valueCodeableConcept =  Interweave-SocialCareAssessmentOutcome-1#PRO-RASS "Progress to Re-assessment"

*/