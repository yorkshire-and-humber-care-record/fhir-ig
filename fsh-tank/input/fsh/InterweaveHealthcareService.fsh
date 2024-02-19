Profile: InterweaveHealthcareService
Parent: CareConnect-HealthcareService-1
Id: Interweave-HealthcareService
Description: "Interweave HealthcareService resource profile - DRAFT."
* ^status = #draft

* insert Ruleset-InterweaveBaseFields

///////////////////////////////////////
// --- MANDATORY FIELDS ---
///////////////////////////////////////

* active 1..1 MS

// Type: A list of types of service for the appointment eg "Cardiology Service", “School Nursing Service" etc
//    Appears to be possible, useful and important to populate. (Could be multiple??)
//    We also want to pre-adopt this value set from UK Core which is better than the original FHIR suggestion
//    (More relevant to UK and better coverage of social care)
//    It is based on SNOMED refset 1127531000000102: Services Simple Reference Set
* type 1..* MS
* type from Interweave-UkCoreCareSettingType (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(type)

* name 1..1 MS
///////////////////////////////////////
// --- MUST SUPPORT FIELDS ---
///////////////////////////////////////

// Specialty: leave optional. Further describes the type of service / person so useful if known, 
//   Replace the default FHIR valueset with the list of SDS Job Roles - 
//   which appears to be more complete and relevant to the UK, and which offers better coverage of Social Care.
* specialty from CareConnect-SDSJobRoleName-1 (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(specialty)

* telecom 0..* MS

* coverageArea 0..* MS

* appointmentRequired 0..1 MS

* availableTime 0..* MS
///////////////////////////////////////
// --- OPTIONAL FIELDS ---
///////////////////////////////////////
// Service Category: In FHIR this is a short list of broad categories at a higher-level then Service Type
* category from http://terminology.hl7.org/ValueSet/service-category (preferred)

* referralMethod from CareConnectReferralRequestMethod (preferred)

* characteristic from InterweaveCodesCharacteristicServiceMode (preferred)

* extension contains Extension-Interweave-R4HealthcareServiceProgram named program 0..1
* extension[Extension-Interweave-R4HealthcareServiceProgram] ^short = "Programs that this service is applicable to (pre-adopted from R4)"
///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////

* extraDetails 0..0
* photo 0..0
* endpoint 0..0
* eligibility 0..0
//* eligibilityNote 0..0
//* programName 0..0 
///////////////////////////////////////
// --- Discouraged fields ---
///////////////////////////////////////
* notAvailable 0..*
* notAvailable ^short = "DISCOURAGED - Not available during this time due to provided reason"


// *************************************************************************************************************************
// EXAMPLES
// *************************************************************************************************************************
