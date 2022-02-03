# **Open Issues**

This page captures topics of ongoing discussion. Contributions and insights are welcome.

## **Patient**
 - **Address - unknown or no permanent abode** - is there a standard representation of the address which could be used in this case?
 - **Religious Affiliation** (Care Connect Extension) - this is a difficult field to provide definitive guidance on. In general it is useful to populate if possible, and for some scenarios it may be extremely important (eg End of Life, and certain aspects of community and social care). In other scenarios however it may be considered unnecessary and intrusive information. Therefore optional, to allow appropriate discretion to be applied. However there is a case for Must Support.

  - **Individual Requirements** - Care Connect (and FHIR) allows for capturing information about "communication", however this focuses on languanges. There are other important aspects to be aware of when dealing with certain patients - for example cognative abilities, mobility, etc. PRSB has been doing work on "Individual Requirements" to better consider this. Do we need an additional extension to allow this information to be captured?

## **Organisation**
 - **Type** - a good list of organisation types has been found on the ODS search page: <https://odsportal.digital.nhs.uk/Organisation/Search>. It has been pasted in, but does anyone know its actual origins (NHS Data Dictionary)? Also need to confirm the codes - as those on this screen do not match those in the ODS extracts. Also need to confirm the relationship between Organisations / Sites etc - are all the codes relevant here? Once all clarified then could potentially make this a Mandatory field.


## **Location**
 - **Type** - the standard HL7 code list seems OK, and includes generic entries - but perhaps does not ideally cover every scenario, especially in Social Care. Are there values to be added? Or alternative lists elsewhere (NHS Data Dictionary?) which might be more useful?


## **Practitioner**
 - **Identifier** - CareConnect makes provision for capturing the SDS User Id and also the SDS Role Profile Id. However our understanding is that, although useful, these do not have the same wide acceptance and use as, say, the ODS code for organisations. There are a range of other identifiers in common use (eg GMP Code, Consultant Code, etc) and so we have made explict provision for capturing the most common of these - with the option to extend with others if necessary. 

   Have we got the right list of identifiers? (or at least a reasonable list)

   (Also are there any sources of definitive reference data about these identifiers which we should consider downloading)

 - **Qualifications** - Whilst it is useful to know the specific identity of the practitioner, often it is at least as useful to know "what type" of practitioner they were - ie their role, specialty, and qualifications. The PractitionerRole resource covers this well, but is really an R4 concept and not well supported in STU3. 
 
   Meanwhile we have the "Qualifications" information on the Practitioner resource which, whilst not quite as good, could offer a reasonable (and straightforward) alternative. This has therefore been marked as "Must Support". The question however is - how realistic and widely supported is the capture of these practitioner qualifications in Data Provider systems?


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
 
  
