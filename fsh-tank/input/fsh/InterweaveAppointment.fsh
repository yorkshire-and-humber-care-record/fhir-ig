Alias: $SCT = http://snomed.info/sct

Profile: InterweaveAppointment
Parent: CareConnect-Appointment-1
Id: Interweave-Appointment
Description: "Interweave Appointment resource profile."
* ^status = #draft

* insert Ruleset-InterweaveBaseFields

///////////////////////////////////////
// --- CARE CONNECT EXTENSIONS ---
///////////////////////////////////////

// Delivery Channel (MS) - a useful and simple selection from “in-person”, “telephone”, “video”
* extension[Extension-CareConnect-DeliveryChannel-1] MS

// Appointment Cancellation Reason (MS) - Obviously only relevant if the appointment has been cancelled. 
// However in that case it is useful to populate – to understand why it was cancelled
// Care Connect offers a free-text extension, which we strike out
// Instead we pre-adopt the field from R4, which offers a better coded list of reasons
* extension[Extension-CareConnect-AppointmentCancellationReason-1] 0..0
* extension contains Extension-Interweave-R4AppointmentCancellationReason named appointmentCancellationReasonR4 0..1
* extension[Extension-Interweave-R4AppointmentCancellationReason] ^short = "The coded reason for the appointment being cancelled (pre-adopted from R4)"
* extension[Extension-Interweave-R4AppointmentCancellationReason] MS



// Booking Organisations - difficult to see why this is needed
// - if the organisation making the booking, then see “incomingReferral”
// - If the organisation taking the booking then see provenance tags
* extension[Extension-CareConnect-BookingOrganisation-1] ^short = "DISCOURAGED - use referral, or provenance tags instead"


// PLUS our own (optional) extension - to pre-adopt the useful R4 field of "patientInstruction"
* extension contains Extension-Interweave-R4PatientInstruction named patientInstruction 0..1
* extension[Extension-Interweave-R4PatientInstruction] ^short = "Detailed information and instructions for the patient"



///////////////////////////////////////
// --- Main Fields ---
///////////////////////////////////////

// Identifier:
// This is a business identifier for the Appointment.
// The value for a local identifier must be populated and contain the internal id for this Appointment on the providing system
// Thus providing a link back for any follow-up and/or troubleshooting
* insert Ruleset-AddLocalIdentifier(appointment)
 
// Status: already mandatory in FHIR
* status MS


// Service Category: Discouraged. In FHIR this is a short list of broad categories at a higher-level then Service Type
//   However CareConnect has somewhat confused matters by instead linking it to SDS Job Roles
//   This isn't the same idea at all, and would have been more appropriate for "specialty"?
* serviceCategory ^short = "DISCOURAGED - Unfortunately CareConnect has prescribed an inappropriate valueset for this field, which negates its use."

// Service Type: A list of types of service for the appointment eg "Cardiology Service", “School Nursing Service" etc
//    Appears to be possible, useful and important to populate. (Could be multiple??)
//    We also want to pre-adopt this value set from UK Core which is better than the original FHIR suggestion
//    (More relevant to UK and better coverage of social care)
//    It is based on SNOMED refset 1127531000000102: Services Simple Reference Set
* serviceType 1..* MS
* serviceType from Interweave-UkCoreCareSettingType (required)
* insert Ruleset-CodingWithSystemCodeDisplay(serviceType)


// Specialty: leave optional. Further describes the type of service / person so useful if known, 
//   Replace the default FHIR valueset with the list of SDS Job Roles - 
//   which appears to be more complete and relevant to the UK, and which offers better coverage of Social Care.
* specialty from CareConnect-SDSJobRoleName-1 (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(specialty)

// Appointment Type: MS and tighten the list. A simple list of “Routine”, “Emergency”, etc
// Move to our own list which adds "Urgent"
* appointmentType MS
//* appointmentType from http://hl7.org/fhir/ValueSet/v2-0276 (required)
* appointmentType from Interweave-AppointmentType-1 (required)
* insert Ruleset-CodingWithSystemCodeDisplay(appointmentType)


// Reason: MS The reason for making the appointment – ie a list of SNOMED codes for various medical problems.
// Does not look very “social care” friendly – an extended or alternative list may be needed if we decide that appointments are relevant to social care?
* reasonCode MS  //R4 reasonCode -> STU3 reason
* reasonCode from Interweave-R4EncounterReason (required)
* insert Ruleset-CodingWithSystemCodeDisplay(reasonCode)

// Indication: Leave optional (concentrate on populating "reason" as the priority)
// A reference to further detail about either the Condition or Procedure which is the reason for the appointment
//  May not always be available, but should be populated if these resources are supported and relevant
// NB "reasonReference" (R4) -> "indication" (STU3)
////* reasonReference MS
/////* insert Ruleset-ReferenceWithReferenceOnly(reasonReference)

// Priority - discouraged
* priority ^short = "DISCOURAGED - More applicable to internal scheduling"

// Description: MS. Useful to populate as a textual summary for displaying
//   (If relevant in addition to time, location, service)
* description MS

// Supporting Information: Discouraged. A pointer to almost any other information
* supportingInformation ^short = "DISCOURAGED - very broad, and so difficult for a consumer to handle"

// Start and End: Must always be populated unless the appointment is still only at status “proposed” (or cancelled)
// (It turns out that this validation is built into FHIR! So originally we favoured not giving the end and 
//  instead saying the "minutesDuration" as a more natural way of expressing it. But that fails FHIR validation!)
//  Capture "minutes duration" too as can be useful to just show easily how long the appointment is.
//     And may also be useful if it is expected to be a shorter time-slot within an overall period of time
* start MS
* end MS
* minutesDuration MS



// Slot: Discouraged
* slot ^short = "DISCOURAGED - Relevant to a scheduling system, but less so to a regional shared record"

// Created: optional - basic information about when it was created

// Comment - Discouraged. Key point is to use with care, as it may be viewed by the patient
//  (Note: We add an extension to pre-adopt the useful R4 for "patientInstruction")
* comment ^short = "DISCOURAGED. It must be assumed that this comment will be widely viewed across the region, including by the patient themselves. See also / instead the 'patientInstruction' field"

// Incoming referral: Optional
// A reference to the Referral which led to the appointment. Useful to provide if relevant and available
// Could have been MS, HOWEVER leave optional for now due to significant changes to ReferralRequest coming in R4
// NB "basedOn" (R4) -> "incomingReferral" (STU3)
* insert Ruleset-ReferenceWithReferenceOnly(basedOn)

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
* participant.type from Interweave-AppointmentParticipationType-1 (required)
* insert Ruleset-CodingWithSystemCodeDisplay(participant.type)

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

// TODO - but... how do we find this by NHS Number. (Could include the id here, but is that enough?)
* participant[subject].type =  http://hl7.org/fhir/v3/ParticipationType#SBJ "subject" (exactly)
* participant[subject].actor 1..1 MS
* participant[subject].actor only Reference(Patient)
* insert Ruleset-ReferenceWithReferenceAndDisplay(participant[subject].actor)

* participant[location].type =  http://hl7.org/fhir/v3/ParticipationType#LOC "location" (exactly)
* participant[location].actor 1..1 MS
* participant[location].actor only Reference(Location)
* insert Ruleset-ReferenceWithReferenceAndDisplay(participant[location].actor)

* participant[primaryPerformer].type =  http://hl7.org/fhir/v3/ParticipationType#PPRF "primary performer" (exactly)
* participant[primaryPerformer].actor 1..1 MS
* participant[primaryPerformer].actor only Reference(Practitioner)
* insert Ruleset-ReferenceWithReferenceAndDisplay(participant[primaryPerformer].actor)


//////////////////////////////////////////////////////////////////////////////////////////////////////////
// EXAMPLES
///////////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: InterweaveAppointmentExample
InstanceOf: InterweaveAppointment
Description: "Interweave Appointment example"

* insert Ruleset-ExampleMetaForHospital(Appointment)

// Text summary no longer needed
// (Start + Service Type + Location.display)
//* extension[Extension-Interweave-TextSummary].valueString = "09/01/2022-9:00 : Adult dermatology service : York Hospital: Ward 27 - Dermatology clinic"

* extension[Extension-Interweave-R4PatientInstruction].valueString = "The clinic is on the second floor. Please do not attend if you have covid symptoms."

* extension[Extension-CareConnect-DeliveryChannel-1].valueCode = https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-DeliveryChannel-1#In-person "In-person"
* extension[Extension-Interweave-R4AppointmentCancellationReason].valueCodeableConcept = Interweave-R4AppointmentCancellationReason#pat "Patient"

* insert Ruleset-ExampleLocalId(appointment, RCB.APPT-Q54321)

* status = http://hl7.org/fhir/appointmentstatus#booked "Booked"

// Service Category: leave optional
* serviceType = $SCT#23871000087101 "Adult dermatology service"
// Specialty: leave optional
* appointmentType = http://hl7.org/fhir/v2/0276#FOLLOWUP "A follow up visit from a previous appointment"

* reasonCode = $SCT#299007 "Paraffinoma of skin" // R4 - STU3 has "reason"


* description = "Outpatient dermatology clinic"

* start = "2022-01-09T09:00:00Z"
* end = "2022-01-09T09:30:00Z"
* minutesDuration = 30

* created = "2021-12-05T00:00:00Z"


// For now take this out, as referral downgraded to optional (due to R4 changes)
//* basedOn.display = "2021-11-04: Dr Jones: Rash on arm" // R4 - STU3 has "incomingReferral"

* participant[0].type =  http://hl7.org/fhir/v3/ParticipationType#SBJ "subject" 
* participant[0].actor = Reference(InterweavePatientExample-MustSupport) 
* participant[0].actor.display = "Mr Fred BLOGGS"
* participant[0].status = http://hl7.org/fhir/participationstatus#accepted "Accepted" 

* participant[1].type =  http://hl7.org/fhir/v3/ParticipationType#LOC "location" 
* participant[1].actor = Reference(InterweaveLocationWardExample1)
* participant[1].actor.display = "York Hospital: Ward 27 - Dermatology clinic"
* participant[1].status = http://hl7.org/fhir/participationstatus#accepted "Accepted" 

* participant[2].type = http://hl7.org/fhir/v3/ParticipationType#PPRF "primary performer"
* participant[2].actor = Reference(InterweavePractitionerExample)
* participant[2].actor.display = "Dr Jane BLOGGS"
//* participant[2].actor.identifier.system = "https://fhir.nhs.uk/Id/sds-user-id"
//* participant[2].actor.identifier.value = "ABC123"
* participant[2].status = http://hl7.org/fhir/participationstatus#tentative "Tentative" 

