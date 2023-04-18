Profile: InterweaveMedication
Parent: CareConnect-Medication-1
Id: Interweave-Medication
Description: "Interweave Medication resource profile - DRAFT."
* ^status = #draft

* insert Ruleset-InterweaveBaseFields

* extension contains Extension-Interweave-R4Identifier named R4Identifier 0..* MS
//* extension[Extension-Interweave-R4Identifier] ^short = "The coded reason for the appointment being cancelled (pre-adopted from R4)"
//* extension[Extension-Interweave-R4Identifier] MS

* code 1..1 MS

* form 0..1 MS

* ingredient.item[x] 1..1 MS
* ingredient.extension contains Extension-Interweave-R4IngredientStrength named strengthR4 1..1 MS

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