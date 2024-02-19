      Status: Draft: For Review (STU)

## **Introduction**
This profile sets minimum expectations for the QuestionnaireResponse resource.

A structured set of questions and their answers. The questions are ordered and grouped into coherent subsets, corresponding to the structure of the grouping of the questionnaire being responded to.

Each time a questionnaire is completed for a different subject or at a different time, a distinct QuestionnaireResponse is generated, though it may be possible for a previously entered set of answers to be edited or updated.

Questionnaire responses cover the need to communicate data originating from forms used in medical history examinations, research questionnaires and sometimes full clinical specialty records. In many systems this data is collected using user-defined screens and forms. Questionnaire responses record specifics about data capture - exactly what questions were asked, in what order, what answers were given, etc. Each of these questions is part of the Questionnaire, and as such the Questionnaire is a separately identifiable Resource, whereas the individual questions are not.

### **Mandatory fields**
The following mandatory fields are defined:

1. **status** - This is a mandatory field which describes the status of the Questionnaire Response. The information on Questionnaire resources may possibly be gathered during multiple sessions and altered after considered being finished.

 - Please note that following codes from the FHIR code system are deemed irrelevent for shared care record and are not supported.
 ***in-progress*** - This QuestionnaireResponse has been partially filled out with answers but changes or additions are still expected to be made to it.
 ***stopped*** - This QuestionnaireResponse has been partially filled out with answers but has been abandoned. It is unknown whether changes or additions are expected to be made to it.

2. **Subject** - The subject of the questionnaire response. Every Questionnaire Response must be linked to a patient.

3. **Authored** - The date and/or time that answers were gathered for this questionnaire response.

4. **Author** - The individual or device that received and interpreted the subject's answers to the questions in the questionnaire, and selected the appropriate options for answers.

QuestionnaireResponses can be authored by clinicians, patients, or patients' relatives . Clinicians may author questionnaire responses, where the answers are provided by others on behalf of the patient. Additionally, information gathered on behalf of a patient may be about the patient's relatives (e.g. in family anamnesis). Therefore, QuestionnaireResponse makes a distinction between the author, the subject and the source of information.

### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known. 

1. **Context** - The Encounter during which this questionnaire response was created or to which the creation of this record is tightly associated. This is likely to be very useful and should be provided if at all possible.

### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:

- **Based on** - Supports traceability of responsibility for the action and allows linkage of an action to the recommendations acted upon. The order, proposal or plan that is fulfilled in whole or in part by this QuestionnaireResponse. For example, a ServiceRequest seeking an intake assessment or a decision support recommendation to assess for post-partum depression.

- **Questionnaire** - A Questionnaire is an organized collection of questions intended to solicit information from patients, providers or other individuals involved in the healthcare domain. They may be simple flat lists of questions or can be hierarchically organized in groups and sub-groups, each containing questions. The Questionnaire defines the questions to be asked, how they are ordered and grouped, any intervening instructional text and what the constraints are on the allowed answers.

 If a QuestionnaireResponse references a Questionnaire, then the QuestionnaireResponse structure must be consistent with the Questionnaire (i.e. questions must be organized into the same groups, nested questions must still be nested, etc.). The order of questions within groups, groups within groups and groups within questions is relevant and must be retained for display and capture. The hierarchy items within the Questionnaire SHALL mirror the hierarchy of the corresponding Questionnaire (if any).

 - **Source** - The individual that answered the questions about a subject that is minor and/or is incapable of answering.

 - **item** - A group or question item from the original questionnaire for which answers are provided.

      - **item.linkId** - Mandatory if element 'item' is provided. The item from the Questionnaire that corresponds to this item in the QuestionnaireResponse resource.
      - **item.text** - Mandatory if element 'item' is provided. Text that is displayed above the contents of the group or as the text of the question being answered. This allows the questionnaire response to be read without access to the questionnaire.
      - **item.answer** - The respondent's answer(s) to the question. 
      - **item.answer.item** - Nested groups and/or questions found within this particular answer. It is useful to have "sub-questions", questions which normally appear when certain answers are given and which collect additional details.
      - **item.item** - Questions or sub-groups nested beneath a question or group.

**Nested Items**
QuestioinnaireResponse has two different mechanisms to support nesting of items - item.item and item.answer.item. The former is used when nesting items within a 'group' and the latter is always used when nesting items within a question. This is because items nested within a question always nest within each answer to the question. If the question allows multiple answers, each will have its own set of nested items.

***Note*** - The Interweave portal only supports flat structure within questionnaireResponse.item element at this time, although there is an intention to support nested items structure in the future. 



### **Discouraged or Removed fields**

 - **Part Of** - This field is discouraged as it does not appear to provide information which would be beneficial in a shared care record. It also allows references to a raft of Observation/procedure resources which introduces a lot of complexity for a data consumer.