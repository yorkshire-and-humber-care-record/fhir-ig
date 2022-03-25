      Status: Draft - For Review


## Introduction
This profile sets minimum expectations for the Practitioner resource.


### **Practitioner coverage and references**

 - A Data Provider MUST offer Practitioner FHIR resources to represent its own practitioners
 - When referencing a Practitioner then "reference" (url to a FHIR Resource) and "display" (name), MUST be populated
   - For an external practitioner then the url could point to an ad-hoc Contained Resource
   - In addition the "identifier" in the reference MAY also be populated. This is not as straightforward as for Organisations (where the ODS Code is widely accepted), but most practitioners will have a professional id which could be populated to more definitively identify them.


### **Mandatory fields**
1. **Name** - This is essential to indicate who the practitioner is. Only a single name is supported by Care Connect, and for this profile then at a minimum the Family Name is mandatory. (Note that in addition, Given Name, Prefix, and Suffix are considered "Must Support") 

2. **Identifier**: Must be populated to formally identify the practitioner. Care Connect highlights the SDS User Id and SDS Role Profile identifiers, however this does not provide complete coverage. Additional professional codes which may be used include:

    - https://fhir.hl7.org.uk/id/gmp-number (General Medical Practitioner)
    - https://fhir.hl7.org.uk/id/gmc-number (General Medical Council / Consultant Code)
    - https://fhir.hl7.org.uk/id/nmc-number (Nursing and Midwifery Council)
    - https://fhir.hl7.org.uk/id/gphc-number (General Pharmaceautical Council Code)
    - https://fhir.hl7.org.uk/id/hcpc-number (Health and Care Professional Council Code)


    Or as a last resort if no other professional identifier:
    - https://fhir.yhcr.nhs.uk/Id/local-practitioner-identifier (Local identifier)

### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known:
1. **Active** - Essential if not active. Good practice to always populate anyway.

3. **Qualifications** - These are useful if known, to provide information above-and-beyond just the identity of the practitioner - ie also about their professional status and qualifications. See further discussion below.


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:
1. **Local Id** - In some cases there may be a local business identifier. Optional, to include if relevant.
2. **Telecom** - It is very useful to provide a contact phone number and/or email if at all possible – to enable further enquiries about any information seen. However caution is needed, as these contact details may be widely seen throughout the region. Only work details suitable for receiving external enquires should be included. Specifically home phone numbers should not be shared.
3. **Gender** - May be provided if known, but is not essential
4. **Communication preferences** - A Care Connect extension containing several fields for details about preferred languages and other modes of communication. Optional, as in general it is assumed that the employing organisation will make any necessary provisions and so largely not relevant for regional sharing. (Note that CareConnect have defined an extension to be used in preference to the standard FHIR field)


### **Discouraged or Removed fields**
1. **Address** - Addresses should be provided instead on the relevant organisation / location records. For the purposes of regional sharing then practitioner home addresses must NOT be shared.
2. **Birth Date** - For the purposes of regional sharing then the birth date could be considered as unnecessary personal information and is not required
3. **Photo** - At the present time then photos are not required. Excluded to avoid any complexities with sharing large image files




### **Further notes on Practitioner vs PractitionerRole, and Qualifications**
"PractitionerRole" describes the practitioner in the context of an actual role they are fulfilling, and so is in many ways a more useful concept than the basic "Practitioner" FHIR Resource. It provides extra information about the nature of the role, explicitly captures contact details relevant to that role (as opposed to personal / home details), and caters for individuals who do more than one role.

HOWEVER the PractitionerRole resource is little used in FHIR STU3. This has been addressed in FHIR R4, which allows use of a PractitionerRole throughout as an alternative to Practitioner. However for now, in STU3, use of the Practitioner resource is the main requirement - and really the only option.

The best substitute in the Practitioner resource appears to be the "qualifications" section - with the opportunity here to provide information about the practitioner's professional status and qualifications. Thus at least indicating the kind of role they are likely to perform. This must therefore be populated if possible (accepting that for some Data Provider systems this may not be known).
