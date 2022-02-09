Alias: $ActCode = http://hl7.org/fhir/v3/ActCode

ValueSet: YhcrEncounterClass
Id: Yhcr-EncounterClass-1
Description: "Encounter Class codes"
* ^name = "YhcrEncounterClass"

// Include the standard HL7 codes (which is a selection - replicate what the original ValueSet used here does)
* include codes from system $ActCode where concept is-a #_ActEncounterCode
* exclude $ActCode#_ActEncounterCode

// And add some of our own
* include codes from system Yhcr-EncounterClass-1



CodeSystem: YhcrEncounterClass
Id: Yhcr-EncounterClass-1
Description: "Additional Encounter Class codes"
* ^name = "YhcrEncounterClass"
* ^content = #complete

* #ENCOUNTERGROUPING "Grouping of related Encounters"