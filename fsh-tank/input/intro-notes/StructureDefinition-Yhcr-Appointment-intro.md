      Status: Draft - Work In Progress

## **Introduction**
This profile sets minimum expectations for the Appointment resource.

Note that it is necessary to consider the different purposes for which appointment data may be shared in a regional care record – as this has a bearing on how the fields are populated:

 - **Historical** – this overlaps with the "Encounter" to a large extent, but may still be useful to build the picture of where someone has been, who they have seen and why. However the precise details of time and location are less likely to be important.

 - **Future** – this a key use, to see what is upcoming. For example to build a picture of ongoing care, as well as to see what other practitioners are involved, and also to coordinate care – for example to arrange other interventions at the same time / place.

 - **Patient** – there is a further use-case where appointments are viewed by the patient themselves – for example in an “app” which reminds them where and when to go. In this case the precise time and location are clearly vital.

 - **Scheduling** – appointment data may potentially be used for scheduling – for example to match required appointments with available time slots and practitioners with appropriate skills. It is assumed however that this will be a feature of local systems and NOT a primary use-case at present for regional sharing. 



### **Mandatory fields**
The following mandatory fields are defined:

1. **Status** - this is already mandatory in FHIR. Note that for future appointments it will be important to keep this status up-to-date.

2. **Service Type** - to describe the type of appointment and/or clinic.

3. **Participant: Subject** - rather unusually, the FHIR Appointment does not actually have a "subject" field, but instead a multi-purpose "participant" field. It is therefore mandatory to have exactly one "participant" of type "subject" to identify the Patient involved.


### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known. 

1. **Identifier** - a Local Id should be provided, such that could be quoted if manually getting in touch to find out more

2. **Start and End** - to define the timing of the appointment. (Note that FHIR requires these fields to be populated for appointments that are not at status "proposed" or "cancelled")

3. **Minutes Duration** - overlaps to some extent with "start" and "end" but useful to indicate at-a-glance how long the appointment is. May also be useful to indicate the anticipated duration within a longer overall timeslot.

4. **Appointment Type** - a simple list of codes eg "routine", "emergency" etc

5. **Description** - any other title or text to further describe the appointment

6. **Participant: Primary Performer** - a reference to the main practitioner involved, once they have been allocated.

7. **Participant: Location** - again, rather unusually, the location is considered as another "participant" in the FHIR Appointment. A reference to the location is therefore required, once this has been allocated. 
    - Note that a location that is as granular as possible should be provided, although what this means may vary by Data Provider. Some may be able to allocate locations down to the "room" level - with this obviously being essential if the aim is to guide the patient directly to the right place. Others may allocate only at a "ward" or even "site" level - with the patient having to ask for further directions on arrival.

    - *See also the Practitioner and Location resources for further advice on approaches to populating references*


8. **Reason, Indication, and Incoming Referral** - these all provide valuable additional "clinical" background to the appointment. Noting that they include references to other FHIR resources (Contition, Procedure, Referral) which can obviously only be populated once actually implemented.

9. **Delivery Channel (Care Connect Extension)** - simple and useful field to indicate whether in-person, telephone, or video

10. **Appointment Cancellation Reason (Care Connect Extension)** - obviously only relevant if the appointment is cancelled, but then useful to populate. (Noting that it is defined as free text, so of limited value for analytics).


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:
 - **Service Category, and Specialty** - further information which may be useful about the type of service and specialty involved

 - **Comment** - to be used only with great care. It must be assumed that this comment will be widely viewed across the region, including by the patient themselves. A use of this field might however be to provide further instructions for the patient in the example of an appointment reminders app eg “Please arrive at least 10 minutes beforehand, and go to the room at the end of the corridor”
   
   *(Note that FHIR R4 introduces an additional field "patientInstruction" for this purpose)*

 - **Additional Participants** - other participant type codes in the list may optionally be used to reference other FHIR Resource types ie RelatedPerson, Device, Healthcare Service. However it must not be assumed that a data consumer will necessarily have the ability to display anything more than the provided “display” text on the reference about these.


### **Discouraged or Removed fields**
 - **Booking Organisation (Care Connect Extension)** - Propose that this is instead covered by other fields. For the organisation making the booking then see “incomingReferral”. For the organisation taking the booking then see provenance tags

  - **Supporting Information** - A pointer to potentially any other FHIR Resource. Should not be used as potentially difficult for a Data Consumer to know how to handle.
.
  - **Priority, Slot, and Requested Period** - more relevant for local use in a scheduling system, rather than a regional shared record.


### **Summary Text**

    Start + Service Type + Location.display
  
    Example: 
    "09/01/2022-9:00 : Dermatology : York Hospital: Ward 27 - Dermatology clinic"