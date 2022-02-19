# **Implementation Sequence**

FHIR offers a wealth of different Resource types, and it can be difficult to know where to start. However experience with Shared Care Record implementations suggests a well-trodden path to incrementally delivering value.

### **1) Patient**

 The [Patient](StructureDefinition-Interweave-Patient.html) resource provides a basis, as everything relates back to a Patient. Creating a Patient also acts as a trigger for PIX registration - thus indicating in the regional record locator that a Data Provider has information about this person.

### **2) Foundational Reference Data**

This consists of:

 - [Organisation](StructureDefinition-Interweave-Organization.html)
 - [Practitioner](StructureDefinition-Interweave-Practitioner.html)
 - [Location](StructureDefinition-Interweave-Location.html)

 Each Data Provider needs to offer a set of FHIR reference data describing these fundamental aspects of their enterprise. The datasets are fairly small and simple, and do not offer any real value on their own. However they lay the foundations as they are constantly referenced by all other datasets.

### **3) Documents**

FHIR offers the [DocumentReference](StructureDefinition-Interweave-DocumentReference.html) resource type to facilitate sharing of documents (eg PDF, Tiff, etc). This is very often a "quick win" which allows a wide variety of useful information (eg Discharge Summaries, Care Plans) to be quickly and easily shared.


### **4a) Healthcare - Encounter, Appointment, Related Person**

 The [Encounter](StructureDefinition-Interweave-Encounter.html) is a key FHIR resource for Healthcare Data Providers. It offers structured information about interactions with the patient. It furthermore provides a foundation - as many other FHIR resources "hang off" the Encounter.

 Appointments are closely related to Encounters, and often worth implementating at the same time.

 Related Person is a fairly straigntforward resource which can, however, provide a very useful overview of contacts relevant to a patient's care.


### **4b) Social Care - Episode of Care, Task, Related Person**

Social Care follows a slightly different model - based around use of the FHIR resources for Episode of Care, Task, and Related Person to represent core concepts and activities in Social Care.

### **5) Use Case Based Sprints**
From this point onwards the implementation path is less clearly pre-defined, and will tend to be based on specific use-cases and priorities. However typical FHIR resources that Data Providers have implemented next include (in no specific order):
 - Allergies
 - Medications
 - Referral Requests
 - Conditions
 - Procedures
 - Observations
 - Diagnostic Reports
 - Flags
 - Devices

Typically these would be tackled in agile sprints, adding one or two resources at a time to continually deliver value.

