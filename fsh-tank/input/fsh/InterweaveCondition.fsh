Alias: $SCT = http://snomed.info/sct

Profile: InterweaveCondition
Parent: CareConnect-Condition-1
Id: Interweave-Condition
Description: "Interweave Condition resource profile - DRAFT"
* ^status = #draft

* insert Ruleset-InterweaveBaseFields


// Extension - CareConnect Episodicity: Leave optional
//  Optional additional information if available
* extension[Extension-CareConnect-ConditionEpisode-1] ^short = "DISCOURAGED"

// Identifier: (MS)
// This is a business identifier for the Condition.
// The value for a local identifier must be populated and contain the internal id for this Condition on the providing system
// Thus providing a link back for any follow-up and/or troubleshooting
* insert Ruleset-AddIdentifierSlicing
* insert Ruleset-AddLocalIdentifierMS(condition)


// Clinical Status: (Mandatory)
//  Essential to explain the status of the condition – eg is it currently active.
* clinicalStatus 1..1 MS

// Verification Status: (Removed by Care Connect)
//   (We thought this looked important - may even indicate that it is "refuted"! However CareConnect has removed it)

// Category (optional)
// This field provides an opportunity to classify a Condition as either “Encounter Diagnosis” or “Problem List Item”.
// This basic FHIR list doesn't seem much point, but CareConnect adds some more values which makes it look a bit more useful
// So optional
* category 0..* MS
* category from https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ConditionCategory-1 (required)

// Severity (Must Support)
// A simple categorisation of “simple”, “moderate”, or “mild”. May be useful if known, but will not be relevant to all types of condition
* severity 0..1 MS

// Code (mandatory)
//  Essential to provide to describe what the condition actually is.
//  We pre-adopt the UKCore code list - which extends the standard FHIR list by adding codes for social care and A&E
* code 1..1 MS
* code from Interweave-UkCoreCareConditionCode (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(code)


// Body Site: (MS)
//     Snomed coding for the affected body part. Important to provide if possible and relevant
//     (Note that it could be a list)
* bodySite MS
* bodySite from http://hl7.org/fhir/ValueSet/body-site (required)
* insert Ruleset-CodingWithSystemCodeDisplay(bodySite)
// * bodySite.coding[snomedCT] 1..1 MS
// * bodySite.coding[snomedCT] from http://hl7.org/fhir/ValueSet/body-site (required)

// Subject: Is already mandatory. Essential reference to the patient (only)
* subject MS 
//   We only want Patients - not Groups
* subject only Reference(CareConnect-Patient-1)
* subject ^short = "Who has the condition? (A patient, NOT group)"
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)

// Context: (MS)
//   Will not be relevant to all Conditions (eg historical lists), 
//   but should be populated if there is a relevant Encounter to link the Condition to.
* encounter MS  // R4 encounter -> STU3 Context
* encounter only Reference(CareConnect-Encounter-1)
* insert Ruleset-ReferenceWithReferenceOnly(encounter)

// Onset and Abatement: (MS)
//   Important to provide if at all possible –
//   For Onset the only reason for not providing would be if the onset is genuinely not known (eg a long-standing historical condition)
//   For Abatement then obviously only relevant if it IS in abatment
//   There are a number of choices - date, age, etc. They all seem relevant, in which case assumption must be that a consumer can display all
//   To consider... do we need a timeline date?
* onset[x] only dateTime
* onset[x] 0..1 

//* abatement[x] MS
// Note that abatementBoolean is deprecated in FHIR R4

// Asserted Date: (Mandatory)
//   Vital information about when the condition was noted. 
//   Provides essential guidance for a viewer about the recency and thus likely relevance / accuracy of historical records
* recordedDate 1..1 MS   // R4 recordedDate -> STU3 assertedDate


// Asserter: (MS)
//   Required to populate if known.
//   Povides details of a Practitioner who can give more information about the condition. 
//   Could maybe also be the patient etc - perhaps more discussion about the implications of this?
//   Useful to say that if not provided then an unknown Practitioner may be assumed
* asserter MS
* insert Ruleset-ReferenceWithReferenceAndDisplay(asserter)

// Stage: (Optional)
//    Clearly not applicable to all conditions, but useful where it is applicable (eg cancer)
//    Possibly worth further discussion, to see if/how used and if there is call for further specification of a consistent approach?
* stage.summary 1..1 MS
* stage.summary from http://hl7.org/fhir/ValueSet/condition-stage (required)
* stage.assessment only Reference (DiagnosticReport or CareConnect-Observation-1)
// * stage.type 0..1 MS
// * stage.type from http://hl7.org/fhir/ValueSet/condition-stage-type (preferred)
// Evidence (Optional)
//    To some extent duplicates the “code”, but may optionally provide further information about what led to this code being assigned
//    Do not want "detail" pointer to any other resource, as difficult for a consumer to display. (Discuss use-case and specify first)
* evidence.detail 0..0
* evidence.code MS
* evidence.code from http://hl7.org/fhir/ValueSet/manifestation-or-symptom (preferred)

// Note (Optional)
* note ^short = "Additional information about the Condition. NB: Any notes may be shared widely across the region, including being viewed by the patient themselves"



////////////////////////////////////////////////////////////////////////////////////////
// Examples
////////////////////////////////////////////////////////////////////////////////////////



// Instance: InterweaveConditionExample
// InstanceOf: InterweaveCondition
// Description: "Interweave Condition example"

// * insert Ruleset-ExampleMetaForHospital(Condition)

// // Text summary no longer needed
// // (Code description + clinical status)
// //* extension[Extension-Interweave-TextSummary].valueString = "Paraffinoma of skin: Active"

// * insert Ruleset-ExampleLocalId(condition, RCB.COND-456-XYZ)

// //* clinicalStatus = http://hl7.org/fhir/condition-clinical#active "Active"
// * clinicalStatus = #active 

// * code.coding[0] = $SCT#299007 "Paraffinoma of skin" 
// * bodySite.coding[0] =  $SCT#2059009 "Skin of ear lobule"

// * subject = Reference(InterweavePatientExample-MustSupport) 
// * subject.display = "Mr Fred BLOGGS"

// * encounter = Reference(InterweaveEncounterExample-MaturityLevel1) // R4 encounter -> STU3 context
// //* encounter.display = "09/01/2022 09:00 - 11/01/2022 14:30 : Inpatient Actute : Dermatology"

// * onsetDateTime = "2020-04-01T00:00:00Z"   
// * abatementString = "During summer holidays 2021"
// * recordedDate = "2020-06-09T09:00:00Z"  //recordedDate -> STU3 assertedDate

// * asserter = Reference(InterweavePractitionerExample)
// * asserter.display = "Dr Jane BLOGGS"
// //* asserter.identifier.system = "https://fhir.nhs.uk/Id/sds-user-id"
// //* asserter.identifier.value = "ABC123"

