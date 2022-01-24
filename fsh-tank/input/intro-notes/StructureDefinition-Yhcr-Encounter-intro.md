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



### **Encounters vs Appointments**
Whilst the terms "Encounter" and "Appointment" might be used interchangably in everyday speach, in FHIR they have specific meanings. In summary:
 - An Appointment describes a plan for the future
 - An Encounter describes something that is happening now, or has occured in the past

 In general therefore:
  - An Appointment will lead to an Encounter - when the patient attends
   - An Encounter may or may not come from an Appointment (ie scheduled vs unscheduled care)

The picture is further complicated as FHIR does allow an Encounter to be created with status "planned", however this is NOT recommended and should normally be represented instead with an Appointment.

Further useful guidance can be found on the FHIR website, here:


<https://www.hl7.org/fhir/STU3/encounter.html#bnr>

<https://www.hl7.org/fhir/STU3/appointment.html#statuses>

<https://www.hl7.org/fhir/STU3/appointment.html#status-flow>



### **Mandatory fields**
A small subset of fields can be specified as mandatory:
1. **xxx** - xxx


### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known:
1. **xxx**: xxx


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:
 - **xxx** - xxx


### **Discouraged or Removed fields**
 - **Operational Status** - Discouraged. As noted in the FHIR spec this is only relevant for beds / rooms, to indicate if they   

