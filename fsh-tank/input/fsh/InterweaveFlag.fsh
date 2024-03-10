Profile: InterweaveFlag
Parent: CareConnect-Flag-1
Id: Interweave-Flag
Description: "Interweave Flag resource profile"
* ^status = #active

* insert Ruleset-InterweaveBaseFields

///////////////////////////////////////
// --- MANDATORY FIELDS ---
///////////////////////////////////////

* status 1..1 MS
* status = #active (exactly)
* status ^short = "Only use 'active' - only active flags should be shared."

* category 1..1 MS
* category from Interweave-FlagCategory-1 (required)
* insert Ruleset-CodingWithSystemCodeDisplay(category)

* code 1..1 MS
* code from Interweave-FlagType-1 (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(code)


// Subject: Every Flag MUST be linked to a patient
* subject 1..1 MS 
// We only want Patients
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)
* subject ^short = "The patient to which the flag is assigned."

///////////////////////////////////////
// --- MUST SUPPORT FIELDS ---
///////////////////////////////////////
* period.start 0..1 MS
* period.start ^short = "The date that the flag was placed against the patient"

///////////////////////////////////////
// --- OPTIONAL FIELDS ---
///////////////////////////////////////

* insert Ruleset-AddIdentifierSlicing
* insert Ruleset-AddLocalIdentifierOptional(flag)

* author 0..1
//* author only Reference(CareConnect-Practitioner-1 or CareConnect-Organization-1) TODO
* author ^short = "The practitioner, organizational team or organization which placed the flag against the patient."

///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////
* encounter 0..0 
//* code.coding[snomedCT] 0..0

///////////////////////////////////////
// --- Discouraged fields ---
///////////////////////////////////////


// *************************************************************************************************************************
// EXAMPLES
// *************************************************************************************************************************
Instance: InterweaveFlagExample-MustSupport
InstanceOf: InterweaveFlag
Description: "Interweave Flag Example - Must Support"

* insert Ruleset-ExampleMetaForSocialCare(Flag)
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Flag-1"

* status = http://hl7.org/fhir/flag-status#active "Active"

* category[0] = https://fhir.yhcr.nhs.uk/CodeSystem/Interweave-SocialCareFlagCategory-1#RTO "Risk to other"

* code = Interweave-SocialCareFlagType-1#ABUSIVE "Know to be abusive"

* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"

* period.start = "2022-01-09T09:00:00Z" 


Instance: InterweaveFlagExample-Full
InstanceOf: InterweaveFlag
Description: "Interweave Flag Example - Full"

* insert Ruleset-ExampleMetaForSocialCare(Flag)
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Flag-1"

* insert Ruleset-ExampleLocalId(Flag, XXX.SCF-ABC123)
 
* status = http://hl7.org/fhir/flag-status#active "Active"

* category.coding[0] = Interweave-SocialCareFlagCategory-1#RTO "Risk to other"

* code = Interweave-SocialCareFlagType-1#ABUSIVE "Know to be abusive"

* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"

* period.start = "2022-01-09T09:00:00Z" 
* period.end = "2022-01-11T14:30:00Z"

* author = Reference(InterweaveOrganizationExampleSocialCare) 
* author.display = "Leeds City Council"


