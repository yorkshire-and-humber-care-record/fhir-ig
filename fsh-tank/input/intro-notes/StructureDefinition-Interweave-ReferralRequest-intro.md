     Status: Active: Approved (STU)


## **Introduction**

This profile sets out the expectations for the interweave referral request resource.

### **Mandatory fields**
The following fields are mandatory:

- **status** – This is a mandatory field which describes the status of the referral. It has a required binding to [STU3 valueset-request-status](http://hl7.org/fhir/stu3/valueset-request-status.html)  however we remove the values ‘draft’, ‘suspended’ and ‘unknown’ from this list as referrals with these statuses are not appropriate to share.

- **intent** – This is a mandatory field in FHIR, however, it does not add much value in the shared care record context. As we have to provide a value from the required binding [STU3 valueset-request-intent](http://hl7.org/fhir/stu3/valueset-request-intent.html) we default its value to ‘order’.

- **type** – A comprehensive list of snomed codes [Valueset-referral-type - FHIR v3.0.2 (hl7.org)](http://hl7.org/fhir/stu3/valueset-referral-type.html) is provided as an example binding on this field by care connect. We enforce this binding further to ‘preferred’. 

- **subject** – every referral request must be linked to a patient resource which is the subject of the referral

- **authoredOn** – This is the date when the referral became active. 

- **recipient** – the organisation or practitioner who is the receiver of the referral.


### **Must Support fields**
In addition, the following fields are "Must Support" - i.e. they must be populated if relevant and known:

- **referralRequestMethod** – This is a care connect extension which was introduced to capture the method used to communicate the referral such as e-referral, secure email etc. 

- **sourceOfReferral** – Another useful care connect extension which is used to specify the source of the referral e.g SCT 309013001 |Referred by person OR
SCT 306098008 |Self-referral.

- **Identifier** – A Local Id should be provided, such that could be quoted if manually getting in touch to find out more.

- **priority** – this is a mandatory field with a required binding inherited from the care connect specification and as such we are unable to add or amend the codes held in the valueset. We intend to build up a library of the codes usage within this guide as data provision of this resource matures.

- **serviceRequested** – We keep this field inline with the encounter resource and pre-adopt the UKCore value set (based on SNOMED refset 1127531000000102: Services Simple Reference Set), which is more relevant than the default FHIR example and also covers social care.

- **context** – If known, a reference to the encounter which initiated the referral request should be populated here. This field is renamed to ‘encounter’ in R4.

- **requester** – This field currently has two sub fields ‘agent’ and ‘onBehalfOf’. IN R4 this is consolidated into one field which replicates the agent field, we therefore remove ‘onBehalfOf’ and ask for ‘agent’ to be populated. We have also restricted the resources which can be referenced here to ‘Organisation’, ‘Patient’ and ‘Practitioner’.

- **reasonCode** - A long list of SNOMED codes to describe different reasons which may have led to the Referral. We pre-adopt the value set used in R4. This builds on the existing STU3 list covering SNOMED codes for “Clinical Finding” and “Procedure”, and adds codes for “Context-dependent categories” (Social Care) and “Events” (A&E).


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Optional fields to note include:

- **basedOn** – Gives the option of providing a link to another procedure or referral request.
- **specialty** – The clinical specialty (discipline) that the referral is requested for. We pre-adopt the UKCore value set (ukcore-practicesettingcode), which is based on the values in the NHS Data Dictionary MAIN SPECIALTY CODE. 
- **locationReference** – This field is pre-adopted from R4 and supports the supply of the patient preference as to where they are seen. 
- **reasonReference** – optionally provide a link to a condition and/or an observation resource(s) which add further context as to why the referral has been requested.
- **notes** – Optionally provide additional information about the referral. Please be cautious when populating this field and ensure notes which are provided are relevant to the shared care record.


### **Discouraged or Removed fields**     
- **definition** – Removed. 
- **replaces** – Removed. 
- **groupIdentifier** – Removed to avoid any complexity for the data consumer.
- **description** – This field is REMOVED in R4 and here we do the same.
- **supportingInfo** – We DISCOURAGE this field do to the complexities placed on the consumer. If this field is used, then we only allow reference to the Questionnaire resource.
- **relevantHistory** – Removed to avoid any complexity for the data consumer. 
- **occurrence[x]** – Removed, detail here is more relevant to the scheduling of the services requested in the referral and not currently deemed relevant to the shared care record.
