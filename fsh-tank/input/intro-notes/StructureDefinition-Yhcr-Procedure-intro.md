      Status: Draft - Work In Progress

## **Introduction**
This profile sets minimum expectations for the Procedure resource.

As described further in the FHIR documentation, a Procedure should be used to describe something that is actually done to a Patient. There are other FHIR Resources which are more appropriate for observations, assessments, opinions etc.

It is also noted that a pragmatic approach is needed to specifying mandatory fields for this resource. The reality is that it may often be populated from a “clinical coding” system - that does not necessarily have access to the full contextual richness that might ideally be hoped for.



### **Mandatory fields**
The following mandatory fields are defined in order to properly describe a Procedure:

1. **Status** - This is most likely to be “completed” to provide a historical list of procedures performed. However other codes about future or aborted procedures MAY be used where relevant – as long as they are kept up-to-date.
   - “unknown” should be avoided if at all possible

2. **Category** - A simple and short list of SNOMED codes to describe the overall category of procedure eg “Surgical Procedure”, “Diagnostic Procedure”

3. **Code** - Essential to describe what the procedure actually is. Based on SNOMED codes eg "Excision of lesion of artery"

4. **Subject** - every Procedure must be linked to a Patient (not a Group)

5. **Performed** - when the Procedure was performed. This is made somewhat more complicated by FHIR offering the choice between a DateTime or a Period, but one or the other must be populated.



### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known:

1. **Identifier** - a Local Id should be provided, such that could be quoted if manually getting in touch to find out more

2. **Context** - A reference to the Encounter where the procedure was performed. This is likely to be very useful and should be provided if at all possible. (Noting however the introductory comments that this may be impossible if the linkage is lost within a clinical coding system). Should link to the lowest level possible in any hierarchy, thus providing maximum detail about where the condition was noted

3. **Outcome** - A short and simple list of “successful”, “unsuccessful”, “partially successful”. Must be populated when relevant and known. (Accepting that for some types of procedure then this may be impossible if there is no simple definition of “success”)

4. **Follow Up** - This is very useful to populate in a regional care record as, for example, it allows community teams to see that follow up care is needed

5. **Focal Device** - This is useful to provide if relevant (ie if a device has been fitted or changed). May inform community teams with follow up care.



### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. For a Procedure there are many of these optional fields. This reflects the view expressed in the introduction that there is considerable richness which could be added, but which it is not necessarily realistic to insist on. Points of note include:

 - **Definition** - A detailed definition of the procedure – eg protocol.

  - **Based On** - Useful to describe the Care Plan, Referral or ProcedureRequest that led to this Procedure

  - **Part Of** - Could be useful to describe if the procedure is part of a wider overall procedure, or involved in an observation or medication administration

  - **Not Done / Not Done Reason** - Somewhat overlaps with status codes such as "suspended" or "aborted", but provides the possibility of adding additional coding to explain why

  - **Performer** - Useful to provide if known, although it may be more relevant in some scenarios than others. For example some procedures are quite transactional and the person in overall charge of the care may be more useful as a contact.
      - Note: The “OnBehalfOf” reference is not essential – as this will also be covered by the Provenance tags

  - **Location** - Generally speaking the exact location where the procedure was performed seems unlikely to be vital for a regional care record. The organisation involved (from the Provenance tags) is often likely to be sufficient, and further details can also be provided by the Context linking to an Encounter.

  - **Reason Code and Reason Reference** - Could be useful to provide a code and/or a link to a Condition or Observation to explain the reason for the Procedure

  - **Body Site** - Useful to populate if known, and if not already obvious from the "code"

  - **Report** - Could be useful if relevant to provide additional background information

  - **Complication and Complication Detail** - can be populated with a code and/or Condition reference for any complications if relevant and known

 - **Note** - Only to be used with caution. Any notes may be shared widely across the region, including being viewed by the patient themselves


### **Discouraged or Removed fields**
 - **Anaesthetic Issues (Care Connect Extension** - May be risky if not consistently used. Consider using AllergyIntolerance or AdverseEvent instead.

 - **Used Code and Used Reference** - Relevant to stock control within an organisation, but less so for a regional record



### **Summary Text**

    PerformedDateTime + Code description 
  
    Example: 
    "09/01/2022 09:00 - Excision of lesion of artery"