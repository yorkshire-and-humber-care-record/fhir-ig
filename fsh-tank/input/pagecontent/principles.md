# Principles

There are some principles which have guided decisions, and it is useful to make these explicit. Note that some of these principles are in conflict - this is appreciated and reflects the real-life tradeoffs which have had to be resolved.

## Principle 1: Support a Shared Care Record
FHIR is a global standard which supports many usage scenarios. However our scenario is a Shared Care Record, and this provides important guidance to standards decisions. 

It means that there are many areas where we can simplify, as we need less detail than FHIR is able to support. For example, we are not attempting to provide Human Resources support for managing staff, nor to track the precise location of people and equipment within a hospital, nor to keep a full legal record of all aspects of a patient's care, nor to support billing.

However we **are** interested in an overview of a person's history and conditions, contact details of those they have interacted with, and highlighting important issues which may affect their future care.

All of these considerations give a particular "shape" to the FHIR Resources. This will be different from how, for example, FHIR would be used within a hospital EPR.

## Principle 2: Support Health AND Social Care
The origins of FHIR are primarily in Healthcare. However our requirement is to support Integrated Care Systems which span both Health AND Social Care - with the information sharing between the two being a particularly important aspect.

This leads to additional consideration being needed - to ensure that the structures and code lists defined can support both of these care settings.

## Principle 3: Build Networks of Interrelated Resources
Feedback from users is that whilst looking at an individual FHIR Resource is useful, the real value comes from being able to follow the links between items. For example being able to see the medications a patient is using, view the encounter when these were first prescribed, understand the condition which led to that prescription, etc. 

It is therefore important to encourage Data Providers to incrementally build up the set of FHIR Resources they offer and, crucually, to make proper use of FHIR References to link them.

## Principle 4: Give Prescriptive Advice
Experience from early implementations has taught us two things:
1. FHIR (and even CareConnect) is a very flexible standard - and left to their own devices then Data Providers will come up with valid but widely different interpretations which are difficult to consolidate into a coherent Shared Care Record
2. Many Data Providers are new to FHIR and find the options confusing. They would in fact prefer to "just be told what to do".

We therefore aim to be quite prescriptive in specifying what is required for each type of resource. Note that this is counterbalanced by Principle 7 below - where we welcome feedback if we get it wrong.

## Principle 5: Capture Standard Coding
Whilst the primary goal is to support Direct Care, an important secondary goal is to put in place a regional infrastructure for Population Health Management. And for this kind of analysis it is important to capture consistent, standardised, coding. Furthermore there is a tremendous opportunity to progress this - as many Data Providers are now commissioning new projects to map their data into FHIR format for the first time.

We have therefore been bold in specifying coding standards where we feel they are important. (Noting, once again, that this Principle is tempered by 6 and 7 below).

## Principle 6: Pick Your Battles
Despite some of the preceeding principles, we do want to make it as easy as possible for Data Providers to be onboarded - as well as to avoid unnecessarily excluding any existing FHIR implementations which already do things in a particular way.

A key question when developing the profiles is therefore *"Is this field important to us?"*
 - If yes, then Principles 4 and 5 apply to specifiying it tightly
  - If no, then it can be left optional and/or loosely specified - to minimise unnecessary work, and maximise tolerence of existing implementations


## Principle 7: Iterate and Respond to Feedback
Defining data standards for a region is complex and difficult to get right. We also need to move at pace, and do not have the luxury of extended standards discussions in advance of any implementation work starting. Finally we want to be bold and to set a clear and consistent direction, rather than avoiding controversy with vague definitions - as these will not deliver the necessary Shared Care Record consistency.

 This means that we may sometimes get things wrong, or make impractical proposals. We welcome collaboration and feedback on the drafts so that we can uncover any issues and address them quickly.



