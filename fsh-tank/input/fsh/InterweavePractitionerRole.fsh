Alias: $SCT = http://snomed.info/sct

Profile: InterweavePractitionerRole
Parent: CareConnect-PractitionerRole-1
Id: Interweave-PractitionerRole
Description: "Interweave Practitioner role resource profile - DRAFT."
* ^status = #draft

* insert Ruleset-InterweaveBaseFields

///////////////////////////////////////
// --- CARE CONNECT EXTENSIONS ---
///////////////////////////////////////

//Service Type: A list of types of service for the appointment eg "Cardiology Service", “School Nursing Service" etc
//Appears to be possible, useful and important to populate. (Could be multiple??) - but missing from STU3!
// This omission is rectified in R4, so we pre-adopt it here - and make the extension Must Support
// We also pre-adopt the UKCore value set, which is more relevant than the default FHIR example and also covers social care
* extension contains Extension-Interweave-R4ServiceType named serviceType 0..*
* extension[Extension-Interweave-R4ServiceType] ^short = "The services which the practitioner can offer. (pre-adopted from R4)."
* extension[Extension-Interweave-R4ServiceType] MS

//identifier - No changes made to the current Careconnect standards. 

* active 1..1 MS
* active ^short = "Whether this practitioner's “role” record is in active use."

* period 0..1 MS
* period ^short = "The period during which the practitioner is authorized to perform in these role(s)."

// code is used to record the roles which a practitioner is authorised to perform.
// Care connect have created a slice on this field which has a required binding to the practitioner’s RBAC role. 
//We treat this as the preferred field to populate. However, with prior authorisation, we will accept other code sets which represent the role.  
* code 1..* MS
* code from CareConnect-SDSJobRoleName-1 (preferred)
//* insert Ruleset-CodingWithSystemCodeDisplay(code)

* practitioner 1..1 MS
* practitioner only Reference(CareConnect-Practitioner-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(practitioner)
* practitioner ^short = "The practitioner that is able to provide the defined services for the organisation."

* organization 0..1 MS
* organization only Reference(CareConnect-Organization-1)
* insert Ruleset-ReferenceWithReferenceOnly(organization)
* organization ^short = "The organization where the Practitioner performs the roles associated."

* location 0..*
* location only Reference(CareConnect-Location-1)
* insert Ruleset-ReferenceWithReferenceOnly(location)
* location ^short = "The location(s) at which this practitioner provides care."

//   Replace the FHIR valueset with the list of clinical specialty of the clinician or provider - 
//   which appears to be more complete and relevant to the UK, and which offers better coverage of Social Care.
* specialty from Interweave-UKCorePracticeSettingCode (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(specialty)

///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////
* healthcareService 0..0
* availableTime 0..0
* notAvailable 0..0
* availabilityExceptions 0..0
* endpoint 0..0

// *************************************************************************************************************************
// EXAMPLES
// *************************************************************************************************************************
Instance: InterweavePractitionerRoleExample
InstanceOf: InterweavePractitionerRole
Description: "Interweave PractitionerRole Example"

* insert Ruleset-ExampleMetaForHospital(PractitionerRole)

* insert Ruleset-ExampleLocalId(PractitionerRole, RCB.PRLE-R0050)

* active = true
* period.start = "2012-01-01"
* period.end = "2012-03-31"
* practitioner = Reference(InterweavePractitionerExample) "Dr Jane BLOGGS"
* organization = Reference(InterweaveOrganizationExample)
* code = https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-SDSJobRoleName-1#R0050 "Consultant"
* specialty = https://fhir.yhcr.nhs.uk/CodeSystem/Interweave-UKCorePracticeSettingCode#180 "Emergency Medicine"
* location = Reference(InterweaveLocationWardExampleAandE) "York Hospital: Accident and Emergency"

* extension[Extension-Interweave-R4ServiceType].valueCodeableConcept = $SCT#409971007 "Emergency medical services"