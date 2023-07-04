Profile: InterweaveMedicationRequest
Parent: CareConnect-MedicationRequest-1
Id: Interweave-MedicationRequest
Description: "Interweave Medication Request resource profile"
* ^status = #active

* insert Ruleset-InterweaveBaseFields

* extension[Extension-CareConnect-MedicationRepeatInformation-1] MS
* extension[Extension-CareConnect-MedicationRepeatInformation-1].extension[numberOfRepeatPrescriptionsAllowed] MS
* extension[Extension-CareConnect-MedicationRepeatInformation-1].extension[numberOfRepeatPrescriptionsIssued] MS
* extension[Extension-CareConnect-MedicationRepeatInformation-1].extension[authorisationExpiryDate] MS
* extension[Extension-CareConnect-MedicationRepeatInformation-1].extension contains 
    Extension-Interweave-MedicationLastIssuedDate-1 named LastIssuedDate 0..1 MS

* extension[Extension-CareConnect-MedicationStatusReason-1] MS
* extension[Extension-CareConnect-MedicationStatusReason-1].extension[statusReason] MS
* extension[Extension-CareConnect-MedicationStatusReason-1].extension[statusChangeDate] 1..1 MS

* extension[Extension-CareConnect-PrescriptionType-1] 1..1 MS

* identifier 0..*

* basedOn 0..0

* groupIdentifier 0..0

* status 1..1 MS

* intent 1..1 MS

* category 1..1 MS
* category from Interweave-MedicationRequestCategory-1 (required)
* insert Ruleset-CodingWithSystemCodeDisplay(category)

* medicationReference 1..1 MS
* medicationReference only Reference(CareConnect-Medication-1)
* medicationReference ^short = "Reference to the medicatin resource"
//* insert Ruleset-ReferenceWithReferenceOnly(medicationReference)
// * medicationReference[medicationReference] 1..1 MS
// * medicationReference[medicationReference] only Reference(CareConnect-Medication-1)


* subject 1..1 MS
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)
* subject ^short = "Who the medication request is for."

//context in STU3
* encounter only Reference(CareConnect-Encounter-1)
* encounter ^short = "For a repeat prescription this is the encounter where the repeat was authorised. For all others this is the encounter where the specific issue was authorised."

* authoredOn 1..1 MS

* requester 0..1 MS
* requester only Reference(CareConnect-Practitioner-1 or CareConnect-Organization-1)

* reasonCode 0..* MS
* reasonCode from http://hl7.org/fhir/ValueSet/condition-code (preferred)

* note 0..* MS
* note ^short = "Extra information about the prescription that could not be conveyed by the other attributes."

* dosageInstruction 1..1 MS
* dosageInstruction.text 1..1 MS
* dosageInstruction.text ^short = "Complete dosage instructions as text."
* dosageInstruction.patientInstruction 1..1 MS
* dosageInstruction.patientInstruction ^short = "Patient or consumer oriented instructions e.g. RHS of prescription label."

* dispenseRequest.quantity MS
* dispenseRequest.quantity.extension[Extension-CareConnect-MedicationQuantityText-1] 0..1 MS
* dispenseRequest.quantity.extension[Extension-CareConnect-MedicationQuantityText-1] ^short = "To support the textual representation of a medication structured quantity."

* dispenseRequest.validityPeriod ^short = "This indicates the validity period of a prescription (stale dating the Prescription)."

* dispenseRequest.expectedSupplyDuration 0..1 MS
* dispenseRequest.expectedSupplyDuration.code 1..1 MS
* dispenseRequest.expectedSupplyDuration.code = #d (exactly)
* dispenseRequest.expectedSupplyDuration.system MS
* dispenseRequest.expectedSupplyDuration.value MS
* dispenseRequest.expectedSupplyDuration.value ^short = "The number of days supply."
* dispenseRequest.expectedSupplyDuration.unit 1..1 MS
* dispenseRequest.expectedSupplyDuration.unit = "day" (exactly)



///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////

* priority 0..0
* substitution 0..0
* priorPrescription 0..0
* detectedIssue 0..0
* eventHistory 0..0
* supportingInformation 0..0
* dispenseRequest.numberOfRepeatsAllowed 0..0
//* extension[Extension-CareConnect-MedicationRepeatInformation-1] 0..0

// the following elements are not in R4, added via JS 
//* definition 0..0