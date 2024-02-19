Profile: InterweaveCarePlan
Parent: CareConnect-CarePlan-1
Id: Interweave-CarePlan
Description: "Interweave CarePlan resource profile."
* ^status = #active

* insert Ruleset-InterweaveBaseFields

* subject 1..1 MS
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)
* subject ^short = "The patient whose characteristics (direct or indirect) are described by the observation and into whose record the observation is placed."

* category 0..* MS
* category from InterweaveR4PCarePlanCategory (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(category)

// Context: (MS)
//   Will not be relevant to all Careplans (eg historical/migrated data), 
//   but should be populated if there is a relevant Encounter to link the Careplan to.
* encounter MS  // R4 encounter -> STU3 Context
* encounter only Reference(CareConnect-Encounter-1)
* insert Ruleset-ReferenceWithReferenceOnly(encounter)

* activity.detail 0..1 MS
///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////
* supportingInfo 0..0
//* definition 0..0
///////////////////////////////////////
// --- Notes on other standards ---
///////////////////////////////////////


// *************************************************************************************************************************
// EXAMPLES
// *************************************************************************************************************************

