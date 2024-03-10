Profile: InterweaveObservationHeight
Parent: Interweave-Observation
Id: Interweave-Observation-Height
Description: "Interweave Height/length resource profile."
* ^status = #active

* identifier 0..* MS

* code 1..1 MS
* code.coding[snomedCT].code = #50373000 (exactly)
* code.coding[snomedCT].display = "Body height measure" (exactly)
* code from observation-vitalsignresult (preferred)
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.ordered = false
* code.coding ^slicing.rules = #open
* code.coding contains loinc 1..1

* code.coding[loinc].system 1..1
* code.coding[loinc].system = "http://loinc.org" (exactly)
* code.coding[loinc].code 1..1
* code.coding[loinc].code = #8302-2 (exactly)
* code.coding[loinc].display 1..1
* code.coding[loinc].display = "Body height" (exactly)

* basedOn ^short = "DISCOURAGED - This field does not appear to provide information which would be beneficial in a shared care record. It also allows references to a raft of request/order resources which introduces a lot of complexity for a data consumer."

* category 1..1 MS
* category[observationCategory].coding.system = "http://hl7.org/fhir/observation-category" (exactly)
* category[observationCategory].coding.code = #vital-signs (exactly)
* category[observationCategory].coding.display = "Vital Signs" (exactly)


// * category.coding.system = "http://hl7.org/fhir/observation-category" (exactly)
// * category.coding[observationCategory].system = "http://hl7.org/fhir/observation-category" (exactly)
// * category.coding.code = #vital-signs (exactly)
// * category.coding[observationCategory].code = #vital-signs (exactly)
// * category.coding.display = "Vital Signs" (exactly)
// * category.coding[observationCategory].display = "Vital Signs" (exactly)

* status 1..1 MS
* status = #final (exactly)
* status ^short = "Fixed value of ‘final’."

//context in STU3
* encounter only Reference(CareConnect-Encounter-1)
* encounter ^short = "The encounter during which this observation is made."

* effective[x] only dateTime
* effective[x] 1..1 MS
* effective[x] ^short = "This is the date/time at which the observation was taken."


* subject 1..1 MS
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)
* subject ^short = "The patient whose characteristics (direct or indirect) are described by the observation and into whose record the observation is placed."

* performer 0..* MS
* performer only Reference(CareConnect-Practitioner-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(performer)
* performer ^short = "Who is responsible for the observation."

* device 0..1
* device only Reference(Device)
* insert Ruleset-ReferenceWithReferenceOnly(device)
* device ^short = "Measurement device."

* method 0..1
* method from http://hl7.org/fhir/ValueSet/observation-methods (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(method)

* value[x] only Quantity
* value[x] 1..1 MS
* valueQuantity 1..1 MS

//comment in STU3
* note 0..1 MS
* note ^short = "Comments about the result"

* issued 0..0
* component 0..0
* bodySite 0..0
* dataAbsentReason 0..0
* interpretation 0..0
* referenceRange 0..0
* specimen 0..0
* extension[Extension-CareConnect-ReasonCondition-1] 0..0
* category.coding[snomedCT] 0..0
* extension[Extension-Interweave-ValuePrecision] 0..0
// * value[x].extension[Extension-Interweave-R4ValueInteger] 0..0
// * valueQuantity.extension[Extension-Interweave-R4ValueInteger] 0..0

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Examples
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
