## Introduction
This profile sets minimum expectations for the Location resource, to record information on locations where care is provided.


### **Location coverage and references**
The goal for regional sharing is not to build a detailed model of the real-world, but rather to provide a simple representation which is easy for Data Consumers to interpret and display. The purpose is to understand where a patient has been, give some insight into the type of services typically provided at that location, and provide contact details if further follow up is desired.

**Therefore a simple 3-level model of site -> ward -> room is proposed**

 - All Data Providers must populate reference data for their own site(s) and wards
 - Room-level detail may optionally be added if relevant (unlikely to be necessary for historical understanding, but may be relevant  to inform attendance at future appointments)
 - Additional detail such as "beds" is not necesssary or desired for regional sharing
 - The phase "ward" is interpreted broadly as a "section of a facility". For example it could also be used to represent a department in a Social Care setting.

When a Data Provider is populating References to its own locations then the "display" (name) and "reference" (url of local FHIR Resource) must be populated. (The "identifer" is optional and may also provide a local id if desired)

**There can also be a need to reference locations outside of the Data Provider's own facilities**

This could be for referals and discharges, and refer to other external locations. Consideration also needs to be given to care provided outside of institutions. Therefore variants of location for "house" and "vehicle" are offered.

If referencing an external location then a Data Provider may:
   1. (Typical) Populate the reference "display" value with the external location's name, and the "reference" url with a pointer to a Contained Resource. Thus including additional ad-hoc information  about the external location.
   2. As per (1), but populating the "reference" url with a 
   pointer to a locally hosted Organisation FHIR Resource. This may be relevant when refering to locations which are frequently referenced and for which the Data Provider therefore does maintain their own local reference data about this external location.


*NB: It is believed that this approach will cover all currently known use-cases, but providing a simple and meaningful shared model of locations is suprisingly complex. Please do get in touch if you have other use-cases which you feel require further development of this profile*


### **Mandatory fields**
Bearing in mind the multiple scenarios above, a small subset of fields can be specified as mandatory:
1. **Name** - The name of the location. Noting that it is useful to reflect any heirarchy for more informative display eg "York Hospital: Ward 27"
2. **Status** - Should normally be “active”, and only active locations should be used in new references. However it may be necessary to retain locations at other statuses (eg inactive) if they have already been used in references
3. **Type** - Must be populated to describe the type of services typically provided at this location. Please select a value that is as specific as possible to provide maximum information. See also further notes below.
4. **Physical Type** - A subset of the FHIR codes - covering either site / ward / room, or house / vehicle.


### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known:
1. **Identifier**: ODS Site code - Must be populated if the location has an ODS site code, to formally identify the site
2. **Telecom** - Eg phone and/or email details. Useful for getting in contact for further information
3. **Address** - Must be provided if relevant (eg for Site and House). Not relevant for a Ward or Room. Just the current address for contact purposes, no history
4. **Managing Organisation** - Must be provided for institutional locations ie Site / Ward / Room. Note: this will often be the same as the provenance of the message, but not necessarily if external locations are being referenced
5. **Part Of** - To describe the heirarchy. Required to link ward -> site and room -> ward


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

 - *We welcome proposed additions to this code list, to be curated regionally if you have additional suggestions*

 - *Alternatively please select the most relevant generic option and provide further detail in the "text" field. This will still be useful for other care professionals to read in a direct care scenario*
