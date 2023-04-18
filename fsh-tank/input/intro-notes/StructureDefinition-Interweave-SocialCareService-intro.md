      Status: Active: Approved (STU)
      
**Definition:** A collection of activities which deliver support to a person funded by a Local Authority.

## **Introduction**

This profile sets minimum expectations for the Social Care Service resource which is modelled using the FHIR Episode of Care resource. The FHIR Episode of Care resource was chosen to model a Service as it was the most akin in terms of logic and structure. Many of the irrelevant health fields have been stripped from this resource to create a clear and concise model for population. We will simply refer to this resource as a Service throughout the remainder of the notes section. 

### **Coverage and references**

 - A Data Provider MUST offer FHIR resources that represent the Services provided to its service users. These may be either in-house services and/or services commissioned from external 3rd parties
 
 - When referencing a Service from another resource, the provider must populate the reference.display with the value held in the Service type.display.

### **Mandatory fields**
The following fields are mandatory:

- **status** It is envisaged that only the following values will be used to describe the status of a Social Care service and therefore we restrict the valueset to these values: active; planned; onhold; finished; entered-in-error

- **type** is used to house the 'type' of service. This should always be known, and vital for meaningful display purposes. We have defined a list of codes derived from the Service Component field of the [Social Care Client Level Data V5 Specification](https://digital.nhs.uk/about-nhs-digital/corporate-information-and-documents/directions-and-data-provision-notices/data-provision-notices-dpns/client-level-adult-social-care-data). This list has been made extensible as it is foreseen that the list will grow. In addition to providing the 'display' field, the **type.text** must also be populated with the local description of the type of service being provided.

- **category** An extension has been created which allows for a high-level grouping of service types. This should always be known, and vital for meaningful display purposes. We have defined a list of codes derived from the Service Type field of the Social Care Client Level Data V5 Specification. This list has been made extensible as it is foreseen that this list will grow.

- **patient** The person who is in receipt of the service. NB: The term Patient and Person can be used interchangeably throughout the FHIR specification.

- **managingOrganization** The organisation which is providing the service. This can be a reference to either and external provider or an organisational team.

### **Must Support fields**
In addition, the following fields are "Must Support" - i.e. they must be populated if relevant and known:

- **statusHistory** When the service has been through several status changes, it is important to populate this field to share this information.

- **period** The duration of the service as a whole, including the time when the service may have been in the planning and onhold statuses. Status history can be used to determine the amount of time that the service was in a particular status.

### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Optional fields to note include:

- **identifier:localIdentifier** - As with most other resources, there is the option to include a local identifier which may help to identify the record at a local level.

- **referralRequest** - An optional link to a Social Care Contact which is modelled using a referralRequest FHIR resource.

- **careManager** This field can be used to provide a link to the practitioner delivering the service. Many social care organisations are unable to currently provide this information, however, it is envisaged that this will be something which is available in the future and will be useful if known. It is likely that this field's conformance will be increased to Must Support.

- **triggeringAssessment** An extension has been created which will allow an optional link to the assessment which triggered the service to be created. We make this optional, as not all services are triggered by an assessment.


 
### **Discouraged or Removed fields**

- **team** This field is marked as DISCOURAGED. We have yet to define the careTeam resource which will represent all the individual workers, who may not work within the same Organisational Team or even Organisation, which are assigned to a person  to aid in their support. 

The following fields have been removed as they are not relevant to social care:


- **diagnosis** 
- **account** 



  






