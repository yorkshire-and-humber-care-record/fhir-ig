      Status: DRAFT: Work in Progress

**Definition:** A record of an assessment to determine a person’s support needs. An assessment record may be in progress, has already taken place, or is planned to be performed in the future.

## **Introduction**

This profile sets minimum expectations for the Social Care Asessment resource which is modelled using the FHIR Task resource. The FHIR Task resource was chosen to model the Assessment as it was the most akin in terms of logic and structure. Many of the irrelevant health fields have been stripped from this resource to create a clear and concise model for population. We will simply refer to this resource as an Assessment throughout the remainder of the notes section. 

### **Coverage and references**

- A Data Provider MUST offer FHIR resources to represent its own Assessments. 

- When referencing an Assessment from another resource, the provider must populate the reference.display with the value held in the Assessment code.display.

### **Mandatory fields**
The following fields are mandatory:

- **status** A mandatory flag to indicate whether the support reason is active or not. We limit the valueset to accepted; in-progress; completed; entered-in-error.

- **intent** Although this field is not relevant to Social Care, it is mandatory within FHIR, therefore we default its value to 'plan'.

- **code** code is used to house the 'category' of assessment. This should always be known, and vital for meaningful display purposes.Currently social care providers have vast lists of assessment types, so here we aim to categorise the type and then use code.text for displaying the more granular local assessment type. 

- **for** A reference to the person (Patient FHIR resource) which is the subject of the assessment.

- **authoredOn** The date that the assessment was entered into the source system.

- **owner** The Organisational Team which has overall responsibility for the assessment.

### **Must Support fields** 
In addition, the following fields are "Must Support" - i.e. they must be populated if relevant and known:

- **basedOn** This is a reference to either the Social Care Assessment (FHIR Task) or Contact (FHIR ReferralReference) which triggered this Assessment to be carried out.

- **execution.period.start** The date/time that the assessment commenced (Or is due to commence should the assessment be in a planned status).

- **execution.period.end** The date/time that the assessment completed.

- **outcome** This is an extension required by social care to specify the outcome of the assessment. The list of available codes has been derived from the "Event Outcome" field of the "V5 Adult Social Care - Client Level Data" specification and has been made extensible as it is foreseen that this list will grow.


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Optional fields to note include:

- **identifier:localIdentifier** - As with most other resources, there is the option to include a local identifier which may help to identify the record at a local level.

- **description** Option to provide an additional description of the assessment, over and above the name.

- **context** Optional link back to an encounter resource – a use case has been identified to link Hospital Discharge assessment back to the hospitals encounter.

- **lastModified** Optionally provide the date that the assessment record was last updated.

- **output** Option to attach a local document which has further details on the assessment carried out.
 
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

