      Status: DRAFT: Work in Progress

**Definition:** The occurrence of a physical item being requested to be placed or having been placed with a person to aid with support.

## **Introduction**

This profile sets minimum expectations for the Social Care Equipment Provision resource to record Information about an occurrence of a physical item being requested to be placed, or having been placed, with or on a person, to aid with support. Many of the irrelevant health fields have been stripped from this resource to create a clear and concise model for population. 

### **Coverage and references**

- A Data Provider MUST offer FHIR resources that represent its own Equipment Provision. 
- When referencing an Equipment Provision resource then the "reference" (URL of FHIR Resource) and "display" (The Equipment type) MUST be populated

### **Mandatory fields**
The following fields are mandatory:
- **status** the details of what the FHIR statuses represent in the context of social care are listed below;

   - draft – the equipment has been requested but is yet to be placed with the patient
   - active – the equipment has been placed with the patient. It is envisaged that this main remain as active in many cases e.g. where equipment is left with the person permanently
   - cancelled - The person refused the equipment offered.
   - completed - The equipment has been removed and returned to the owner/organisation 
   - entered-in-error - The request was placed in error.

- **intent** Although this field is not relevant to Social Care, it is mandatory within FHIR, therefore we default its value to 'order'.

- **code** The type of equipment – categorisation is not required. It is enough to state the exact piece of equipment here. To be taken from the following SNOMED concepts where possible (Preferred Binding) 

   - Support Equipment 272243001
   - Assistive Equipment 390296002
   - Equipment to Aid Mobility 183135000

If it is not possible to use the concepts above, please get in touch. We can either look at extending the valueset, or approve the use of local codes where appropriate. 

- **subject.patient** (The person to which the equipment is assigned.)

- **authoredOn** (The date that the request was created) This may be the same as the occurrence.period.start if the equipment is placed without prior notice/request.

### **Must Support fields**
In addition, the following fields are "Must Support" - i.e. they must be populated if relevant and known:

- **occurrence.period** period.start should be populated with the date when the person received the equipment. period.end should be populated with the date when the person returned the equipment. It is envisaged that the end date may never be populated in some cases, when a piece of equipment is placed with a person indefinitely. 

 - **note** - Most equipment will be where the patient lives or on the person, where this is not the case, the notes field can be used to detail exceptions to this rule e.g. aid placed at daughter's house. Although this field will not normally be relevant – if it *is* then it will be important to populate.


### **Optional fields**
These fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them:

- **identifier:localIdentifier** - As with most other resources, there is the option to include a local identifier which may help to identify the record at a local level.

- **requester.agent** -  Optionally provide an Organization or OrganizationalTeam which has requested the equipment to be placed with the person. e.g. The External Organization or an Internal Team who placed the request.

- **requester.onBehalfOf** -  Optionally provide an Organization which the agent is acting on behalf of.

- **performer** - Option to provide the Practitioner or Organizational Team or Organization, which fitted or placed the equipment with/on the person.

### **Discouraged or Removed fields**
The following fields are not relevant to social care and have been removed.
    
- **definition** 
- **basedOn**  
- **priorRequest** 
- **groupIdentfier**
- **priority** 
- **context** 
- **performerType**
- **reasonCode**
- **reasonReference**
- **supportingInformation**
- **relevantHistory**