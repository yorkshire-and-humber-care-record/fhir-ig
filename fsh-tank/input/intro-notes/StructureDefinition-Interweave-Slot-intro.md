      Status: Draft: For Review (STU)

## **Introduction**
This profile sets minimum expectations for the Slot resource. A slot of time on a schedule that may be available for booking appointments.

Slot resources are used to provide time-slots that can be booked using an appointment. They do not provide any information about appointments that are available, just the time, and optionally what the time can be used for. These are effectively spaces of free/busy time.

Slots can also be marked as busy without having appointments associated.

A slot can have more than one appointment allocated to it. A scheduling system may permit multiple allocations up to a specific number of places. An example of this type of usage could be where the slot is being used for a group service that permits 5 participants at the same time.

If a service had a weekly schedule created that permitted eight 1 hour appointments each day of a working week (Monday - Friday), this would be constructed by a single Schedule resource with the dates for the start and end of the week set, and then 40 (5x8) Slot resources associated with it.

As appointments fill up the schedule, these slots would individually be marked as busy as the appointments are filled into the slots.

The slots in a schedule do not need to be the same size, and can be different for different days of the week.

### **Mandatory fields**
The following mandatory fields are defined:

1. **Service Type** - The type of appointments that can be booked into this slot (ideally this would be an identifiable service - which is at a location, rather than the location itself). We pre-adopt the UKCore value set (based on SNOMED refset 1127531000000102: Services Simple Reference Set) - for consistency with the Encounter, and because it is more relevant than the default FHIR example and also covers social care.

2. **Status** - this is already mandatory in FHIR. Slots are categorized as free or busy. A free slot on a schedule indicates that the service or resource is available for provision or use during that period of time. A busy slot indicates that the service or resource is not available during the time period, because an appointment has been scheduled. A busy-unavailable slot indicates that a service or resource is unavailable for reasons other than a scheduled appointment.

3. **Schedule** - Schedule resources provide a container for time-slots that can be booked using an appointment. It provides the window of time (period) that slots are defined for and what type of appointments can be booked.

4. **Start** - Date/Time that the slot is to begin.

5. **End** - Date/Time that the slot is to conclude.


### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known. 

1. **Delivery Channel (Care Connect Extension)** - simple and useful field to indicate whether in-person, telephone, or video.

2. **Appointment Type** - The style of appointment or patient that may be booked in the slot. In some situations a service may have a specific set of slots reserved for specific uses, such as "walk-ins" or a specific organization has a "standing booking" for Thursday mornings. These should be represented using the appointmentType field with a specified and agreed value.
A simple list of codes eg "routine", "emergency" etc. We add a value for "urgent" to cover scheduled but urgent appointments.

3. **Overbooked** - A slot can be marked as over-booked indicating that there are too many appointments allocated to it. Default value of 'false' is assumed.

4. **Specialty** - further information which may be useful about the type of specialty required. Knowing the Service Type is probably sufficient for a shared care record, with the Specialty being more relevant to resourcing the correct staff member in a scheduling system. However obviously useful additional information if available. We replace the default FHIR valueset with the list of SDS Job Roles - which appears to be more complete and relevant to the UK, and which offers better coverage of Social Care.


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:

 - **Service Category** - A general description under broad categorisation of the types of services that is to be performed during this appointment.

  - **Comment** - Comments on the slot to describe any extended information. Such as custom constraints on the slot.