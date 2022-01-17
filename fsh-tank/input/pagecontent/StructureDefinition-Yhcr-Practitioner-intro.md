## Introduction
This profile sets minimum expectations for the Practitioner resource.


### **Practitioner coverage and references**
- A Data Provider MUST offer Practitioner FHIR resources to represent its own practitioners
   - When populating references to its own Practitioners then the "display" (name) and "reference" (url of local FHIR Resource) must be populated. In addition the SDS User Id must be populated in the "identifier" if the Pracitioner has one
 - If referencing an external practitioner then a Data Provider may:
   1. Populate the reference "display" value with the external practitioner's name, and the "identifier" with their SDS User Id - thus allowing further regional master details to be searched for by Data Consumers if so desired. The "reference" url can then be omitted.
   2. Populate the reference "display" value with the external practitioner's name, and the "reference" url with a pointer to a Contained Resource. Thus including additional ad-hoc information  about the practitioner. The "identifier" should also be populated with the SDS User Id if the Practitioner has one
   3. As per (2), but populating the "reference" url with a pointer to a locally hosted Practitioner FHIR Resource. This may be relevant for external pracitioners who are frequently referenced and for whom the Data Provider therefore does maintain their own local reference data about this external practitioner.
 


### **Mandatory fields**
1. **Name** - This is essential to indicate who the practitioner is. Only a single name is supported by Care Connect, and for this profile then at a minimum the Family Name is mandatory. (Note that in addition, Given Name, Prefix, and Suffix are considered "Must Support") 


### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known:
1. **Active** - Essential if not active. Good practice to always populate anyway.
2. **Identifier**: SDS User Id - Must be populated if the practitioner has an SDS User Id, to formally identify them


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:
1. **Local Id** - In some cases there may be a local business identifier. Optional, to include if relevant.
2. **Telecom** - It is very useful to provide a contact phone number and/or email if at all possible – to enable further enquiries about any information seen. However caution is needed, as these contact details may be widely seen throughout the region. Only work details suitable for receiving external enquires should be included. Specifically home phone numbers should not be shared.
3. **Gender** - May be provided if known, but is not essential
4. **Communication preferences** - A Care Connect extension containing several fields for details about preferred languages and other modes of communication. Optional, as in general it is assumed that the employing organisation will make any necessary provisions and so largely not relevant for regional sharing. (Note that CareConnect have defined an extension to be used in preference to the standard FHIR field)
5. **Qualifications** - May be useful if known, but not essential for regional sharing. (Envisaged that it will often not be easy to include)


### **Discouraged or Removed fields**
1. **Address** - Addresses should be provided instead on the relevant organisation / location records. For the purposes of regional sharing then practitioner home addresses must NOT be shared.
2. **Birth Date** - For the purposes of regional sharing then the birth date could be considered as unnecessary personal information and is not required
3. **Photo** - At the present time then photos are not required. Excluded to avoid any complexities with sharing large image files



### **Further notes on Practitioner vs PractitionerRole**
"PractitionerRole" describes the practitioner in the context of an actual role they are fulfilling, and so is in many ways a more useful concept than the basic "Practitioner" FHIR Resource. It provides extra information about the nature of the role, explicitly captures contact details relevant to that role (as opposed to personal / home details), and caters for individuals who do more than one role.

HOWEVER the PractitionerRole resource is little used in FHIR STU3. This has been addressed in FHIR R4, which allows use of a PractitionerRole throughout as an alternative to Practitioner. However for now, in STU3, use of the Practitioner resource is the main requirement - and really the only option.
