Profile: InterweaveSocialCareService
Parent: CareConnect-EpisodeOfCare-1
Id: Interweave-SocialCareService
Description: "Interweave Social Care Service resource profile (modelled using FHIR EpisodeOfCare) - DRAFT"
* ^status = #draft

* insert Ruleset-InterweaveBaseFields

///////////////////////////////////////
// --- EXTENSIONS ---
///////////////////////////////////////

//A MS extension for requester type, As requested by the Social Care Data Standards working group.
* extension contains Extension-Interweave-SocialCareServiceCategory named category 1..1
* extension contains Extension-Interweave-SocialCareServiceTrigger named trigger 0..1

///////////////////////////////////////
// --- MANDATORY FIELDS ---
///////////////////////////////////////
* status 1..1 MS
* status from InterweaveSocialCareServiceStatus (required)
* status ^short = "A mandatory flag to indicate the status of the service."

* type 1..1 MS
* type from InterweaveSocialCareServiceType (extensible)
* type.text 1..1 MS
* insert Ruleset-CodingWithSystemCodeDisplay(type)

* managingOrganization 1..1 MS
* managingOrganization ^short = "The organisation which is providing the service. This can be a reference to either and external provider or an organisational team."

* patient 1..1 MS

///////////////////////////////////////
// --- MUST SUPPORT FIELDS ---
///////////////////////////////////////

* statusHistory MS

* period.start MS
* period.start ^short = "The date/time when a service commences"

* period.end MS
* period.end ^short = "The date/time that a service ceases"

///////////////////////////////////////
// --- OPTIONAL FIELDS ---
///////////////////////////////////////

//optional localId
* insert Ruleset-AddIdentifierSlicing
* insert Ruleset-AddLocalIdentifierOptional(socialcareservice)

* referralRequest ^short = "An optional link to a Social Care Contact (FHIR STU3 ReferralRequest)."

* careManager ^short = "An optional link to a practitioner delivering the service."


///////////////////////////////////////
// --- Discouraged fields ---
///////////////////////////////////////

* team ^short = "DISCOURAGED - The care team resource is yet to be defined (see notes)"

///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////
* account 0..0
* account ^short = "Not relevant to social care."

* diagnosis 0..0
* diagnosis ^short = "Not relevant to social care."



// *************************************************************************************************************************
// EXAMPLES 
// *************************************************************************************************************************

Instance: InterweaveSocialCareServiceExample-MustSupport
InstanceOf: InterweaveSocialCareService
Description: "Interweave Social Care Service example - Must Support"

* insert Ruleset-ExampleMetaForHospital(SocialCareService)
* meta.versionId = "InterweaveSocialCareServiceExampleMustSupport-v1.0.0"

* status = http://hl7.org/fhir/episode-of-care-status#planned "Planned"

* statusHistory[+].status = #planned
* statusHistory[=].period.start = "2022-06-08T09:00:00Z"
* statusHistory[=].period.end = "2022-06-09T09:00:00Z"
* statusHistory[+].status = #active
* statusHistory[=].period.start = "2022-06-09T09:00:00Z"
* statusHistory[=].period.end = "2022-07-09T09:00:00Z" 
* statusHistory[+].status = #finished 
* statusHistory[=].period.start = "2022-07-09T09:00:00Z"

* type = Interweave-SocialCareServiceType-1#R "Reablement"
* type.text = "Reablement Service"

* patient = Reference(InterweavePatientExample-MustSupport) 
* patient.display = "Mr Fred BLOGGS"

* managingOrganization = Reference(InterweaveSocialCareOrganisationalTeamExampleMS) 
* managingOrganization.display = "The reablement team"

* period.start = "2022-06-09T09:00:00Z" 
* period.end = "2022-07-09T09:00:00Z" 

* extension[Extension-Interweave-SocialCareServiceCategory].valueCodeableConcept = Interweave-SocialCareServiceCategory-1#STS-OLL "Short Term Support: Ongoing Low Level"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: InterweaveSocialCareServiceExample-Full
InstanceOf: InterweaveSocialCareService
Description: "Interweave Social Care Service example - Full"

* insert Ruleset-ExampleMetaForHospital(SocialCareService)
* meta.versionId = "InterweaveSocialCareServiceExampleFull-v1.0.0"

* insert Ruleset-ExampleLocalId(SocialCareService, XXX.SERVICE-ABC123)

* status = http://hl7.org/fhir/episode-of-care-status#finished "Finished"

* statusHistory[+].status = #planned
* statusHistory[=].period.start = "2022-06-08T09:00:00Z"
* statusHistory[=].period.end = "2022-06-09T09:00:00Z"
* statusHistory[+].status = #active
* statusHistory[=].period.start = "2022-06-09T09:00:00Z"
* statusHistory[=].period.end = "2022-07-09T09:00:00Z" 
* statusHistory[+].status = #finished 
* statusHistory[=].period.start = "2022-07-09T09:00:00Z"

* type = Interweave-SocialCareServiceType-1#R "Reablement"
* type.text = "Reablement Service"

* patient = Reference(InterweavePatientExample-MustSupport) 
* patient.display = "Mr Fred BLOGGS"

* managingOrganization = Reference(InterweaveSocialCareOrganisationalTeamExampleMS) 
* managingOrganization.display = "The reablement team"

* period.start = "2022-06-09T09:00:00Z" 
* period.end = "2022-07-09T09:00:00Z" 

//* referralRequest = Reference(InterweaveSocialCareContactExample-Full) TODO

//TODO create new practitioner example for Social Care
* careManager = Reference(InterweavePractitionerExample)
* careManager.display = "Dr Jane BLOGGS"

* extension[Extension-Interweave-SocialCareServiceCategory].valueCodeableConcept = Interweave-SocialCareServiceCategory-1#STS-OLL "Short Term Support: Ongoing Low Level"

* extension[Extension-Interweave-SocialCareServiceTrigger].valueReference = Reference(InterweaveSocialCareAssessmentExample-Full)



