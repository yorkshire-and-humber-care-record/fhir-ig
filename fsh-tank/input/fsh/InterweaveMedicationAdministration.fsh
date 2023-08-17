Profile: InterweaveMedicationAdministration
Parent: CareConnect-MedicationAdministration-1
Id: Interweave-MedicationAdministration
Description: "Interweave Medication Administration resource profile."
* ^status = #active

* insert Ruleset-InterweaveBaseFields

* status MS

* category 1..1 MS
* category from Interweave-MedicationRequestCategory-1 (required)
* insert Ruleset-CodingWithSystemCodeDisplay(category)

* medicationReference 1..1 MS
* medicationReference only Reference(CareConnect-Medication-1)
* medicationReference ^short = "Reference to the medicatin resource"


* subject 1..1 MS
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)
//* subject ^short = "Who the medication request is for."

//context in STU3
* context 0..1 MS
* context only Reference(CareConnect-Encounter-1) 
//* encounter ^short = "For a repeat prescription this is the encounter where the repeat was authorised. For all others this is the encounter where the specific issue was authorised."

* effective[x] only Period
* effective[x] 1..1 MS
* effectivePeriod.start 1..1 MS

* performer.actor MS

// * reasonNotGiven 0..*
// * reasonNotGiven from http://hl7.org/fhir/ValueSet/reason-medication-not-given-codes (preferred)

* reasonCode 0..*
* reasonCode from http://hl7.org/fhir/ValueSet/reason-medication-given-codes (preferred)


///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////

//* definition 0..0
* partOf 0..0
* supportingInformation 0..0
* eventHistory 0..0
//* performer.onBehalfOf 0..0