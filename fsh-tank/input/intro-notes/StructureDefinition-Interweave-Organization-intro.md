      Status: Active: Approved (STU)


## Introduction
This profile sets minimum expectations for the Organization resource.


### **Organisation coverage and references**
 - A Data Provider MUST offer Organisation FHIR resources to represent its own organisation(s)
 - When referencing an organisation then the "reference" (url of FHIR Resource) and "display" (name) MUST be populated
   - For an external organisation then the url could be either to an ad-hoc Contained Resource, or to the regional master organisation record
   - The "identifier" in the reference MAY be populated with the organisation's ODS Code
  

### **Mandatory fields**
The following fields are mandatory:
1. **Name** - The name of the organisation


### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known:
1. **Identifier: ODS Organisation code** - Must be populated where available. Almost all organisations in both Health and Social Care do have an ODS Code which both identifies the organisation and allows other details to be looked up from the master ODS records. However it is recognised that there may be some circumstances with new or smaller providers where it cannot be mandated.
2. **Type** - The type of organisation, as classified by ODS
3. **Active** - Essential if not active. Good practice to always populate anyway.
4. **Address** - The organisation's address. (Noting that the definitive address can always be looked up given the ODS code)


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:
  - **Other Identifiers** - 
    - **ODS Site Code** - Care Connect makes provision for an ODS Site code which may optionally be populated if relevant.  
    - **Local Id** - As with most other resources, there is the option to include a local identifier. The wide use of ODS codes to uniquely identify an organisation makes it less important to also include a local id. However in cases where an ODS code does not exist then a local id MUST be provided instead to help identify the organisation.
  - **Telecom** - Can be populated if known - although the Location and Practitioner resources are likely to provide more specific and useful contact details


### **Discouraged or Removed fields**
 - **Extensions** - Discouraged. Two extensions are defined by Care Connect, but do not appear to be vital for our usage here.
 - **Part Of** - Discouraged. We are expecting a simple, flat structure based on ODS codes. (Any modelling of ODS hierarchy could be done separately and does not need to be built into the resources).
 - **Contact** - Discouraged. These administrative contact details would need to be kept up-to-date, and do not appear particularly relevant to maintain or exchange.
 - **Endpoint** - Removed. Technical endpoints are captured elsewhere (ie via the Participant Registry)

