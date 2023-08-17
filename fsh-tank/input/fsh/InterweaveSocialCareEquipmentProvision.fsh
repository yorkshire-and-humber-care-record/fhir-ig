Profile: InterweaveSocialCareEquipmentProvision
Parent: DeviceRequest
Id: Interweave-SocialCareEquipmentProvision
Description: "Interweave Social Care Equipment Provision resource profile"
* ^status = #active

* insert Ruleset-InterweaveBaseFields


///////////////////////////////////////
// --- MANDATORY FIELDS ---
///////////////////////////////////////

* status 1..1 MS
* status from InterweaveSocialCareRequestStatus (required)
* status ^short = "draft | active | completed | entered-in-error | cancelled"

* intent 1..1 MS
* intent = #order (exactly)
* intent ^short = "Not important to social care, but is mandated by FHIR, so we default to 'order'"

* code[x] only CodeableConcept or Reference
* code[x] MS
* codeCodeableConcept 0..1 MS
* codeCodeableConcept from InterweaveSocialCareEquipmentType (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(codeCodeableConcept)
* codeReference 0..1 MS
* codeReference only Reference(Device)

// Subject: Every Device Request MUST be linked to a patient
* subject 1..1 MS 
// We only want Patients
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)
* subject ^short = "The person to which the equipment is assigned."

* authoredOn 1..1 MS 
* authoredOn ^short = "The date that the request was created, this may be the same as the occurrence.period.start, if the equipment is placed without prior request."

///////////////////////////////////////
// --- MUST SUPPORT FIELDS ---
///////////////////////////////////////

* occurrence[x] only Period 
* occurrence[x].start MS
* occurrence[x].end MS
* occurrence[x] ^short = "The period during which the equipment was placed with the person." 

///////////////////////////////////////
// --- Other fields ---
///////////////////////////////////////

// Optional local id

* insert Ruleset-AddIdentifierSlicing
* insert Ruleset-AddLocalIdentifierOptional(socialcareequipmentrequest)

// Patient reference must be provided, with reference and display populated
* note ^short = "Most equipment will be where the patient lives or on the person, where this is not the case, the notes field can be used to detail exceptions."

//STU3 has requester.agent
//* requester only Reference(Organization) - TODO
* insert Ruleset-ReferenceWithReferenceAndDisplay(requester)
* requester ^short = "The organization or organizationalTeam that requested the equipment be placed with the person."

//* performer only Reference(Organization or Practitioner) - TODO
* insert Ruleset-ReferenceWithReferenceAndDisplay(performer)
* performer ^short = "The practitioner, organization or organizationalTeam who placed or fitted the equipment with/on the person."

///////////////////////////////////////
// --- Discouraged fields ---
///////////////////////////////////////

//Currently none


///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////
// * definition 0..0 doesnt exist in R4
// * context 0..0 doesnt exist in R4
* basedOn 0..0
* priorRequest 0..0
* groupIdentifier 0..0
* priority  0..0
* performerType 0..0
* reasonCode 0..0
* priorRequest 0..0
* reasonReference 0..0
* supportingInfo 0..0
* relevantHistory 0..0


// *************************************************************************************************************************
// EXAMPLES 
// *************************************************************************************************************************
/*
Instance: InterweaveSocialCareEquipmentProvisionExample-MS
InstanceOf: InterweaveSocialCareEquipmentProvision
Description: "Interweave Social Care Equipment Provision example - Must Support"

* insert Ruleset-ExampleMetaForSocialCare(SocialCareEquipmentProvision)
* meta.profile[1] = "https://www.hl7.org/fhir/STU3/devicerequest"

* status = http://hl7.org/fhir/request-status#active "Active"

* intent = http://hl7.org/fhir/request-intent#order "Order"

* codeCodeableConcept.coding = http://snomed.info/sct#705593007 "Raised toilet seat, fixed (physical object)"

* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"

* occurrence[x].start =  2022-04-20

* authoredOn =  2022-04-20

Instance: InterweaveSocialCareEquipmentProvisionExample-Full
InstanceOf: InterweaveSocialCareEquipmentProvision
Description: "Interweave Social Care Equipment Provision example - Full"

* insert Ruleset-ExampleMetaForSocialCare(SocialCareEquipmentProvision)
* meta.profile[1] = "https://www.hl7.org/fhir/STU3/devicerequest"

* insert Ruleset-ExampleLocalId(SocialCareEquipmentProvision, XXX.OT-ABC123)

* status = http://hl7.org/fhir/request-status#active "Active"

* intent = http://hl7.org/fhir/request-intent#order "Order"

* codeCodeableConcept.coding = http://snomed.info/sct#705593007 "Raised toilet seat, fixed (physical object)"

* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"

* note[0].text = "Equipment placed at daughter's home for regular weekend visiting."

* occurrence[x].start =  2022-04-20

* authoredOn =  2022-04-20

//STU3 is requester.agent
* requester = Reference(InterweaveOrganizationalTeamExampleFull) 
* requester.display = "The reablement team"

* performer = Reference(InterweaveOrganizationalTeamExampleFull) 
* performer.display = "The reablement team"
*/