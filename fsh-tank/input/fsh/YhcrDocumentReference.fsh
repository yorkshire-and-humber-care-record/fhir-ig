Profile: YhcrDocumentReference
Parent: CareConnect-DocumentReference-1
Id: Yhcr-DocumentReference
Description: "YHCR DocumentReference resource profile."
* ^status = #draft

// Leave optional:
// masterIdentifier (version specific, eg correlate with document system)
// identifier (other ids for the document)

// Status and docStatus
// Status is already mandatory in FHIR (challenge may be accurately populating it with anything other than "current")
// Add docStatus for useful additional information about the document (will normally just be "final")
* status MS
* docStatus 1..1 MS

// Type - very important field to identify the type of document (already mandatory in FHIR)
// Much discussion about this, and DADA proposed list of SNOMED codes selected for now
* type MS
* type from YhcrDocumentType (required)

// Class - leave optional for now, pending further discussion
// This is a higher level categorisation, initially concluded that not needed as well as "type"
// But some of the candidate standards have 2 levels (eg PRSB), so leave optional pending further discussion

// Subject - mandatory, and must refer to a patient
* subject 1..1 MS
* subject only Reference(CareConnect-Patient-1)

// Created - leave optional
// This is a potentially useful field, but note that deprecated in R4

// Indexed - already mandatory in FHIR (note it is renamed to "date" in R4)
* date MS

// Author - MS
// Preferably we really want exactly one author - the main practitioner involved and who should be contacted
// There are potentially many other scenarios for collaborative document authoring, so leave open wider possibilities
// But explain in words what we want
* author    MS
* author ^short = "Who and/or what authored the document. NB: For most use-cases this should contain a single practitioner who is the main contact for any further questions"

// Authenticator - leave optional
// More likely to be relevant for internal records rather than external sharing, but may be used if desired

// Custodian
* custodian ^short = "DISCOURAGED - this information is already covered by the provenance tags"

// Relates to
// Potentially useful to link documents, but unlikely to be any behaviour in consumer systems to honour it
* relatesTo ^short = "DISCOURAGED - use with great caution as consumer systems are likely to display a simple list of documents, and may not interpret these relationships"

// Description - leave optional
* description ^short = "Human-readable description (title). Useful to populate, but acceptable to omit if nothing to add over-and-above the 'type'"

// Security label
* securityLabel ^short = "DISCOURAGED - unlikely to be honoured by consumers"

// And then we have the "context" structure with numerous fields:
//  Encounter (MS) It is extremely useful to link documents back to the encounter they relate to

* context.encounter MS
//  Period (MS) A document may related to a period of time (eg a care plan for the coming 6 months). 
//     Where this is the case then this field must be populated
* context.period MS

// Source Patient Info - version-specific snapshot of the patient. Should usually be known and useful to populate
* context.sourcePatientInfo MS

// Context.Event (leave optional). A complex list of codes, many to do with billing but also others.
//   As FHIR notes, there is overlap with Type - for our purposes suggest Type and link to Encounter
// Context.FacilityType and PracticeSetting (leave optional) - could be useful additional info if known

// Context.Related - discouraged for now, stick with Encounter - to reconsider given specific use cases
* context.related ^short = "DISCOURAGED - see above for linkage to Encounter. Other linkages may be defined in future only if use-cases arise"

// And finally the actual content. This and the attachment are already mandatory in FHIR, and we also need the content type
* content MS
* content.attachment MS
* content.attachment.contentType 1..1 MS
