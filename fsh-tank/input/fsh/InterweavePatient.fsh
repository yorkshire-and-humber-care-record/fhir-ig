Alias: $patient-cadavericDonor = http://hl7.org/fhir/StructureDefinition/patient-cadavericDonor

Profile: InterweavePatient
Parent: CareConnect-Patient-1
Id: Interweave-Patient
Description: "Interweave Patient resource profile."
* ^status = #active

* insert Ruleset-InterweaveBaseFields

///////////////////////////////////////
// --- EXTENSIONS ---
///////////////////////////////////////

// **TODO** - new extension for Summary Text
// **TODO** - should we specify and give examples of tags??

// There are a set of extensions defined by CareConnect, many of which are not particularly relevant for a regional record:
// - ResidentialStatus and treatmentCategory: deal with administrative and payment details. 
//     It is not a primary responsibility of the regional record to handle these. (Some are also gone in the new UK Core)
// - DeathNotificationStatus: similarly, this is generally managed Nationally by PDS and not needed again here  
// - patient-cadavericDonor: useful but seems unlikely to be relevant to ongoing regional care whilst they are still alive
// - birthPlace: is similarly administrative and unlikely to often be relevant. 
//     (Other items such as DocumentReferences and Encounters could provide specific maternity details if needed)
// - nominatedPharmacy: generally not needed for current use-cases and should not be used unless certain that up-to-date (also gone in new UK Core)  

* extension[Extension-CareConnect-TreatmentCategory-1] ^short = "DISCOURAGED (removed in UKCore)"
* extension[$patient-cadavericDonor] ^short = "DISCOURAGED"
* extension[birthPlace] ^short = "DISCOURAGED"
* extension[Extension-CareConnect-NominatedPharmacy-1] ^short = "DISCOURAGED"
* extension[Extension-CareConnect-DeathNotificationStatus-1] ^short = "DISCOURAGED"


// Then there are some extensions which may be useful if known, but are not essential - ie genuinely optional:
// - religiousAffiliation: optional

// And finally some which appear to have real use for a regional record and should be supported if possible:
// - nhsCommunication: The assumption will be that most people have a working command of English, and this does not need to be stated.
//                      (We also do not need to know about people's holiday French!)
//       The value of this field is therefore to indicate cases where there may be difficulties communicating in English - and this should be populated if known                
//       Note that this field is similar to (and replaces) the standard FHIR "communication" field. The differences are:
//          -> allows more detail - not only language and preference, but also the option to note the mode and proficiency and whether an interpreter is required
//                                  However use of this extra detail is discouraged due to the divergence from standard FHIR and the extra complexity of assessing and populating 
//                                  Most of the practical value probably comes from simply noting if a language other than English is "prefered"  
//          -> uses a different set of language codes to standard FHIR (more languages from around the world, sign-language etc, less specific breakdown of languanges such as English)
// - ethnicCategory: may be useful for regional equality monitoring. Noting the ability to provide a value of "Not Stated" if withheld.
* extension[Extension-CareConnect-NHSCommunication-1] MS
* extension[Extension-CareConnect-NHSCommunication-1] ^short = "Communication Preferences - please indicate if a preference for language other than English"
* extension[Extension-CareConnect-NHSCommunication-1].extension[modeOfCommunication] ^short = "DISCOURAGED"
* extension[Extension-CareConnect-NHSCommunication-1].extension[communicationProficiency] ^short = "DISCOURAGED"
//* extension[Extension-CareConnect-EthnicCategory-1] MS
* extension[Extension-CareConnect-EthnicCategory-1] ^short = "Ethnic Category - please provide if known. (Noting also option for 'Not Stated')"
//* extension[Extension-CareConnect-ResidentialStatus-1]


//Also - add an extension (optional) for Sexual Orientation, based on NHSDD. As requested for equality monitoring
* extension contains Extension-Interweave-SexualOrientation named sexualOrientation 0..1
* extension[Extension-Interweave-SexualOrientation] ^short = "Sexual Orientation, as per NHS Data Dictionary: Person Stated Sexual Orientation Code"


///////////////////////////////////////
// --- Identifiers ---
///////////////////////////////////////

// CareConnect already defines a special identifier for NHS Number
// However we want to make it mandatory, and also force it to be fully verified
// This is to ensure the patient if fully identified before sharing regionally
* identifier[nhsNumber] 1..1 MS
* identifier[nhsNumber].extension[nhsNumberVerificationStatus].valueCodeableConcept = CareConnect-NHSNumberVerificationStatus-1#01 "Number present and verified" (exactly)
* identifier[nhsNumber].extension[nhsNumberVerificationStatus] ^short = "Verification status of the NHS Number - must be traced and verified"


///////////////////////////////////////
// --- Core Demographics ---
///////////////////////////////////////

// Active:  Assumption (in detailed definition for both STU3 and R4) is that it is "true" if not populated
// It is however important that both Providers and Consumers can handle appropriatly if "false"
// (Suggested good practice would just be to always populate it)
* active MS
* active ^short = "Whether this patient's record is in active use - must be both populated and understood if 'false'. See notes on usage."

// Name: CareConnect already mandates there to be exactly one "official" name, including a "family" name.
//   However here we also mandate a "given" name, plus note that prefix and suffix must be supported if relevant
//   Also add notes about the verification performed against PDS
* name[official] MS
* name[official].use MS
* name[official].family 1..1 MS
* name[official].family ^short = "Family name (often called 'Surname'). NB: First 3 letters must match PDS"
* name[official].given 1..* MS
* name[official].given ^short = "Given names (not always 'first'). Includes middle names. NB: First letter (initial) must match PDS"
* name[official].prefix 0..* MS
* name[official].suffix 0..* MS
* name[official].text ^short = "DISCOURAGED: Please do not rely on this. Providers might not populate and Consumers might not use. Instead display the name based on the detailed elements."

// DoB: Basics which we want to always capture - and needed for PDS tracing
* birthDate 1..1 MS
* birthDate ^short = "The date of birth for the individual. NB: Must match PDS"

//* birthDate.extension ^slicing.discriminator.type = #value
//* birthDate.extension ^slicing.discriminator.path = "url"
//* birthDate.extension ^slicing.rules = #open
//* birthDate.extension contains $patient-birthTime named patient-birthTime 0..1

// Gender - basics which we want to always capture, although not as vital as other fields so Must Support
* gender MS

// Deceased, maritalStatus, multipleBirth: Already optional, no changes needed

// Telcom: Useful, "must support" (noting precident from US Core and IPS)
//    (Note that CareConnect already enforces that if a telcom is provided then a system and value must be included)
* telecom MS
* telecom.system MS
* telecom.value MS
* telecom.use MS


// Address: We want an address, unless actually not known (eg unconscious patient) and with as many details populated as known/relevant
//    This would normally be use = "home" - ie a permanent home address
//    (It is difficult to actaully specify anything as mandatory, but most subfields as Must Support)
* address MS
* address.use MS
* address.use ^short = "home | work | temp | old - purpose of this address. Normally expect at least a 'home' address."
// address.type remains genuinely optional
* address.text ^short = "DISCOURAGED: Please do not rely on this. Providers might not populate and Consumers might not use. Instead display the address based on the detailed elements."
* address.line MS
* address.city MS
* address.district MS
* address.postalCode MS
// address.country remains optional (unlikely to be other than GBR)
// address.period remains genuinely optional


///////////////////////////////////////
// --- Other fields ---
///////////////////////////////////////
* generalPractitioner ^short = "DISCOURAGED: PDS is the master of this information, should not normally be populated by other systems."
* managingOrganization ^short = "DISCOURAGED: Already covered by the provenance tags. (If populated then must match this)"
//link: remains optional. ***TODO** or maybe discouraged - normally for internal use only?

//contact: useful to provide relevant contact(s) if possible, and useful to get at least the name, telecom and relationship
// (leaving the other Contact fields such as address, gender, organisation, period as genuinely optional)
// Whilst it is difficult to mandate any of this due to varying circumstances, indicate Must Support the key details
* contact MS
* contact.relationship MS
* insert Ruleset-CodingWithSystemCodeDisplay(contact.relationship)
* contact.name MS
* contact.telecom MS
* contact.name.text ^short = "DISCOURAGED: Please do not rely on this. Providers might not populate and Consumers might not use. Instead display the name based on the detailed elements."
* contact.address.text ^short = "DISCOURAGED: Please do not rely on this. Providers might not populate and Consumers might not use. Instead display the address based on the detailed elements."

* deceased[x] ^short = "Indicates if the individual is deceased or not. Do not populate - populated by PDS only."
//TODO: Compilier is only recognising the first resource in the list - to investigate
//* link.other only Reference(RelatedPerson or CareConnect-Patient-1)
* link ^short = "Link to another patient resource that concerns the same actual person. (For example merged record)"

///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////
* photo 0..0
//communication - already been removed by CareConnect
//animal - already been removed by CareConnect

///////////////////////////////////////
// --- Notes on other standards ---
///////////////////////////////////////

// US-CORE
// Requires Id, Name, Gender (same)
// Must Support DoB (we are stricter and insist), telecom, and address (same)
// The also encourage Contact, Communication language, ethnicity, previous name, suffix - similar with the addition of previous name.
//                       (So perhaps we could add something to the notes about previous name (it is also in the second example))
// There is also further discussion ongoing of gender and an extra field for birth sex
// They also get quite specific about the types of searches that should be supported (perhaps less of an issue for us, as we have PDS to locate the NHS Number)

// IPS
// Is also very similar
// It wants the GP - which makes sense for IPS, but not for us given that PDS exists within UK
// It also wants the language - which again makes sense for the IPS, but the context is slighty different for us

// UK Core (R4)
// Has juggled around with the Extensions:
//  - Removed: registrationDetails, treatmentCategory, nominatedPharmacy (all of which we discouraged anyway)
//  - Added: birthSex, deathNotificationStatus
//  - It has also put the communication/languange preferences back to standard, with just a flag for "interpreter required" instead 
//Also
// - Has made the NHS Number optional (but we want it anyway)
// - Has loosened up on all of the madatory fields, (and does not have Must Support) and reintroduced photo (seems backwards steps for us)
// - Has introduced various minor extensions to individual fields ie:
//     - addressKey (?)
//     - Contact - rank and copyCorrespondence
//     - Telecom - other contact system (?)
//     - Communication - proficiency (so moving the same idea out of the original nhsCommunication extension)

// *************************************************************************************************************************
// EXAMPLES
// *************************************************************************************************************************

Instance: InterweavePatientExample-MustSupport
InstanceOf: InterweavePatient
Description: "Interweave Patient example - Must Support"

* insert Ruleset-ExampleMetaForHospital(Patient)
* meta.versionId = "InterweavePatientExampleMustSupport-v1.0.0"

// Text summary no longer needed
// (name.given + name.family)
//* extension[Extension-Interweave-TextSummary].valueString = "Mr Fred BLOGGS"


* identifier[nhsNumber].extension[nhsNumberVerificationStatus].valueCodeableConcept = CareConnect-NHSNumberVerificationStatus-1#01 "Number present and verified"
* identifier[nhsNumber].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[nhsNumber].value = "123456789"

* active = true

* name[0].use = #official "Official"
* name[0].given[0] = "Jane"
* name[0].family = "Bloggs"

* birthDate = 1992-01-27
* gender = http://hl7.org/fhir/administrative-gender#female "Female"

* telecom[0].system = #phone "Phone"
* telecom[0].value = "07987 123412"
* telecom[0].use = #mobile

* address[0].use = #home
* address[0].line[0] = "42 Grove Street"
* address[0].line[1] = "Northville"
* address[0].city = "Overtown"
* address[0].district = "West Yorkshire"
* address[0].postalCode = "LS21 1PF"

* contact[0].relationship.coding = 	http://hl7.org/fhir/v2/0131#N "Next-of-Kin"
* contact[0].name[0].use = #usual
* contact[0].name[0].given[0] = "Fred"
* contact[0].name[0].family = "Bloggs"
* contact[0].telecom[0].system = #phone "Phone"
* contact[0].telecom[0].value = "07123 987698"
* contact[0].telecom[0].use = #mobile


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: InterweavePatientExample-Full
InstanceOf: InterweavePatient
Description: "Interweave Patient example - Full"


* insert Ruleset-ExampleMetaForHospital(Patient)
* meta.versionId = "InterweavePatientExampleFull-v1.0.0"

// Text summary no longer needed
// (name.given + name.family)
//* extension[Extension-Interweave-TextSummary].valueString = Dr Jane BLOGGS"


* extension[Extension-CareConnect-EthnicCategory-1].valueCodeableConcept = CareConnect-EthnicCategory-1#A "British, Mixed British"
* extension[Extension-CareConnect-ReligiousAffiliation-1].valueCodeableConcept = http://snomed.info/sct#160549006 "Christian"
* extension[Extension-CareConnect-NHSCommunication-1].extension[language].valueCodeableConcept = CareConnect-HumanLanguage-1#bo "Tibetan"
* extension[Extension-CareConnect-NHSCommunication-1].extension[preferred].valueBoolean =  true
* extension[Extension-CareConnect-ResidentialStatus-1].valueCodeableConcept =  CareConnect-ResidentialStatus-1#H "UK Resident"
* extension[Extension-Interweave-SexualOrientation].valueCodeableConcept =  Interweave-SexualOrientation-1#1 "Heterosexual or Straight"

* identifier[nhsNumber].extension[nhsNumberVerificationStatus].valueCodeableConcept = CareConnect-NHSNumberVerificationStatus-1#01 "Number present and verified"
* identifier[nhsNumber].system = "https://fhir.nhs.uk/Id/nhs-number"
* identifier[nhsNumber].value = "123456789"

//* identifier[localIdentifier].system = "https://fhir.nhs.uk/Id/local-patient-identifier"
//* identifier[localIdentifier].value = "ABC-456-XYZ"
  //TODO - add a reference to the assigning organisation (once we have an organisation example)

* active = true

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
  
* name[2].use = #nickname "Nickname"
* name[2].given[0] = "Jinny"

* birthDate = 1992-01-27
* gender = http://hl7.org/fhir/administrative-gender#female "Female"

* telecom[0].system = #phone "Phone"
* telecom[0].value = "07987 123412"
* telecom[0].use = #mobile "Mobile"

* telecom[1].system = #email "Email"
* telecom[1].value = "jane.bloggs@email.com"

* address[0].use = #home "Home"
* address[0].line[0] = "42 Grove Street"
* address[0].line[1] = "Northville"
* address[0].city = "Overtown"
* address[0].district = "West Yorkshire"
* address[0].postalCode = "LS21 1PF"
* address[0].country = "GBR"
* name[0].period.start = 2019-04-20

* address[1].use = #old "Old"
* address[1].line[0] = "3 Acacia Avenue"
* address[1].city = "Birmingham"
* address[1].district = "West Midlands"
* address[1].postalCode = "BH3 1UW"
* name[0].period.end = 2019-04-19
* name[0].period.start = 2010-07-21

* maritalStatus.coding = http://hl7.org/fhir/v3/MaritalStatus#M "Married"

* contact[0].relationship.coding = 	http://hl7.org/fhir/v2/0131#N "Next-of-Kin"
* contact[0].name[0].use = #usual "Usual"
* contact[0].name[0].given[0] = "Fred"
* contact[0].name[0].family = "Bloggs"
* contact[0].name[0].prefix = "Mr"
* contact[0].telecom[0].system = #phone "Phone"
* contact[0].telecom[0].value = "07123 987698"
* contact[0].telecom[0].use = #mobile "Mobile"
* contact[0].telecom[1].system = #email "Email"
* contact[0].telecom[1].value = "fred.bloggs@email.com"
* contact[0].address[0].use = #home "Home"
* contact[0].address[0].line[0] = "42 Grove Street"
* contact[0].address[0].line[1] = "Northville"
* contact[0].address[0].city = "Overtown"
* contact[0].address[0].district = "West Yorkshire"
* contact[0].address[0].postalCode = "LS21 1PF"

* contact[1].relationship.coding = 	http://hl7.org/fhir/v2/0131#C "Emergency Contact"
* contact[1].name[0].use = #usual "Usual"
* contact[1].name[0].given[0] = "Ann"
* contact[1].name[0].family = "Hathaway"
* contact[1].telecom[0].system = #phone "Phone"
* contact[1].telecom[0].value = "07456 456745"
* contact[1].telecom[0].use = #mobile "Mobile"

