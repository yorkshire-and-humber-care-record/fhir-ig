Alias: $RC = http://hl7.org/fhir/v3/RoleCode

Profile: InterweaveRelatedPerson
Parent: CareConnect-RelatedPerson-1
Id: Interweave-RelatedPerson
Description: "Interweave Related Person resource profile"
* ^status = #active

* insert Ruleset-InterweaveBaseFields

///////////////////////////////////////
// --- EXTENSIONS ---
///////////////////////////////////////

//A MS extensiSon for Social Care Role, As requested by the Social Care Data Standards working group.
* extension contains Extension-Interweave-SocialCareSupportRole named socialCareSupportRole 0..* MS
* extension[Extension-Interweave-SocialCareSupportRole] ^short = "Social Care Support Role: The role which a person plays in this service user's support"

///////////////////////////////////////
// --- Identifiers ---
///////////////////////////////////////
* insert Ruleset-AddIdentifierSlicing
* insert Ruleset-AddLocalIdentifierOptional(RelatedPerson)

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
* relationship from http://hl7.org/fhir/ValueSet/relatedperson-relationshiptype (required)
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

Instance: InterweaveRelatedPersonExample-SocialCare-MustSupport
InstanceOf: InterweaveRelatedPerson
Description: "Interweave Related Person - Social Care - Must Support - Example"

* insert Ruleset-ExampleMetaForSocialCare(RelatedPerson)
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-RelatedPerson-1"

* extension[Extension-Interweave-SocialCareSupportRole].extension[supportRoleType].valueCodeableConcept = Interweave-SocialCareSupportRole-1#KH "Key Holder"
* extension[Extension-Interweave-SocialCareSupportRole].extension[supportRolePeriod].valuePeriod.start = "2022-01-11"

* active = true

* patient = Reference(InterweavePatientExample-MustSupport) 
* patient.display = "Mr Fred BLOGGS"

* relationship.coding = $RC#MTH "mother"

* name[0].use = #usual "Usual"
* name[0].given[0] = "Jane"
* name[0].family = "Bloggs"

* telecom[0].system = #phone "Phone"
* telecom[0].value = "07987 123412"
* telecom[0].use = #mobile

* period.start = 2019-04-20


Instance: InterweaveRelatedPersonExample-SocialCare-Full
InstanceOf: InterweaveRelatedPerson
Description: "Interweave Related Person - Social Care - Full - Example"

* insert Ruleset-ExampleMetaForSocialCare(RelatedPerson)
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-RelatedPerson-1"

* extension[Extension-Interweave-SocialCareSupportRole].extension[supportRoleType].valueCodeableConcept = Interweave-SocialCareSupportRole-1#KH "Key Holder"
* extension[Extension-Interweave-SocialCareSupportRole].extension[supportRolePeriod].valuePeriod.start = "2022-01-11"

* identifier[0].system = "https://fhir.nhs.uk/Id/local-relatedperson-identifier"
* identifier[0].value = "ABC-456-XYZ"

* active = true

* patient = Reference(InterweavePatientExample-MustSupport) 
* patient.display = "Mr Fred Bloggs"

* relationship.coding = $RC#MTH "mother"

* name[0].use = #usual "Usual"
* name[0].given[0] = "Jane"
* name[0].family = "Bloggs"
* name[0].prefix = "Mrs"
* name[0].suffix = "PhD"
* name[0].period.start = 2019-04-20

* telecom[0].system = #phone "Phone"
* telecom[0].value = "07987 123456"
* telecom[0].use = #mobile "Mobile"

* telecom[1].system = #email "Email"
* telecom[1].value = "jane.bloggs@email.com"

* gender = http://hl7.org/fhir/administrative-gender#female "Female"

* birthDate = 1992-01-27

* address[0].use = #home "Home"
* address[0].line[0] = "42 Grove Street"
* address[0].line[1] = "Northville"
* address[0].city = "Overtown"
* address[0].district = "West Yorkshire"
* address[0].postalCode = "LS21 1PF"
* address[0].country = "GBR"
* address[0].period.start = 2019-04-20

* period.start = 2019-04-20

Instance: InterweaveRelatedPersonExample-Full
InstanceOf: InterweaveRelatedPerson
Description: "Interweave Related Person - Full - Example"

* insert Ruleset-ExampleMetaForHospital(RelatedPerson)

* identifier[0].system = "https://fhir.nhs.uk/Id/local-relatedperson-identifier"
* identifier[0].value = "ABC-456-XYZ"

* active = true

* patient = Reference(InterweavePatientExample-MustSupport) 
* patient.display = "Mr Fred Bloggs"

* relationship.coding = $RC#MTH "mother"

* name[0].use = #usual "Usual"
* name[0].given[0] = "Jane"
* name[0].family = "Bloggs"
* name[0].prefix = "Mrs"
* name[0].suffix = "PhD"
* name[0].period.start = 2019-04-20

* telecom[0].system = #phone "Phone"
* telecom[0].value = "07987 123456"
* telecom[0].use = #mobile "Mobile"

* telecom[1].system = #email "Email"
* telecom[1].value = "jane.bloggs@email.com"

* gender = http://hl7.org/fhir/administrative-gender#female "Female"

* birthDate = 1992-01-27

* address[0].use = #home "Home"
* address[0].line[0] = "42 Grove Street"
* address[0].line[1] = "Northville"
* address[0].city = "Overtown"
* address[0].district = "West Yorkshire"
* address[0].postalCode = "LS21 1PF"
* address[0].country = "GBR"
* address[0].period.start = 2019-04-20

* period.start = 2019-04-20