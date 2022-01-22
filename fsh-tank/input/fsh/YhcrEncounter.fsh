Alias: $SCT = http://snomed.info/sct

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
* identifier ^slicing.rules = #open
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
* priority from http://hl7.org/fhir/ValueSet/v3-ActPriority (required)

// Subject: Every Encounter MUST be linked to a patient
//     (It is appreciated that sometimes the identity of the patient may not be known, but the encounter cannot be shared regionally until this is established)
* subject 1..1 MS 
* subject only Reference(Yhcr-Patient)

// Episode of Care: Leave as optional for now. (A potential part of wider structure, see wider discussion)

// Incoming Referal and Appointment: MS. If these exist, and if the Data Provider is able to publish the resources, then this must link to it
* basedOn MS   // R4 - STU3 has "incomingReferral"
* appointment MS

// Participant: We want exactly one "primary performer" who is the main contact responsible
//   Where relevant an "admitter" and "discharger"
//   And for simplicity suggest to classify anyone else simply as "participant"
// (Note: Tried to do this with slicing, but the "type" is an array! Too hard, will just have to be text...)

// Must be at least one participant - the Primary Performner
* participant 1..* MS
// Only one "type" per participant. Pick the main one. (Or list the whole participant several times)
* participant.type 1..1 MS
// Must actually reference someone, and for this type of encounter they must be a practitioner
* participant.individual 1..1 MS
* participant.individual only Reference(Yhcr-Practitioner)
// Period is optional, may be useful if they were briefly involved, but most likely it matches the period of the encounter


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
* diagnosis.use 1..1 MS   //R4 - STU3 has "role"
* diagnosis.rank 1..1 MS

// And if provided then we want at least a "Chief Complaint" (plus any others such as comorbidities if relevant)
* diagnosis ^slicing.discriminator.type = #value
* diagnosis ^slicing.discriminator.path = "use"  //R4 - STU3 has "role"
* diagnosis ^slicing.ordered = false
* diagnosis ^slicing.rules = #open
* diagnosis contains chiefComplaint 0..1 MS

* diagnosis[chiefComplaint].use = http://hl7.org/fhir/diagnosis-role#CC "Chief complaint" (exactly)  //R4 - STU3 has "role"

// Account: Excluded - we are not concerned with billing information
* account 0..0

// Hospitalization: Excluded. This contains important information, but a special Encounter profile will be created for it
// ??? TODO - or do we allow it, for a self-contained option??
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



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: YhcrEncounterExample
InstanceOf: YhcrEncounter
Description: "YHCR Encounter example"

* identifier[localIdentifier].system = "https://yhcr.org/Id/local-encounter-identifier"
* identifier[localIdentifier].value = "ABC-456-XYZ"

* status = #finished
* statusHistory[0].status = #planned 
* statusHistory[0].period.start = "2021-11-04T14:25:00Z"
* statusHistory[0].period.end = "2022-01-09T09:00:00Z"
* statusHistory[1].status = #in-progress 
* statusHistory[1].period.start = "2022-01-09T09:00:00Z"
* statusHistory[1].period.end = "2022-01-11T14:30:00Z"
* statusHistory[2].status = #finished 
* statusHistory[2].period.start = "2022-01-11T14:30:00Z"

// TODO - what goes in here? Is it actually the "in progress" period?
* period.start = "2022-01-09T09:00:00Z" 
* period.end = "2022-01-11T14:30:00Z"

* class = http://hl7.org/fhir/v3/ActCode#ACUTE "inpatient acute"
* type.coding[0] = $SCT#185212007 "Seen in hospital ward"  //TODO - for some reason not valid??
* priority.coding[0] = http://hl7.org/fhir/v3/ActPriority#EL "elective"



* subject = Reference(YhcrPatientExample-MustSupport) 
* subject.display = "Fred Bloggs"

// TODO - add fuller references once we have these resources
* basedOn.display = "2021-11-04: Dr Jones: Sore foot" // R4 - STU3 has "incomingReferral"
* appointment.display = "2022-01-09: Foot surgery"


* participant[0].type[0].coding = http://hl7.org/fhir/v3/ParticipationType#PPRF "primary performer"
* participant[0].individual = Reference(YhcrPractitionerExample)
* participant[0].individual.display = "Dr Jane Bloggs"
* participant[0].individual.identifier.system = "https://fhir.nhs.uk/Id/sds-user-id"
* participant[0].individual.identifier.value = "ABC123"

* participant[1].type[0].coding = http://hl7.org/fhir/v3/ParticipationType#ADM "admitter" 
* participant[1].individual = Reference(YhcrPractitionerExample)
* participant[1].individual.display = "Dr Jane Bloggs"
* participant[1].individual.identifier.system = "https://fhir.nhs.uk/Id/sds-user-id"
* participant[1].individual.identifier.value = "ABC123"

* participant[2].type[0].coding = http://hl7.org/fhir/v3/ParticipationType#DIS "discharger"
* participant[2].individual = Reference(YhcrPractitionerExample)
* participant[2].individual.display = "Dr Jane Bloggs"
* participant[2].individual.identifier.system = "https://fhir.nhs.uk/Id/sds-user-id"
* participant[2].individual.identifier.value = "ABC123"

* participant[3].type[0].coding = http://hl7.org/fhir/v3/ParticipationType#PART "Participation" 
* participant[3].individual.display = "Bob Smithson"
* participant[3].individual.identifier.system = "https://fhir.nhs.uk/Id/sds-user-id"
* participant[3].individual.identifier.value = "XYZ987"

// TODO - add fuller references once we have these resources
* diagnosis[0].condition.display = "Purple rash"
* diagnosis[0].use = http://hl7.org/fhir/diagnosis-role#CC "Chief complaint"   //R4 - STU3 has "role"
* diagnosis[0].rank = 1

* reasonCode = http://snomed.info/sct#299007 "Paraffinoma of skin"

* location[0].location = Reference(YhcrLocationWardExample1)
* location[0].location.display = "Ward 27 - Dermatology clinic"
* location[0].status = #completed
* location[0].period.start = "2022-01-09T09:00:00Z"
* location[0].period.end = "2022-01-09T10:30:00Z"

* location[1].location = Reference(YhcrLocationWardExample2)
* location[1].location.display = "Ward 28 - Allergy clinic"
* location[1].status = #completed
* location[1].period.start = "2022-01-09T10:30:00Z"
* location[1].period.end = "2022-01-11T14:30:00Z"

* partOf = Reference(YhcrEncounterHospitalizationExample)