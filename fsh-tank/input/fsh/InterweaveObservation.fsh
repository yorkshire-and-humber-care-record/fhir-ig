Profile: InterweaveObservation
Parent: CareConnect-Observation-1
Id: Interweave-Observation
Description: "Interweave Observation resource profile."
* ^status = #active

* insert Ruleset-InterweaveBaseFields

* extension[Extension-CareConnect-ReasonCondition-1] 0..*

* extension contains Extension-Interweave-ValuePrecision named valuePrecision 0..1
* extension[Extension-Interweave-ValuePrecision] ^short = "Explicit precision of the number"

// * extension contains Extension-Interweave-R4ValueInteger named valueInteger 0..1
// * extension[Extension-Interweave-R4ValueInteger] ^short = "valueInteger"

* identifier 0..* MS

* code 1..1 MS
* code from https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ObservationType-1 (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(code)
* code.coding[snomedCT] 0..1 MS
* code.coding[snomedCT] from https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ObservationType-1 (preferred)

* basedOn ^short = "DISCOURAGED - This field does not appear to provide information which would be beneficial in a shared care record. It also allows references to a raft of request/order resources which introduces a lot of complexity for a data consumer."

* category 1..* MS
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "coding.system"
* category ^slicing.rules = #open
* category contains observationCategory 1..1
* category[observationCategory] ^binding.strength = #required


// * category 1..* MS
// * category from observation-category (preferred)
// * category.coding ^slicing.discriminator.type = #value
// * category.coding ^slicing.discriminator.path = "system"
// * category.coding ^slicing.ordered = false
// * category.coding ^slicing.rules = #open
// * category.coding contains observationCategory 1..1

* category[observationCategory].coding.system 1..
* category[observationCategory].coding.system = "http://hl7.org/fhir/observation-category" (exactly)
* category[observationCategory].coding.version ..0
* category[observationCategory].coding.code 1..
* category[observationCategory].coding.display 1..
* insert Ruleset-CodingWithSystemCodeDisplay(category)

* status 1..1 MS
* status from http://hl7.org/fhir/ValueSet/observation-status (required)
* status ^short = "Only finalised observations should be shared. We do also allow for amendments and corrections to the final observation to take place. We therefore limit the list of statuses which can be used to the following - final | amended | corrected"

//context in STU3
* encounter only Reference(CareConnect-Encounter-1)
* encounter ^short = "The encounter during which this observation is made."

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

* specimen 0..1
* specimen only Reference(CareConnect-Specimen-1)
* insert Ruleset-ReferenceWithReferenceOnly(specimen)
* specimen ^short = "Specimen used for this observation."

* device 0..1
* device only Reference(Device)
* insert Ruleset-ReferenceWithReferenceOnly(device)
* device ^short = "Measurement device."

* referenceRange 0..* MS

* dataAbsentReason 0..1 MS
* dataAbsentReason from http://hl7.org/fhir/ValueSet/observation-valueabsentreason (required)
* insert Ruleset-CodingWithSystemCodeDisplay(dataAbsentReason)

* interpretation 0..1 MS
* interpretation from http://hl7.org/fhir/ValueSet/observation-interpretation (required)

* bodySite 0..1 MS
* bodySite from http://hl7.org/fhir/ValueSet/body-site (required)

* method 0..1
* method from http://hl7.org/fhir/ValueSet/observation-methods (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(method)

* value[x] only Quantity or CodeableConcept or string or boolean or Range or Ratio or SampledData or time or dateTime or Period
//* value[x].extension contains Extension-Interweave-R4ValueInteger named valueInteger 0..1
* value[x] 0..1 MS

//comment in STU3
* note 0..1 MS
* note ^short = "Comments about the result"

* component 0..* MS
* component.extension contains Extension-Interweave-ValuePrecision named valuePrecision 0..1
* component.value[x] only Quantity or CodeableConcept or string or Range or Ratio or SampledData or time or dateTime or Period
//* component.value[x].extension contains Extension-Interweave-R4ValueInteger named valueInteger 0..1
* component.value[x] 0..1 MS
* component.code MS
* component.code from https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ObservationType-1 (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(component.code)
* component.code.coding[snomedCT] 0..1 MS
* component.code.coding[snomedCT] from https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ObservationType-1 (preferred)



* issued 0..0
* category[observationCategory].coding[snomedCT] 0..0


Invariant: valint-1
Description: "Cannot have both valueInteger and value[x]"
* severity = #error
* expression = "valueInteger.exists() != value.exists()"

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Examples
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Instance: InterweaveObservationExample
// InstanceOf: InterweaveObservation
// Description: "Interweave Observation example"

// * insert Ruleset-ExampleMetaForHospital(Observation)