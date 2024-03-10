Profile: InterweaveObservationBloodOxygenSaturation
Parent: Interweave-Observation
Id: Interweave-Observation-BloodOxygenSaturation
Description: "Interweave BloodOxygenSaturation Observation resource profile."
* ^status = #active

* status 1..1 MS
* status = #final (exactly)

* category 1..1 MS
* category[observationCategory].coding.system = "http://hl7.org/fhir/observation-category" (exactly)
* category[observationCategory].coding.code = #vital-signs (exactly)
* category[observationCategory].coding.display = "Vital Signs" (exactly)

* code 1..1 MS
* code.coding[snomedCT].code = #103228002 (exactly)
* code.coding[snomedCT].display = "Blood oxygen saturation" (exactly)

* value[x] only Quantity
* value[x] ^short = "Actual result."
* valueQuantity 0..1 MS


///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////

//* issued 0..0
* component 0..0
* extension[Extension-Interweave-ValuePrecision] 0..0
//* value[x].extension[Extension-Interweave-R4ValueInteger] 0..0
//* valueQuantity.extension[Extension-Interweave-R4ValueInteger] 0..0
