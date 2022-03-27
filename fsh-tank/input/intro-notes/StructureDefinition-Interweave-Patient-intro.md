      Status: Draft - For Review


## **Introduction**

***NB: Whilst the term "Patient" is used by FHIR, the profile is equally relevant to a "citizen", "service user" or "client" in other contexts such as Social Care.***

This profile sets minimum expectations for the Patient resource to record basic demographics and other administrative information about an individual patient. 

The important underlying principle is that this information identifies a patient for **regional sharing**. It is therefore not the aim to necessarily to record every patient **immediately** they present to a service, but only to populate with those who have been confidently identified and with a quality of demographic information suitable for wider sharing.


### **Patient coverage and references**

 - A Data Provider MUST offer Patient FHIR resources to represent its own patients (those that are relevant for regional sharing). 
 - This includes registering these patients with PIX, such that they become available for regional sharing.
 - When referencing a Patient then the "reference" (url of FHIR Resource) and "display" (name) MUST be populated
   - The "identifier" in the reference MAY be populated with the patient's NHS Number


### **Mandatory fields**
Bearing in mind the above principle, the following fields are mandatory:
1. NHS Number (fully traced and verified)
2. Name ("usual" name, including given and family names, and matching PDS)
3. Date of Birth (matching PDS)

### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known:
1. Prefix and suffix for the "usual" name
2. Gender
3. Active status (essential if not active. Good practice to always populate anyway)
4. Telecom (eg phone and/or email details)
5. Address (eg a current home address)
6. Contacts (eg next of kin and/or emergency contact)
7. Communication preferences - only required if a language other than English is preferred. (Note that CareConnect have defined an extension to be used in preference to the standard FHIR field)

### **Analytical fields**
The patient resource has a number of fields which are difficult to provide definitive guidance on. In the profile they are marked as "optional" as they are not necessarily essential for the provision of direct care. Their significant in terms of both data capture and display is however likely to be scenario dependant. In some scenarios they may be extremely relevant (eg Religious Affiliation at End of Life), whereas in other scenarios they may be seen as unnecessary or even intrusive information.

These fields however assume a greater importance when considering analytics - and in particular for Public Health and Equality Monitoring. Considering, for example, the requirement for monitoring of Protect Characteristics and for reducing health inequalities based on Core20Plus5. Therefore although marked as "optional" every effort should be made to populate wherever possible and appropriate:

1. Ethnicity 
2. Religious Affiliation (Care Connect Extension)
3. Sexual Orientation (Interweave Extension, based on NHS Data Dictionary)
4. Residential Status


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Optional fields to note include:

 - Name and Address history - these can be provided if known, optionally with periods, and importantly with a "use" that distinguishes them from the current values.

### **Discouraged or Removed fields**
Several fields are marked as "discouraged" to indicate that they are preferably not used by new implementations. These include:
 - various administrative fields and extensions - that are either not relevant to current use-cases, or are better covered by National Systems, or have been deprecated in future versions of CareConnect.

  - the "text" summary of names and addresses. This formatting and presentation can be problematic, and the preference is to allow Data Consumers to generate their own presentation from the underlying detailed fields. 

  - Photo - not relevant here, and adds size and complexity to the content
  
  Other standard FHIR fields that have been entirely removed by CareConnect are:
   - Animal - not relevant here, and also deprecated in FHIR R4



### **Notes on "active" and "deceased" flags**
There are several flags regarding the overall status of a patient, with further guidance on their use as follows:

 - **Active** - this is a "technical" flag, for example used to indicate if a record was entered in error, or has been merged. It has no bearing on the actual physical state of the patient

  - **Death Notification Status** - this CareConnect extension will not be used. There is a formal process for death notification which is already in place outside of this Care Record. That existing process should be used and not replicated here.

   - **Deceased** - this flag must NOT be populated by local Data Providers. It will however be populated in the regional Master Patient Index. This MPI is based on PDS and will reflect the deceased status of the patient, as formally recorded by PDS. 


### **Notes on additional patient-based datasets**
The [PRSB](https://prsb2.vercel.app/page/core-information-standard) defines quite a number of additional datasets which provide additional rich information about the patient. For example "About Me", "Individual Requirements", etc. Guidance is however that in FHIR these are generally not incorporated into the basic Patient resource, are but instead represented as separate QuestionnaireResponse resources. Additional profiles of the QuestionnaireResponse to model these datasets are therefore anticipated. 

