Profile: InterweaveSchedule
Parent: CareConnect-Schedule-1
Id: Interweave-Schedule
Description: "Interweave Schedule resource profile - DRAFT."
* ^status = #draft

* insert Ruleset-InterweaveBaseFields

///////////////////////////////////////
// --- MANDATORY FIELDS ---
///////////////////////////////////////
* actor 1..* MS

* active 1..1 MS
// Service Type: A list of types of service for the slot eg "Cardiology Service", “School Nursing Service" etc
//    Appears to be possible, useful and important to populate. (Could be multiple??)
//    We also want to pre-adopt this value set from UK Core which is better than the original FHIR suggestion
//    (More relevant to UK and better coverage of social care)
//    It is based on SNOMED refset 1127531000000102: Services Simple Reference Set
* serviceType 1..* MS
* serviceType from Interweave-UkCoreCareSettingType (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(serviceType)

* planningHorizon 1..1 MS
* planningHorizon.start 1..1 MS
///////////////////////////////////////
// --- MUST SUPPORT FIELDS ---
///////////////////////////////////////
// Specialty: Further describes the type of service / person so useful if known, 
//   Replace the default FHIR valueset with the list of SDS Job Roles - 
//   which appears to be more complete and relevant to the UK, and which offers better coverage of Social Care.
* specialty 0..* MS
* specialty from CareConnect-SDSJobRoleName-1 (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(specialty)
///////////////////////////////////////
// --- OPTIONAL FIELDS ---
///////////////////////////////////////
// Service Category: In FHIR this is a short list of broad categories at a higher-level then Service Type
* serviceCategory from http://terminology.hl7.org/ValueSet/service-category (preferred)

///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////


///////////////////////////////////////
// --- Discouraged fields ---
///////////////////////////////////////


// *************************************************************************************************************************
// EXAMPLES
// *************************************************************************************************************************
