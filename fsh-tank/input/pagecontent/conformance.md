# Conformance

This page considers the expectations for systems who wish to claim confirmance with this Implementation Guide. FHIR already provides guidance on this topic  and this should be consulted as it applies here also. See https://www.hl7.org/fhir/STU3/conformance-rules.html. 

However this page adds additional detail and clarification for Interweave implementations.

## Conformance levels for data items

Five basic levels of confirmance have been considered when developing these profiles:

### 1. Mandatory
Mandatory data items have a cardinality of at least 1, and therefore MUST always be populated. As the FHIR specification itself notes, it is surprisingly rare to find a data item which can be mandated with certainty as *always* available and relevant to *every* scenario. 

*Mandatory data items are, by definition, also marked as "Must Support"*

### 2. Must Support
Must Support is a key concept - used to identify the important fields which implementations are expected to support. It means that even where a field cannot be classified as "mandatory", it MUST be populated where it is relevant and available.

Consider for example a patient's phone number (telecom). Maybe some patients do not own a phone, or did not wish to provide this information, or maybe some Data Provider systems cannot capture this information about a patient. However assuming that a phone number is captured then it MUST be populated in the message.

In more detail the implications are as follows:
 - A Data Provider
   - MUST populate this field where the data item is relevant and available
   - In practice this means that a Data Provider must demonstrate AT LEAST ONE test case showing the field populated. (ie not all patients may have a phone number, but AT LEAST ONE example of being able to populate a patient who DOES have a phone number must be shown)
   - Where this is not possible to demonstrate then the reason must be documented as part of the testing report, and the exception approved as part of regional governance signoff. (For example, if the data item is simply not captured by the Data Provider system)
  - A Data Consumer
    - MUST understand and be able to display this field, where relevant to the use-case.
    - Note that this still leaves considerable flexibility about exactly how and where the field is displayed, how prominent, etc. Local assurance of Usability and Clinical Safety provide the final signoff here.
    -  The starting assumption however is that these data items are the basic core fields which are expected to be displayed, and which the Data Provider is expecting Data Consumer users to be informed of.


### 3. Optional
Optional fields are genuinely optional. A Data Provider may or may not populate them, and a Data Consumer may or may not display them.

Providing a rich data set is obviously encouraged and may help to provide additional information and support more use-cases. However use of these fields is not essential or enforced.

*Note: If the choice is made to populate an optional field, then it MUST, of course, be populated correctly and safely*

### 4. Discouraged
The use of some optional fields is actively discouraged. These fields are not seen as relevant or useful, and are not expected to be used by Data Consumer applications.

Legacy implementations which provide data in this field are acceptable, as long as they understand that it is unlikely to be used. New implementations are not recommended to spend time and effort attempting to populate it.

*Note: We have found this to be a useful concept, but it is not natively supported by FHIR. It is therefore implemented by starting the "short comments" field in the profile tables with the word "DISCOURAGED"*

### 5. Excluded
Excluded data items have a cardinality of 0, and therefore MUST NOT be populated. This is quite rare, as many unwanted data items can marked as "Discouraged" - to be tolerated and ignored. However a few items justify this stronger "Excluded" classification.


## Binding Strengths for Coding
When populating coded data, FHIR offers four levels of Binding Strength, as documented here: https://www.hl7.org/fhir/STU3/conformance-rules.html
 - **Required** - This is the strongest Binding Strength, and is the most commonly used by Interweave. We take the view that to be useful then coding needs to be consistent. Where FHIR (as an international standard) offers weaker binding options, these are taken as a cue for us to consider and replace / refine the coding list - agreeing on a definitive list of codes to be used by this Implementation Guidance.
  - **Extensible / Preferred / Example** - These weaker Binding Strengths will generally only remain on "Optional" fields - indicating that not only is the field itself optional, but so also is whether and how to code it. Very occasionally they might be seen on a Must Support field - to indicate that text is the priority, and that coding is not considered important for this field. (This is rare and will be explained further in accompanying notes).

  ***NB: Although marked as "Required", most code lists are implicitly "Extensible" via consultation.***
   - If a code list does not meet your needs, please do get in touch so that the issue can be discussed and extra codes added.
   - The point is to extend the "Required" list in a curated and consistent way, to be used by all in the region. As opposed to inconsistent extensions being unilaterally devised by individual Data Providers.
