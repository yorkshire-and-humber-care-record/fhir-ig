## **Introduction**
This profile describes the use of an Encounter resource to provide an overarching "Visit Grouping". The purpose is to link together several underlying more detailed Encounters, thus representing the concept of a "visit", "stay", or "hospitalisation.

***Please refer to the main Encounter Resource profile for a more complete description of the approach to modelling Encounters***

The VisitGrouping is a skeletal Encounter which requires a small number of mandatory fields:
 - Class - a new class code of VISITGROUPING is defined specifically to identify these overarching Encounters
 - Status - mandatory in FHIR
 - Period - the period of the overall "visit"
 - Subject - the Patient involved
 - Location - the site involved

 In addition as Must Support:
  - Identifier - a local id if relevant
  - Hospitalization - populating this data structure will generally be the whole point of this overarching Encounter. Please refer to the main Encounter profile for further details of the fields.

Most other fields are removed, as this detail should instead be captured on the underlying Encounter records.


