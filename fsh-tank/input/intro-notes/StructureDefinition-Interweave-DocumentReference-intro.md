      Status: Active: Approved (STU)

## **Introduction**
This profile sets minimum expectations for the DocumentReference resource.


### **Mandatory fields**
The following mandatory fields are defined in order to properly describe a DocumentReference:
1. **Status** - already mandatory in FHIR, and will generally contain "current". (A practical challenge for many systems can be to accurately maintain this, eg updating to "superseded" when necessary)
2. **DocStatus** - will generally contain “final”, as most documents will only be published for regional sharing once they are finalised. 
However there may be exceptions where it is useful to collaborate on preliminary versions of a document. (It is anticipated that additional guidance on the use of this field for collaborating on specific types of document may be added in future.)
3. **Type** - essential information to help categorise the type of document. 

   The categorisation of document types is a much debated topic, with a number of alternative standards still vying for precedence. See [discussion of code list options](codelist-options.html) for further details. However for practical purposes of consistency a regional design decision has been made based on the SNOMED refset **24501000000105: EHR composition types**. This is therefore specified as "preferred" and we ask that SNOMED coding based on this list is provided. 
   - It is, of course, permissible to provide more than one code to also support other coding schemes if desired
   - We accept that this is an area where we will need to remain open to consultation as National standards continue to evolve.


4. **Indexed** - already mandatory in FHIR and essential for date-based searching and sorting
5. **Subject** - every document must be linked to a Patient
6. **Content** - usually a link to retrieve the actual document content (see further guidance below). 
7. **Content Type** It is mandatory to populate the Content Type, so that consumers can be aware and process accordingly.  

> Data Providers and Data Consumers SHOULD support the following contentTypes:
>    - application/pdf
>    - text/html
>    - image/tiff
>    - image/jpeg
>
>    (This list may be added to by request and discussion)
>
>   Other contentTypes should only be used with caution, as not all Data Consumers may be able to view them.


### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known:
1. **Identifier** - a Local document id should be provided (non-version-specific), such that could be quoted if manually getting in touch to find out more
2. **Author** - This is very useful as it provides a person to speak to if more information about the document is needed. Preferably we want exactly one author - the main practitioner involved who should be contacted. (The profile is, however, left open to allow for other more collaborative models of document creation in future).
3. **Context - Encounter** - If relevant and possible then it is very useful to link documents back to the Encounter they relate to
4. **Context - Period** - A document may related to a period of time (eg a care plan for the coming 6 months). Where this is the case then this field must be populated



### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:
 - **Master Identifier** - FHIR also makes provision for both a "master identifier" (version specific). Generally this will link with a Data Provider's in-house document management system, and is therefore an internal implementation detail and of limited relevance for external sharing. If provided then Data Consumers should exercise caution in relying upon it. 
  - **Class** - This provides a higher-level categorisation over-and-above the document "type"
 - **Authenticator** - More likely to be relevant for internal records management rather than external sharing, but may be populated if desired
 - **Description** - May be used if there is additional “title” or summary “description” information about the document which is useful to provide. It is not necessary to populate with a repeat of the document “type” - instead feel free to omit if there is nothing additional to add.
 - **Additional Context Fields** - These include the Event, Facility Type, and Practice Setting. There is also the sourcePatientInfo which may be useful to populate with a version-specific pointer to the patient record at the time the document was created.


### **Discouraged or Removed fields**
  - **Created** - Whilst this is a field often used currently, its use is deprecated in FHIR R4, so in the longer term a reliance on it may not be wise
    - Note that the Exchange has a “docxsort” feature to allow sorting by created date where known, or else indexed date. However as noted, the direction of FHIR is towards a simpler approach based on indexed date only.
 - **Custodian** - this information is instead provided by the provenance tags
 - **Relates To** - This is a potentially useful field that may be used to record relationships between documents. However it is not used as-yet, and there is unlikely to be any behaviour in consumer systems to honour it. Please get in touch for further discussion if planning to use it.
  - **Content - Related** - This provides the opportunity to link to other types of resources – in addition to Encounters. It is anticipated that additional guidance on the use of this field may be added in future, based on specific document types and use-cases. Please get in touch if planning to use this field meanwhile.
   - **Security Label** - This field is not used and will not be honoured. All data published to the Interweave Exchange will be shared with other participants. (It is possible that additional security mechanisms may be added in future, however this would be subject to further consultation at the time). 



### **Approaches to document content**
The DocumentReference this offers three different ways to transmit the document content and it is important to understand the details of this. The sections below cover each option in turn.

 - **(1) Embedded document (only supported for messaging NOT online query)**

    This is the “simplest” approach, as the document content is embedded directly into the DocumentReference. Note that the contentType (mime-type) is provided so that the consumer is able to judge whether it has the ability to display this format of document eg PDF, etc. (This is the same for all three approaches).

    For example the “content” section of a DocumentReference would look like:

>
>     "content": [{​​​​​
>            "attachment": {​​​​​
>                "contentType": "text/html",
>            "data":"PGRpdiB4123ucz0iaHR0cDovL123dy53My5vcmcvMTk5OS94aHRtbCI ... etc..."
>            }​​​​​​​​​​​​
>        }​​​​​​​​​​​​]

 
   This embedded approach is often suitable for messaging, where a relevant document is being specifically sent (eg Ambulance Transfer of Care). However for online query it has the significant disadvantage of making the DocumentReference resources very large  - as the whole document is transferred even when just viewing the list of documents available. Typically there may be many documents about a patient, but only one or two which are relevant for the user to actually view. It is very inefficient (and slow) to transfer the entirety of the documents when a user is only perusing the list.

 (NB: Despite this limitation, GP Connect is an important use-case which returns embedded document content. However GP Connect documents are not returned from ordinary online queries and instead must be specifically requested from a screen developed to meet NHSD accreditation requirements. The reason for embedding is that, having requested a patient’s GP Record, it is almost always going to be desired to view the document content).

 

 - **(2) Linked document (recommended)**

    This replaces the content in the DocumentReference with a link. For example:

>
>     "content": [{​​​​​​​​​​​​
>            "attachment": {​​​​​​​​​​​​
>                "contentType": "text/html",
>                "url": "https://my.server.com/documents/21f51e78-a46d-402c-aa22-dd43e0fec530"
>            }​​​​​​​​​​​​
>        }​​​​​​​​​​​​]

 
This is clearly much more efficient. This list of DocumentReferences contains only metadata about the documents, and if the user wants to open the document then it is a case of following the link to download it. This performs a simple binary download of the document bytes – as would be provided by hosting the document on any standard web server.

 
Note that InterWeave Connect offers a proxy service to avoid the need for point-to-point networking for document downloads. Instead the urls in the DocumentReference are automatically rewritten to point at a central hub which in turn connects to the Data Provider and streams document downloads.

 

 - **(3) FHIR Binary Resource (only recommended if implemented comprehensively)**

    Yet another possible approach is to replace the content in the DocumentReference with a link to a FHIR Binary Resource <http://hl7.org/fhir/stu3/binary.html>. This is similar in principle to the Linked document approach, but adds an extra layer of wrappings and complexity to the Data Provider's implementation. For that reason it is not recommended unless a Data Provider is working with a local system which already exposes documents in this way. Note: that the contentType of the document reference must be the mime type of the document encoded by the binary resource (see GET behaviour below)

    The “content” section of a DocumentReference with a linked Binary Resource would now look like this:

>
>          "content": [{​​​​​​​​​​​​
>            "attachment": {​​​​​​​​​​​​
>                "contentType": "text/html",
>                "url": "https://my.server.com/fhirpath/Binary/21f51e78-a46d-402c-aa22-dd43e0fec530"
>            }​​​​​​​​​​​​
>          }​​​​​​​​​​​​]

 
    
 When the link is followed then it again returns the binary content – as would be provided by hosting the document on any standard web server.

(This is because of a feature of the FHIR specification that treats Binary resources differently from any other resource. When a FHIR server receives a GET request for a Binary resource then it MUST return the binary document content rather than the Binary resource. However the FHIR specification also requires that this behaviour can be overridden by a consumer by inserting the HTTP Accept header with value “application/fhir+json” (or even “application/fhir+xml”). This then returns a more complete FHIR data structure with the document content embedded – although for document viewing purposes it is difficult to envisage why a consumer would desire this)

 

 **Summary of Requirements for DocumentReference content**

 - Data Providers SHOULD use the “linked document” mechanism when publishing documents for on-demand retrieval

   - This is (2) above, which is recommended as a simple and efficient approach.

   - Data Providers MUST NOT embed documents for on-demand retrieval, as this is inefficient

   - Data Providers MAY publish documents as FHIR Binary Resources. This is equivalent from a Data Consumer perspective as it provides a link to follow to download the document. However it is not recommended due to the additional complexity for a Data Provider. If this option is chosen then the Data Provider MUST fully support the FHIR specification.
 

 - Data Consumers MUST support viewing of documents via a DocumentReference resource which contains a link for downloading the actual document content

   - This covers both of (2) and (3) above as, in practice, both contain a link to download the document content
  

  - Data Consumers MAY leave the HTTP “Accept” header blank, and SHOULD NOT populate it with anything other than the mime-type advertised by the Data Provider in the DocumentReference

     - There is no expectation of Data Providers being able to offer translation capabilities between mime-types

