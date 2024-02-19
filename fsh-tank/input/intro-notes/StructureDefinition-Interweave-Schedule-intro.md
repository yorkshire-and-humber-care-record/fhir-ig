      Status: Draft: For Review (STU)

## **Introduction**
This profile sets minimum expectations for the Schedule resource.

A schedule controls the dates and times available for the performance of a service and/or the use of a resource. One schedule applies to one service or resource, since each service or resource can be reserved independently of the others.
If two or more services, people, locations, or things cannot be reserved independently of one another, they are considered to be one activity or resource.

A schedule consists of slots of time during which the controlled service or resource is potentially available for provision or use. Slots are categorized as open, booked, or blocked. An open slot on a schedule indicates that the service or resource is available for provision or use during that period of time. A booked slot indicates that the service or resource is not available during the time period, because an appointment has been scheduled. A blocked slot indicates that a service or resource is unavailable for reasons other than a scheduled appointment.

### **Mandatory fields**
The following mandatory fields are defined:

1. **Active** - Essential if not active. Good practice to always populate anyway.

2. **Service Type** - The type of appointments that can be booked into this slot (ideally this would be an identifiable service - which is at a location, rather than the location itself). We pre-adopt the UKCore value set (based on SNOMED refset 1127531000000102: Services Simple Reference Set) - for consistency with the Encounter, and because it is more relevant than the default FHIR example and also covers social care.

3. **Actor** - The schedule belongs to a single instance of a service or resource. This is normally a HealthcareService, Practitioner, Location or Device. In the case where a single resource can provide different services, potentially at different location, then the schedulable resource is considered the composite of the actors.
For example, if a practitioner can provide services at multiple locations, they might have one schedule per location, where each schedule includes both the practitioner and location actors.

4. **planningHorizon** - Period of time covered by schedule. The start date/time is always mandatory, but as per the FHIR specification, the end date/time may be omitted

### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known. 

1. **Specialty** - further information which may be useful about the type of specialty required. Knowing the Service Type is probably sufficient for a shared care record, with the Specialty being more relevant to resourcing the correct staff member in a scheduling system. However obviously useful additional information if available. We replace the default FHIR valueset with the list of SDS Job Roles - which appears to be more complete and relevant to the UK, and which offers better coverage of Social Care.


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:

- **Service Category** - A general description under broad categorisation of the types of services that is to be performed during this appointment.

 - **Comment** - Comments on the slot to describe any extended information. Such as custom constraints on the slot.