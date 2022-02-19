      Status: Draft - Work In Progress

## **Introduction**
This profile sets minimum expectations for the Diagnostic Report resource. As noted in the FHIR specifications, a Diagnostic Report allows for presenting a combination of:
 - A written report "document"
 - Structured results in the form of Observations
 - Imaging (although this is currently out of scope for the shared care record) 


### **Mandatory fields**
The following mandatory fields are defined for a Diagnostic Report:
1. **Status** - this is mandatory in FHIR, with a short list of codes provided. Most commonly the status will be "final". (Other statuses may be used if relevant, but must be kept up-to-date)

2. **Subject** - every Diagnostic Report must be linked to a Patient

3. **Issued and Effective dates** - important dates to cover both when the report was issued and the clinically relevant period

4. **Category** - provides a high-level categorisation of the report. This is based on a short and simple list provided by FHIR which is expected to be straightforward to map to (eg "Radiology"). Useful for sorting and filtering.

5. **Code** - this is mandatory in FHIR and defines in more detail the type of diagnostic report. The coding of diagnostic reports is known to be a difficult topic, and at this stage a single set of codes is difficult to prescribe. However the following are preferred, most favoured first:
 
   - SNOMED - CareConnect defines the use of SNOMED coding based on the use of ***371525003 - Clinical procedure report***

   - NICIP - this code list covers only imaging. However within that domain it has been defined by NHS Digital and mandated for use by the Information Standards Board. See <https://digital.nhs.uk/services/terminology-and-classifications/national-interim-clinical-imaging-procedure-nicip-code-set>. Note that the NICIP codes include a maintained standard mapping to SNOMED  ***TODO - so do we use this mapping to always just provide SNOMED? Or include both?***

    - LOINC - the default mapping in FHIR is to LOINC codes for diagnostic reporting

    - Local Codes - outside of the imaging domain there is significant variation in coding and, whilst mapping to one of the above standards is preferred, it may not always be feasible. 

    ***NB: Any intention to use local codes must be explictly discussed and approved***

    ***NB: In all cases display text must be provided so that, regardless of coding, the type of report can be understood by a user***


### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known:

1. **Identifier** - a Local Id should be provided, such that could be quoted if manually getting in touch to find out more

2. **Context** - this provides a link to the Encounter. Whilst there will not always be an Encounter, it is important to populate if it is relevant - to help build the complete picture by linking together all activities surrounding the Encounter

3. **Presented Form** - this allows for a textual report to be offered. Whilst not mandatory, this will almost always be relevant and important.

   - Within "presented form" it is mandatory to populate the Content Type, so that consumers can be aware and process accordingly.  

        > Data Providers and Data Consumers SHOULD support the following contentTypes:
        >    - application/pdf
        >    - text/html
        >    - image/tiff
        >    - image/jpeg
        >
        >    (This list may be added to by request and discussion)
        >
        >   Other contentTypes should only be used with caution, as not all Data Consumers may be able to view them.

   - As of this writing (Feb 2022) the actual content must be Base64 encoded and included in the "data" element
   - Longer term it is anticipated that the messaging infrastructure will be enhanced to also support "url" links to a separately saved document - with this then becoming the preferred mechanism due to the reduced message size. (See [DocumentReference](StructureDefinition-Yhcr-DocumentReference.html) for further guidance on providing url links)
   - A particular issue for Diagnostic Reports is the use of text/plain. 
     - The underlying source for many diagnostic reports is messages extracted from a text-based lab or RIS system.
     - The ***strongly preferred*** approach is to reformat as HTML - as this is an interoperable standard which guarantees consistent presentation across any consumer system
     - In some cases this may be relatively easy to do - for example if the report is already structured as separate lines which can be simply "decorated" with HTML tags
     - In other cases it may be much more difficult - for example if the original report is structured as a single block of text containing various escape characters. ***TODO - discuss this problem further. It may be that formatting for certain defined escape characters can be agreed... although it still feels like the most robust option may be to do this interpretation at source?***
     


4. **Result** - this allows for (semi) structured results to be offered in the form of a list of Observations. Whilst some types of Diagnostic Report are purely textual, for others these structured Observations are extremely important.

    ***Note: The relevant Observations for different types of report, and tips for populating from common Radiology and Lab systems is potentially a topic for a further paper in its own right***



### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Points of note include:

 - **Conclusion** - this is an important field, and only considered "optional" due to the potential difficulty of populating it in practice. It provides a brief summary of the findings, typically easier to understand than the technical detail of the full report. This information can often be found in the "comments" field(s) of a lab or RIS system. However the wide variation in usage of these "comments" fields can make it challenging to identify and extract reliably.

 - **Coded Diagnosis** - this is in effect the "conclusion" in coded form (In FHIR R4 this field is renamed as "conclusionCode"). Whilst this could obviously be useful to populate, it often may not be feasible given the challenges described above in extracting even a text-based conclusion

 - **Specimen** - if relevant and available then details of the specimen should be provided

 - **Performer** - again this may be useful if available. (Noting that for a regional shared care record the practitioner managing the overall encounter may often be of greater relevance).


### **Discouraged or Removed fields**
 - **Image and Imaging Study** - the priority for the shared care record is to share results and reports, rather than raw image data. As of this writing (Feb 2022) there is no support for retriving these imaging links. (Note that this position could change in future - please get in touch if you have a specific use-case) 


### **Summary Text**

    Date + Code Description
  
    Example: 
    "14/01/2022: CT Abdomen"