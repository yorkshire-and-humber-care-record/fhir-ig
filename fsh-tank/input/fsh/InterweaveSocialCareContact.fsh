

Profile: InterweaveSocialCareContact
Parent: CareConnect-ReferralRequest-1 
Id: Interweave-SocialCareContact
Description: "Interweave Social Care Contact resource profile (modelled using FHIR ReferralRequest)"
* ^status = #active

* insert Ruleset-InterweaveBaseFields

///////////////////////////////////////
// --- EXTENSIONS ---
///////////////////////////////////////

//A MS extension for requester type, As requested by the Social Care Data Standards working group.
* extension contains Extension-Interweave-SocialCareRequesterType named requesterType 1..1 MS

///////////////////////////////////////
// --- MANDATORY FIELDS ---
///////////////////////////////////////

* status 1..1 MS
* status from InterweaveSocialCareContactStatus (required)
* status ^short = "A mandatory flag to indicate the status of the contact."

* intent 1..1 MS
* intent = #plan (exactly)

// Subject: Every contact/referral request MUST be linked to a patient
* subject MS
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)
* subject ^short = "The person which is subject of the contact."

* occurrence[x] only dateTime
* occurrence[x] 1..1 MS
* occurrence[x] ^short = "The date/time that the contact was made."

* authoredOn 1..1 MS 
* authoredOn ^short = "The date/time that the contact was recorded."

* reasonCode 1..1 MS
* reasonCode from InterweaveSocialCareContactReason (required)

///////////////////////////////////////
// --- MUST SUPPORT FIELDS ---
///////////////////////////////////////

// * type MS - e.g. TODO Referral to social services for adult protection- not in R4

//description in STU3
* patientInstruction 0..1 MS  
* patientInstruction ^short = "Additional narrative around the reason for contact"



///////////////////////////////////////
// --- Optional fields ---
///////////////////////////////////////

//Optionally provide a localId
* insert Ruleset-AddIdentifierSlicing
* insert Ruleset-AddLocalIdentifierOptional(socialcarecontact)

* priority ^short = "The priority for the contact being acted upon/followed up."

//context in STU3
* encounter only Reference(CareConnect-Encounter-1)
* encounter ^short = "Optional link to an encounter resource. e.g. contact for hospital discharge assessments linked back to a hospital encounter."

//requester.agent in STU3
//* requester only Reference(CareConnect-Practitioner-1 or CareConnect-Organization-1) TODO
* requester ^short = "Use agent to provide a reference to the organisation, organisational team or practitioner making the contact."



///////////////////////////////////////
// --- Discouraged fields ---
///////////////////////////////////////

//None


///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////
//* definition 0..0 - not in R4
//* definition ^short = "Not relevant to social care." - not in R4
* basedOn 0..0
* basedOn ^short = "Not relevant to social care."
* replaces 0..0
* replaces ^short = "Not relevant to social care."
//* groupIdentifier 0..0 - not in R4
//* groupIdentifier ^short = "Not relevant to social care."
//* specialty 0..0 - not in R4
//* specialty ^short = "Not relevant to social care."
//* recipient 0..0 - not in R4
//* recipient ^short = "Not relevant to social care."
* reasonReference 0..0
* reasonReference ^short = "Not relevant to social care."
* supportingInfo 0..0
* supportingInfo ^short = "Not relevant to social care."
* note 0..0
* note ^short = "Not relevant to social care."
* relevantHistory 0..0
* relevantHistory ^short = "Not relevant to social care."



/*
// *************************************************************************************************************************
// EXAMPLES - TODO
// *************************************************************************************************************************
Instance: InterweaveSocialCareContactExample-MS
InstanceOf: InterweaveSocialCareContact
Description: "Interweave Social Care Contact example - Must Support"

* insert Ruleset-ExampleMetaForSocialCare(SocialCareContact)
//Add care connect profile manually
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-ReferralRequest-1"

* status = http://hl7.org/fhir/request-status#completed "Completed"

* intent = http://hl7.org/fhir/request-intent#plan "Plan"

//* type = http://snomed.info/sct#306238000 "Referral to Social Services" TODO

* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"

* occurrence[x] = "2022-07-10T09:00:00Z" 

* authoredOn = "2022-07-10T09:00:00Z" 

* reasonCode = Interweave-SocialCareContactReason-1#HD "Hospital Discharge"

* patientInstruction = "Request for hospital discharge assessment."

* extension[Extension-Interweave-SocialCareRequesterType].valueCodeableConcept = Interweave-SocialCareRequesterType-1#SH "Secondary Health (A&E, Hospital, OT, Ward, Hospice)"

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: InterweaveSocialCareContactExample-Full
InstanceOf: InterweaveSocialCareContact
Description: "Interweave Social Care Contact example - Full"

* insert Ruleset-ExampleMetaForSocialCare(SocialCareContact)
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-ReferralRequest-1"

* extension[Extension-CareConnect-ReferralRequestMethod-1].valueCodeableConcept = CareConnect-ReferralRequestMethod-1#2 "Phone"
* extension[Extension-CareConnect-SourceOfReferral-1].valueCodeableConcept = http://snomed.info/sct#309013001 "Referred by person"

* insert Ruleset-ExampleLocalId(SocialCareContact, XXX.CONTACT-ABC123)

* status = http://hl7.org/fhir/request-status#completed "Completed"

* intent = http://hl7.org/fhir/request-intent#plan "Plan"

//* type = http://snomed.info/sct#306238000 "Referral to Social Services" TODO

* priority = http://hl7.org/fhir/request-priority#routine "Routine"

//* serviceRequested = http://snomed.info/sct#394602003 "Rehabilitation" TODO

* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"

* encounter = Reference(InterweaveEncounterExample-MaturityLevel1)

* occurrence[x] = "2022-07-10T09:00:00Z" 

* authoredOn = "2022-07-10T09:00:00Z" 

* requester = Reference(InterweavePractitionerExample)
* requester.display = "Dr Jane BLOGGS"

* reasonCode = Interweave-SocialCareContactReason-1#HD "Hospital Discharge"

* patientInstruction = "Request for hospital discharge assessment."

* extension[Extension-Interweave-SocialCareRequesterType].valueCodeableConcept = Interweave-SocialCareRequesterType-1#SH "Secondary Health (A&E, Hospital, OT, Ward, Hospice)"

*/