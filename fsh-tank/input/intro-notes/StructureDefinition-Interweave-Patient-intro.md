      Status: Draft - For Review


## **Introduction**
This profile sets minimum expectations for the Patient resource to record basic demographics and other administrative information about an individual patient. 

The important underlying principle is that this information identifies a patient for **regional sharing**. It is therefore not the aim to necessarily to record every patient as soon as they are **treated**, but only to populate those who have been confidently identified and with a quality of demographic information suitable for wider sharing.

*NB: Whilst the term "Patient" is used by FHIR, the profile is equally relevant to a "citizen", "service user" or "client" in other contexts such as Social Care.*

### **Patient coverage and references**

 - A Data Provider MUST offer Patient FHIR resources to represent its own patients (those that are relevant for regional sharing). 
 - This includes registering these patients with PIX, such that they become available for regional sharing.
 - When referencing a Patient then the "reference" (url of FHIR Resource) and "display" (name) MUST be populated
 - The "identifier" MAY be populated with the patient's NHS Number


### **Mandatory fields**
Bearing in mind the above principle, the following fields are mandatory:
1. NHS Number (fully traced and verified)
2. Name ("usual" name, including given and family names, and matching PDS)
3. Date of Birth (matching PDS)
4. Gender

### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known:
1. Prefix and suffix for the "usual" name
2. Active status (essential if not active. Good practice to always populate anyway)
3. Telecom (eg phone and/or email details)
4. Address (eg a current home address)
5. Contacts (eg next of kin and/or emergency contact)
6. Ethnicity (potentially useful for equality monitoring, noting the option for "Not Stated")
7. Communication preferences - only required if a language other than English is preferred. (Note that CareConnect have defined an extension to be used in preference to the standard FHIR field)

### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:

 - Religious Affiliation (Care Connect Extension) - this is a difficult field to provide definitive guidance on. In general it is useful to populate if possible, and for some scenarios it may be extremely important (eg End of Life, and certain aspects of community and social care). In other scenarios however it may be considered unnecessary and intrusive information. Therefore optional, to allow appropriate discretion to be applied.

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

