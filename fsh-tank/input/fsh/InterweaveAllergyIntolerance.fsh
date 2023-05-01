Alias: $SCT = http://snomed.info/sct

Profile: InterweaveAllergyIntolerance
Parent: CareConnect-AllergyIntolerance-1
Id: Interweave-AllergyIntolerance
Description: "Interweave AllergyIntolerance resource profile - DRAFT."
* ^status = #draft

* insert Ruleset-InterweaveBaseFields

* clinicalStatus 0..1 MS
* verificationStatus 1..1 MS
* type 1..1 MS
* category 0..* MS
* criticality 0..1 MS

* code 1..1 MS
* code from CareConnect-AllergyCode-1 (preferred)

* patient 1..1 MS
* patient only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(patient)

* onset[x] only dateTime or Age or Period
* onset[x] 0..1 MS

// assertedDate in STU3
* recordedDate 1..1 MS
* asserter 0..1 MS

* lastOccurrence 0..1
* lastOccurrence ^short = "DISCOURAGED – maybe misleading unless information is kept acutely up to date."

* reaction 0..* MS
* reaction.substance from CareConnect-AllergyCode-1 (preferred)
* reaction.manifestation 1..* MS
* reaction.manifestation from CareConnect-AllergyManifestation-1 (required)
* reaction.onset 0..1 MS
* reaction.severity 0..1 MS
* reaction.note 0..0
* reaction.exposureRoute from CareConnect-AllergyExposureRoute-1 (preferred)

// *************************************************************************************************************************
// EXAMPLES
// *************************************************************************************************************************
Instance: InterweaveAllergyIntoleranceExample-NKA
InstanceOf: InterweaveAllergyIntolerance
Description: "Interweave AllergyIntolerance Example - No Known Allergy"

* insert Ruleset-ExampleMetaForHospital(AllergyIntolerance)

* insert Ruleset-ExampleLocalId(AllergyIntolerance, RCB.ALL-NKA123)

* clinicalStatus = http://hl7.org/fhir/allergy-clinical-status#active "active"

* verificationStatus = http://hl7.org/fhir/allergy-verification-status#confirmed "confirmed"

* type = http://hl7.org/fhir/allergy-intolerance-type#allergy "allergy"

* code = $SCT#716186003 "No Known Allergy (situation)"

* patient = Reference(InterweavePatientExample-MustSupport) 
* patient.display = "Mr Fred BLOGGS"

* recorder = Reference(InterweavePractitionerExample)

* recordedDate = "2022-01-09T09:00:00Z"

////////////////////////////////////////////////////////////////////////

Instance: InterweaveAllergyIntoleranceExample-Food
InstanceOf: InterweaveAllergyIntolerance
Description: "Interweave AllergyIntolerance Example - Food Allergy"

* insert Ruleset-ExampleMetaForHospital(AllergyIntolerance)

* insert Ruleset-ExampleLocalId(AllergyIntolerance, RCB.ALL-Food123)

* clinicalStatus = http://hl7.org/fhir/allergy-clinical-status#active "active"

* verificationStatus = http://hl7.org/fhir/allergy-verification-status#unconfirmed "unconfirmed"

* type = http://hl7.org/fhir/allergy-intolerance-type#allergy "allergy"

* code.coding[snomedCT] = $SCT#227493005 "Cashew nuts"

* criticality = #high

* category = #food

* patient = Reference(InterweavePatientExample-MustSupport) 
* patient.display = "Mr Fred BLOGGS"

* recorder = Reference(InterweavePractitionerExample)

* asserter = Reference(InterweavePatientExample-MustSupport)

* recordedDate = "2023-04-09T00:00:00Z"

* note.text = "The criticality is high becasue of the observed anaphylactic reaction when challenged with cashew extract."

* reaction[0].substance.coding[snomedCT] = $SCT#227495003 "Roasted and salted cashew nuts"
* reaction[=].manifestation.coding[snomedCT] = $SCT#39579001 "Anaphylactic reaction"
* reaction[=].description = "Challenge Protocol. Severe reaction to subcutaneous cashew extract. Epinephrine administered"
* reaction[=].onset = "2012-06-12"
* reaction[=].severity = #severe
* reaction[=].exposureRoute = $SCT#34206005 "Subcutaneous route"
* reaction[+].manifestation.coding[snomedCT] = $SCT#405531001 "Adverse incident resulting in potentially permanent but not disabling damage"
* reaction[=].onset = "2004"
* reaction[=].severity = #moderate
//* reaction[=].note.text = "The patient reports that the onset of urticaria was within 15 minutes of eating cashews."

//////////////////////////////////////////////////////////////////////////////////

Instance: InterweaveAllergyIntoleranceExample-Drug
InstanceOf: InterweaveAllergyIntolerance
Description: "Interweave AllergyIntolerance Example - Drug Allergy"

* insert Ruleset-ExampleMetaForHospital(AllergyIntolerance)

* insert Ruleset-ExampleLocalId(AllergyIntolerance, RCB.ALL-Drug123)

* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active "Active"

* verificationStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-verification#unconfirmed "Unconfirmed"

* type = http://hl7.org/fhir/allergy-intolerance-type#allergy "allergy"

* category = #medication

* criticality = #high

* code.coding[snomedCT] = $SCT#323389000 "Penicillin G"

* patient = Reference(InterweavePatientExample-MustSupport) 
* patient.display = "Mr Fred BLOGGS"

* recordedDate = "2010-03-01"

* recorder = Reference(InterweavePractitionerExample)

* asserter = Reference(InterweavePractitionerExample)

* reaction[0].manifestation[0] = $SCT#247472004 "Hives"