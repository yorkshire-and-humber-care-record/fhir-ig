Alias: $SCT = http://snomed.info/sct
Alias: $v3-ObservationInterpretation = http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation


Profile: InterweaveObservationHeartRate
Parent: CareConnect-HeartRate-Observation-1 //CareConnect-Observation-1
Id: Interweave-Observation-HeartRate
Description: "Interweave HeartRate Observation resource profile."
* ^status = #active

* insert Ruleset-InterweaveBaseFields

//* extension contains Extension-CareConnect-ReasonCondition-1 named reason 0..*
//* extension[Extension-CareConnect-ReasonCondition-1] ^short = "Reason resource added/performed/given."

* identifier 0..* MS

* basedOn ^short = "DISCOURAGED -  This field does not appear to provide information which would be beneficial in a shared care record. It also allows references to a raft of request/order resources which introduces a lot of complexity for a data consumer."

* status 1..1 MS
* status ^short = "Fixed value of ‘final’."

* category 1..1 MS
* category.coding.display 1..1

* code 1..1 MS
* code.coding[loinc].display 1..1
* code.coding[loinc].display = "Heart rate" (exactly)

* subject 1..1 MS
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)
* subject ^short = "The patient whose characteristics (direct or indirect) are described by the observation and into whose record the observation is placed."

//context in STU3
* encounter only Reference(CareConnect-Encounter-1)
* encounter ^short = "The encounter during which this observation is made."

* effective[x] 1..1 MS
* effective[x] ^short = "This is the time/time period during which the observation was taken."

* performer 0..* MS
* performer only Reference(CareConnect-Practitioner-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(performer)
* performer ^short = "Who is responsible for the observation."

* value[x] only Quantity
* value[x] 0..1 MS
* value[x] ^short = "Actual result."

* dataAbsentReason 0..1 MS
* dataAbsentReason from http://hl7.org/fhir/ValueSet/observation-valueabsentreason (required)
* insert Ruleset-CodingWithSystemCodeDisplay(dataAbsentReason)

* interpretation 0..1 MS
* interpretation from http://hl7.org/fhir/ValueSet/observation-interpretation (required)
* insert Ruleset-CodingWithSystemCodeDisplay(interpretation)

//comment in STU3
* note 0..1 MS
* note ^short = "Comments about the result"

* bodySite 0..1 MS
* bodySite from http://hl7.org/fhir/ValueSet/body-site (required)

* method 0..1
* method from http://hl7.org/fhir/ValueSet/observation-methods (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(method)

* specimen 0..1
* specimen only Reference(CareConnect-Specimen-1)
* insert Ruleset-ReferenceWithReferenceOnly(specimen)
* specimen ^short = "Specimen used for this observation."

* device 0..1
* device only Reference(Device)
* insert Ruleset-ReferenceWithReferenceOnly(device)
* device ^short = "Measurement device."

* referenceRange 0..* MS

///////////////////////////////////////
// --- Removed fields ---
///////////////////////////////////////

* issued 0..0
* component 0..0


// *************************************************************************************************************************
// EXAMPLES
// *************************************************************************************************************************
Instance: InterweaveObservationHeartRateExample-Full
InstanceOf: InterweaveObservationHeartRate
Description: "Interweave Observation HeartRate Example"

* insert Ruleset-ExampleMetaForHospital(Observation-HeartRate)
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-HeartRate-Observation-1"
* insert Ruleset-ExampleLocalId(Observation-HeartRate, RCB.HRTRate123)

* status = #final

* category = http://hl7.org/fhir/observation-category#vital-signs "Vital Signs"

* code = $SCT#364075005 "Heart rate"

* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"

* performer = Reference(InterweavePractitionerExample)
* performer.display = "Dr Jane BLOGGS"

//* interpretation = http://hl7.org/fhir/ValueSet/observation-interpretation#L "low"

* encounter = Reference(InterweaveEncounterExample-MaturityLevel1) // R4 encounter -> STU3 context

* referenceRange.low = 60 '/min' "beats/minute"
* referenceRange.high = 100 '/min' "beats/minute"

* bodySite = $SCT#89971009 "Entire right radial artery"

* method = $SCT#37931006 "Auscultation"

* note.text = "this is comment." //R4 note -> STU3 comment

* effectiveDateTime = "1999-07-02"
* valueQuantity = 44 '/min' "beats/minute"