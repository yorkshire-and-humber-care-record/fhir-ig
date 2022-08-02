Profile: InterweaveSocialCareRelatedPerson
Parent: CareConnect-RelatedPerson-1
Id: Interweave-SocialCareRelatedPerson
Description: "Interweave Social Care RelatedPerson resource profile - DRAFT"
* ^status = #draft

* insert Ruleset-InterweaveBaseFields


///////////////////////////////////////
// --- EXTENSIONS ---
///////////////////////////////////////

//A MS extensiSon for Social Care Role, As requested by the Social Care Data Standards working group.
* extension contains Extension-Interweave-SocialCareSupportRole named socialCareSupportRole 0..* MS
* extension[Extension-Interweave-SocialCareSupportRole] ^short = "Social Care Support Role: The role which a person plays in a service user's support"


///////////////////////////////////////
// --- Identifiers ---
///////////////////////////////////////
* insert Ruleset-AddIdentifierSlicing
* insert Ruleset-AddLocalIdentifierOptional(SocialCareRelatedPerson)

///////////////////////////////////////
// --- Core Demographics ---
///////////////////////////////////////

// Active:  Assumption (in detailed definition for both STU3 and R4) is that it is "true" if not populated
// It is however important that both Providers and Consumers can handle appropriatly if "false"
// (Suggested good practice would just be to always populate it)
* active 1..1 MS

// We mandate both a "family" and at least one "given" name, plus note that prefix and suffix must be supported if relevant
* name 1..* MS
* name.use MS
* name.family 1..1 MS
* name.given 1..* MS
* name.prefix 0..* MS
* name.suffix 0..* MS
* name.text ^short = "DISCOURAGED: Please do not rely on this. Providers might not populate and Consumers might not use. Instead display the name based on the detailed elements."

// Telecom: Useful, "must support" and if provided system and value must also be provided
* telecom MS
* telecom.system 1..1 MS
* telecom.value 1..1 MS
* telecom.use MS


///////////////////////////////////////
// --- Other fields ---
///////////////////////////////////////

// Patient reference must be provided, with reference and display populated
* patient 1..1 MS
* patient.reference 1..1 MS
* patient.display 1..1 MS

// Relationship must be populated, ensuring code, display and system are provided
* relationship 1..1 MS
* insert Ruleset-CodingWithSystemCodeDisplay(relationship)

// Period: useful, "Must Support"
* period 0..1 MS


///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////
* photo 0..0


///////////////////////////////////////
// --- Notes on other standards ---
///////////////////////////////////////


// *************************************************************************************************************************
// EXAMPLES
// *************************************************************************************************************************

Instance: InterweaveSocialCareRelatedPersonExample-MustSupport
InstanceOf: InterweaveSocialCareRelatedPerson
Description: "Interweave Social Care Related Person example - Must Support"

* insert Ruleset-ExampleMetaForSocialCare(SocialCareRelatedPerson)
* meta.versionId = "InterweaveSocialCareRelatedPersonExampleMustSupport-v1.0.0"

* extension[Extension-Interweave-SocialCareSupportRole].extension[supportRoleType].valueCodeableConcept = Interweave-SocialCareSupportRole-1#KH "Key Holder"
* extension[Extension-Interweave-SocialCareSupportRole].extension[supportRolePeriod].valuePeriod.start = "2022-01-11T09:00:00Z"

* active = true

* patient = Reference(InterweavePatientExample-MustSupport) 
* patient.display = "Mr Fred BLOGGS"

* relationship.coding = http://hl7.org/fhir/v3/RoleCode#MTH "mother"

* name[0].use = #official "Official"
* name[0].given[0] = "Jane"
* name[0].family = "Bloggs"

* telecom[0].system = #phone "Phone"
* telecom[0].value = "07987 123412"
* telecom[0].use = #mobile

* period.start = 2019-04-20


Instance: InterweaveSocialCareRelatedPersonExample-Full
InstanceOf: InterweaveSocialCareRelatedPerson
Description: "Interweave Social Care Related Person example - Full"

* insert Ruleset-ExampleMetaForSocialCare(SocialCareRelatedPerson)
* meta.versionId = "InterweaveSocialCareRelatedPersonExampleFull-v1.0.0"


* extension[Extension-Interweave-SocialCareSupportRole].extension[supportRoleType].valueCodeableConcept = Interweave-SocialCareSupportRole-1#KH "Key Holder"
* extension[Extension-Interweave-SocialCareSupportRole].extension[supportRolePeriod].valuePeriod.start = "2022-01-11T09:00:00Z"

* identifier[0].system = "https://fhir.nhs.uk/Id/local-relatedperson-identifier"
* identifier[0].value = "ABC-456-XYZ"

* active = true

* patient = Reference(InterweavePatientExample-MustSupport) 
* patient.display = "Mr Fred Bloggs"

* relationship.coding = http://hl7.org/fhir/v3/RoleCode#MTH "mother"

* name[0].use = #official "Official"
* name[0].given[0] = "Jane"
* name[0].family = "Bloggs"
* name[0].prefix = "Mrs"
* name[0].suffix = "PhD"
* name[0].period.start = 2019-04-20

* name[1].use = #maiden "Maiden"
* name[1].given[0] = "Jane"
* name[1].family = "Smith"
* name[1].prefix = "Miss"
* name[1].period.end = 2019-04-19
* name[1].period.start = 1992-01-27

* telecom[0].system = #phone "Phone"
* telecom[0].value = "07987 123456"
* telecom[0].use = #mobile "Mobile"

* telecom[1].system = #email "Email"
* telecom[1].value = "jane.bloggs@email.com"

* gender = http://hl7.org/fhir/administrative-gender#female "Female"

* birthDate = 1992-01-27

* telecom[1].system = #email "Email"
* telecom[1].value = "jane.bloggs@email.com"

* address[0].use = #home "Home"
* address[0].line[0] = "42 Grove Street"
* address[0].line[1] = "Northville"
* address[0].city = "Overtown"
* address[0].district = "West Yorkshire"
* address[0].postalCode = "LS21 1PF"
* address[0].country = "GBR"
* address[0].period.start = 2019-04-20

* address[1].use = #old "Old"
* address[1].line[0] = "3 Acacia Avenue"
* address[1].city = "Birmingham"
* address[1].district = "West Midlands"
* address[1].postalCode = "BH3 1UW"
* address[1].period.end = 2019-04-19
* address[1].period.start = 2010-07-21

* period.start = 2019-04-20