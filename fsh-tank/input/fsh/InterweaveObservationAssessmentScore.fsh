Profile: InterweaveObservationAssessmentScore
Parent: Interweave-Observation
Id: Interweave-Observation-AssessmentScore
Description: "Interweave AssessmentScore Observation resource profile."
* ^status = #active

* status 1..1 MS
* status = #final (exactly)

* category 1..1 MS
* category.coding.system = "http://hl7.org/fhir/observation-category" (exactly)
* category.coding.code = #survey (exactly)
* category.coding.display = "Survey" (exactly)

* insert Ruleset-CodingWithSystemCodeDisplay(interpretation)

///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////

* dataAbsentReason 0..0
* extension[Extension-Interweave-ValuePrecision] 0..0
//* category.coding[observationCategory] 0..0
* bodySite 0..0
* specimen 0..0
* component 0..0