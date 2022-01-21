Profile: YhcrEncounterHospitalization
Parent: CareConnect-Encounter-1
Id: Yhcr-Encounter-Hospitalization
Description: "YHCR Encounter resource profile for Hospitalization."

// This is the first (and currently only) example of a higher-level encounter used to group other encounters together. 
// The aim is to capture skeletal information which does not duplicate that already covered by the more detailed Encounter records
//  – with focus on the “Hospitalisation” fields which add overarching details of the hospital stay


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

// Status History: Leave as optional - more likely to be captured on the underlying encounters

// Class: Make mandatory, MS - must be "Inpatient Acutre"
//      **TODO - <<How to identify that it is actually a Hospitalisation? A “tag” has been suggested – to confirm>>
* class 1..1 MS
* class = http://hl7.org/fhir/v3/ActCode#ACUTE "inpatient acute" (exactly)
* classHistory 0..0

// Type and Priority: Are captured in the underlying encounters
* type 0..0
* priority 0..0

// Subject: Every Encounter MUST be linked to a patient
* subject 1..1 MS 
* subject only Reference(Yhcr-Patient)

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
//   Don't want status or period - should be a single site
* location 1..* MS
* location.location MS
* location.location only Reference(YhcrLocation)
* location.status 0..0
* location.period 0..0

// Service Provider: Discouraged
//  This is covered via the provenance tags
* serviceProvider ^short = "DISCOURAGED: This is instead covered via the provenance tags"

// PartOf: Excluded. This is the top of the heirarchy
* partOf 0..0

////////////////////////////////////////////////////////////////////////////////////////
// Hospitalization: This is the point of this type of encounter, so must obviously be included!
////////////////////////////////////////////////////////////////////////////////////////
* hospitalization 1..1 MS

// PreAdmissionIdentifier: Leave as optional (TODO confirm exactly what it is for)

// TODO!!!!!!! Admission Method and Discharge Method: there are these extensions on the "other" CareConnect which looked useful.
// But they are not here? Hmm. So leave them out for now.

// Origin: Useful to provide if possible, especially if transfered from another institution
* hospitalization.origin ^short = "The location from which the patient came before admission. Useful to provide if possible, in particular to reference a 'site' if transfered from another institution."
* hospitalization.origin only Reference(YhcrLocation)

// AdmitSource: MS. Useful categorisation about the type of place the patient came from (eg home, other NHS hospital, care home, etc)
//   (Also tighten the code list)
* hospitalization.admitSource MS
* hospitalization.admitSource from CareConnect-SourceOfAdmission-1 (required)

// Readmission: MS. If it is known to be a readmission then the field should be included and populated with the single code value of “R” for “Readmission”
//      Otherwise this field is omitted
* hospitalization.reAdmission MS

// Diet Preferences and others: Discouraged. This information would be relevant for a hospital EPR (to inform management of the patient’s stay), but adds unnecessary complexity to the Hospitalisation linkage for a regional shared record. 
//     (If needed then could be captured other ways eg via flags, observations, care plan, etc)
* hospitalization.dietPreference ^short = "DISCOURAGED: Relevant for managing the patient's stay, but less so for regional sharing"
* hospitalization.specialCourtesy ^short = "DISCOURAGED: Relevant for managing the patient's stay, but less so for regional sharing"
* hospitalization.specialArrangement ^short = "DISCOURAGED: Relevant for managing the patient's stay, but less so for regional sharing"

// Destination: Important to provide if known, especially if transfered to another institution, but also to support discharge planning
* hospitalization.destination MS
* hospitalization.destination ^short = "The location from which the patient came before admission. Important to provide if known to support discharge planning, and/or to reference a 'site' if transfered to another institution."
* hospitalization.destination only Reference(YhcrLocation)

// Discharge Disposition: MS. Useful categorisation about the type of place the patient came from (eg home, other NHS hospital, care home, etc)
//   (Also tighten the code list)
* hospitalization.dischargeDisposition MS
* hospitalization.dischargeDisposition from CareConnect-DischargeDestination-1 (required)


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: YhcrEncounterHospitalizationExample
InstanceOf: YhcrEncounterHospitalization
Description: "YHCR Encounter Hospitalization example"

* identifier[localIdentifier].system = "https://yhcr.org/Id/local-encounter-identifier"
* identifier[localIdentifier].value = "ABC-777-XYZ"

* status = #finished

* period.start = "2022-01-09T09:00:00Z"
* period.end = "2022-01-11T14:30:00Z"

* class = http://hl7.org/fhir/v3/ActCode#ACUTE "inpatient acute"

* subject = Reference(YhcrPatientExample-MustSupport) 
* subject.display = "Fred Bloggs"

* location[0].location = Reference(YhcrLocationSiteExample)
* location[0].location.display = "York Hospital"

* hospitalization.origin.display = "Patient's home"
* hospitalization.admitSource = CareConnect-SourceOfAdmission-1#19 "Usual place of residence unless listed below, for example, a private dwelling whether owner occupied or owned by Local Authority, housing association or other landlord. This includes wardened accommodation but not residential accommodation where health care is provided. It also includes Patients with no fixed abode." 

* hospitalization.destination = Reference(YhcrLocationSocialCareDeptExample)
* hospitalization.destination.display = "Leeds Social Services: Adult Services Department"
* hospitalization.dischargeDisposition = CareConnect-DischargeDestination-1#65 "Local Authority residential accommodation i.e. where care is provided' instead of 'Local Authority residential accommodation"

