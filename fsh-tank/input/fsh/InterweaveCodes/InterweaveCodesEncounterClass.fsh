Alias: $ActCode = http://hl7.org/fhir/v3/ActCode

ValueSet: InterweaveEncounterClass
Id: Interweave-EncounterClass-1
Description: "Encounter Class codes"
* ^name = "InterweaveEncounterClass"

// Include the standard HL7 codes (which is a selection - replicate what the original ValueSet used here does)
* include codes from valueset http://hl7.org/fhir/ValueSet/v3-ActEncounterCode

// And add some of our own
* include codes from system Interweave-EncounterClass-1



CodeSystem: InterweaveEncounterClass
Id: Interweave-EncounterClass-1
Description: "Additional Encounter Class codes"
* ^name = "InterweaveEncounterClass"
* ^content = #complete
* ^caseSensitive = true

* #GROUPING "Grouping of related Encounters"