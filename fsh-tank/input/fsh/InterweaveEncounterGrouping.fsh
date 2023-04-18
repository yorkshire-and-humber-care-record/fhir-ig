Profile: InterweaveEncounterGrouping
Parent: CareConnect-Encounter-1
Id: Interweave-EncounterGrouping
Description: "Interweave Encounter resource profile  to group other encounters into a 'visit'"
* ^status = #active

* insert Ruleset-InterweaveBaseFields

// This is a higher-level encounter used to group other encounters together. 
// The aim is to capture skeletal information which does not duplicate that already covered by the more detailed Encounter records
//  – with focus on the “Hospitalization” fields which add overarching details of the visit
// Typically this would indeed be used to represent a "hospitalization", but it could be used as a higher level grouping in other situations too.


// Extensions - Not really needed on this grouping encounter, but leave as optional for now

// Identifier:
// This is a business identifier for the Encounter.
// The value for a local identifier must be populated and contain the internal id for this Encounter on the providing system
// Thus providing a link back for any follow-up and/or troubleshooting
* insert Ruleset-AddIdentifierSlicing
* insert Ruleset-AddLocalIdentifierMS(encounter)

// Status: Already mandatory in FHIR, emphasise with Must Support
* status MS

// Status History: Leave as optional - more likely to be captured on the underlying encounters

// Class: Make mandatory, MS - must be "Grouping"
//      (Use our own list in case so we can add this to it
* class 1..1 MS
* class from Interweave-EncounterClass-1 (required)
* class = Interweave-EncounterClass-1#GROUPING "Grouping of related Encounters" (exactly)
* insert Ruleset-RawCodingWithSystemCodeDisplay(class)

* classHistory 0..0

// Type and Priority: Are captured in the underlying encounters
* type 0..0
* priority 0..0

// Subject: Every Encounter MUST be linked to a patient
* subject 1..1 MS 
// We only want Patients - not Groups
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)
* subject ^short = "The patient (NOT group) present at the encounter"


// More fields that are instead captured in the underlying encounter
* extension[Extension-CareConnect-EncounterTransport-1] 0..0
* extension[Extension-CareConnect-OutcomeOfAttendance-1] 0..0
* extension[Extension-CareConnect-EmergencyCareDischargeStatus-1] 0..0
* basedOn 0..0  // R4 - STU3 has "incomingReferral"
* appointment 0..0
* participant 0..0
* reasonCode 0..0  //R4 - STU3 has "reason"
* diagnosis 0..0
* location 0..0
* episodeOfCare 0..0

// Period: Mandatory. When the encounter occurred is vital to know.
//      The start date/time is always mandatory, but as per the FHIR specification, the end date/time may be omitted if the encounter is ongoing
* period 1..1 MS
* period.start 1..1 MS
* period.end MS

// Length: Discouraged. This duplicates information that is already available via the Period.
// In some systems it is used to indicate exactly how long a patient was in the consulting room (eg for billing), but this is not relevant here.
* length ^short = "DISCOURAGED: This duplicates information that is already available via the Period"

// Account: Excluded - we are not concerned with billing information
* account 0..0


// Service Provider: Discouraged
//  This is covered via the provenance tags
* serviceProvider ^short = "DISCOURAGED: This is instead covered via the provenance tags"

// PartOf: Excluded. This is the top of the hierarchy
* partOf 0..0


// Hospitalization: Must Support to provide as part of this grouping
// It will be normal to fully populate here too (although not necessarily always if not relevant, depending on use-case)
// This will intentionally repeat here (all in one place details) already provided separately on one or more of the base encounters
* hospitalization 0..1 MS
* insert Ruleset-Hospitalization


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: InterweaveEncounterGroupingExample
InstanceOf: InterweaveEncounterGrouping
Description: "Interweave Encounter Grouping example"


* insert Ruleset-ExampleMetaForHospital(Encounter)
* meta.profile[0] = "https://fhir.yhcr.nhs.uk/StructureDefinition/Interweave-EncounterGrouping"
* meta.versionId = "InterweaveEncounterGroupingExample-v1.0.0"

// Text summary no longer needed
// (Period.start - Period.end : Class description)
//* extension[Extension-Interweave-TextSummary].valueString = "08/01/2022 11:03 - 11/01/2022 14:30 : Grouping of related Encounters"

* contained[0] = InterweaveLocationHouseAdmissionExample

* insert Ruleset-ExampleLocalId(encounter, RCB.ENC-777-XYZ)

* status = #finished

* period.start = "2022-01-08T11:03:00Z"
* period.end = "2022-01-11T14:30:00Z"

* class = Interweave-EncounterClass-1#GROUPING "Grouping of related Encounters"

* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"

* insert Ruleset-HospitalizationExample-AdmissionEmergency
* insert Ruleset-HospitalizationExample-Discharge


