# **Open Issues**

This page captures topics of ongoing discussion. Contributions and insights are welcome.

## **Patient**
 - **Address - unknown or no permanent abode** - is there a standard representation of the address which could be used in this case?
 

## **Organisation**
 - No points noted


## **Location**
 - **hierarchy in references** - how best to represent the location hierarchy in references?


## **Practitioner**
 - **Identifier** - confirm that we have included an appropriate list of options for practitioner identifiers

 - **Qualifications** - Whilst it is useful to know the specific identity of the practitioner, often it is at least as useful to know "what type" of practitioner they were - ie their role, specialty, and qualifications. The PractitionerRole resource covers this well, but is really an R4 concept and not well supported in STU3. 
 
   Meanwhile we have the "Qualifications" information on the Practitioner resource which, whilst not quite as good, could offer a reasonable (and straightforward) alternative. This has therefore been marked as "Must Support". The question however is - how realistic and widely supported is the capture of these practitioner qualifications in Data Provider systems?

   Also - should this be free text, or is there an accepted list of qualifications that might be used?


## **Document Reference**

 - **Document ids** - Suggestion is that the "masterIdentifier" and "identifier" are not generally needed, but confirm

 - **Relates To** - Current assumption that it will not usually be necessary to link documents like this - unless there is knowledge of use-cases and/or systems where it is important.

 - **Additional Context fields** - Comments are invited on whether there are use-cases and need for any of the other optional "context" fields


## **Encounter**
 - No points noted


## **Appointment**

 - **Subject (participant)** - the Appointment does not have a Subject field! So we are referencing the Patient as a "participant". But double check exactly how this will work for practical purposes such as patient-centric searching.

  
## **Condition**

 - **Onset and Abatement** -In both cases there is a variety of options for how to express this (eg datetime, age, period, etc). These do seem relevant for accurately capturing what is known - with the implication that Data Consumers will need corresponding flexibility in displaying this information.
   - Is this OK?
   - What about implications for a "timeline". Options other than a simple datetime may be difficult to plot on a timeline? Do we need any other options eg a "timeline date?"

 -  **Asserter** - The initial assumption is that this will usually be a Practitioner. However the possibility of a Patient or Related Person is permitted by FHIR and is also left open.
     - Is this OK?
     - Do we have any immediately known use-cases
     - If so, what are the implications for display?

  - **Stage** - Stage has been left as "optional" for now. WHilst not relevant for all conditions, for some (eg Cancer) it is an important and complex aspect.
     - Do we need to specify more detail about staging?
     - If so, who is working with it and can provide this input?


- **Verification Status** - This appears to be an important modifier of the Condition, however it has been removed by Care Connect. Note that an implication of this decision by Care Connect is that this becomes a set of Conditions which DO apply to the subject. Ie there is no mechanism to capture a "refuted" Condition. Check this implication is understood (Noting that not clear what could be done if a problem however)


## **Procedure**

  - **Follow Up codes** - FHIR provides an example list, but it is quite short - provisionally adopted for now, but invite feedback on sources of alternatives. 
 
 - **Performed** - it seems important to know when a Procedure is performed, but FHIR complicates with a choice between datetime and period. It would be simpler to restrict to a single datetime only, but this could exclude valid use-cases which do need a period? Otherwise a Data Consumers will need to cope with both (including for timelines)?

 - **Optional fields** - this is a resource with a large number of optional fields. This reflects the view that there is a lot of additional detail which could be useful, but which it is felt unrealistic to insist on, at least initially. Does this look right - and/or are there any strong arguments to promote other fields Must Support?

