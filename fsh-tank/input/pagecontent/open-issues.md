# **Open Issues**

This page captures topics of ongoing discussion. Contributions and insights are welcome.

## **Patient**
 - **Address - unknown or no permanent abode** - is there a standard representation of the address which could be used in this case?


## **Organisation**
 - **Type** - a good list of organisation types has been found on the ODS search page: <https://odsportal.digital.nhs.uk/Organisation/Search>. It has been pasted in, but does anyone know its actual origins (NHS Data Dictionary)? Also need to confirm the codes - as those on this screen do not match those in the ODS extracts. Also need to confirm the relationship between Organisations / Sites etc - are all the codes relevant here? Once all clarified then could potentially make this a Mandatory field.


## **Location**
 - **Type** - the standard HL7 code list seems OK, and includes generic entries - but perhaps does not ideally cover every scenario, especially in Social Care. Are there values to be added? Or alternative lists elsewhere (NHS Data Dictionary?) which might be more useful?


## **Practitioner**
 - **Identifier** - CareConnect makes provision for capturing the SDS User Id and also the SDS Role Profile Id. But do we need both of these, how widely applicable are they, and how do they relate to other widely known identifiers (eg GMC code)? What about in Social Care? 

   What is the best identifier (or set of identifiers) to capture about practitioners?


## **Document Reference**
 - **Type and Class** - For "type" we are currently using a SNOMED reference 24501000000105, as recommended by DADA. CareConnect uses a SNOMED reference that doesn't seem to have any members? However there is also recent PRSB work, see <https://theprsb.org/standards/documentnaming/>. There is the further question of whether it is necessary to also populate the "class", and if so what to use.

 - **Document ids** - Suggestion is that the "masterIdentifier" and "identifier" are not generally needed, but confirm

 - **Relates To** - Current assumption that it will not usually be necessary to link documents like this - unless there is knowledge of use-cases and/or systems where it is important.

 - **Additional Context fields** - Comments are invited on whether there are use-cases and need for any of the other optional "context" fields


## **Encounter**
 - **Class and Type** - CareConnect provides reasonable lists for these, but do we need to extend them? Or is there a better list anywhere else?

 - **Reason** -  a long list of SNOMED codes to describe different types of problems which may have led to the Encounter. Confirm if this is a good list? The right level of detail? Covering relevant care settings? Also may not be needed if extensive information already in the Appointment or Referral?


## **Appointment**
 - **Service Category, Service Type, and Specialty** - review the various FHIR standard lists provided and their suitabilty in different scenarios. (Is there anything better, eg in NHS Data Dictionary?) Do we need all three of these, and if so exactly what is the distinction? (Noting also that Care Connect has linked the Service Category codes to SDS Job Roles, which seems slightly at odds with the original FHIR field definition - is this helpful and how best to use?) Also consider the implications of multiple vs single values?

  - **Reason** -  as-per Encounter. Is this a useful list of SNOMED codes?

 - **Subject (participant)** - the Appointment does not have a Subject field! So we are referencing the Patient as a "participant". But double check exactly how this will work for practical purposes such as patient-centric searching.

  - **Appointment Cancellation Reason** - how useful is this field and when will it be used? It is free text - is that OK?
 
  
