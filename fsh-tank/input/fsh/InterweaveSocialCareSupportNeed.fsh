Profile: InterweaveSocialCareSupportNeed
Parent: CareConnect-Condition-1
Id: Interweave-SocialCareSupportNeed
Description: "Interweave Social Care Support Need resource profile (modelled using FHIR Condition)"
* ^status = #draft

* insert Ruleset-InterweaveBaseFields

///////////////////////////////////////
// --- EXTENSIONS ---
///////////////////////////////////////

* extension contains Extension-Interweave-SocialCareSupportNeedPeriod named supportNeedPeriod 0..1
* extension contains Extension-Interweave-SocialCareServicePartofAssessment named partOfAssessment 0..1

///////////////////////////////////////
// --- MANDATORY FIELDS ---
///////////////////////////////////////
* clinicalStatus 1..1 MS
* clinicalStatus from InterweaveSocialCareSupportNeedClinicalStatus (required)
* clinicalStatus ^short = "A mandatory flag to indicate whether the support Need is active or not. Valueset restricted to active and inactive only."

* category 1..1 MS
* category ^short = "A categorisation of the Need why a person is receiving support."
* category from InterweaveSocialCareSupportNeedCategory (required)
* insert Ruleset-CodingWithSystemCodeDisplay(category)

* code 1..1 MS
* code ^short = "The type of support Need."
* code from InterweaveSocialCareSupportNeed (required)
* insert Ruleset-CodingWithSystemCodeDisplay(code)

// Subject: Every Need MUST be linked to a patient
* subject 1..1 MS 
// Ensure we only have patients referenced here
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)
* subject ^short = "The person which is subject of the support Need."

// Renamed in R4 to recordedDate from assertedDate
* recordedDate 1..1 MS
* recordedDate ^short = "Date record was believed accurate / the need was recorded."
///////////////////////////////////////
// --- MUST SUPPORT FIELDS ---
///////////////////////////////////////



///////////////////////////////////////
// --- OPTIONAL FIELDS ---
///////////////////////////////////////
* insert Ruleset-AddIdentifierSlicing
* insert Ruleset-AddLocalIdentifierOptional(socialcaresupportneed)


* asserter 0..1
* asserter only Reference(CareConnect-Practitioner-1)
* asserter ^short = "Optionally provide the practitioner who asserted the support Need"

* note ^short = "Can be used to provide further information to describe the support Need"


///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////
* stage 0..0
* stage ^short = "Not relevant to social care."

* severity 0..0
* severity ^short = "Not relevant to social care."

* onset[x] 0..0
* onset[x] ^short = "To avoid confusion with the various dates we create our own. Please use x and see notes above for further detail."

* bodySite 0..0
* bodySite  ^short = "Not relevant to social care."

* abatement[x] 0..0
* abatement[x]  ^short = "To avoid confusion with the various dates we create our own. Please use x and see notes above for further detail."

* evidence 0..0
* evidence  ^short = "Not relevant to social care."

* code.coding[snomedCT] 0..0

* extension[Extension-CareConnect-ConditionEpisode-1] 0..0

//* context  ^short = "not in R4 - remove via script"

///////////////////////////////////////
// --- Discouraged fields ---
///////////////////////////////////////



// // *************************************************************************************************************************
// // EXAMPLES -
// // *************************************************************************************************************************
Instance: InterweaveSocialCareSupportNeedExample-Adult
InstanceOf: InterweaveSocialCareSupportNeed
Description: "Interweave Social Care Support Need (FHIR Condition) example - Adult"

* insert Ruleset-ExampleMetaForSocialCare(SocialCareSupportNeed)
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Condition-1"

* extension[Extension-Interweave-SocialCareServicePartofAssessment].valueReference = Reference(Task/InterweaveSocialCareAssessmentExample-MS)
* extension[Extension-Interweave-SocialCareSupportNeedPeriod].valuePeriod.start = "2024-12-09T09:00:00Z" 

* clinicalStatus = http://hl7.org/fhir/condition-clinical#active "Active"

* category = Interweave-SocialCareSupportNeedCategory#Adult "Adult's Need"

* code = Interweave-SocialCareSupportNeed#Diet-and-nutrition "managing and maintaining nutrition"

* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"

* recordedDate = "2020-06-09T09:00:00Z"  //recordedDate -> STU3 assertedDate

// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Instance: InterweaveSocialCareSupportNeedExample-Full
// InstanceOf: InterweaveSocialCareSupportNeed
// Description: "Interweave Social Care Support Need (FHIR Condition) example - Full"

// * insert Ruleset-ExampleMetaForSocialCare(SocialCareSupportNeed)
// * meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Condition-1"

// * extension[Extension-Interweave-SocialCarePrimarySupportNeed].valueBoolean = true
// * extension[Extension-Interweave-SocialCareSupportNeedPeriod].valuePeriod.start = "2022-01-09T09:00:00Z" 
// * extension[Extension-Interweave-SocialCareSupportNeedPeriod].valuePeriod.start = "2022-08-01T14:30:00Z"

// * insert Ruleset-ExampleLocalId(SocialCareSupportNeed, XXX.SR-ABC123)

// * clinicalStatus = http://hl7.org/fhir/condition-clinical#active "Active"

// * category = Interweave-SocialCareSupportNeedCategory-1#PS "Physical Support"

// * code = Interweave-SocialCareSupportNeed-1#PS-AMO "Physical Support: Access & mobility only"

// * subject = Reference(InterweavePatientExample-MustSupport) 
// * subject.display = "Mr Fred BLOGGS"

// * recordedDate = "2022-01-09T09:00:00Z" 

// * asserter = Reference(InterweavePractitionerExample)
// * asserter.display = "Dr Jane BLOGGS"

// * note[0].text = "Unable to climb stairs."