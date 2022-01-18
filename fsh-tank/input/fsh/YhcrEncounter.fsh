Profile: YhcrEncounter
Parent: CareConnect-Encounter-1
Id: Yhcr-Encounter
Description: "YHCR Encounter resource profile."

// Extension - Encounter Transport: Leave as optional
// Other Extensions? - there seem to be other extensions in some versions of Care Connect?? Anyway, leave as optional

// Identifier:
// This is a business identifier for the Encounter.
// The value for a local identifier must be populated and contain the internal id for this Encounter on the providing system
// Thus providing a link back for any follow-up and/or troubleshooting
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.ordered = false
* identifier ^slicing.rules = #openAtEnd
* identifier contains
    localIdentifier 0..1 MS

* identifier[localIdentifier].system 1..1 MS
* identifier[localIdentifier].system = "https://yhcr.org/Id/local-encounter-identifier" (exactly)
* identifier[localIdentifier].value 1..1
* identifier[localIdentifier].value ^short = "The Local Encounter Identifier"
// Period assumed to match that of the Encounter
* identifier[localIdentifier].period 0..0
// Assigner assumed to match provenance of the Encounter
* identifier[localIdentifier].assigner 0..0

// Status: Already mandatory in FHIR, emphasise with Must Support
* status MS

// Status History: Make mandatory and MS
//    It is considered to also be very important and useful to be able to see the progression and timeline of the encounter – from arrived, triaged, in-progress, etc
* statusHistory 1..* MS

// Class: Make mandatory, MS, and tighten the coding.
//      This is an essential field to categorise the encounter (eg emergency, inpatient, ambulatory, etc)
//      However Class History we do not want.
//      Each encounter should be of exactly one class. If the class changes then this is modelled as a separate encounter
* class 1..1 MS
* class from http://hl7.org/fhir/ValueSet/v3-ActEncounterCode (required)
* classHistory 0..0

// Type: Make mandatory, and tighten coding based on the Care Connect list
//     Useful information based on several sets of SNOMED codes which describes the type of clinic or setting where the encounter occurred 
//      (eg in establishment, in own home, by telephone, etc)
* type 1..1 MS
* type.coding[snomedCT] 1..1 MS
* type.coding[snomedCT] from CareConnect-EncounterType-1 (required)

// Priority: This provides useful information about whether it was emergency, routine, elective, etc
* priority MS

// Subject: Every Encounter MUST be linked to a patient
//     (It is appreciated that sometimes the identity of the patient may not be known, but the encounter cannot be shared regionally until this is established)
* subject 1..1 MS 
* subject only Reference(Yhcr-Patient)

// Episode of Care: Leave as optional for now. (A potential part of wider structure, see wider discussion)

// Incoming Referal and Appointment: MS. If these exist, and if the Data Provider is able to publish the resources, then this must link to it
// **NB - R4 change!
//* incomingReferral MS
* basedOn MS
* appointment MS

// Participant: We want exactly one "primary performer" who is the main contact responsible
//   Where relevant an "admitter" and "discharger"
//   And for simplicity suggest to classify anyone else simply as "participant"
* participant ^slicing.discriminator.type = #value
* participant ^slicing.discriminator.path = "type"
* participant ^slicing.ordered = false
* participant ^slicing.rules = #open
* participant contains primary 1..1 MS
                    and admitter 0..1 MS 
                    and discharger 0..1 MS
                    and otherParticipant 0..*

* participant[primary].type = #PPRF (exactly)
* participant[primary].individual 1..1 MS

* participant[admitter].type = #ADM (exactly)
* participant[admitter].individual 1..1 MS
* participant[discharger].type = #DIS (exactly)
* participant[discharger].individual 1..1 MS

* participant[otherParticipant].type = #PART (exactly)
* participant[otherParticipant].individual 1..1

// Period: Mandatory. When the encounter occurred is vital to know.
//      The start date/time is always mandatory, but as per the FHIR specification, the end date/time may be omitted if the encounter is ongoing
* period 1..1 MS
* period.start 1..1 MS
* period.end MS

// Length: Discouraged. This duplicates information that is already available via the Period.
// In some systems it is used to indicate exactly how long a patient was in the consulting room (eg for billing), but this is not relevant here.
* length ^short = "DISCOURAGED: This duplicates information that is already available via the Period"

// Reason: Leave it alone as optional for now
// *** More consultation needed. Potentially a simplified code-list might be used ***

// Diagnosis: Is Must Support, and if provided we want references only to a Condition, with role and ranking
* diagnosis MS
* diagnosis.condition only Reference(Condition)
* diagnosis.condition 1..1 MS
//***************** R4 difference, STU3 - Role
* diagnosis.use 1..1 MS
* diagnosis.rank 1..1 MS

// And if provided then we want at least a "Chief Complaint" (plus any others such as comorbidities if relevant)
* diagnosis ^slicing.discriminator.type = #value
//***************** R4 difference, STU3 - Role
* diagnosis ^slicing.discriminator.path = "use"
* diagnosis ^slicing.ordered = false
* diagnosis ^slicing.rules = #open
* diagnosis contains chiefComplaint 0..1 MS

//***************** R4 difference, STU3 - Role
* diagnosis[chiefComplaint].use = #CC (exactly)

// Account: Excluded - we are not concerned with billing information
* account 0..0

// Hospitalization: Excluded. This contains important information, but a special Encounter profile will be created for it
* hospitalization 0..0

// Location: Mandatory.
//   The location provides essential information about where the encounter took place. 
//   The intent is to provide information down to the “ward” level
//   It is useful to understand the history of where the patient has been seen, 
//   So the status and period MUST be populated, and a history provided.
* location 1..* MS
* location.location MS
* location.location only Reference(YhcrLocation)
* location.status 1..1 MS
* location.period 1..1 MS

// Service Provider: Discouraged
//  This is covered via the provenance tags
* serviceProvider ^short = "DISCOURAGED: This is instead covered via the provenance tags"

// PartOf: Optional. Generally it is a flat structure, EXCEPT for pointing specifically at a hospitalisation encounter
* partOf only Reference(Yhcr-Encounter-Hospitalization)
