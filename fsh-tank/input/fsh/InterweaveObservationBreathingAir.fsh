Profile: InterweaveObservationBreathingAir
Parent: Interweave-Observation
Id: Interweave-Observation-BreathingAir
Description: "Interweave BreathingAir Observation resource profile - DRAFT."
* ^status = #draft

* status 1..1 MS
* status = #final (exactly)

* category 1..1 MS
* category.coding.system = "http://hl7.org/fhir/observation-category" (exactly)
* category.coding.code = #vital-signs (exactly)
* category.coding.display = "Vital Signs" (exactly)

* code 1..1 MS
* code.coding[snomedCT].code = #722742002 (exactly)
* code.coding[snomedCT].display = "Breathing room air" (exactly)

* value[x] only boolean
* value[x] 0..1 MS
* value[x] ^short = "Actual result."

///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////

* component 0..0
* extension[Extension-Interweave-ValuePrecision] 0..0
* value[x].extension[Extension-Interweave-R4ValueInteger] 0..0