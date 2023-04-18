Profile: InterweaveSocialCareSupportReason
Parent: CareConnect-Condition-1
Id: Interweave-SocialCareSupportReason
Description: "Interweave Social Care Support Reason resource profile (modelled using FHIR Condition)"
* ^status = #active

* insert Ruleset-InterweaveBaseFields

///////////////////////////////////////
// --- EXTENSIONS ---
///////////////////////////////////////

//A MS extensiSon for Primary Support Reason, As requested by the Social Care Data Standards working group.
* extension contains Extension-Interweave-SocialCarePrimarySupportReason named primarySupportReason 0..1 MS

* extension contains Extension-Interweave-SocialCareSupportReasonPeriod named supportReasonPeriod 1..1 MS

///////////////////////////////////////
// --- MANDATORY FIELDS ---
///////////////////////////////////////
* clinicalStatus 1..1 MS
* clinicalStatus from InterweaveSocialCareSupportReasonClinicalStatus (required)
* clinicalStatus ^short = "A mandatory flag to indicate whether the support reason is active or not. Valueset restricted to active and inactive only."

* category 1..1 MS
* category ^short = "A categorisation of the reason why a person is receiving support."
* category from InterweaveSocialCareSupportReasonCategory (required)
* insert Ruleset-CodingWithSystemCodeDisplay(category)

* code 1..1 MS
* code ^short = "The type of support reason."
* code from InterweaveSocialCareSupportReason (required)
* insert Ruleset-CodingWithSystemCodeDisplay(code)

// Subject: Every Flag MUST be linked to a patient
* subject 1..1 MS 
// Ensure we only have patients referenced here
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)
* subject ^short = "The person which is subject of the support reason."

///////////////////////////////////////
// --- MUST SUPPORT FIELDS ---
///////////////////////////////////////

//Two extensions are MS

///////////////////////////////////////
// --- OPTIONAL FIELDS ---
///////////////////////////////////////
* insert Ruleset-AddIdentifierSlicing
* insert Ruleset-AddLocalIdentifierOptional(socialcaresupportreasoncondition)

// Renamed in R4 to recordedDate from assertedDate
* recordedDate ^short = "Optionally supply the date that the support reason was recognised/diagnosed."

* asserter 0..1
* asserter only Reference(CareConnect-Practitioner-1)
* asserter ^short = "Optionally provide the practitioner who asserted the support reason"

* note ^short = "Can be used to provide further describe the support reason"


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



// *************************************************************************************************************************
// EXAMPLES -
// *************************************************************************************************************************
Instance: InterweaveSocialCareSupportReasonExample-MS
InstanceOf: InterweaveSocialCareSupportReason
Description: "Interweave Social Care Support Reason (FHIR Condition) example - Must Support"

* insert Ruleset-ExampleMetaForSocialCare(SocialCareSupportReason)
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Condition-1"

* extension[Extension-Interweave-SocialCarePrimarySupportReason].valueBoolean = true
* extension[Extension-Interweave-SocialCareSupportReasonPeriod].valuePeriod.start = "2022-01-09T09:00:00Z" 

* clinicalStatus = http://hl7.org/fhir/condition-clinical#active "Active"

* category = Interweave-SocialCareSupportReasonCategory-1#PS "Physical Support"

* code = Interweave-SocialCareSupportReason-1#PS-AMO "Physical Support: Access & mobility only"

* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: InterweaveSocialCareSupportReasonExample-Full
InstanceOf: InterweaveSocialCareSupportReason
Description: "Interweave Social Care Support Reason (FHIR Condition) example - Full"

* insert Ruleset-ExampleMetaForSocialCare(SocialCareSupportReason)
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Condition-1"

* extension[Extension-Interweave-SocialCarePrimarySupportReason].valueBoolean = true
* extension[Extension-Interweave-SocialCareSupportReasonPeriod].valuePeriod.start = "2022-01-09T09:00:00Z" 
* extension[Extension-Interweave-SocialCareSupportReasonPeriod].valuePeriod.start = "2022-08-01T14:30:00Z"

* insert Ruleset-ExampleLocalId(SocialCareSupportReason, XXX.SR-ABC123)

* clinicalStatus = http://hl7.org/fhir/condition-clinical#active "Active"

* category = Interweave-SocialCareSupportReasonCategory-1#PS "Physical Support"

* code = Interweave-SocialCareSupportReason-1#PS-AMO "Physical Support: Access & mobility only"

* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"

* recordedDate = "2022-01-09T09:00:00Z" 

* asserter = Reference(InterweavePractitionerExample)
* asserter.display = "Dr Jane BLOGGS"

* note[0].text = "Unable to climb stairs."
