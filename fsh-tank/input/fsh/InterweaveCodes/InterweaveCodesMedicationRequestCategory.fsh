ValueSet: InterweaveMedicationRequestCategory
Id: Interweave-MedicationRequestCategory-1
Description: "Medication Request Category codes"
* ^name = "InterweaveMedicationRequestCategory"

// Include the standard HL7 codes (which is a selection - replicate what the original ValueSet used here does)
* include codes from valueset http://hl7.org/fhir/ValueSet/medication-request-category

// And add some of our own
* include codes from system Interweave-MedicationRequestCategory-1



CodeSystem: InterweaveMedicationRequestCategory
Id: Interweave-MedicationRequestCategory-1
Description: "Additional Medication Request Category codes"
* ^name = "InterweaveMedicationRequestCategory"
* ^content = #complete
* ^caseSensitive = true

* #discharge "discharge" "Includes orders for medications to be administered or consumed when the patient is discharged from the hospital"


