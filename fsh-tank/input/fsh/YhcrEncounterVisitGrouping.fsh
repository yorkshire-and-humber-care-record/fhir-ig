Profile: YhcrEncounterVisitGrouping
Parent: CareConnect-Encounter-1
Id: Yhcr-Encounter-VisitGrouping
Description: "YHCR Encounter resource profile  to group other encounters into a 'visit'"

// This is a higher-level encounter used to group other encounters together. 
// The aim is to capture skeletal information which does not duplicate that already covered by the more detailed Encounter records
//  – with focus on the “Hospitalization” fields which add overarching details of the visit
// Typically this would indeed be used to represent a "hospitalization", but it could be used as a higher level grouping in other situations too.


// Extensions - Not really needed on this grouping encounter, but leave as optional for now

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

// Status History: Leave as optional - more likely to be captured on the underlying encounters

// Class: Make mandatory, MS - must be "Visit Grouping"
//      (Use our own list in case so we can add this to it
* class 1..1 MS
//* class = http://hl7.org/fhir/v3/ActCode#ACUTE "inpatient acute" (exactly)
* class = Yhcr-EncounterClass-1#VISITGROUPING "Grouping of Encounters that comprise a visit" (exactly)
* classHistory 0..0

// Type and Priority: Are captured in the underlying encounters
* type 0..0
* priority 0..0

// Subject: Every Encounter MUST be linked to a patient
* subject 1..1 MS 
// We only want Patients - not Groups
* subject only Reference(CareConnect-Patient-1)
* subject ^short = "The patient (NOT group) present at the encounter"

// Episode of Care: Leave as optional for now. (A potential part of wider structure, see wider discussion)

// More fields that are instead captured in the underlying encounter
* basedOn 0..0  // R4 - STU3 has "incomingReferral"
* appointment 0..0
* participant 0..0
* reasonCode 0..0  //R4 - STU3 has "reason"
* diagnosis 0..0

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

// Location: Mandatory.
//   The location provides essential information about where the encounter took place. 
//   Points to the Site level for a hospitalization
//   Leave status and period as optional - but usually expect an single entry for a single site
* location 1..* MS
* location.location MS
* location ^short = "Location the encounter takes place (at Site level for the overall visit)"


// Service Provider: Discouraged
//  This is covered via the provenance tags
* serviceProvider ^short = "DISCOURAGED: This is instead covered via the provenance tags"

// PartOf: Excluded. This is the top of the heirarchy
* partOf 0..0

// Hospitalization: Generally this would be filled in at this top level, so MS
//  However leave non-mandatory, as there may be other grouping scenarios in future, and/or populated at the lower level
* hospitalization MS
* insert HospitalizationRuleset




/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: YhcrEncounterVisitGroupingExample
InstanceOf: YhcrEncounterVisitGrouping
Description: "YHCR Encounter Visit Grouping example"

* contained[0] = YhcrLocationHouseDischargeExample

* identifier[localIdentifier].system = "https://yhcr.org/Id/local-encounter-identifier"
* identifier[localIdentifier].value = "ABC-777-XYZ"

* status = #finished

* period.start = "2022-01-09T09:00:00Z"
* period.end = "2022-01-11T14:30:00Z"

* class = Yhcr-EncounterClass-1#VISITGROUPING "Grouping of Encounters that comprise a visit"

* subject = Reference(YhcrPatientExample-MustSupport) 
* subject.display = "Fred Bloggs"

* location[0].location = Reference(YhcrLocationSiteExample)
* location[0].location.display = "York Hospital"

// Copy in our example fields for a hospitalization
* insert EncounterHospitalizationExampleRuleset

