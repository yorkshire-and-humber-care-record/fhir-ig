Extension: ExtensionInterweaveR4AppointmentCancellationReason
Id: Extension-Interweave-R4AppointmentCancellationReason
Description: "An extension to add Appointment Cancellation Reason to the Appointment. This is pre-adopting a field that is missing in STU3 but added in R4. (And replacing a CareConnect extension which caters for free-text only)"
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "Appointment" //R3 is just context

* . ..1
* . ^short = "The coded reason for the appointment being cancelled (pre-adopted from R4)"
* . ^definition = "The coded reason for the appointment being cancelled. This is pre-adopting a field that is missing in STU3 but added in R4. (And replacing a CareConnect extension which caters for free-text only)."

* valueCodeableConcept only CodeableConcept
* valueCodeableConcept ^short = "The coded reason for the appointment being cancelled (pre-adopted from R4)"
* valueCodeableConcept from Interweave-R4AppointmentCancellationReason (required)
* insert Ruleset-CodingWithSystemCodeDisplay(valueCodeableConcept)
