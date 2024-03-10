Profile: InterweaveSlot
Parent: CareConnect-Slot-1
Id: Interweave-Slot
Description: "Interweave Slot resource profile."
// * ^version = "1.0.0"
* ^status = #active
// * ^date = "2023-12-09"
// * ^publisher = "Interweave"

* insert Ruleset-InterweaveBaseFields

///////////////////////////////////////
// --- MANDATORY FIELDS ---
///////////////////////////////////////
// Service Type: A list of types of service for the slot eg "Cardiology Service", “School Nursing Service" etc
//    Appears to be possible, useful and important to populate. (Could be multiple??)
//    We also want to pre-adopt this value set from UK Core which is better than the original FHIR suggestion
//    (More relevant to UK and better coverage of social care)
//    It is based on SNOMED refset 1127531000000102: Services Simple Reference Set
* serviceType 1..* MS
* serviceType from Interweave-UkCoreCareSettingType (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(serviceType)

* schedule 1..1 MS
* schedule only Reference (CareConnect-Schedule-1)

* start 1..1 MS
* end 1..1 MS

* status 1..1 MS
///////////////////////////////////////
// --- MUST SUPPORT FIELDS ---
///////////////////////////////////////
// Delivery Channel (MS) - a useful and simple selection from “in-person”, “telephone”, “video”
// * extension[Extension-CareConnect-DeliveryChannel-1] MS
// * extension[Extension-CareConnect-DeliveryChannel-1] from CareConnectDeliveryChannel1 (preferred)
// * extension contains Extension-CareConnect-DeliveryChannel-1 named deliveryChannel 0..1
// * extension[Extension-CareConnect-DeliveryChannel-1] ^short = "The coded reason for the appointment being cancelled (pre-adopted from R4)"
* extension[Extension-CareConnect-DeliveryChannel-1] MS

// Appointment Type: MS and tighten the list. A simple list of “Routine”, “Emergency”, etc
// Move to our own list which adds "Urgent"
* appointmentType MS
* appointmentType from Interweave-AppointmentType-1 (required)
* insert Ruleset-CodingWithSystemCodeDisplay(appointmentType)

// Specialty: Further describes the type of service / person so useful if known, 
//   Replace the default FHIR valueset with the list of SDS Job Roles - 
//   which appears to be more complete and relevant to the UK, and which offers better coverage of Social Care.
* specialty 0..* MS
* specialty from CareConnect-SDSJobRoleName-1 (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(specialty)

* overbooked MS 
* overbooked ^short = "if this slot has already been overbooked, appointments are unlikely to be accepted for this time. Default value of 'false' is assumed."
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
