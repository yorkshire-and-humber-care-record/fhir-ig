Extension: ExtensionInterweaveEDDischargeDestination
Id: Extension-Interweave-EDDischargeDestination
Description: "An extension to record the discharge destination of patients which have attended ED."
* ^status = #draft

* . ..1
* . ^short = "Discharge destination of patients which have attended ED."
* . ^definition = "Discharge destination of patients which have attended ED represented using Snomed CT code."


* valueCodeableConcept only CodeableConcept
* valueCodeableConcept ^short = "Discharge destination of patients which have attended ED."

// It is based on SNOMED refset 999003011000000105: Emergency care discharge destination simple reference set
* valueCodeableConcept from Interweave-EDDischargeDestination (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(valueCodeableConcept)