      Status: Active: Approved (STU)

**Definition** A notification to social services that a person may need their support – a contact can be made by the person themselves, a relative, health professional or any concerned member of the public.

## **Introduction**

This profile sets minimum expectations for the Social Care Contact resource which is modelled using the FHIR ReferralRequest resource. The FHIR ReferralRequest resource was chosen to model a Contact as it was the most akin in terms of logic and structure. Many of the irrelevant health fields have been stripped from this resource to create a clear and concise model for population. We will simply refer to this resource as a Contact throughout the remainder of the notes section. 

### **Coverage and references**

- A Data Provider MUST offer FHIR resources to represent its own Contacts. 

- When referencing a Contact from another resource, the provider must populate the reference.display with the value held in 'reasonCode.display' field of the Contact.


### **Mandatory fields**
The following fields are mandatory:

- **status** Used to indicate the status of the contact. Here we use the mandated FHIR code system request-status but limit it to the following values, a description of their use is placed in brackets:

active (The Contact becomes active as soon as it is created)
completed (The Contact has been actioned/acted upon)
cancelled (The Contact was rejected e.g. The contact was made with the wrong organisation)
entered-in-error (The Contact was recorded in error)

It is envisaged that most contacts will not use the 'active' status as most contacts are recorded and acted upon straight away. 

- **intent** Although this field is not relevant to Social Care, it is mandatory within FHIR, therefore we default its value to 'plan'.

- **subject.patient** The person who is the subject of the contact.

- **occurrence** The date that the contact was made with the organisation.

- **authoredOn** The date that the contact was recorded on the administration system.

- **requesterType** This is an Interweave extension created to record the type of person making the contact E.g. relative, person themselves, health professional etc. We have created an extensible Valueset to use here. Please get in touch if there are any requirements for further values to be added. 

- **reasonCode** The reason why the person first made the contact. e.g. Concern for welfare

### **Must Support fields**
In addition, the following fields are "Must Support" - i.e. they must be populated if relevant and known:

- **type** The type of contact being made e.g. Referral to Social Care

- **description** Narrative around the reason for contact. Please ensure any detail included is appropriate for regional sharing.

### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Optional fields to note include:

- **identifier:localIdentifier** - As with most other resources, there is the option to include a local identifier which may help to identify the record at a local level.

- **Extension-CareConnect-ReferralRequestMethod-1** The form in which the contact is made e.g. Phone, Letter, Self Referral etc

- **Extension-CareConnect-SourceOfReferral-1** The source of the referral request.

- **priority** Can be used to record the priority for the contact to be acted upon.

- **serviceRequested** Can be used to record which service was requested.

- **context** Optional link to an encounter resource. A use case has been identified where it would be useful to link the contact back to a Hospital Encounter record for when a discharge assessment is requested.

- **requester** Optionally provide the Organization, Organisational Team or Practitioner making the contact. The data provider will need to consider the usefulness of sharing this information and any condider and confidentiality implications.
 
### **Discouraged or Removed fields**
The following fields have also been removed as they do not capture data relevant to a Social Care Contact.    

- **definition**
- **basedOn**
- **replaces**
- **groupIdentfier**
- **specialty**
- **receipient**
- **reasonReference** - Removed to not over complicate the resource, the reasonCode field provides enough information.
- **supportingInfo**
- **note**
- **relevantHistory**