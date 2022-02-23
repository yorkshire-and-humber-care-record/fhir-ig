      Status: Draft - For Review


## **Introduction**
This profile describes the use of an Encounter resource to provide an overarching "Encounter Grouping". The purpose is to link together several underlying more detailed Encounters, thus representing the concept of a "visit", "stay", or "incident".

***Please refer to the main [Encounter Resource profile](StructureDefinition-Interweave-Encounter.html) for a more complete description of the approach to modelling Encounters***

The EncounterGrouping is a skeletal Encounter which requires a small number of mandatory fields:
 - Class - a new class code of GROUPING is defined specifically to identify these overarching Encounters
 - Status - mandatory in FHIR
 - Period - the period of the overall "visit"
 - Subject - the Patient involved

 In addition as Must Support:
  - Identifier - a local id if relevant
 - Hospitalization - information about admission and discharge. (Collating together information already provided on the underlying Encounters). See the Encounter Resource Profile for further details of this structure.


Most other fields are removed, as this detail should instead be captured on the underlying Encounter records.

