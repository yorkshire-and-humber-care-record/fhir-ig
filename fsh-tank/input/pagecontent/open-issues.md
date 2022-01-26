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


## **Encounter**
 - **Class and Type** - CareConnect provides reasonable lists for these, but do we need to extend them? Or is there a better list anywhere else?

 - **Reason** -  a long list of SNOMED codes to describe different types of problems which may have led to the Encounter. Confirm if this is a good list? The right level of detail? Covering relevant care settings? Also may not be needed if extensive information already in the Appointment or Referral?

 

 
  
