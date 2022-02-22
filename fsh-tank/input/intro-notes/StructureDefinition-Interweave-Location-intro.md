      Status: Draft - For Review


## Introduction
This profile sets minimum expectations for the Location resource, to record information on locations where care is provided.



### **Location coverage and references**

 - A Data Provider MUST offer Location FHIR resources to represent its own locations
 - When referencing a Location then "reference" (url to a FHIR Resource) and "display" (name), MUST be populated
 - For an external location then the url could point to an ad-hoc Contained Resource
 - In addition the "identifier" MAY also be populated. This is not as straightforward as for Organisations (where the ODS Code is widely accepted). However for some locations an ODS Site Code may be relevant, or otherwise it may still be useful to provide a local identifier.

### **Location structure and hierarchy**
The goal for regional sharing of locations is not necessarily to build a detailed model of the real-world, but rather to provide a simple representation which is easy for Data Consumers to interpret and display. The purpose is to understand where a patient has been, give some insight into the type of services typically provided at that location, and provide contact details if further follow up is desired.

**Therefore a simple 3-level model of site -> ward -> room is proposed as adequate for most purposes**

 - All Data Providers must populate reference data for their own site(s) and wards
  - The phase "ward" is interpreted broadly as a "section of a facility". For example it could also be used to represent a department in a Social Care setting.
 - Room-level detail may optionally be added if relevant (unlikely to be necessary for historical understanding, but may be relevant to inform attendance at future appointments)
 - Additional detail such as "bed" level of location detail is optional, may be onerous to keep up-to-date, and is not necessary for currently known regional sharing use-cases

A particular issue is making it easy and efficient for Data Consumers to understand the hierarchy.
 - The location "name" is used in references, and this needs to be usable standalone - without the need for Data Consumers to make multiple additional queries to follow a tree, just to meaningfully display where the patient is. 

 - In practice this means:

   **The location name must incorporate the hierarchy. For example "York Hospital: Ward 27: Room 4"**

 - *(In contrast just naming the location "Room 4" is meaningless to a consumer without further queries to follow the references, trace the tree, and assemble these details for themselves every time)*



### **Mandatory fields**
Bearing in mind the multiple scenarios above, a small subset of fields can be specified as mandatory:
1. **Name** - The name of the location. Noting that, as noted above,this must reflect any hierarchy for more informative display eg "York Hospital: Ward 27"
2. **Status** - Should normally be “active”, and only active locations should be used in new references. However it may be necessary to retain locations at other statuses (eg inactive) if they have already been used in references
3. **Type** - Must be populated to describe the type of services typically provided at this location. Please select a value that is as specific as possible to provide maximum information. See also further notes below.
4. **Physical Type** - Standard FHIR code list. As noted in the introduction, any location structures should be kept simple with focus on site/ward/room, plus of course non-institutional locations such as "house" or "vehicle" 


### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known:
1. **Identifier**: ODS Site code - Must be populated if the location has an ODS site code, to formally identify the site
2. **Telecom** - Eg phone and/or email details. Useful for getting in contact for further information
3. **Address** - Must be provided if relevant (eg for Site and House). Not relevant for a Ward or Room. Just the current address for contact purposes, no history
4. **Managing Organisation** - Must be provided for institutional locations ie Site / Ward / Room. Note: this will often be the same as the provenance of the message, but not necessarily if external locations are being referenced
5. **Part Of** - To describe the hierarchy. Required to link ward -> site and room -> ward


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:
 - **Mode** - this must always be "instance", and is preferably explicitly populated. "Instance" may be assumed if missing.
 - **Local Id** - In some cases there may be a local business identifier, over-and-above the name. Optional, but useful to include if relevant - to assist with more definitively identifying the location.
 - **Alias and Description** - May be useful to provide additional information. Description might include information to assist vistors in finding the location - eg if being used for appointments.
 - **Position** - Currently there is no requirement to track exact geographical coordinates

### **Discouraged or Removed fields**
 - **Operational Status** - Discouraged. As noted in the FHIR spec this is only relevant for beds / rooms, to indicate if they are undergoing housekeeping etc – relevant for a local care system, but not for tracking in a regional care record.
  - **Endpoint** - Removed. Technical endpoints are captured elsewhere (ie via the Participant Registry)



### **Further notes on Location "Type"**
We always want to know what type of services are typically provided at the location - as this is useful (primarily for direct care) to help understand why the patient may have been going there. The standard code list has some very generic entries eg "Hospital", "Community Location", "Community Service Centre", "Patient's Residence". These should cover most eventualities at a high level, plus there are some useful more specific entries focused on healthcare.

 - *Please select the most specific code possible, to provide maximum context about the location to Data Consumers*

 - *The list is perhaps not ideal, and there might be better alternatives for the UK - for example based on the NHS Data Dictionary or PRSB standards. However the binding is specified as "extensible" by FHIR which means it is simply not possible to replace it with an alternative. We therefore invite proposed additions to this code list, to be curated regionally if you have additional suggestions*

 - *Alternatively please select the most relevant generic option and provide further detail in the "text" field. This will still be useful for other care professionals to read in a direct care scenario*
