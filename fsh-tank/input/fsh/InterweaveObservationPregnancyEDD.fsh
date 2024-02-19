Profile: InterweaveObservationPregnancyEDD
Parent: Interweave-Observation
Id: Interweave-Observation-Pregnancy-EDD
Description: "Interweave Pregnancy Estimated Delivery Date resource profile."
* ^status = #active

// * insert Ruleset-InterweaveBaseFields

// * extension contains Extension-Interweave-workflow-episodeOfCare named episodeOfCare 0..1
// * extension[Extension-Interweave-workflow-episodeOfCare] MS

* identifier 0..* MS

* code 1..1 MS
* code from InterweavePregnancyEDDCode (required)
* insert Ruleset-CodingWithSystemCodeDisplay(code)
* code.coding[snomedCT] 1..1 MS
* code.coding[snomedCT] from InterweavePregnancyEDDCode (required)

* basedOn ^short = "DISCOURAGED - This field does not appear to provide information which would be beneficial in a shared care record. It also allows references to a raft of request/order resources which introduces a lot of complexity for a data consumer."

* status 1..1 MS
* status = #final (exactly)
* status ^short = "Fixed value of ‘final’."

//context in STU3
* encounter only Reference(CareConnect-Encounter-1)
* encounter ^short = "The encounter during which this observation is made."

* effective[x] only dateTime
* effective[x] 1..1 MS
* effective[x] ^short = "This is the time/time period during which the observation was taken."

* subject 1..1 MS
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)
* subject ^short = "The patient whose characteristics (direct or indirect) are described by the observation and into whose record the observation is placed."

* performer 0..* MS
* performer only Reference(CareConnect-Practitioner-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(performer)
* performer ^short = "Who is responsible for the observation."


* value[x] only dateTime
* value[x] ^short = "Actual result."
* valueDateTime 1..1 MS

//comment in STU3
* note 0..1 MS
* note ^short = "Comments about the result"

* issued 0..0
* component 0..0
* method 0..0
* bodySite 0..0
* dataAbsentReason 0..0
* interpretation 0..0
* referenceRange 0..0
* specimen 0..0
* device 0..0
* extension[Extension-CareConnect-ReasonCondition-1] 0..0
* category.coding[snomedCT] 0..0

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Examples
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////