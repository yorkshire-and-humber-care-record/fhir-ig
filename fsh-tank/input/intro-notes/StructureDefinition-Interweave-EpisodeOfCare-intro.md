     Status: Active: Approved (STU)


## **Introduction**

An association between a patient and an organization / healthcare provider(s) during which time encounters may occur. The managing organization assumes a level of responsibility for the patient during this time.

## **Multiple Organizations and Transfer of Care**
Many organizations can be involved in an EpisodeOfCare; however each organization will have its own EpisodeOfCare resource instance that tracks its responsibility with the patient.

When an Organization completes their involvement with the patient and transfers care to another Organization. This is often in the form of a referral to another Organization (or Organizations).
When an incoming referral is received a new EpisodeOfCare may be created for this organization.

## EpisodeOfCare vs. Encounter
The primary difference between the EpisodeOfCare and the Encounter is that the Encounter records the details of an activity directly relating to the patient, while the EpisodeOfCare is the container that can link a series of Encounters together for problems/issues.

### **Mandatory fields**
The following fields are mandatory:

- **patient** - The patient who is the focus of this episode of care.

- **status** - this is mandatory in FHIR, with a short list of codes provided. 

### **Must Support fields**
In addition, the following fields are "Must Support" - i.e. they must be populated if relevant and known:

- **Identifier** - a Local Id should be provided, such that could be quoted if manually getting in touch to find out more

- **statusHistory** - The history of statuses that the EpisodeOfCare has been through (without requiring processing the history of the resource).

- **Diagnosis** - Link to a Condition diagnosed as a result of the episodeOfCare. Can obviously be provided only if the Condition FHIR Resource is also being offered. 

- **ReferralRequest** - A link to a ReferralRequest which initiated this Episode of Care resource. 

- **careManager** - This field can be used to provide a link to the practitioner delivering the service. 

- **team** - Other practitioners facilitating this episode of care

### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Optional fields to note include:

- **Type** - categorises the type of place where the episodeOfcare took place. 
Care providers do not operate in isolation. Primary, secondary, tertiary and community care are intended to act as a single, integrated care system. Patients are passed from one provider to another as appropriate, for example when a GP refers a patient to a specialist in secondary care.

The diagram below summarises the above each with a specific purpose or specialism.


<img src=".\episodeOfCareType.png" alt="Episode of Care type categorisation" style="clear:both; float:none">

- **managingOrganization** - The organization that has assumed the specific responsibilities for the specified duration.

- **Period** When the episodeOfCare occurred is vital to know. The start date/time is always mandatory, but as per the FHIR specification, the end date/time may be omitted if the episodeOfCare is ongoing

### **Discouraged or Removed fields**

- **Account** - Removed. for billing purposes, not relevant.
     
