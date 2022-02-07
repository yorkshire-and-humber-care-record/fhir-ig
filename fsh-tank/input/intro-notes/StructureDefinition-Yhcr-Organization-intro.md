      Status: Draft - For Review


## Introduction
This profile sets minimum expectations for the Organization resource.

Organisations are consistently identified across the region by their ODS code, and so this is the most important data item as it both identifies the organisation and allows other details to be looked up from the master ODS records.


### **Organisation coverage and references**
 - A Data Provider MUST offer Organisation FHIR resources to represent its own organisation(s)
   - When populating references to its own organisation(s) then all three of "display" (name), "identifier" (ODS Code) and "reference" (url of local FHIR Resource) must be populated

 - If referencing an external organisation then the widely accepted use of ODS codes is an important advantge. A Data Provider may therefore typically:
   - Populate the reference "display" value with the external organisation's name, and the "identifier" with the ODS code - thus allowing further regional master details to be searched for by Data Consumers if so desired. The "reference" url can then be omitted.


     *(It would also be possible to populate the "reference" with a link to either a Contained Resource, or to a locally hosted replica of an Organisation Resource for this external organisation. However the widespread use of ODS codes as an identifier which already allows full master details to be retrieved means that this seems unlikely to be necessary)*
   

### **Mandatory fields**
The following fields are mandatory:
1. **Identifier**: ODS Organisation code - The critical identifier which must always be populated
2. **Name** - The name of the organisation
3. **Address** - The organisation's address. (Noting that the definitive address can always be looked up given the ODS code)


### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known:
1. **Type** - The type of organisation, as classified by ODS
2. **Active** - Essential if not active. Good practice to always populate anyway.


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:
  - **Other Identifiers** - Care Connect makes provision for an ODS Site code which may optionally be populated if relevant
  - **Telecom** - Can be populated if known - although the Location and Practitioner resources are likely to provide more specific and useful contact details


### **Discouraged or Removed fields**
 - **Extensions** - Discouraged. Two extensions are defined by Care Connect, but do not appear to be vital for our usage here.
 - **Part Of** - Discouraged. We are expecting a simple, flat structure based on ODS codes. (Any modelling of ODS hierarchy could be done separately and does not need to be built into the resources).
 - **Contact** - Discouraged. These administrative contact details would need to be kept up-to-date, and do not appear particularly relevant to maintain or exchange.
 - **Endpoint** - Removed. Technical endpoints are captured elsewhere (ie via the Participant Registry)



### **Summary Text**

    Name
  
    Example: 
    "York and Scarborough Teaching Hospitals NHS Foundation Trus"
