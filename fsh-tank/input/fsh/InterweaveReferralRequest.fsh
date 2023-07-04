// There is no ReferralRequest in FHIR R4!

// However there is a ServiceRequest that is 90% similar, 
// and the CareConnect ReferralRequest is therefore avaiable here, built over that

// 1) Consider if profiling ReferralRequest is a good idea? (Or should we go straight to the new R4 ServiceRequest?)

// 2) If proceeding, then need to carefully compare STU3 ReferralRequest and R4 ServiceRequest and understand the differences
//    - This is good to do anyway, to consider future migration path
//    - Some fields have been renamed - which is similar to other R4 renames, and easily dealt with in the "convert-STU3" script
//    - A few changes are more significant. In most cases there is a "similar"field in R4 which could be profiled and renamed.
//      However it is possible that some profiling statements might need to be added directly in code in "convert-STU3" script


Profile: InterweaveReferralRequest
Parent: CareConnect-ReferralRequest-1
Id: Interweave-ReferralRequest
Description: "Interweave Referral Request resource profile."
* ^status = #active

* insert Ruleset-InterweaveBaseFields

* extension[Extension-CareConnect-ReferralRequestMethod-1] MS
* extension[Extension-CareConnect-SourceOfReferral-1] MS
//* extension[Extension-CareConnect-SourceOfReferral-1].valueCodeableConcept from https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-SourceOfReferral-1 (preferred)
* extension[Extension-Interweave-R4LocationReference]


* identifier MS

* status 1..1 MS

* basedOn only Reference(CareConnect-ProcedureRequest-1 or CareConnect-ReferralRequest-1)

* intent 1..1 MS
* intent = #order (exactly)

// * specialty 0..1
// * specialty from Interweave-UKCorePracticeSettingCode (preferred)

// * type 1..1 MS
// * type from http://hl7.org/fhir/ValueSet/referral-type (preferred)

* priority 1..1 MS

// * serviceRequested 0..1 MS
// * serviceRequested from Interweave-UkCoreCareServiceType (preferred)

* subject 1..1 MS 
// We only want Patients - not Groups
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)

//   Replace the FHIR valueset with the list of clinical specialty of the clinician or provider - 
//   which appears to be more complete and relevant to the UK, and which offers better coverage of Social Care.
// * specialty from Interweave-UKCorePracticeSettingCode (preferred)
// * insert Ruleset-CodingWithSystemCodeDisplay(specialty)

* supportingInfo 0..*
* supportingInfo only Reference(Questionnaire)

//context in STU3
* encounter MS
* encounter only Reference(CareConnect-Encounter-1)
* encounter ^short = "Optional link to an encounter resource. e.g. contact for hospital discharge assessments linked back to a hospital encounter."

* authoredOn 1..1 MS

* reasonCode MS
* reasonCode from Interweave-R4EncounterReason (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(reasonCode)

* requester 0..1 MS
//* requester only reference(CareConnect-Practitioner-1 or CareConnect-Organization-1 or CareConnect-Patient-1)

///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////

//* definition 0..0
* replaces 0..0
//* groupIdentifier 0..0
* occurrence[x] 0..0
* relevantHistory 0..0