Alias: $SCT = http://snomed.info/sct

Profile: InterweaveMedication
Parent: CareConnect-Medication-1
Id: Interweave-Medication
Description: "Interweave Medication resource profile."
* ^status = #active

* insert Ruleset-InterweaveBaseFields

* extension contains Extension-Interweave-R4Identifier named R4Identifier 0..*

* code 1..1 MS
* insert Ruleset-CodingWithSystemCodeDisplay(code)

* form 0..1 MS

* ingredient.item[x] 1..1 MS
* ingredient.extension contains Extension-Interweave-R4IngredientStrength named strengthR4 0..1

///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////

* status 0..0
// the following elements are not in R4, added via JS 
//* isBrand 0..0
//* isOverTheCounter 0..0
//* package 0..0
//* image 0..0
//* ingredient.amount 0..0

// *************************************************************************************************************************
// EXAMPLES
// *************************************************************************************************************************
Instance: InterweaveMedicationExample
InstanceOf: InterweaveMedication
Description: "Interweave Medication Example"

* insert Ruleset-ExampleMetaForHospital(Medication)

* code = $SCT#20455311000001102 "Hydrocortisone 1mg capsules"

* form = $SCT#385049006 "Capsule"
* ingredient.itemCodeableConcept = $SCT#396458002 "Hydrocortisone"
* ingredient.isActive = true
* ingredient.extension[Extension-Interweave-R4IngredientStrength].valueRatio.numerator = 500 'mg'
* ingredient.extension[Extension-Interweave-R4IngredientStrength].valueRatio.denominator = 10 'mL'