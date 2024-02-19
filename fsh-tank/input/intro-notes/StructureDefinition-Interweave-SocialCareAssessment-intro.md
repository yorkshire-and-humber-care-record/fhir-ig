      Status: Active: Approved (STU)

**Definition:** A record of an assessment to determine a person’s support needs. An assessment record may be in progress, has already taken place, or is planned to be performed in the future.

## **Introduction**

This profile sets minimum expectations for the Social Care Asessment resource which is modelled using the FHIR Task resource. The FHIR Task resource was chosen to model the Assessment as it was the most akin in terms of logic and structure. Many of the irrelevant health fields have been stripped from this resource to create a clear and concise model for population. We will simply refer to this resource as an Assessment throughout the remainder of the notes section. 

We are primarily interested in recording that an assessment is being / has been performed and the high-level outcomes of that assessment – we are not attempting to capture the detailed content of the assessment at this stage. In particular we are not attempting to capture detailed coded information about the findings and plans – although this could be added via other FHIR Resources in future.

### **Coverage and references**

- A Data Provider MUST offer FHIR resources to represent its own Assessments. 

- When referencing an Assessment from another resource, the provider must populate the reference.display with the value held in the Assessment code.display.

### **Mandatory fields**
The following fields are mandatory:

- **status** A mandatory flag to indicate whether the assessment is active or not. We limit the valueset to accepted; in-progress; completed; entered-in-error.

- **intent** Although this field is not relevant to Social Care, it is mandatory within FHIR, therefore we default its value to 'plan'.

- **code** code is used to house the 'category' of assessment. This should always be known, and vital for meaningful display purposes.Currently social care providers have vast lists of assessment types, so here we aim to categorise the type and then use code.text for displaying the more granular local assessment type. code.text must always be populated, if there is no divergence between the local assessment name and the code.display, simply repeat the code.display here. 

- **for** A reference to the person (Patient FHIR resource) which is the subject of the assessment.

- **authoredOn** The date that the assessment was first entered into the source system.

- **lastModified** The date that the assessment record was last updated.

- **owner** The Organisational Team which has overall responsibility for the assessment.

### **Must Support fields** 
In addition, the following fields are "Must Support" - i.e. they must be populated if relevant and known:

- **basedOn** This is a reference to either the Social Care Assessment (FHIR Task) or Contact (FHIR ReferralReference) which triggered this Assessment to be carried out.

- **execution.period.start** The date/time that the assessment commenced (Or is due to commence should the assessment be in a planned status).

- **execution.period.end** The date/time that the assessment completed.

- **outcome** This is an extension required by social care to specify the outcome of the assessment. The list of available codes has been derived from the "Event Outcome" field of the ["V5 Adult Social Care - Client Level Data"](https://digital.nhs.uk/about-nhs-digital/corporate-information-and-documents/directions-and-data-provision-notices/secretary-of-state-directions/collection-of-client-level-adult-social-care-data-no-2) specification and has been made extensible as it is foreseen that this list will grow.

- **performer** Option to provide the practitioner which either performed, is going to perform or is performing the assessment. 


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Optional fields to note include:

- **identifier:localIdentifier** - As with most other resources, there is the option to include a local identifier which may help to identify the record at a local level.

- **description** Option to provide an additional description of the assessment, over and above the name.

- **context** Optional link back to an encounter resource – a use case has been identified to link Hospital Discharge assessment back to the hospitals encounter.

- **output** We give the option here to attach a local document which contains further detail of the asssessment carried out such as detailed coding information, findings and plans.  Please ensure that any documents attached are relevant for regional sharing.

### **Discouraged or Removed fields**

- **groupIdentifier** and **partOf** - It is not the intention to create a complex grouping or hierarchy of assessments, a simple flat structure is informative and preferred. Therefore, both these fields have been removed.

The following fields have also been removed as they do not capture data relevant to a Social Care Assessment:

- **incrementNumber**  - A non-relevant Care Connect extension
- **failSafeRuleVersions**  - A non-relevant Care Connect extension
- **definition** 
- **statusReason** 
- **businessStatus**
- **priority**
- **focus**
- **requester**
- **performerType**
- **reason**
- **note**
- **relevantHistory**
- **restriction**
- **input**

