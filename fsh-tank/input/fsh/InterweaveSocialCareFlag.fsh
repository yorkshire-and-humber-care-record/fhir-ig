Profile: InterweaveSocialCareFlag
Parent: CareConnect-Flag-1
Id: Interweave-SocialCareFlag
Description: "Interweave Social Care Flag resource profile - DRAFT"
* ^status = #draft

* insert Ruleset-InterweaveBaseFields

///////////////////////////////////////
// --- MANDATORY FIELDS ---
///////////////////////////////////////

* status 1..1 MS
* status = #active (exactly)
* status ^short = "Only use 'active' - only active flags should be shared."

* category 1..1 MS
* category from Interweave-SocialCareFlagCategory-1 (extensible)
* insert Ruleset-CodingWithSystemCodeDisplay(category)

* code 1..1 MS
* code from Interweave-SocialCareFlagType-1 (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(code)


// Subject: Every Flag MUST be linked to a patient
* subject 1..1 MS 
// We only want Patients
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)
* subject ^short = "The person to which the flag is assigned."

///////////////////////////////////////
// --- MUST SUPPORT FIELDS ---
///////////////////////////////////////
* period.start 0..1 MS
* period.start ^short = "The date that the flag was placed against the patient"

///////////////////////////////////////
// --- OPTIONAL FIELDS ---
///////////////////////////////////////

* insert Ruleset-AddIdentifierSlicing
* insert Ruleset-AddLocalIdentifierOptional(socialcareflag)

* author 0..1
//* author only Reference(CareConnect-Practitioner-1 or CareConnect-Organization-1) TODO
* author ^short = "The practitioner, organizational team or organization which placed the flag against the person."

///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////
* encounter 0..0 
* code.coding[snomedCT] 0..0

///////////////////////////////////////
// --- Discouraged fields ---
///////////////////////////////////////


// *************************************************************************************************************************
// EXAMPLES
// *************************************************************************************************************************
Instance: InterweaveSocialCareFlagExample-MustSupport
InstanceOf: InterweaveSocialCareFlag
Description: "Interweave Social Care Flag example - Must Support"

* insert Ruleset-ExampleMetaForSocialCare(SocialCareFlag)
* meta.versionId = "InterweaveSocialCareFlagExampleMS-v1.0.0"

* status = http://hl7.org/fhir/flag-status#active "Active"

* category = Interweave-SocialCareFlagCategory-1#RTO "Risk to other"

* code = Interweave-SocialCareFlagType-1#ABUSIVE "Know to be abusive"

* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"

* period.start = "2022-01-09T09:00:00Z" 


Instance: InterweaveSocialCareFlagExample-Full
InstanceOf: InterweaveSocialCareFlag
Description: "Interweave Social Care Flag example - Full"

* insert Ruleset-ExampleMetaForSocialCare(SocialCareFlag)
* meta.versionId = "InterweaveSocialCareFlagExampleFull-v1.0.0"

* insert Ruleset-ExampleLocalId(SocialCareFlag, XXX.SCF-ABC123)
 
* status = http://hl7.org/fhir/flag-status#active "Active"

* category = Interweave-SocialCareFlagCategory-1#RTO "Risk to other"

* code = Interweave-SocialCareFlagType-1#ABUSIVE "Know to be abusive"

* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"

* period.start = "2022-01-09T09:00:00Z" 
* period.end = "2022-01-11T14:30:00Z"

* author = Reference(InterweaveOrganizationExampleSocialCare) 
* author.display = "Leeds City Council"


