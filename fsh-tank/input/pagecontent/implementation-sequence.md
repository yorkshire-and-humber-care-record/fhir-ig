# Implementation Sequence

FHIR offers a wealth of different Resource types, and it can be difficult to know where to start. However experience with Shared Care Record implementations suggests a well-trodden path to incrementally delivering value.

### 1) Foundational Reference Data
This consists of:

 - Organisation
 - Practitioner
 - Location

 Each Data Provider needs to offer a set of FHIR reference data describing these fundamental aspects of their enterprise. The datasets are fairly small and simple, and do not offer any real value on their own. However they lay the foundations as they are constantly referenced by all other datasets.


### 2) Patient

 The Patient resource comes next, as everything relates back to a Patient. Creating a Patient also acts as a trigger for PIX registration - thus indicating in the regional record locator that a Data Provider has information about this person.


### 3a) Healthcare - Encounter. 

 The Encounter is a key FHIR resource for Healthcare Data Providers. It provides the first real value by offering information about interactions with the patient. It furthermore provides a foundation - as many other FHIR resources "hang off" the Encounter.


### 3b) Social Care - Episode of Care, Task, Related Person

Social Care follows a slightly different model - based around use of the FHIR resources for Episode, Task, and Related Person to represent core concepts and activities in Social Care.


### 4) Documents

FHIR offers the DocumentReference resource type to facilitate sharing of documents (eg PDF, Tiff, etc). This is very often a "quick win" which allows a wide variety of useful information (eg Discharge Summaries, Care Plans) to be quickly and easily shared.

***NB: A typical initial project will often cover all of steps 1-4 as a first iteration - with this offering the opportunity for a fairly rapid delivery which shares information of real value.***
 

### 5) Use Case Based Sprints
From this point onwards the implementation path is less clearly pre-defined, and will tend to be based on specific use-cases and priorities. However typical FHIR resources that Data Providers have implemented next include (in no specific order):
 - Allergies
 - Medications
 - Appointments
 - Referral Requests
 - Conditions
 - Procedures
 - Observations
 - Diagnostic Reports
 - Flags
 - Devices

Typically these would be tackled in agile sprints, adding one or two resources at a time to continually deliver value.
