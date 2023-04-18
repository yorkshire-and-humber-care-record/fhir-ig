      Status: DRAFT: For Review.

## **Introduction**
This profile sets out the expectations for the interweave assessment score observation resource. Care connect do not have a profile for this observation, and therefore the base for this profile is the [Interweave-Observation](https://fhir.yhcr.nhs.uk/StructureDefinition/Interweave-Observation). We stipulate the use of SNOMED concept codes where possible, and the score should be provided within the value[x] field. 

### **Mandatory fields**
The following mandatory fields are defined:

1. **status** –  Fixed value of ‘final’.

2. **category** – Fixed value of ‘survey’.

3. **code** – This is the type of observation i.e. the name of the score. We state a preferred binding on this field of the SNOMED concept: 363788007 (observable entity), in recognition of the large amount of local code sets which are currently in use and the difficulties which data providers may have mapping their local codes to SNOMED. Should you wish to use a local code set to populate this field, as detailed in the conformance section of this implementation guide, you must contact us for explicit approval to do so..

4. **subject** – Reference to the patient who is the subject of this measurement. 

5. **effective** – An important field to provide details of the time/time period during which the observation was taken.

6. **value[x]** – The result presented as a score within the value[x] field.

### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known. 

1. **identifier** – A Local Id should be provided, such that could be quoted if manually getting in touch to find out more.

2. **performer** – We limit this field to reference practitioner resources only. The organization responsible for the observation can be obtained via the provenance tag.

3. **interpretation** – This is also known as the ‘abnormal flag’ and is regularly recorded alongside the actual result. It is used to signal the meaning of the result.

4. **referenceRange** – To aid the interpretation of a result, it is important to include the reference range.

5. **comment** – Comments in addition to the result are often recorded for observations, it is therefore important to provide this field when available to give the consumer the full result information.

6. **related** – It is often important for a clinician to see the observations from which a score has been derived. This field should be used to reference any such observations.

### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:

 - **reasonCondition (care connect extension)** – An optional care connect extension that allows the reason for an observation being performed/recorded to be specified. This can be a reference to a condition resource or a coded entity.
 
 - **context** – Optional link to an encounter resource.
 
 - **method** – Option to provide the mechanism used to perform the observation.
 
 - **device** – Opportunity to provide a link to a device resource from which was used to obtain the observation.

### **Discouraged or Removed fields**

 - **Component** – Removed to aid the data consumer, we ask that the result is provided in the valueQuantity field and not as a component.

 - **dataAbsentReason** – Removed as a score should always be available.

 - **bodySite** – Removed as not required for a score observation.

 - **specimen** – Removed as not required for a score observation.

 - **basedOn** – This field is discouraged as it does not appear to provide information which would be beneficial in a shared care record. It also allows references to a raft of request/order resources which introduces a lot of complexity for a data consumer.
 
 - **issued** –  This field has been removed as this information can be taken from the mandatory meta.lastUpdated field, and to also avoid any confusion with the other date fields.