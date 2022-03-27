      Status: Draft - For Review

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

2. **Service Type** - to describe the type of appointment and/or clinic. We pre-adopt the UKCore value set (based on SNOMED refset 1127531000000102: Services Simple Reference Set) - for consistency with the Encounter, and because it is more relevant than the default FHIR example and also covers social care

3. **Participant: Subject** - rather unusually, the FHIR Appointment does not actually have a "subject" field, but instead a multi-purpose "participant" field. It is therefore mandatory to have exactly one "participant" of type "subject" to identify the Patient involved.


### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known. 

1. **Identifier** - a Local Id should be provided, such that could be quoted if manually getting in touch to find out more

2. **Start and End** - to define the timing of the appointment. (Note that FHIR requires these fields to be populated for appointments that are not at status "proposed" or "cancelled")

3. **Minutes Duration** - overlaps to some extent with "start" and "end" but useful to indicate at-a-glance how long the appointment is. May also be useful to indicate the anticipated duration within a longer overall timeslot.

4. **Appointment Type** - a simple list of codes eg "routine", "emergency" etc. We add a value for "urgent" to cover scheduled but urgent appointments.

5. **Description** - any other title or text to further describe the appointment

6. **Participant: Primary Performer** - a reference to the main practitioner involved, once they have been allocated.

7. **Participant: Location** - again, rather unusually, the location is considered as another "participant" in the FHIR Appointment. A reference to the location is therefore required, once this has been allocated. 
    - Note that a location that is as granular as possible should be provided, although what this means may vary by Data Provider. Some may be able to allocate locations down to the "room" level - with this obviously being essential if the aim is to guide the patient directly to the right place. Others may allocate only at a "ward" or even "site" level - with the patient having to ask for further directions on arrival.


8. **Reason**: A long list of SNOMED codes to describe different reasons which have led to the Appointment. 

   We pre-adopt the value set used in R4. This builds on the existing STU3 list covering SNOMED codes for "Clinical Finding" and "Procedure", and adds codes for "Context-dependent categories" (Social Care) and "Events" (A&E) 

9. **Delivery Channel (Care Connect Extension)** - simple and useful field to indicate whether in-person, telephone, or video

10. **Appointment Cancellation Reason (Extension, from R4)** - obviously only relevant if the appointment is cancelled, but then useful to populate. (CareConnect offers a free-text extension - however we replace this by pre-adopting the field from R4 which offers a better coded list).


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:

 - **Specialty** - further information which may be useful about the type of specialty required. Knowing the Service Type is probably sufficient for a shared care record, with the Specialty being more relevant to resourcing the correct staff member in a scheduling system. However obviously useful additional information if available. We replace the default FHIR valueset with the list of SDS Job Roles - which appears to be more complete and relevant to the UK, and which offers better coverage of Social Care.

 - **Indication** - opportunity to provide additional "clinical" background to the appointment. Noting that this includes references to other FHIR resources (Condition, Procedure) which can obviously only be populated once actually implemented.

 - **Patient Instruction (Extension)** - this is a useful field added in FHIR R4, and pre-adopted by us here as an extension. It provides a more specific alternative to the "comment" field for any notes specifically intended for the patient. It might be used, for example, by an appointment reminders app to provide instructions such as “Please arrive at least 10 minutes beforehand, and go to the room at the end of the corridor”
   
 - **Additional Participants** - other participant type codes in the list may optionally be used to reference other FHIR Resource types ie RelatedPerson, Device, Healthcare Service. However it must not be assumed that a data consumer will have the ability to display anything more than the provided “display” text associated with a reference to these resources.

 - **Incoming Referral**: Link to the originating Referral, if relevant and implemented. This could be very useful information. However FHIR makes significant changes from the STU3 "ReferralRequest" to the R4 "ServiceRequest", and so we are reluctant to mandate implementation at this stage


### **Discouraged or Removed fields**

 - **Comment** - to be used only with great care. It must be assumed that this comment will be widely viewed across the region, including by the patient themselves. For many uses see instead "Patient Instruction" above.

 - **Service Category** - unfortunately Care Connect has made a choice of mandating a code list based on SDS Job Roles. In our opinion this is not the intended use of this field, and so negates its use. (Encouragingly, drafts of the future UKCore specification revert to the standard FHIR list of simple appointment category codes - so this situation may change in future)

 - **Booking Organisation (Care Connect Extension)** - Proposed that this can instead be covered by other fields. For the organisation making the booking then see “incomingReferral”. For the organisation taking the booking then see provenance tags in the "meta" section

  - **Supporting Information** - A pointer to potentially any other FHIR Resource. Should not be used as potentially difficult for a Data Consumer to know how to handle.
.
  - **Priority, Slot, and Requested Period** - more relevant for local use in a scheduling system, rather than a regional shared record.

