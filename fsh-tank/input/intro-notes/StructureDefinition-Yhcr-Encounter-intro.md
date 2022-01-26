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
The FHIR Encounter Resource includes the "partOf" field, which allows Encounters to be linked into complex structures and heirarchies.

***Our goal is NOT to create structures, but instead to present a simple, "flat", list of Encounters***

This is driven by the practical needs of Data Consumers, who need to be able to display Encounters from many different sources. A simple flat list is easy and reliable to display - whereas a plethora of varying complex heirarchical structures would be very challenging. Most of the value comes from this list and, for Direct Care purposes at least, it is not difficult for a clinician to look at the times and locations and deduce what has occured.

Despite this, the concept of a "visit" or "hospitalisation" is widely recognised and agreed to be useful. For example an initial Emergency Encounter progresses into an Inpatient Encounter.

***A single level of heirarchy is therefore supported, based on the use of special type of "Visit Grouping" Encounter which links together underlying Encounters which comprise part of the same "visit" or "stay". A separate Encounter profile is provided to support this "visit grouping".***

Use of this grouping structure is optional, but encouraged where applicable.
 - If grouping is used, then the "hospitalization" information about admission and discharge should be held at the grouping level
 - If grouping is not used, then each encounter should be stand-alone and contain any relevant "hospitalization" information (even if this leads to some duplication)


### **Relationship to Episode of Care**
In the ideal world there would be further level of grouping - one that goes beyond modelling a visit to a single organisation, and links together a whole cross-care-setting pathway. This would involve multiple visits to different organisations, and would be represented by the Episode of Care. In the short term at least, however, this is seen as aspirational. Currently there is no obvious mechanism to identify and link encounters across organisational boundaries. 

The diagram below summarises the above discussion - ie core Encounters, single Visit Grouping Encounter, and aspiriational Episode of Care.


 ![Encounter Structure](.\EncounterStructure.png)

 <br>
 


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
3. **Class** - this provides a basic categorisation, ie Emergency, Inpatient, Ambulatory. Should always be known, and vital for meaningful display purposes. We have defined a custom code list which, for now, simply replicates the standard list provided by Care Connect. However it enables the possiblity of extending the list to cover a wider range of care settings if this is found to be necessary (please get in touch).
4. **Type** -  fundamental information based on several sets of SNOMED codes which describes the type of clinic or setting where the encounter occurred.
5. **Subject** - every encounter must be linked to a Patient (not a Group)
6. **Participant** - it is required to include EXACTLY ONE practitioner who has the "type" of "Primary Performer". This should be the main person responsible - someone who it would be useful to contact if further information is desired. (If this person changed during the course of the encounter then please pick just ONE to finally hold this key role, and demote the others to "participant")

   Also included in the list of participants might be:
     - Admitter and Discharger - should be included if known/relevant and different to the Primary Performer
     - Participant - FHIR offers a wealth of other participant type codes, however it is suggested that simply classifying others as "participant" is likely to be adequate in most cases.

   Participants can be given a "period" and this is optional. For regional sharing the most important thing is really just to see who has been involved with the patient, rather than to construct a forensic timeline of involvements. However this information might be useful in the case of a long Encounter with many brief involvements, and so may be provided if desired.

7. **Location** - the location provides essential information about where the encounter took place. The intent is to provide information down to the “ward” level. It is useful to understand the history of where the patient has been seen, so the status and period MUST be populated, and a history provided. (As noted above, a change of location does not in itself constitute a new Encounter, simply append to this list).


### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known. These largely relate to providing additional "clinical" detail about the Encounter - including links to related FHIR Resources such as the originating Appointment, the Condition, etc. These build up the rich dataset around an Encounter and are important to provide, but may not yet be available for an initial Encounter implementation.

1. **Identifier** - a Local Id should be provided, such that could be quoted if manually getting in touch to find out more
2. **Priority**: This provides useful information about whether it was emergency, routine, elective, etc
3. **Appointment**: Link to the originating Appointment, if relevant
4. **Incoming Referral**: Link to the originating Referral, if relevant
5. **Reason**: A long list of SNOMED codes to describe different types of problems which may have led to the Encounter. (TODO - confirm if this is a good list? the right level of detail? covering relevant care settings? Also may not be needed if extensive information already in the Appointment or Referral?)
6. **Diagnosis**: Link to a Condition diagnosed as a result of the Encounter. Can obviously be provided only if the Condition FHIR Resource is also being offered. If populated then it is required to rank the Conditions, and to assign one the "role" of "Chief Complaint"
7. **Hospitalization**: As discussed above, this must be provided either here (self contained) or in a linked "VisitGrouping" Encounter. The Hospitalization structure contains multiple fields - see below for further detail.


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:
 - **Care Connect Extensions** - these cover Encounter Transport, Outcome of Attendance, and Emergency Care Discharge Status. May be useful if relevant and known
 - **Part of** - as described above this may optionally be used to point to an overarching "VisitGrouping" Encounter. No other complex structures or nesting are permitted.


### **Discouraged or Removed fields**
 - **Class History** - as described in the introduction, a change of care setting would constitute a new Encounter. Therefore by definition an Encounter will only ever have a single Class.
  - **Length** - the period is already provided, so this appears to be duplication. In other countries then the exact length might be important for billing purposes, but this is not relevant here.
  - **Account** - for billing purposes, not relevant.   
  - **Service Provider** - duplicates information already available in the provenance tags



### **Hospitalization Structure**
Within the Encounter sits the "Hospitalization" structure. This must be provided either here (self-contained), or in an overarching "Visit Grouping" Encounter. This structure provides information about the admission and discharge. Therefore it is particularly important for a regional shared record - as this defines the touchpoints with other care providers.

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

    *Note that Origin and Destination are likely to be external locations - please refer to guidance on the Location profile about use of References. For example the use of a Contained Resource may be appropriate.*


 - **Optional**
   - **Readmission** - flag may be provided if known and relevant

 - **Discouraged**
   - **Diet Preferences, Special Courtesy, Special Arrangement** - additional details that are relevant internally for planning the patient's stay, but not so relevant for external sharing.