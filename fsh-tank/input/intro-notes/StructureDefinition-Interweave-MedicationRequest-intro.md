     Status: Active: Approved (STU)


## **Introduction**

This profile sets out the expectations for the interweave medication request resource. We use this resource to represent prescriptions of medication and repeat prescription schedules. Only prescriptions which have been issued should be shared. Issued is the point at when the prescription is either printed and signed, or passed on to the Electronic Prescription Service (EPS). The exception to this rule is repeat prescriptions, which are not themselves issued, but are authorised for instances of them to be issued.

### **Mandatory fields**
The following fields are mandatory:

- **prescriptionType** – This field records the type of prescription rather than having to derive this information from other fields. We use the required binding supplied by care connect, further details on how the codes should be used are outlined in the table below:

<table class="grid">
     <tr>
          <th>Code</th>
          <th>Description</th>
     </tr>
     <tr>
          <td>acute</td>
          <td>A medication which the patient is only expected to consume for the duration of the current order and which is not expected to be renewed.</td>
     </tr>
     <tr>
          <td>repeat</td>
          <td>Details of medication which are expected to be issued on a regular basis to treat an ongoing medical condition.</td>
     </tr>
     <tr>
          <td>repeat dispensing</td>
          <td>A dispense of medication which is on a repeat prescription i.e. an instance of a repeat prescription.</td>
     </tr>
     <tr>
          <td>delayed prescribing</td>
          <td>The supply of a prescription to a patient in advance of the possible need for it to be dispensed and taken.</td>
     </tr>
</table>

- **status** - Repeat prescriptions can have the statuses listed below. For all other prescription types, this should be defaulted to “complete”.

     - active – the repeat prescription is active
     - stopped – the repeat has been stopped, discontinued or cancelled.
     - complete – the repeat has ran its course

- **intent** – Only prescriptions which have been issued/authorised should be shared. When prescriptionType == “repeat” then intent == “plan” otherwise set to “order”.
GPC use this field as part of a hierarchy implementation of prescriptions. It is felt that for the shared care record, having a linear list of prescriptions, and being able to identify which are ‘repeat prescriptions’ is enough and we do not want to create any complex linkages.

- **category** – We update the valueset used to populated this field, to include the additional code of “discharge”, which is present in R4. We also make this a required binding, as currently it is an example only.

- **medicationReference** - Care connect have removed medication.codeableConcept in favour of referencing a medication resource, meaning that we have to model the medication resource. the reference.display field should be populated with the name of the medication which will be a DM&D description.

- **subject** – A reference to the patient who the request is for. To aid the data consumer, the display element should contain the patient’s name.

- **authoredOn** – This is the date/time that the medication was authorised/prescribed.


### **Must Support fields**
In addition, the following fields are "Must Support" - i.e. they must be populated if relevant and known:

- **repeatInformation** – This is a useful extension created by care connect which allows repeat information to be captured. We further extend this field to also include the date when the last repeat was issued. These fields should be populated when the prescription type is “repeat”.
- **statusReason** – Another useful care connect extension which should be used to record the reason why and when a medication was stopped. This should be populated when the status == “stopped”. Currently care connect do not offer any valueset for populating this field, SNOMED have a concept, Drug therapy discontinued (274512008), which appears to be a good candidate to use here. We have set this as our “preferred” valueset – and will accept other code lists which have similar representations on a case by case basis.
- **identifier** – We keep this fields usage inline with GPC (GP Connect) specification as follows; If the EPS identifier is present, then the identifier.value is where the EPS Id SHOULD also be added. The codeSystem for this identifier is https://fhir.nhs.uk/Id/prescription-order-item-number and use should  be set to “official”. This field may also be used to provide other types of unique business identifiers.
- **context** - This field is renamed to Encounter in R4. Here we limit the field to only allow references to an encounter resource. For a repeat prescriptions, this is the encounter where the repeat was authorised. For all others this is the encounter where the specific issue was authorised.
- **requester** - R4 has this as one field, whereas STU3 has this split into requester.agent and requester.onBehalfOf. We remove the onBehalfOf field to aid and use the agent to provide reference to the Practitioner or Organization making the request.
- **reasonCode** – A preferred list of SNOMED codes are used to populate this field which represent Condition/Problem/Diagnosis.
- **note** - Use this field for instructions to a third party e.g. “GP to Continue” noted on a prescription given to an outpatient.
dispenseRequest – Hold useful information on quantity and expected supply duration.


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Optional fields to note include:

- **recorder** –  This field is used to capture the person who entered the order on behalf of another individual for example in the case of a verbal or a telephone order. In pharmacy systems, it is a legal requirement to capture this field, however we have left as optional, as no real-benefit was identified for use within the shared care record.

- **reasonReference** – Option to provide more detailed information via Observation and/or a condition resource which represent the reason for the medication request.

### **Discouraged or Removed fields**
     
- **definition** – This field has been removed in R4 and we have done the same in our specification to keep it inline.
- **basedOn** and **groupIdentifier** – Both removed to avoid unnecessary hierarchy complexity, a simple list of prescriptions in date order will suffice.
- **priority** – Removed, this field is more likely to be used in a prescribing system rather than the shared care record.
- **supportingInformation** – Removed. This field allows reference to any type of resource which is very open and may cause confusion to the consumer. GPC also do not use this field
- **substitution** – Removed. This field is more pertinent to a pharmacy system.
- **priorPrescription** – Removed to avoid any unnecessary complexity.
- **detectedIssue** – Removed. Not required for the shared care record.
- **eventHistory** – Removed. Not required for the shared care record.
