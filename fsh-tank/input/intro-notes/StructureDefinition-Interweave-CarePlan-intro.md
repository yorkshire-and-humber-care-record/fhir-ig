      Status: Active: Approved (STU)

## **Introduction**
This profile sets minimum expectations for the CarePlan resource.


### **Mandatory fields**
The following mandatory fields are defined in order to properly describe a Condition:
1. **status** - Indicates whether the plan is currently being acted upon, represents future intentions or is now a historical record. Thus, allowing clinicians to determine whether the plan is actionable or not.

2. **intent** - Indicates the level of authority/intentionality associated with the care plan and where the care plan fits into the workflow chain. Proposals/recommendations, plans and orders all use the same structure and can exist in the same fulfillment chain.

3. **Subject** - every CarePlan must be linked to a Patient (not a Group).


### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known:

1. **Identifier** - a Local Id should be provided, such that could be quoted if manually getting in touch to find out more

2. **category** - Identifies what "kind" of plan this is to support differentiation between multiple co-existing plans; e.g. "Home health", "psychiatric", "asthma", "disease management", "wellness plan", etc. 
We have pre-adopted UK Core R4 list of SNOMED codes, as the snomed parent code used within CareConnect have been discontinued.

3. **Context** - a link to the  Encounter when the condition was first asserted. Will not be relevant to all Conditions (eg historical lists), but should be populated if applicable. Should link to the lowest level possible in any hierarchy, thus providing maximum detail about where the condition was noted. 

   *Note: Do not link to an Episode of Care, as this is deprecated in FHIR R4*


### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:

 - **basedOn** - A care plan that is fulfilled in whole or in part by this care plan. This allows tracing of the care plan and tracking whether proposals/recommendations were acted upon.

 - **replaces** - Completed or terminated care plan whose function is taken by/ supersedes this new care plan. This allows tracing of the care plan and tracking whether proposals/recommendations were acted upon.

 - **title** - Human-friendly name for the care plan.

 - **description** - A description of the scope and nature of the plan. It provides more detail than conveyed by category.

 - **addresses** - Identifies the conditions/problems/concerns/diagnoses/etc. whose management and/or mitigation are handled by this plan. It links plan to the conditions it manages. The element can identify risks addressed by the plan as well as active conditions. (The Condition resource can include things like "at risk for hypertension" or "fall risk".) Also scopes plans - multiple plans may exist addressing different concerns.

 - **activity** - Identifies a planned action to occur as part of the plan. For example, a medication to be used, lab tests to perform, self-monitoring, education, etc.


### **Discouraged or Removed fields**

 - **supportingInfo** - removed to avoid unnecessary hierarchy complexity.

 - **definition** - removed.

