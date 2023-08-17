      Status: Active: Approved (STU)

## **Introduction**
This profile sets minimum expectations for the Condition resource.


### **Mandatory fields**
The following mandatory fields are defined in order to properly describe a Condition:
1. **Clinical Status** - Essential to explain the status of the condition – eg is it currently active.

   This implies a need to keep this status up-to-date – and ideally this will be done, but in reality might not always be possible. For example in the case of historical records where the patient has moved on. 
At a minimum however this status must be valid as-at the “assertedDate”. This allows a viewer to make an informed judgement about the likelihood that it is still relevant now.

2. **Code** - Essential to describe what the condition actually is. Based on SNOMED codes eg "Sprain of shoulder". We pre-adopt the UK Core code list, which extends the default FHIR list with additional codes covering Social Care and Urgent Care

3. **Subject** - every Condition must be linked to a Patient (not a Group)

4. **Asserted Date** - vital information about when the condition was noted. Provides essential guidance for a viewer about the recency and thus likely relevance / accuracy of historical records



### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known:

1. **Identifier** - a Local Id should be provided, such that could be quoted if manually getting in touch to find out more

2. **Body Site** - snomed coding for the affected body part. Important to provide if possible and relevant

3. **Context** - a link to the  Encounter when the condition was first asserted. Will not be relevant to all Conditions (eg historical lists), but should be populated if applicable. Should link to the lowest level possible in any hierarchy, thus providing maximum detail about where the condition was noted. 

   *Note: Do not link to an Episode of Care, as this is deprecated in FHIR R4*

4. **Category** - There are a few codes here to classify a Condition eg “Encounter Diagnosis” or “Problem List Item”. (The original FHIR spec only has these two, but Care Connect adds a few more which perhaps makes it a bit more useful).


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:

 - **Stage** - Additional information that may be useful for relevant conditions eg cancer

- **Evidence** - To some extent duplicates the “code”, but may optionally provide further information about what led to this code being assigned

 - **Note** - Only to be used with caution. Any notes may be shared widely across the region, including being viewed by the patient themselves

-  **Asserter** - Required to populate if known. The main purpose would be to provide details of a Practitioner who can give more information about the condition. Therefore it should not be populated with details of purely admin staff who may have keyed in the data. If the asserter is not populated then an unknown Practitioner should be assumed.

   *A further consideration is the possibility of a Condition being asserted by a non-care-professional, for example the Patient themselves or a relative. FHIR caters for this possibiity by allowing the asserter to be a Patient or RelatedPerson, and this option is left open here.*

- **Onset and Abatement** - these are important to provide if at all possible. 
    - Onset might be omitted if genuinely not known (eg a long-standing historical condition), but should normally be populated
   - Abatement is obviously only relevant if the condition has actually abated – in which case useful and important to populate
   - Note that in both cases there are a variety of options for how to express this (eg datetime, age, period, etc). These do seem relevant for accurately conveying what is known - with the implication that Data Consumers will need corresponding flexibility in displaying this information.

   *Note: Do not use abatementBoolean, as this is deprecated in FHIR R4*



### **Discouraged or Removed fields**

 - **Episodicity (Care Connect Extension)** - Discouraged.

 - **Verification Status** - This appears to be a significant modifier of the Condition, however it has been removed by Care Connect. Note that an implication of this decision by Care Connect is that this becomes a set of Conditions which DO apply to the subject. Ie there is no mechanism to capture a "refuted" Condition.
