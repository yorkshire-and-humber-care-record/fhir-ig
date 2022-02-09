      Status: Draft - Work In Progress


## **Introduction**
This profile describes the use of an Encounter resource to provide an overarching "Encounter Grouping". The purpose is to link together several underlying more detailed Encounters, thus representing the concept of a "visit", "stay", or "hospitalisation".

***Please refer to the main [Encounter Resource profile](StructureDefinition-Yhcr-Encounter.html) for a more complete description of the approach to modelling Encounters***

The EncounterGrouping is a skeletal Encounter which requires a small number of mandatory fields:
 - Class - a new class code of ENCOUNTERGROUPING is defined specifically to identify these overarching Encounters
 - Status - mandatory in FHIR
 - Period - the period of the overall "visit"
 - Subject - the Patient involved
 - Hospitalization - populating this data structure will generally be the whole point of this overarching Encounter. See below for further details of the fields.

 In addition as Must Support:
  - Identifier - a local id if relevant

Most other fields are removed, as this detail should instead be captured on the underlying Encounter records.


### **Hospitalization Structure**
Within the Encounter sits the "Hospitalization" structure. This must be provided either here as part of the overarching "Encounter Grouping". This structure provides information about the admission and discharge. Therefore it is particularly important for a regional shared record - as this defines the touchpoints with other care providers.

Fields in the Hospitalization structure are as follows:

 - **Must Support**
   - **Admission Method** - this CareConnect extension provides a useful list of codes about the method of admission (eg Planned, A&E, transfer, etc)
   - **Discharge Method** - this CareConnect extension provides a useful list of codes about the method of discharge (eg clinical discharge, self-discharge, deceased, etc)
   - **Origin** - Information about the location which the patient arrived from (if relevant / known)
      - Required at the “site” level if arriving from another institution
      - Optional if arriving from a residential address
   - **Admit Source** - Useful information about the type of place the patient came from (eg home, other NHS hospital, care home, etc)
   - **Destination** - Information about the location which the patient is discharged to (if relevant / known)
      - Required at the “site” level if discharged to another institution
      - Optional if discharged to a residential address
   - **Discharge Disposition** - Useful information about the type of place the patient has been discharged to (eg home, other NHS hospital, care home, etc))

    *Note that Origin and Destination are likely to be external locations - please refer to guidance on the [Location profile](StructureDefinition-Yhcr-Location.html) about use of References. For example the use of a Contained Resource may be appropriate.*


 - **Optional**
   - **Readmission** - flag may be provided if known and relevant

 - **Discouraged**
   - **Diet Preferences, Special Courtesy, Special Arrangement** - additional details that are relevant internally for planning the patient's stay, but not so relevant for external sharing.
