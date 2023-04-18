Alias: $ActPriority = http://hl7.org/fhir/ValueSet/v3-ActPriority

ValueSet: InterweaveEncounterPriority
Id: Interweave-EncounterPriority-1
Description: "Encounter priority codes"
* ^name = "InterweaveEncounterPriority"

// Include the standard HL7 codes (which is a selection - replicate what the original ValueSet used here does)
* include codes from valueset http://hl7.org/fhir/ValueSet/v3-ActPriority

// And add some of our own
* include codes from system Interweave-EncounterPriority-1



CodeSystem: InterweaveEncounterPriority
Id: Interweave-EncounterPriority-1
Description: "Additional Encounter Priority codes"
* ^name = "InterweaveEncounterPriority"
* ^content = #complete
* ^caseSensitive = true

* #2WW "two week wait" "Two Week Wait"


