Alias: $SCT = http://snomed.info/sct

Profile: YhcrAppointment
Parent: CareConnect-Appointment-1
Id: Yhcr-Appointment
Description: "YHCR Appointment resource profile."
* ^status = #draft

///////////////////////////////////////
// --- CARE CONNECT EXTENSIONS ---
///////////////////////////////////////

// Delivery Channel (MS) - a useful and simple selection from “in-person”, “telephone”, “video”
* extension[Extension-CareConnect-DeliveryChannel-1] MS

// Appointment Cancellation Reason (MS) - Obviously only relevant if the appointment has been cancelled. 
// However in that case it is useful to populate – to understand why it was cancelled
// However it is text only - not coded...
* extension[Extension-CareConnect-AppointmentCancellationReason-1] MS

// Booking Organisations - difficult to see why this is needed
// - if the organisation making the booking, then see “incomingReferral”
// - If the organisation taking the booking then see provenance tags
* extension[Extension-CareConnect-BookingOrganisation-1] ^short = "DISCOURAGED - use referral, or provenance tags instead"


///////////////////////////////////////
// --- Main Fields ---
///////////////////////////////////////

// Identifier:
// This is a business identifier for the Appointment.
// The value for a local identifier must be populated and contain the internal id for this Appointment on the providing system
// Thus providing a link back for any follow-up and/or troubleshooting
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.ordered = false
* identifier ^slicing.rules = #open
* identifier contains
    localIdentifier 0..1 MS

* identifier[localIdentifier].system 1..1 MS
* identifier[localIdentifier].system = "https://yhcr.org/Id/local-appointment-identifier" (exactly)
* identifier[localIdentifier].value 1..1
* identifier[localIdentifier].value ^short = "The Local Appointment Identifier"
// Period assumed to match that of the Encounter
* identifier[localIdentifier].period 0..0
// Assigner assumed to match provenance of the Encounter
* identifier[localIdentifier].assigner 0..0


// Status: already mandatory in FHIR
* status MS


// Service Category: leave optional. In FHIR this is a short list of broad categories at a higher-level then Service Type
//   However CareConnect has somewhat confused matters by instead linking it to SDS Job Roles
//   This isn't the same idea at all, and would have been more appropriate for "specialty"?
//   Leave optional therefore

// Service Type: A list of types of appointment eg “Urology”, “Community Health”, “Social Support” etc
//    Appears to be possible, useful and important to populate.
//    (Could be multiple??)
//    Tighten up to use the FHIR list (is this OK?)
* serviceType 1..* MS
* serviceType from http://hl7.org/fhir/ValueSet/service-type (required)

// Specialty: leave optional. Further describes the type of service / person so useful if known, 
// although the list seems very acute-focused. Overall, confusing between this and Service Category.

// Appointment Type: MS and tighten the list. A simple list of “Routine”, “Emergency”, etc
* appointmentType MS
* appointmentType from http://hl7.org/fhir/ValueSet/v2-0276 (required)

// Reason: MS The reason for making the appointment – ie a list of SNOMED codes for various medical problems.
// Does not look very “social care” friendly – an extended or alternative list may be needed if we decide that appointments are relevant to social care?
// NB "reasonCode" (R4) -> "reason" (STU3)
* reasonCode MS
* reasonCode from http://hl7.org/fhir/ValueSet/encounter-reason (required)

// Indication: A reference to further detail about either the Condition or Procedure which is the reason for the appointment
//  May not always be available, but should be populated if these resources are supported and relevant
// NB "reasonReference" (R4) -> "indication" (STU3)
* reasonReference MS

// Priority - discouraged
* priority ^short = "DISCOURAGED - More applicable to internal scheduling"

// Description: MS. Useful to populate as a textual summary for displaying
//   (If relevant in addition to time, location, service)
* description MS

// Supporting Information: Discouraged. A pointer to almost any other information
* supportingInformation ^short = "DISCOURAGED - very broad, and so difficult for a consumer to handle"

// Start: Must always be populated unless the appointment is still only at status “proposed”
* start MS
// End: Leave optional. Generally should not be used in favour of populating “start” and “minutesDuration”.
//    May however be used to indicate that the appointment is within a general timeslot ie 10 mins between 9:00 and 11:00
// MinutesDuration: Should always be populated to indicate how long the appointment is
* minutesDuration MS

// Slot: Discouraged
* slot ^short = "DISCOURAGED - Relevant to a scheduling system, but less so to a regional shared record"

// Created: Mandatory - basic information about when it was created
* created 1..1 MS

// Comment - leave optional. Key point is to use with care, as it may be viewed by the patient
//  (Note: R4 has an extra field "patientInstruction", but "comment" has to cover this too in STU3)
* comment ^short = "Additional comments. NB: It must be assumed that this comment will be widely viewed across the region, including by the patient themselves"

// Incoming referral: A reference to the Referral which led to the appointment.
// Useful to provide if relevant and available
// NB "basedOn" (R4) -> "incomingReferral" (STU3)
* basedOn MS

// RequestedPeriod: Discouraged
* requestedPeriod ^short = "DISCOURAGED - Relevant to a scheduling system, but less so to a regional shared record"


//////////////////////////////
// Participant:
//////////////////////////////
// This is a complicated field that allows for referencing almost any person, location or equipment involved in the appointment. This includes the patient themselves. Arguably it would have been easier if FHIR had defined several distinct fields for each of these concepts.
// Furthermore the list of “type” codes provided appears to have been reused from elsewhere and is not well equipped to distinguish these concepts.

// The field is already mandatory in FHIR
* participant MS

// Allow only one "type" per participant. Pick the main one. (Or list the whole participant several times)
// To the normal valueset extend with the standard codes for SBJ (subject) and LOC (location)
* participant.type 1..1 MS
* participant.type from Yhcr-AppointmentParticipationType-1 (required)
// We also need an actor, and FHIR insists on a status. Leave the other bits optional ("required", "period") 
* participant.actor 1..1 MS
* participant.status MS

// Now we can slice it - to specify that we need the Subject, and want the Location and Primary Performer
// (Leave the slicing open to not exclude others in future, but it is these three that we are expecting)
* participant ^slicing.discriminator.type = #value
* participant ^slicing.discriminator.path = "type"
* participant ^slicing.ordered = false
* participant ^slicing.rules = #open
* participant contains
    subject 1..1 MS and
    location 0..1 MS and
    primaryPerformer 0..1 MS

* participant[subject].type =  http://hl7.org/fhir/v3/ParticipationType#SBJ "subject" (exactly)
* participant[subject].actor 1..1 MS
* participant[subject].actor only Reference(Patient)

* participant[location].type =  http://hl7.org/fhir/v3/ParticipationType#LOC "location" (exactly)
* participant[location].actor 1..1 MS
* participant[location].actor only Reference(Location)

* participant[primaryPerformer].type =  http://hl7.org/fhir/v3/ParticipationType#PPRF "primary performer" (exactly)
* participant[primaryPerformer].actor 1..1 MS
* participant[primaryPerformer].actor only Reference(Practitioner)