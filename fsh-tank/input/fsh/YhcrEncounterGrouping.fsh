Profile: YhcrEncounterGrouping
Parent: CareConnect-Encounter-1
Id: Yhcr-EncounterGrouping
Description: "YHCR Encounter resource profile  to group other encounters into a 'visit'"
* ^status = #draft

* insert Ruleset-YhcrBaseFields

// This is a higher-level encounter used to group other encounters together. 
// The aim is to capture skeletal information which does not duplicate that already covered by the more detailed Encounter records
//  – with focus on the “Hospitalization” fields which add overarching details of the visit
// Typically this would indeed be used to represent a "hospitalization", but it could be used as a higher level grouping in other situations too.


// Extensions - Not really needed on this grouping encounter, but leave as optional for now

// Identifier:
// This is a business identifier for the Encounter.
// The value for a local identifier must be populated and contain the internal id for this Encounter on the providing system
// Thus providing a link back for any follow-up and/or troubleshooting
* insert Ruleset-AddLocalIdentifier(encounter)

// Status: Already mandatory in FHIR, emphasise with Must Support
* status MS

// Status History: Leave as optional - more likely to be captured on the underlying encounters

// Class: Make mandatory, MS - must be "Visit Grouping"
//      (Use our own list in case so we can add this to it
* class 1..1 MS
//* class = http://hl7.org/fhir/v3/ActCode#ACUTE "inpatient acute" (exactly)
* class = Yhcr-EncounterClass-1#GROUPING "Grouping of related Encounters" (exactly)
* insert Ruleset-RawCodingWithSystemCodeDisplay(class)

* classHistory 0..0

// Type and Priority: Are captured in the underlying encounters
* type 0..0
* priority 0..0

// Subject: Every Encounter MUST be linked to a patient
* subject 1..1 MS 
// We only want Patients - not Groups
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferencePatient(subject)
* subject ^short = "The patient (NOT group) present at the encounter"

// Episode of Care: Leave as optional for now. (A potential part of wider structure, see wider discussion)

// More fields that are instead captured in the underlying encounter
* basedOn 0..0  // R4 - STU3 has "incomingReferral"
* appointment 0..0
* participant 0..0
* reasonCode 0..0  //R4 - STU3 has "reason"
* diagnosis 0..0
* location 0..0

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

// PartOf: Excluded. This is the top of the heirarchy
* partOf 0..0


////////////////////////////////////////////////////////////////////////////////////////
// Hospitalization 
////////////////////////////////////////////////////////////////////////////////////////

// Hospitalization: Mandatory to provide as part of this grouping
* hospitalization 1..1 MS


// PreAdmissionIdentifier: Leave as optional (TODO confirm exactly what it is for)

// Extensions - these seem useful, make MS
* hospitalization.extension[Extension-CareConnect-AdmissionMethod-1] MS
* hospitalization.extension[Extension-CareConnect-DischargeMethod-1] MS

// Origin: Useful to provide if possible, especially if transfered from another institution
* hospitalization.origin ^short = "The location from which the patient came before admission. Useful to provide if possible, in particular to reference a 'site' if transfered from another institution."
* insert Ruleset-ReferenceExternalLocation(hospitalization.origin)

// AdmitSource: MS. Useful categorisation about the type of place the patient came from (eg home, other NHS hospital, care home, etc)
//   (Also tighten the code list)
* hospitalization.admitSource MS
* hospitalization.admitSource from CareConnect-SourceOfAdmission-1 (required)
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
* insert Ruleset-ReferenceExternalLocation(hospitalization.destination)

// Discharge Disposition: MS. Useful categorisation about the type of place the patient came from (eg home, other NHS hospital, care home, etc)
//   (Also tighten the code list)
* hospitalization.dischargeDisposition MS
* hospitalization.dischargeDisposition from CareConnect-DischargeDestination-1 (required)
* insert Ruleset-CodingWithSystemCodeDisplay(hospitalization.dischargeDisposition)


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: YhcrEncounterGroupingExample
InstanceOf: YhcrEncounterGrouping
Description: "YHCR Encounter Grouping example"


* insert Ruleset-ExampleMetaForHospital(Encounter)
* meta.profile[0] = "http://yhcr.org/StructureDefinition/Yhcr-EncounterGrouping"
* meta.versionId = "YhcrEncounterGroupingExample-v1.0.0"

// (Period.start - Period.end : Class description)
* extension[Extension-Yhcr-TextSummary].valueString = "09/01/2022 09:00 - 11/01/2022 14:30 : Grouping of related Encounters"

* contained[0] = YhcrLocationHouseDischargeExample

* insert Ruleset-ExampleLocalId(encounter, RCB.ENC-777-XYZ)

* status = #finished

* period.start = "2022-01-09T09:00:00Z"
* period.end = "2022-01-11T14:30:00Z"

* class = Yhcr-EncounterClass-1#GROUPING "Grouping of related Encounters"

* subject = Reference(YhcrPatientExample-MustSupport) 
* subject.display = "Fred Bloggs"


* hospitalization.extension[Extension-CareConnect-AdmissionMethod-1].valueCodeableConcept =  CareConnect-AdmissionMethod-1#11 "Waiting list"
* hospitalization.extension[Extension-CareConnect-DischargeMethod-1].valueCodeableConcept =  CareConnect-DischargeMethod-1#1 "Patient discharged on clinical advice or with clinical consent"

* hospitalization.origin = Reference(YhcrLocationHouseDischargeExample)
* hospitalization.origin.display = "42 Grove Street, LS21 1PF"
* hospitalization.admitSource = CareConnect-SourceOfAdmission-1#19 "Usual place of residence unless listed below, for example, a private dwelling whether owner occupied or owned by Local Authority, housing association or other landlord. This includes wardened accommodation but not residential accommodation where health care is provided. It also includes Patients with no fixed abode." 

* hospitalization.destination = Reference(YhcrLocationSocialCareDeptExample)
* hospitalization.destination.display = "Leeds Social Services: Adult Services Department"
* hospitalization.dischargeDisposition = CareConnect-DischargeDestination-1#65 "Local Authority residential accommodation i.e. where care is provided"


/////////////////////////////////////////////////////////////////////////
Instance: YhcrLocationHouseDischargeExample
InstanceOf: YhcrLocation
Description: "YHCR Location example - House for discharge"
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