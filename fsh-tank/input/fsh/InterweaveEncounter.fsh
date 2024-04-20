Alias: $SCT = http://snomed.info/sct

Profile: InterweaveEncounter
Parent: CareConnect-Encounter-1
Id: Interweave-Encounter
Description: "Interweave Encounter resource profile."
* ^status = #active

* insert Ruleset-InterweaveBaseFields

// Extensions
// - Encounter Transport:  (Optional - contains more detail of type, period, reason - as far as I can see free text? Removed in UK Core)

// Outcome information (Must Support. BUT only one of these two or hospitalization.dischargeMethod is needed, depending on the type of encounter)
// - Outcome of attendance: (For outpatients - simple list of discharged, another appointment given, another appointment needed)
// - Emergency Care Discharge Status (For emergencies - a list of snomed codes - when did they leave, were they pass onwards)
* extension[Extension-CareConnect-OutcomeOfAttendance-1] MS
* extension[Extension-CareConnect-EmergencyCareDischargeStatus-1] MS

* extension contains Extension-Interweave-EDDischargeDestination named emergencyCareDischargeDestination 0..1
* extension[Extension-Interweave-EDDischargeDestination] MS

// Service Type is perhaps one of the most useful and important fields about an Encounter - but missing from STU3!
// This omission is rectified in R4, so we pre-adopt it here - and make the extension Must Support
// We also pre-adopt the UKCore value set, which is more relevant than the default FHIR example and also covers social care
* extension contains Extension-Interweave-R4EncounterServiceType named serviceType 0..1
* extension[Extension-Interweave-R4EncounterServiceType] ^short = "Specific type of service (pre-adopted from R4)"
* extension[Extension-Interweave-R4EncounterServiceType] MS


// Identifier:
// This is a business identifier for the Encounter.
// The value for a local identifier must be populated and contain the internal id for this Encounter on the providing system
// Thus providing a link back for any follow-up and/or troubleshooting
* insert Ruleset-AddIdentifierSlicing
* insert Ruleset-AddLocalIdentifierMS(encounter)


// Status: Already mandatory in FHIR, emphasise with Must Support
// For now do not eliminate "planned" (as there may be some scenarios where clinical information is useful to capture in advance?)
// But in general advise against it
* status MS
* status ^short = "arrived | triaged | in-progress | onleave | finished | cancelled + (Note: 'planned' is also possible, but normally represented instead as an Appointment)"

// Status History: Make mandatory and MS
//    It is considered to also be very important and useful to be able to see the progression and timeline of the encounter – from arrived, triaged, in-progress, etc
* statusHistory 0..* MS

// Class: Make mandatory, MS, and tighten the coding.
//      This is an essential field to categorise the encounter (eg emergency, inpatient, ambulatory, etc)
//      (Use our own list in case we want to add to it - including to allow Encounter Grouping)
//      However Class History we do not want.
//      Each encounter should be of exactly one class. If the class changes then this is modelled as a separate encounter
* class 1..1 MS //(R4 is already 1..1, so need to hack this in via script)
//* class from http://hl7.org/fhir/ValueSet/v3-ActEncounterCode (required)
* class from Interweave-EncounterClass-1 (required)
* class ^short = "Classification of the encounter. EXTENSIBLE on request, eg to cover other care settings"
* insert Ruleset-RawCodingWithSystemCodeDisplay(class)

* classHistory 0..0

// Type: Make MS, and tighten coding based on the Care Connect list
//     Useful information based on several sets of SNOMED codes which describes the type of clinic or setting where the encounter occurred 
//      (eg in establishment, in own home, by telephone, etc)
* type 0..1 MS
* type from CareConnect-EncounterType-1 (required)
* insert Ruleset-CodingWithSystemCodeDisplay(type)
* type.coding[snomedCT] 1..1 MS
* type.coding[snomedCT] from CareConnect-EncounterType-1 (required)

// Priority: This provides useful information about whether it was emergency, routine, elective, etc
* priority MS
* priority from Interweave-EncounterPriority-1 (required)
* insert Ruleset-CodingWithSystemCodeDisplay(priority)

// Subject: Every Encounter MUST be linked to a patient
//     (It is appreciated that sometimes the identity of the patient may not be known, but the encounter cannot be shared regionally until this is established)
* subject 1..1 MS 
// We only want Patients - not Groups
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)
* subject ^short = "The patient (NOT group) present at the encounter"

// Episode of Care: Leave as optional for now. (A potential part of wider structure, see wider discussion)

// Appointment: MS. If these exist, and if the Data Provider is able to publish the resources, then this must link to it
* appointment MS
* insert Ruleset-ReferenceWithReferenceOnly(appointment)

// Incoming referral: Optional
// A reference to the Referral which led to the appointment. Useful to provide if relevant and available
// Could have been MS, HOWEVER leave optional for now due to significant changes to ReferralRequest coming in R4
// NB "basedOn" (R4) -> "incomingReferral" (STU3)
* insert Ruleset-ReferenceWithReferenceOnly(basedOn)


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
* insert Ruleset-ReferenceWithReferenceAndDisplay(participant.individual) 
// Period is optional, may be useful if they were briefly involved, but most likely it matches the period of the encounter


// Period: Mandatory. When the encounter occurred is vital to know.
//      The start date/time is always mandatory, but as per the FHIR specification, the end date/time may be omitted if the encounter is ongoing
* period 1..1 MS
* period.start 1..1 MS
* period.end MS

// Length: (optional)
// This to some extent duplicates information that is already available via the Period, but useful to provide for analytical purposes
// In some systems it is used to indicate exactly how long a patient was in the consulting room (eg for billing), but this is not relevant here.
* length ^short = "Quantity of time the encounter lasted (less time absent). Please use minutes."

// Reason: MS
//   Capture the reason for the encounter
//   We pre-adopt the R4 list of reason codes which covers not only Clinical Finding and Procedure, but also social care and A&E.
* reasonCode MS  //R4 reasonCode -> STU3 reason
* reasonCode from Interweave-R4EncounterReason (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(reasonCode)

// Diagnosis: Is Must Support, and if provided we want references only to a Condition, with role and ranking
* diagnosis MS
* diagnosis.condition only Reference(CareConnect-Condition-1)
* diagnosis.condition 1..1 MS
* insert Ruleset-ReferenceWithReferenceOnly(diagnosis.condition)
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

// Hospitalization: Must Support
//   However it will not always be relevant to actaully populate all fields
//   Depending on scenario it could include information on admission, discharge, both, or neither
//   However where relevant it must be populated - all information must be available in these base encounters
* hospitalization 0..1 MS
* insert Ruleset-Hospitalization

// Location: Mandatory.
//   The location provides essential information about where the encounter took place. 
//   The intent is to provide information down to the “ward” level
//   It is useful to understand the history of where the patient has been seen, 
//   So the status and period MUST be populated, and a history SHOULD be provided.
* location 0..* MS
* location ^short = "Location the encounter takes place (at Ward level)"
* location.location MS
* insert Ruleset-ReferenceWithReferenceAndDisplay(location.location)
* location.status 1..1 MS
* location.period 1..1 MS

// Service Provider: Discouraged
//  This is covered via the provenance tags
* serviceProvider ^short = "DISCOURAGED: This is instead covered via the provenance tags"

// PartOf: Optional - may be used to point at an overarching EncounterGrouping.
// Generally it is a flat structure, EXCEPT for pointing specifically at an Encounter Grouping
* partOf 0..1
* partOf only Reference(Interweave-EncounterGrouping)
* insert Ruleset-ReferenceWithReferenceOnly(partOf)


////////////////////////////////////////////////////////////////////////////////////////
// Hospitalization Ruleset
////////////////////////////////////////////////////////////////////////////////////////
RuleSet: Ruleset-Hospitalization

// PreAdmissionIdentifier: Leave as optional (TODO confirm exactly what it is for)

// Extensions - these seem useful, make MS
* hospitalization.extension[Extension-CareConnect-AdmissionMethod-1] MS
* hospitalization.extension[Extension-CareConnect-DischargeMethod-1] MS

// Add an extension to provide information about whether the patient is medically safe for discharge
// The current status, date when predicted they will be ready, and actaul date when they were ready
// This has been requested as important information to inform planning and analysis (therefore make MS)
* hospitalization.extension contains Extension-Interweave-MedicallySafeForDischarge named medicallySafeForDischarge 0..1
* hospitalization.extension[Extension-Interweave-MedicallySafeForDischarge] MS
* hospitalization.extension[Extension-Interweave-MedicallySafeForDischarge] ^short = "Medically Safe for Discharge"


// Origin: Useful to provide if possible, especially if transfered from another institution
* hospitalization.origin ^short = "The location from which the patient came before admission. Useful to provide if possible, in particular to reference a 'site' if transfered from another institution."
* insert Ruleset-ReferenceWithReferenceAndDisplay(hospitalization.origin)

// AdmitSource: MS. Useful categorisation about the type of place the patient came from (eg home, other NHS hospital, care home, etc)
//   (Also tighten the code list)
* hospitalization.admitSource MS
* hospitalization.admitSource from Interweave-AdmissionSource-1 (required)
* insert Ruleset-CodingWithSystemCodeDisplay(hospitalization.admitSource)

// Readmission: Optional.
//      If it is known to be a readmission then the field can be included and populated with the single code value of “R” for “Readmission”

// Diet Preferences and others: Discouraged. This information would be relevant for a hospital EPR (to inform management of the patient’s stay), but adds unnecessary complexity to the Hospitalisation linkage for a regional shared record. 
//     (If needed then could be captured other ways eg via flags, observations, care plan, etc)
* hospitalization.dietPreference ^short = "DISCOURAGED: Relevant for managing the patient's stay, but less so for regional sharing"
* hospitalization.specialCourtesy ^short = "DISCOURAGED: Relevant for managing the patient's stay, but less so for regional sharing"
* hospitalization.specialArrangement ^short = "DISCOURAGED: Relevant for managing the patient's stay, but less so for regional sharing"

// Destination: Important to provide if known, especially if transfered to another institution, but also to support discharge planning
* hospitalization.destination MS
* hospitalization.destination ^short = "Location to which the patient is discharged. Important to provide if known to support discharge planning, and/or to reference a 'site' if transfered to another institution."
* insert Ruleset-ReferenceWithReferenceAndDisplay(hospitalization.destination)

// Discharge Disposition: MS. Useful categorisation about the type of place the patient came from (eg home, other NHS hospital, care home, etc)
//   (Also tighten the code list, and use our own which updates CareConnect with the latest values from NHSDD)
* hospitalization.dischargeDisposition MS
* hospitalization.dischargeDisposition from Interweave-DischargeDestination-1 (required)
* insert Ruleset-CodingWithSystemCodeDisplay(hospitalization.dischargeDisposition)



////////////////////////////////////////////////////////////////////////////////////////
// Examples
////////////////////////////////////////////////////////////////////////////////////////

Instance: InterweaveEncounterExample-MaturityLevel1
InstanceOf: InterweaveEncounter
Description: "Interweave Encounter example - Maturity Level 1 (no grouping)"

* insert Ruleset-ExampleMetaForHospital(Encounter)

// Text summary no longer needed
// (Period.start - Period.end : Class description: Service Type description)
//* extension[Extension-Interweave-TextSummary].valueString = "09/01/2022 09:00 - 11/01/2022 14:30 : Inpatient Actute : Adult dermatology service"

// Extension to add the all-important Service Type that is missing from STU3!
* extension[Extension-Interweave-R4EncounterServiceType].valueCodeableConcept = $SCT#23871000087101 "Adult dermatology service"

* contained[0] = InterweaveLocationHouseAdmissionExample
* contained[1] = InterweavePractitionerBobExample

* insert Ruleset-ExampleLocalId(encounter, RCB.ENC-123-XYZ)

* status = #finished
* statusHistory[+].status = #in-progress 
* statusHistory[=].period.start = "2022-01-09T09:00:00Z"
* statusHistory[=].period.end = "2022-01-11T14:30:00Z"

// (Note: Not using the "planned" status also helps the period make more sense)
* period.start = "2022-01-09T09:00:00Z" 
* period.end = "2022-01-11T14:30:00Z"

* class = http://hl7.org/fhir/v3/ActCode#ACUTE "inpatient acute"
* type.coding[0] = $SCT#185212007 "Seen in hospital ward"  //TODO - for some reason not valid??
* priority.coding[0] = http://hl7.org/fhir/v3/ActPriority#EL "elective"


* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"


// For now take this out, as referral downgraded to optional (due to R4 changes)
//* basedOn.display = "04/11/2021: Dr Jones: Rash on arm" // R4 - STU3 has "incomingReferral"

* appointment = Reference(InterweaveAppointmentExample)
//* appointment.display = "09/01/2022 09:00 - 09/01/2022 09:30 : Inpatient Acture : Dermatology"


* participant[0].type[0].coding = http://hl7.org/fhir/v3/ParticipationType#PPRF "primary performer"
* participant[0].individual = Reference(InterweavePractitionerExample)
* participant[0].individual.display = "Dr Jane BLOGGS"
//* participant[0].individual.identifier.system = "https://fhir.nhs.uk/Id/sds-user-id"
//* participant[0].individual.identifier.value = "ABC123"

* participant[1].type[0].coding = http://hl7.org/fhir/v3/ParticipationType#ADM "admitter" 
* participant[1].individual = Reference(InterweavePractitionerExample)
* participant[1].individual.display = "Dr Jane BLOGGS"
//* participant[1].individual.identifier.system = "https://fhir.nhs.uk/Id/sds-user-id"
//* participant[1].individual.identifier.value = "ABC123"

* participant[2].type[0].coding = http://hl7.org/fhir/v3/ParticipationType#DIS "discharger"
* participant[2].individual = Reference(InterweavePractitionerExample)
* participant[2].individual.display = "Dr Jane BLOGGS"
//* participant[2].individual.identifier.system = "https://fhir.nhs.uk/Id/sds-user-id"
//* participant[2].individual.identifier.value = "ABC123"


* participant[3].type[0].coding = http://hl7.org/fhir/v3/ParticipationType#PART "Participation" 
* participant[3].individual = Reference(InterweavePractitionerBobExample)
* participant[3].individual.display = "Dr Bob SMITHSON"
//* participant[3].individual.identifier.system = "https://fhir.nhs.uk/Id/sds-user-id"
//* participant[3].individual.identifier.value = "XYZ987"


* diagnosis[0].condition = Reference(InterweaveConditionExample)
//* diagnosis[0].condition.display = "Purple rash"
* diagnosis[0].use = http://hl7.org/fhir/diagnosis-role#CC "Chief complaint"   //R4 - STU3 has "role"
* diagnosis[0].rank = 1

* reasonCode = http://snomed.info/sct#299007 "Paraffinoma of skin"

* location[0].location = Reference(InterweaveLocationWardExample1)
* location[0].location.display = "York Hospital: Ward 27 - Dermatology clinic"
* location[0].status = #completed
* location[0].period.start = "2022-01-09T09:00:00Z"
* location[0].period.end = "2022-01-09T10:30:00Z"

* location[1].location = Reference(InterweaveLocationWardExample2)
* location[1].location.display = "York Hospital: Ward 28 - Allergy clinic"
* location[1].status = #completed
* location[1].period.start = "2022-01-09T10:30:00Z"
* location[1].period.end = "2022-01-11T14:30:00Z"

// No partOf for this basic maturity level, but a full set of admission / discharge information

* insert Ruleset-HospitalizationExample-AdmissionWaitingList
* insert Ruleset-HospitalizationExample-Discharge



////////////////////////////////////////////////////////////////////////

Instance: InterweaveEncounterExample-MaturityLevel2-Part1
InstanceOf: InterweaveEncounter
Description: "Interweave Encounter example - Maturity Level 2 (part 1 of grouping)"

* insert Ruleset-ExampleMetaForHospital(Encounter)

// Text summary no longer needed
// (Period.start - Period.end : Class description: Service Type description)
//* extension[Extension-Interweave-TextSummary].valueString = "08/01/2022 11:03 - 09/01/2022 09:00 : Emergency : Accident and Emergency service"

// Extension to add the all-important Service Type that is missing from STU3!
* extension[Extension-Interweave-R4EncounterServiceType].valueCodeableConcept = $SCT#310000008 "Accident and Emergency service"

* contained[0] = InterweaveLocationHouseAdmissionExample

* insert Ruleset-ExampleLocalId(encounter, RCB.ENC-321-XYZ)

* status = #finished
* statusHistory[+].status = #in-progress 
* statusHistory[=].period.start = "2022-01-08T11:03:00Z"
* statusHistory[=].period.end = "2022-01-09T09:00:00Z"


// (Note: Not using the "planned" status also helps the period make more sense)
* period.start = "2022-01-08T11:03:00Z" 
* period.end = "2022-01-09T09:00:00Z"

* class = http://hl7.org/fhir/v3/ActCode#EMER "emergency"
* type.coding[0] = $SCT#113091000000109 "Seen in minor injuries department" 
* priority.coding[0] = http://hl7.org/fhir/v3/ActPriority#EM "emergency"


* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"


// For now take this out, as referral downgraded to optional (due to R4 changes)
//* basedOn.display = "04/11/2021: Dr Jones: Rash on arm" // R4 - STU3 has "incomingReferral"

// No appointment as an emergency


* participant[0].type[0].coding = http://hl7.org/fhir/v3/ParticipationType#PPRF "primary performer"
* participant[0].individual = Reference(InterweavePractitionerExample)
* participant[0].individual.display = "Dr Jane BLOGGS"
//* participant[0].individual.identifier.system = "https://fhir.nhs.uk/Id/sds-user-id"
//* participant[0].individual.identifier.value = "ABC123"

* participant[1].type[0].coding = http://hl7.org/fhir/v3/ParticipationType#ADM "admitter" 
* participant[1].individual = Reference(InterweavePractitionerExample)
* participant[1].individual.display = "Dr Jane BLOGGS"
//* participant[1].individual.identifier.system = "https://fhir.nhs.uk/Id/sds-user-id"
//* participant[1].individual.identifier.value = "ABC123"

// No discharger or other participants

* diagnosis[0].condition = Reference(InterweaveConditionExample)
//* diagnosis[0].condition.display = "Purple rash"
* diagnosis[0].use = http://hl7.org/fhir/diagnosis-role#CC "Chief complaint"   //R4 - STU3 has "role"
* diagnosis[0].rank = 1

* reasonCode = http://snomed.info/sct#299007 "Paraffinoma of skin"

* location[0].location = Reference(InterweaveLocationWardExampleAandE)
* location[0].location.display = "York Hospital: Accident and Emergency"
* location[0].status = #completed
* location[0].period.start = "2022-01-08T11:03:00Z"
* location[0].period.end = "2022-01-09T09:00:00Z"


* partOf = Reference(InterweaveEncounterGroupingExample)
//* partOf.display = "08/01/2022 11:03 - 11/01/2022 14:30 : Grouping of related Encounters"

// This encounter has the "admission" half of the hospitalization
* insert Ruleset-HospitalizationExample-AdmissionEmergency




////////////////////////////////////////////////////////////////////////


Instance: InterweaveEncounterExample-MaturityLevel2-Part2
InstanceOf: InterweaveEncounter
Description: "Interweave Encounter example - Maturity Level 2 (part 2 of grouping)"

* insert Ruleset-ExampleMetaForHospital(Encounter)

// Text summary no longer needed
// (Period.start - Period.end : Class description: Service Type description)
//* extension[Extension-Interweave-TextSummary].valueString = "09/01/2022 09:00 - 11/01/2022 14:30 : Inpatient Actute : Adult dermatology service"

// Extension to add the all-important Service Type that is missing from STU3!
* extension[Extension-Interweave-R4EncounterServiceType].valueCodeableConcept = $SCT#23871000087101 "Adult dermatology service"

* contained[0] = InterweavePractitionerBobExample

* insert Ruleset-ExampleLocalId(encounter, RCB.ENC-456-XYZ)

* status = #finished
* statusHistory[+].status = #in-progress 
* statusHistory[=].period.start = "2022-01-09T09:00:00Z"
* statusHistory[=].period.end = "2022-01-11T14:30:00Z"


// (Note: Not using the "planned" status also helps the period make more sense)
* period.start = "2022-01-09T09:00:00Z" 
* period.end = "2022-01-11T14:30:00Z"

* class = http://hl7.org/fhir/v3/ActCode#ACUTE "inpatient acute"
* type.coding[0] = $SCT#185212007 "Seen in hospital ward"  //TODO - for some reason not valid??
* priority.coding[0] = http://hl7.org/fhir/v3/ActPriority#EM "emergency"


* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"


// For now take this out, as referral downgraded to optional (due to R4 changes)
//* basedOn.display = "04/11/2021: Dr Jones: Rash on arm" // R4 - STU3 has "incomingReferral"

* appointment = Reference(InterweaveAppointmentExample)
//* appointment.display = "09/01/2022 09:00 - 09/01/2022 09:30 : Inpatient Acture : Dermatology"


* participant[0].type[0].coding = http://hl7.org/fhir/v3/ParticipationType#PPRF "primary performer"
* participant[0].individual = Reference(InterweavePractitionerExample)
* participant[0].individual.display = "Dr Jane BLOGGS"
//* participant[0].individual.identifier.system = "https://fhir.nhs.uk/Id/sds-user-id"
//* participant[0].individual.identifier.value = "ABC123"

// No admitter here

* participant[1].type[0].coding = http://hl7.org/fhir/v3/ParticipationType#DIS "discharger"
* participant[1].individual = Reference(InterweavePractitionerExample)
* participant[1].individual.display = "Dr Jane BLOGGS"
//* participant[1].individual.identifier.system = "https://fhir.nhs.uk/Id/sds-user-id"
//* participant[1].individual.identifier.value = "ABC123"


* participant[2].type[0].coding = http://hl7.org/fhir/v3/ParticipationType#PART "Participation" 
* participant[2].individual = Reference(InterweavePractitionerBobExample)
* participant[2].individual.display = "Dr Bob SMITHSON"
//* participant[2].individual.identifier.system = "https://fhir.nhs.uk/Id/sds-user-id"
//* participant[2].individual.identifier.value = "XYZ987"


* diagnosis[0].condition = Reference(InterweaveConditionExample)
//* diagnosis[0].condition.display = "Purple rash"
* diagnosis[0].use = http://hl7.org/fhir/diagnosis-role#CC "Chief complaint"   //R4 - STU3 has "role"
* diagnosis[0].rank = 1

* reasonCode = http://snomed.info/sct#299007 "Paraffinoma of skin"

* location[0].location = Reference(InterweaveLocationWardExample1)
* location[0].location.display = "York Hospital: Ward 27 - Dermatology clinic"
* location[0].status = #completed
* location[0].period.start = "2022-01-09T09:00:00Z"
* location[0].period.end = "2022-01-09T10:30:00Z"

* location[1].location = Reference(InterweaveLocationWardExample2)
* location[1].location.display = "York Hospital: Ward 28 - Allergy clinic"
* location[1].status = #completed
* location[1].period.start = "2022-01-09T10:30:00Z"
* location[1].period.end = "2022-01-11T14:30:00Z"


* partOf = Reference(InterweaveEncounterGroupingExample)
//* partOf.display = "08/01/2022 11:03 - 11/01/2022 14:30 : Grouping of related Encounters"

// This encounter has the "discharge" half of the hospitalization
* insert Ruleset-HospitalizationExample-Discharge



/////////////////////////////////////////////////////////////////////////
Instance: InterweaveLocationHouseAdmissionExample
InstanceOf: InterweaveLocation
Description: "Interweave Location example - House for discharge"
Usage: #inline


// No meta tags or TextSummary as inline

* status = http://hl7.org/fhir/location-status#active "Active"
* name = "42 Grove Street, LS21 1PF"

* mode = http://hl7.org/fhir/location-mode#instance "Instance"
* type.coding = http://hl7.org/fhir/v3/RoleCode#PTRES "Patient's Residence"
* physicalType.coding = http://hl7.org/fhir/location-physical-type#ho "House"

* address[0].line[0] = "42 Grove Street"
* address[0].line[1] = "Northville"
* address[0].city = "Overtown"
* address[0].district = "West Yorkshire"
* address[0].postalCode = "LS21 1PF"


/////////////////////////////////////////////////////////////////////////
Instance: InterweavePractitionerBobExample
InstanceOf: InterweavePractitioner
Description: "Interweave Practitioner Bob example"
Usage: #inline


// No meta tags or TextSummary as inline

* identifier[0].system = "https://fhir.nhs.uk/Id/sds-user-id"
* identifier[0].value = "XYZ987"

* active = true
* name[0].given[0] = "Bob"
* name[0].family = "Smithson"
* name[0].prefix = "Dr"

* telecom[0].system = #phone "Phone"
* telecom[0].use = #work "Work"
* telecom[0].value = "01234 9876512"



////////////////////////////////////////////////////////////////////////////////////////
// Example Rulesets
////////////////////////////////////////////////////////////////////////////////////////

RuleSet: Ruleset-HospitalizationExample-AdmissionEmergency

* hospitalization.extension[Extension-CareConnect-AdmissionMethod-1].valueCodeableConcept =  CareConnect-AdmissionMethod-1#21 "Accident and emergency or dental casualty department of the Health Care Provider"
* hospitalization.origin = Reference(InterweaveLocationHouseAdmissionExample)
* hospitalization.origin.display = "42 Grove Street, LS21 1PF"
* hospitalization.admitSource = CareConnect-SourceOfAdmission-1#19 "Usual place of residence unless listed below, for example, a private dwelling whether owner occupied or owned by Local Authority, housing association or other landlord. This includes wardened accommodation but not residential accommodation where health care is provided. It also includes Patients with no fixed abode." 


RuleSet: Ruleset-HospitalizationExample-AdmissionWaitingList

* hospitalization.extension[Extension-CareConnect-AdmissionMethod-1].valueCodeableConcept =  CareConnect-AdmissionMethod-1#11 "Waiting list"
* hospitalization.origin = Reference(InterweaveLocationHouseAdmissionExample)
* hospitalization.origin.display = "42 Grove Street, LS21 1PF"
* hospitalization.admitSource = CareConnect-SourceOfAdmission-1#19 "Usual place of residence unless listed below, for example, a private dwelling whether owner occupied or owned by Local Authority, housing association or other landlord. This includes wardened accommodation but not residential accommodation where health care is provided. It also includes Patients with no fixed abode." 



RuleSet: Ruleset-HospitalizationExample-Discharge

* hospitalization.extension[Extension-CareConnect-DischargeMethod-1].valueCodeableConcept =  CareConnect-DischargeMethod-1#1 "Patient discharged on clinical advice or with clinical consent"

* hospitalization.extension[Extension-Interweave-MedicallySafeForDischarge].extension[status].valueCode = Interweave-MedicallySafeForDischargeStatus-1#ready "Ready"
* hospitalization.extension[Extension-Interweave-MedicallySafeForDischarge].extension[predictedDate].valueDateTime = "2022-01-11T09:00:00Z"
* hospitalization.extension[Extension-Interweave-MedicallySafeForDischarge].extension[actualDate].valueDateTime = "2022-01-09T09:00:00Z"

* hospitalization.destination = Reference(InterweaveLocationSocialCareExample)
* hospitalization.destination.display = "St Hildas Care Home"
* hospitalization.dischargeDisposition = Interweave-DischargeDestination-1#56 "Care Home Without Nursing"


