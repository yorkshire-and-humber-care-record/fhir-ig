      Status: DRAFT: Work in Progress

**Definition** Information about a person that has a relationship with a patient. The person may be involved in the care or support of a patient, but is not the target of the care/support.


## **Introduction**

***NB: Whilst the term "Patient" is used by FHIR, the profile is equally relevant to a "citizen", "service user" or "client" in other contexts such as Social Care.***

This profile sets minimum expectations for the RelatedPerson resource to record Information about a person who has a relationship with a patient. The related person is always defined from the position of the patient e.g. This related person is the patient's mother, spouse, brother etc. In Social Care, a related person may also play one or more roles in the service user's support.


### **Coverage and references**

 - A Data Provider MUST offer RelatedPerson FHIR resources to represent its own patients' relationships (those that are relevant for regional sharing). 

 - The related person resource does not negate the use of the patient.contact field. This should still be used to specify the person who should be contacted in an emergency, and the related person should be used to model all other relationships.

 - When referencing a RelatedPerson the "reference" (URL of FHIR Resource) and "display" (related person's name) MUST be populated.

### **Mandatory fields**
The following fields are mandatory:
- **name** - "usual" name, what they liked to be known as, including given and family names. Its only relevant to capture the person's current name, no history is required.

- **active** - A mandatory flag to indicate whether the relatedPerson record is active.

- **patient** - To whom this person has a relationship with.

- **relationship** - How this person is related to the patient e.g. mother, spouse, brother etc.

### **Must Support fields**
In addition, the following fields are "Must Support" - i.e. they must be populated if relevant and known:

- **telecom** - how the related person can be contacted e.g. phone and/or email details. It's only relevant to capture the person's current contact details, no telecom history is appropriate.

- **socialCareSupportRole** (Extension) - This extension has been developed for use by the Social Care sector, who have a requirement to model the role(s) which a related person plays in a service user's support. We have specified a preferred interweave valueset for populating this field, which was developed with the Social Care Data Standards working group. Please note, that if ‘Other’ is entered here, then it is essential to provide additional detail of the role within the text field.

Background to extension: Initially we looked at whether we should adopt the R4 relationship field, which allows for multiple relationships to be specified, to support this requirement. however, as this breaks compliance with STU3 and given role is a different concept, it was agreed that this should be represented by a separate field. 

- **period** - The period during which the relationship existed.

### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Optional fields to note include:

- **address** - Can be provided if known and relevant. Only the person's current address should be captured. 

- **gender and birthDate** - These can be provided if known, but it is felt that these do not add much value to the related person record.

- **identifier:localIdentifier** - An optional local identifier which may be helpful to identify the record at a local level.

### **Discouraged or Removed fields**

- **photo** - removed - not relevant here and adds size and complexity to the content






