      Status: Active: Approved (STU)

## **Introduction**
This profile sets out the expectations for the interweave blood pressure observation resource. The base for this profile is the [CareConnect-BloodPressure-Observation-1](https://simplifier.net/HL7FHIRCareConnectBaselineforSTU3/CareConnect-BloodPressure-Observation-1) and we have made little adjustment to this base profile. We have enforced the use of SNOMED codes where possible.

### **Mandatory fields**
The following mandatory fields are defined:

1. **status** –  Fixed value of ‘final’.

2. **category** – Fixed value of ‘vital-signs’.

3. **code** – Fixed value of  SCT:75367002 (Blood Pressure).

4. **subject** – Reference to the patient who is the subject of this measurement. 

5. **effective** – An important field to provide details of the time/time period during which the observation was taken.

### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known. 

1. **component** – The component field contains two slices, one which represents the systolic measurement and the other the diastolic. Both components must be populated, unless the dataAbsentReason is populated. Both slices have fixed SNOMED values for the code field, and the result must be populated into the valueQuantity field.

2. **dataAbsentReason** – The reason why the result is missing, this is valuable if a value has not been obtained for some reason e.g. a patient refused. This field can only be provided when there is no value present.

3. **identifier** – A Local Id should be provided, such that could be quoted if manually getting in touch to find out more.

4. **performer** – We limit this field to reference practitioner resources only. The organization responsible for the observation can be obtained via the provenance tag.

5. **interpretation** – This is also known as the ‘abnormal flag’ and is regularly recorded alongside the actual result. It is used to signal the meaning of the result. 

6. **referenceRange** – To aid the interpretation of a result, it is important to include the reference range.

7. **comment** – Comments in addition to the result are often recorded for observations, it is therefore important to provide this field when available to give the consumer the full result information.

### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:

 - **reasonCondition (care connect extension)** – An optional care connect extension that allows the reason for an observation being performed/recorded to be specified. This can be a reference to a condition resource or a coded entity.
 
 - **bodySite** – A long list of SNOMED codes which represent the observed parts of the body.
 
 - **context** – Optional link to an encounter resource.
 
 - **method** – Option to provide the mechanism used to perform the observation
 
 - **specimen** – Opportunity to provide a link to a specimen resource from which the observation was obtained.
 
 - **device** – Opportunity to provide a link to a device resource from which was used to obtain the observation.
 
 - **related** – To reduce complexity, we limit the related field’s usage to only allow links to observation resources, from which the primary observation’s value was derived. E.g. An observation may have a value which is a score, and that score may have been derived from several other observations.

### **Discouraged or Removed fields**

 - **basedOn** – This field is discouraged as it does not appear to provide information which would be beneficial in a shared care record. It also allows references to a raft of request/order resources which introduces a lot of complexity for a data consumer.
 
 - **issued** –  This field has been removed as this information can be taken from the mandatory meta.lastUpdated field, and to also avoid any confusion with the other date fields.