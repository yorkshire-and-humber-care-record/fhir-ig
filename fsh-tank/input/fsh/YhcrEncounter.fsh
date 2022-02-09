Alias: $SCT = http://snomed.info/sct

Profile: YhcrEncounter
Parent: CareConnect-Encounter-1
Id: Yhcr-Encounter
Description: "YHCR Encounter resource profile."
* ^status = #draft

* insert YhcrBaseFieldsRuleset

// Extensions
// - Encounter Transport:  (contains more detail of type, period, reason - as far as I can see free text?)
// - Outcome of attendance: (simple list of discharged, another appointment given, another appointment needed)
// - Emergency Care Discharge Status (a list of snomed codes - when did they leave, were they pass onwards)
// These all look like they might sometimes be useful but not essential - leave optional for now, subject to further discussion.


// Identifier:
// This is a business identifier for the Encounter.
// The value for a local identifier must be populated and contain the internal id for this Encounter on the providing system
// Thus providing a link back for any follow-up and/or troubleshooting
* insert Ruleset-AddLocalIdentifier(encounter)


// Status: Already mandatory in FHIR, emphasise with Must Support
// For now do not eliminate "planned" (as there may be some scenarios where clinical information is useful to capture in advance?)
// But in general advise against it
* status MS
* status ^short = "arrived | triaged | in-progress | onleave | finished | cancelled + (Note: 'planned' is also possible, but normally represented instead as an Appointment)"

// Status History: Make mandatory and MS
//    It is considered to also be very important and useful to be able to see the progression and timeline of the encounter – from arrived, triaged, in-progress, etc
* statusHistory 1..* MS

// Class: Make mandatory, MS, and tighten the coding.
//      This is an essential field to categorise the encounter (eg emergency, inpatient, ambulatory, etc)
//      (Use our own list in case we want to add to it - including to allow Encounter Grouping)
//      However Class History we do not want.
//      Each encounter should be of exactly one class. If the class changes then this is modelled as a separate encounter
* class 1..1 MS //(R4 is already 1..1, so need to hack this in via script)
//* class from http://hl7.org/fhir/ValueSet/v3-ActEncounterCode (required)
* class from Yhcr-EncounterClass-1 (required)
* insert Ruleset-RawCodingWithSystemCodeDisplay(class)

* classHistory 0..0

// Type: Make mandatory, and tighten coding based on the Care Connect list
//     Useful information based on several sets of SNOMED codes which describes the type of clinic or setting where the encounter occurred 
//      (eg in establishment, in own home, by telephone, etc)
* type 1..1 MS
* type from CareConnect-EncounterType-1 (required)
* insert Ruleset-CodingWithSystemCodeDisplay(type)
* type.coding[snomedCT] 1..1 MS
* type.coding[snomedCT] from CareConnect-EncounterType-1 (required)

// Priority: This provides useful information about whether it was emergency, routine, elective, etc
* priority MS
* priority from http://hl7.org/fhir/ValueSet/v3-ActPriority (required)
* insert Ruleset-CodingWithSystemCodeDisplay(priority)

// Subject: Every Encounter MUST be linked to a patient
//     (It is appreciated that sometimes the identity of the patient may not be known, but the encounter cannot be shared regionally until this is established)
* subject 1..1 MS 
// We only want Patients - not Groups
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferencePatient(subject)
* subject ^short = "The patient (NOT group) present at the encounter"

// Episode of Care: Leave as optional for now. (A potential part of wider structure, see wider discussion)

// Incoming Referal and Appointment: MS. If these exist, and if the Data Provider is able to publish the resources, then this must link to it
* basedOn MS   // R4 - STU3 has "incomingReferral"
* insert Ruleset-ReferenceWithAtLeastDisplay(basedOn)
* appointment MS
* insert Ruleset-ReferenceWithAtLeastDisplay(appointment)

// Participant: We want exactly one "primary performer" who is the main contact responsible
//   Where relevant an "admitter" and "discharger"
//   And for simplicity suggest to classify anyone else simply as "participant"
// (Note: Tried to do this with slicing, but the "type" is an array! Too hard, will just have to be text...)

// Must be at least one participant - the Primary Performner
* participant 1..* MS
// Only one "type" per participant. Pick the main one. (Or list the whole participant several times)
* participant.type 1..1 MS
* participant.type from http://hl7.org/fhir/ValueSet/encounter-participant-type (required)
* insert Ruleset-CodingWithSystemCodeDisplay(participant.type)
// Must actually reference someone, and for this type of encounter they must be a practitioner
* participant.individual 1..1 MS
* participant.individual only Reference(CareConnect-Practitioner-1)
* insert Ruleset-ReferenceExternalPractitioner(participant.individual) // Will normally be internal, but occaisonally maybe not
// Period is optional, may be useful if they were briefly involved, but most likely it matches the period of the encounter


// Period: Mandatory. When the encounter occurred is vital to know.
//      The start date/time is always mandatory, but as per the FHIR specification, the end date/time may be omitted if the encounter is ongoing
* period 1..1 MS
* period.start 1..1 MS
* period.end MS

// Length: Discouraged. This duplicates information that is already available via the Period.
// In some systems it is used to indicate exactly how long a patient was in the consulting room (eg for billing), but this is not relevant here.
* length ^short = "DISCOURAGED: This duplicates information that is already available via the Period"

// Reason: MS
//   Capture the reason for the encounter (see documentation notes on code lists)
* reasonCode MS  //R4 reasonCode -> STU3 reason

// Diagnosis: Is Must Support, and if provided we want references only to a Condition, with role and ranking
* diagnosis MS
* diagnosis.condition only Reference(CareConnect-Condition-1)
* diagnosis.condition 1..1 MS
* insert Ruleset-ReferenceWithAtLeastDisplay(diagnosis.condition)
* diagnosis.use 1..1 MS   //R4 - STU3 has "role"
* diagnosis.use from http://hl7.org/fhir/ValueSet/diagnosis-role (required)
* insert Ruleset-CodingWithSystemCodeDisplay(diagnosis.use)
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

// Hospitalization: Excluded from here. Instead it must be put in the overarching EncounterGrouping
* hospitalization 0..0

// Location: Mandatory.
//   The location provides essential information about where the encounter took place. 
//   The intent is to provide information down to the “ward” level
//   It is useful to understand the history of where the patient has been seen, 
//   So the status and period MUST be populated, and a history provided.
* location 1..* MS
* location ^short = "Location the encounter takes place (at Ward level)"
* location.location MS
* insert Ruleset-ReferenceInternalLocation(location.location)
* location.status 1..1 MS
* location.period 1..1 MS

// Service Provider: Discouraged
//  This is covered via the provenance tags
* serviceProvider ^short = "DISCOURAGED: This is instead covered via the provenance tags"

// PartOf: Mandatory - based on decision to always put the hospitalization in separate EncounterGrouping.
// Generally it is a flat structure, EXCEPT for pointing specifically at an Encounter Grouping
* partOf 1..1 MS
* partOf only Reference(Yhcr-EncounterGrouping)
* insert Ruleset-ReferenceWithDisplayAndReference(partOf)





////////////////////////////////////////////////////////////////////////////////////////
// Examples
////////////////////////////////////////////////////////////////////////////////////////

Instance: YhcrEncounterExample
InstanceOf: YhcrEncounter
Description: "YHCR Encounter example"

//(Note - important to put our profile first, or else the website won't recognise it!)
* meta.lastUpdated = "2022-02-01T09:37:00Z"
* meta.profile[0] = "http://yhcr.org/StructureDefinition/Yhcr-Encounter"
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Encounter-1"
* meta.versionId = "YhcrEncounterWithVisitGroupigExample-v1.0.0"

* meta.tag[0] =  https://yhcr.nhs.uk/Source#ABC-01 "Acme Ltd Data Systems"
* meta.tag[1] =  https://yhcr.nhs.uk/Provenance#RCB "York and Scarborough Teaching Hospitals NHS Foundation Trust"
// (Period.start - Period.end : Class description: Type description)
* extension[Extension-Yhcr-TextSummary].valueString = "09/01/2022 09:00 - 11/01/2022 14:30 : Inpatient Actute : Dermatology"



* identifier[localIdentifier].system = "https://yhcr.org/Id/local-encounter-identifier"
* identifier[localIdentifier].value = "ENC-456-XYZ"

* status = #finished
* statusHistory[+].status = #in-progress 
* statusHistory[=].period.start = "2022-01-09T09:00:00Z"
* statusHistory[=].period.end = "2022-01-11T14:30:00Z"
* statusHistory[+].status = #finished 
* statusHistory[=].period.start = "2022-01-11T14:30:00Z"

// (Note: Not using the "planned" status also helps the period make more sense)
* period.start = "2022-01-09T09:00:00Z" 
* period.end = "2022-01-11T14:30:00Z"

* class = http://hl7.org/fhir/v3/ActCode#ACUTE "inpatient acute"
* type.coding[0] = $SCT#185212007 "Seen in hospital ward"  //TODO - for some reason not valid??
* priority.coding[0] = http://hl7.org/fhir/v3/ActPriority#EL "elective"


* subject = Reference(YhcrPatientExample-MustSupport) 
* subject.display = "Fred Bloggs"

// TODO - add fuller references once we have these resources
* basedOn.display = "04/11/2021: Dr Jones: Rash on arm" // R4 - STU3 has "incomingReferral"
* appointment = Reference(YhcrAppointmentExample)
* appointment.display = "09/01/2022 09:00 - 09/01/2022 09:30 : Inpatient Acture : Dermatology"


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
* location[0].location.display = "York Hospital: Ward 27 - Dermatology clinic"
* location[0].status = #completed
* location[0].period.start = "2022-01-09T09:00:00Z"
* location[0].period.end = "2022-01-09T10:30:00Z"

* location[1].location = Reference(YhcrLocationWardExample2)
* location[1].location.display = "York Hospital: Ward 28 - Allergy clinic"
* location[1].status = #completed
* location[1].period.start = "2022-01-09T10:30:00Z"
* location[1].period.end = "2022-01-11T14:30:00Z"


* partOf = Reference(YhcrEncounterGroupingExample)
* partOf.display = "09/01/2022 09:00 - 11/01/2022 14:30 : Grouping of related Encounters"



