Extension: ExtensionInterweavePatientInstruction
Id: Extension-Interweave-R4PatientInstruction
Description: "Detailed information and instructions for the patient. Pre-adopted from R4"
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "Appointment" //R3 is just context

* . ..1
* . ^short = "Detailed information and instructions for the patient. Pre-adopted from R4"
* . ^definition = "Detailed information and instructions for the patient. Pre-adopted from R4"

* valueString only string
* valueString ^short = "Detailed information and instructions for the patient. Pre-adopted from R4"
* valueString ^definition = "Detailed information and instructions for the patient. Pre-adopted from R4"