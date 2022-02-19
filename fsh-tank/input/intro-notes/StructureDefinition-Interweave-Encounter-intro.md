      Status: Draft - Work In Progress

## **Introduction**
This profile sets minimum expectations for the Encounter resource.

The Encounter is a key resource - as it explains the who, where, when, and why of care that has been provided. Not only is the Encounter resource valuable in itself, but it also acts as a point of reference for linking to other clinical resources.

Its main use in our region at present is for acute care, where it can be used to describe inpatient, outpatient and emergency encounters.

As of this writing then Encounters are not being used by Social Care - which instead uses a model based around the Episode of Care. See the Episode of Care profile for further details.

The Encounter is a complex FHIR Resource – and one which offers significant flexibility to support different representations. The FHIR guidance on anticipated usage is helpful and should be read as background, see <https://www.hl7.org/fhir/STU3/encounter.html>. As this states however: “*The expectation is that for each domain of exchange, profiles are used to limit the flexibility of Encounter to meet the demands of the use case*”. Before looking at the data items in detail, it is therefore necessary to establish some overall guidelines on how the Encounter resource type will be used

### **Encounter Start/End**
Whilst there is an intuitive understanding of what constitutes the start / end of an Encounter, it is challenging to establish a rigorous definition. Nevertheless, the following guidelines cover key points discussed to date:

 - An Encounter covers a period of ***continuous care***

 - A ***change in care-setting*** constitutes a change of Encounter. (This would include moving from Emergency to Inpatient to Outpatient within a hospital – as indicated by the “class”)

 - A ***change in diagnosis*** constitutes a change of Encounter. (This would include a significant change in the primary diagnosis, as this is significant for many analytical purposes including outcome tracking. It would not necessarily include a minor refinement to the secondary diagnosis)

 - A ***change in location*** does NOT constitute a change of Encounter. (For example moving between beds and/or wards within a hospital inpatient stay. This would instead be modelled using the “location” sub-structure of the Encounter)

 - ***Involvement of additional clinicians*** does NOT constitute a separate Encounter. For example, suppose a hospital inpatient is visited by a dietician during their stay: 
   - As a major contributor to the encounter the dietician would be referenced as one of the participants
   - As a minor contributor the dietician would be referenced as the author of a CarePlan, performer of an Observation, or assessor of a ClinicalImpression. These in turn would be linked to the Encounter.


### **Encounter Structure and Heirarchy**

Any discussion of Encounters inevitably has to consider the topic of how Encounters are structured and grouped. 
 - The FHIR Encounter Resource includes the "partOf" field, which allows Encounters to be linked into structures and heirarchies.
 - It is also possible to link to an Episode of Care

 There is a need to balance the desire to accurately model the complexity of real-life vs the need to provide a simple model which is easy for Data Consumers to understand and to reliably display. Experience suggests that offering a plethora of varying complex heirarchical structures from different care settings makes the task of a Data Consumer extremely challenging.

 ***A three-level maturity model for Encouter structures is therefore defined:***

  - **Maturity Level 1 - Simple flat list of Encounters**

    This is the basic level which all Data Providers and Consumers MUST support. It consists of a simple flat list of Encounters with no heirarchy whatsoever.

     - Much of the value comes from this list and, for Direct Care purposes at least, it is not difficult for a clinician to look at the times and locations and deduce what has occured.
      - ***A important use-case is messaging-based consumers*** - eg Ambulance Transfer of Care and Subscription Notifications. These consumers see the world as a real-time stream of Encounter-based events. In this world-view it is difficult to comprehend heirarchy - and indeed the ultimate set of interrelationships may not even be known as the initial Encounter event unfolds. ***It is therefore extremely important that all of the necessary information can be conveyed as a "flat" stream of Encounter messages***.

      The basic model is therefore of standalone Encounters which have a full set of information populated to give a complete picture of what occured.

      A specific implication of this is in the use of the "hospitalization" structure which, despite the name, can be used to convey important admission and discharge information relevant to any care-setting:
       - A hospitalization structure MUST be included on every Encounter
       - If the Encounter includes an Admission event, then the relevant portion of the hospitalization structure MUST be populated
       - If the Encounter includes a Discharge event, then the relevant portion of the hospitalization structure MUST be populated
       - Portions of the hospitalization structure which are irrelevant to this Encounter may be omitted. 
       - In other words, there will always be a hospitalization structure but - depending on circumstances - it might be:
         - Fully populated (for a simple standalone Encounter)
         - Half populated (for an Encounter that is the first or last of a set)
         - Not populated at all (more rarely, for an Encounter that is "in the middle" of a set)


  - **Maturity Level 2 - Encounter Grouping**

    Despite the appeal of a simple flat list of Encounters, the concept of a "visit", "hospitalisation", or "incident" is widely recognised and agreed to be useful. For example:
     - An initial "emergency" visit to A&E is followed by admittance to the ward as an inpatient
     - An initial call to 111 is followed by a visit at home from a first-responder, and finally a conveyance to hospital in an ambulance

    ***A two-level heirarchy is therefore defined, based on the use of special type of Grouping Encounter to link together Encounters which comprise part of the same "visit", "stay" or "incident".***
      -  A separate [Encounter Grouping profile](StructureDefinition-Interweave-EncounterGrouping.html) is provided to support this.
      - Data Providers who feel it is relevant MAY provide this additional grouping information
      - Data Consumers who are able MAY make use of this additional grouping information to provide a richer and more meaningful display to their users

    In practical terms:
      - The "partOf" field on the base Encounters is populated to point at a Grouping Encounter
      - Only a SINGLE level of Encounter heirarchy is supported. The "partOf" field of a base Encounter must point ONLY at a single Grouping Encounter. Other more complex structures are NOT supported
      - It is perfectly acceptable to have a Grouping Encounter which contains only a single base Encounter. In fact this is likely to be common - as when the initial encounter occurs it is not known how events will unfold. The simplest approach for a Maturity Level 2 Data Provider will therefore be to always create a Grouping Encounter in anticipation. With the grouping structure already in place, it becomes straightforward to add additional Encounters as-and-if they occur.
      - The Grouping Encounter is essentially an empty shell. Its purpose is purely to group. All of the important information is held in the base Encounters.
       - The Grouping Encounter does however add value by capturing the overall period and the full set of "hospitalization" information about admission and discharge. Whilst this could be deduced from the base encounters, it is helpful and logical to also provide in one place here.

  - **Maturity Level 3 - Episode of Care**

    This final level of maturity adds a further level of linkage - one that goes beyond modelling a single visit or incident and links together a whole care pathway. This is provided by the Episode of Care.
    
    At first glance it can be difficult to distinguish an Encounter Grouping from an Episode of Care - however the [FHIR specification](https://www.hl7.org/fhir/STU3/episodeofcare.html) provides helpful guidance, and in fact there are some clear differentiating features:
     - An Episode of Care continues over a longer period of time. Specifically it can be used to link together ***multiple separate visits*** over a period of months or even years
     - An Episode of Care is ***based around a "condition"***, and is thus used to join-up a care pathway. Specifically, a patient with multiple conditions could have multiple Episodes of Care running concurrently. The Episode of Care is used to "pick out" from the mass of activity those Encounters relating to a particular care pathway.

     The FHIR Specification states that an Episode of Care relates to a single organisation. However the definition of "organisation" might be considered a point of controversy, specifically is an Integrated Care System an "organisation"? This would provide a valuable mechanism to link up a   cross-care-setting care pathway - granted however that there is currently no obvious mechanism to identify and link encounters at this whole-system level.

     ***Level 3 is currently seen as aspiriational and unlikely to be implemented immediately. Please get in touch for further discussion if you believe you may be a first-of-type.***


The diagram below summarises the above discussion - ie core Encounters, single Grouping Encounter, and aspirational Episode of Care.


<img src=".\EncounterStructure.png" alt="Encounter Structure" style="clear:both; float:none">
 


### **Encounters vs Appointments**
Whilst the terms "Encounter" and "Appointment" might be used interchangably in everyday speach, in FHIR they have specific meanings:
 - An Appointment describes a plan for the future
 - An Encounter generally describes something that is happening now, or has occured in the past

 In general therefore:
  - An Appointment will lead to an Encounter - when the patient attends
   - An Encounter may or may not come from an Appointment (ie scheduled vs unscheduled care)

The picture is further complicated as FHIR does allow an Encounter to be created with status "planned", however this is not recommended here and should normally be represented instead with an Appointment.

Further useful guidance can be found on the FHIR website, here:


<https://www.hl7.org/fhir/STU3/encounter.html#bnr>

<https://www.hl7.org/fhir/STU3/appointment.html#statuses>

<https://www.hl7.org/fhir/STU3/appointment.html#status-flow>



### **Mandatory fields**
A significant set of mandatory fields are defined in order to properly describe an Encounter:

1. **Status** - this is already mandatory in FHIR. As noted above the use of "planned" is discouraged - use Appointment instead for this.
2. **Status History** - this is seen as important - to understand the timeline of the Encounter. (If there is only a single status then simply replicate it here, so it should always be possible to populate). 
3. **Class** - this provides a basic categorisation, ie Emergency, Inpatient, Ambulatory. Should always be known, and vital for meaningful display purposes. We have defined a custom code list which, for now, simply replicates the standard list provided by Care Connect and adds a code to identify an "Encounter Grouping". However it also enables the possiblity of extending the list to cover a wider range of care settings if this is found to be necessary (please get in touch).

4. **Subject** - every encounter must be linked to a Patient (not a Group)
5. **Participant** - it is required to include EXACTLY ONE practitioner who has the "type" of "Primary Performer". This should be the main person responsible - someone who it would be useful to contact if further information is desired. (If this person changed during the course of the encounter then please pick just ONE to finally hold this key role, and demote the others to "participant")

   Also included in the list of participants might be:
     - Admitter and Discharger - should be included if known/relevant and different to the Primary Performer
     - Participant - FHIR offers a wealth of other participant type codes, however it is suggested that simply classifying others as "participant" is likely to be adequate in most cases.

   Participants can be given a "period" and this is optional. For regional sharing the most important thing is really just to see who has been involved with the patient, rather than to construct a forensic timeline of involvements. However this information might be useful in the case of a long Encounter with many brief involvements, and so may be provided if desired.

6. **Location** - the location provides essential information about where the encounter took place. The intent is to provide information down to the “ward” level. It is useful to understand the history of where the patient has been seen, so the status and period MUST be populated, and a history provided. (As noted above, a change of location does not in itself constitute a new Encounter, simply append to this list).

7. **Hospitalization**: To provide details of admission and discharge. As described above, although it is mandatory to include the structure, depending on circumstances it might be actually populated fully, partially, or not at all. See below for further details of the fields contained 


### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known. These largely relate to providing additional "clinical" detail about the Encounter - including links to related FHIR Resources such as the originating Appointment, the Condition, etc. These build up the rich dataset around an Encounter and are important to provide, but may not yet be available for an initial Encounter implementation.

1. **Identifier** - a Local Id should be provided, such that could be quoted if manually getting in touch to find out more

2. **Type** -  categorises the type of place where the encounter took place. CareConnect modifies FHIR by providing a much more relevant list covering:
   - Indirect encounters - eg phone, video, letter, etc
   - In an establishment - a short list of top-level codes which cover a good range of care settings eg "Seen in clinic", "Seen in own home", "Seen in supervised accomodation", etc.
   - On the street
   > NB: The code for "Seen in Clinic" offers the ability to drill down into a long list of specific clinic types. However this overlaps to some extent with the purpose of the "Service Type" field - so it is sufficient here to populate simply "Seen in Clinic".

2. **Service Type (Extension)** -  this is perhaps one of the most important and useful fields about an Encounter as it describes the type of service - ie what the Encounter was "for". 

   However this field is missing in FHIR STU3! This is corrected in FHIR R4, and so we pre-adopt it here as an extension.

   We also pre-adopt the UKCore value set (based on SNOMED refset 1127531000000102: Services Simple Reference Set), which is more relevant than the default FHIR example and also covers social care


3. **Priority**: This provides useful information about whether it was emergency, routine, elective, etc
4. **Appointment**: Link to the originating Appointment, if relevant
5. **Reason**: A long list of SNOMED codes to describe different reasons which may have led to the Encounter. (Note that this may duplicate to some extent information provided in a linked Appointment and/or Referral, but is seen as useful to pull through onto the Encounter itself also).

   We pre-adopt the value set used in R4. This builds on the existing STU3 list covering SNOMED codes for "Clinical Finding" and "Procedure", and adds codes for "Context-dependent categories" (Social Care) and "Events" (A&E) 

6. **Diagnosis**: Link to a Condition diagnosed as a result of the Encounter. Can obviously be provided only if the Condition FHIR Resource is also being offered. If populated then it is required to rank the Conditions, and to assign one the "role" of "Chief Complaint"


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:

 - **Part Of** - as described above, this may be used to point to an overarching "EncounterGrouping" Encounter. No other complex structures or nesting are permitted.

 - **Episode of Care** - again as described above, this may be used to link up a care pathway by pointing to an Episode of Care.

 - **Incoming Referral**: Link to the originating Referral, if relevant and implemented. This could be very useful information. However FHIR makes significant changes from the STU3 "ReferralRequest" to the R4 "ServiceRequest", and so we are reluctant to mandate implementation at this stage
 - **Care Connect Extensions** - these cover Encounter Transport, Outcome of Attendance, and Emergency Care Discharge Status. May be useful if relevant and known



### **Discouraged or Removed fields**
 - **Class History** - as described in the introduction, a change of care setting would constitute a new Encounter. Therefore by definition an Encounter will only ever have a single Class.
  - **Length** - the period is already provided, so this appears to be duplication. In other countries then the exact length might be important for billing purposes, but this is not relevant here.
  - **Account** - for billing purposes, not relevant.   
  - **Service Provider** - duplicates information already available in the provenance tags





### **Hospitalization Structure**
Within the Encounter sits the "Hospitalization" structure. TThis structure provides information about the admission and discharge. Therefore it is particularly important for a regional shared record - as this defines the touchpoints with other care providers.

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

    *Note that Origin and Destination are likely to be external locations - please refer to guidance on the [Location profile](StructureDefinition-Interweave-Location.html) about use of References. For example the use of a Contained Resource may be appropriate.*


 - **Optional**
   - **Readmission** - flag may be provided if known and relevant

 - **Discouraged**
   - **Diet Preferences, Special Courtesy, Special Arrangement** - additional details that are relevant internally for planning the patient's stay, but not so relevant for external sharing.




### **Summary Text**

    Period.start - Period.end : Class description: Service Type description
  
    Example: 
    "09/01/2022 09:00 - 11/01/2022 14:30 : Inpatient Actute : Adult dermatology service"

