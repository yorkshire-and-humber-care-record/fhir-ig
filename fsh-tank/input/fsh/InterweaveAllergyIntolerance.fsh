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