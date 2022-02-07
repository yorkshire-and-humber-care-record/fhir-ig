////////////////////////////////////////////////////////////////////////////////////////////////////////////
// YHCR Base Fields
////////////////////////////////////////////////////////////////////////////////////////////////////////////

// This ruleset defines the use of base fields - ie from the Resource, Resource.meta, and DomainResource
// It is intended to be inserted into all other YHCR profiles

RuleSet: YhcrBaseFieldsRuleset

//////////////
// Resource
//////////////

// Id:
//   An arbitrary unique id (eg guid) which is used to reference the resource.
//   This is mandatory for most resource types, but may not be included for some transient resources (eg Bundle, OperationOutcome, etc)
* id MS

// Implicit Rules - not used
* implicitRules ^short = "DISCOURAGED - may not be honoured by Data Consumers"

// Languange - leave optional.
//   If not provided then English (EN) will be assumed. (Note that as of this writing Interweave is not a multilingual system)
* language ^short = "English is assumed (not currently a multi-lingual implementation)"


//////////////////
// Resource.meta
//////////////////

// Version Id
//   Must be populated for a FHIR endpoint which supports versioning. 
//   It is appreciated that some systems cannot achieve this, however it is strongly encouraged as a mechanism for providing a fully history and audit trail of what has been shared
* meta.versionId MS

// Last Updated
//   Mandatory - this is important and useful information
//   HOWEVER can only mark as MS, because FHIR does not permit it to be populated in Contained resources
* meta.lastUpdated MS

// Profile
//   All resources must conform to a Profile and should state it here. Also note that it’s an array and multiple profiles can be specified (e.g. Care Connect AND Interweave)
//   This MUST reference the relevant CareConnect profile (Resources not compliant with CareConnect will not be accepted)
//   This should normally also reference an Interweave profile (such as this one) which further constraints CareConnect. 
* meta.profile MS

// Security
//  This field is not used and will not be honoured. 
//  All data published to the Interweave Exchange will be shared with other participants. 
//  (Mechanisms for additional restrictions and “break glass” MAY be considered in future 
//    and it MAY be decided to use this field as part of that consultation. However this will be progressed as a change when-and-if that time comes)
* meta.security ^short = "DISCOURAGED - may not be honoured by Data Consumers"


// Tags
//  We require two tags to describe the source (system - Data Provider Id) and provenance (organisation - ODS Code) of the data

* meta.tag ^slicing.discriminator.type = #value
* meta.tag ^slicing.discriminator.path = "system"
* meta.tag ^slicing.ordered = false
* meta.tag ^slicing.rules = #open
* meta.tag contains
    Source 1..1 MS and
    Provenance 1..1 MS

* meta.tag[Source] ^short = "The Data Provider Id (and display text) of the system supplying the data"
* meta.tag[Source].system =  "https://yhcr.nhs.uk/Source" (exactly)
* meta.tag[Source].code 1..1 MS
* meta.tag[Source].code ^short = "The Data Provider Id of the system supplying the data"
* meta.tag[Source].display 1..1 MS
* meta.tag[Source].display ^short = "Name of the system supplying the data"

* meta.tag[Provenance] ^short = "The ODS Code (and display text) of the organisation responsible for the data"
* meta.tag[Provenance].system =  "https://yhcr.nhs.uk/Provenance" (exactly)
* meta.tag[Provenance].code 1..1 MS
* meta.tag[Provenance].code ^short = "The ODS Code of the organisation responsible for the data"
* meta.tag[Provenance].display 1..1 MS
* meta.tag[Provenance].display ^short = "Name of the organisation supplying the data"



////////////////////
// Domain Resource
////////////////////

* text ^short = "DISCOURAGED - the preferred approach is to offer structured data fields which a Data Consumer can then render and present in a manner most suited to its users"


////////////////////
// Extensions
////////////////////

// Useful to assist with creating references having useful display text. 
// But only one approach to achieving this, so not mandatory
//* extension contains Extension-Yhcr-TextSummary 0..1 //named textSummary 0..1
//* extension[Extension-Yhcr-TextSummary] ^short = "A short text string to summarise the resource. Intended to be used for the 'display' value in References"
* extension contains Extension-Yhcr-TextSummary named textSummary 0..1
* extension[Extension-Yhcr-TextSummary] ^short = "A short text string to summarise the resource. Intended to be used for the 'display' value in References"



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Extension: ExtensionYhcrTextSummary
Id: Extension-Yhcr-TextSummary
Description: "A short text string to summarise the resource. Intended to be used for the 'display' value in References"
* ^status = #draft
* ^url = "http://yhcr.org/StructureDefinition/Extension-Yhcr-TextSummary"

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "Appointment" //R3 is just context
* ^context[+].type = #element   
* ^context[=].expression = "Encounter" 
* ^context[+].type = #element   
* ^context[=].expression = "DocumentReference" 
* ^context[+].type = #element   
* ^context[=].expression = "Location" 
* ^context[+].type = #element   
* ^context[=].expression = "Organization" 
* ^context[+].type = #element   
* ^context[=].expression = "Practitioner" 
* ^context[+].type = #element   
* ^context[=].expression = "Patient" 
* ^context[+].type = #element   
* ^context[=].expression = "Condition" 
* ^context[+].type = #element   
* ^context[=].expression = "Procedure" 

* . ..1
* . ^short = "A short summary string eg for display in References"
* . ^definition = "A short summary string eg for display in References"

* valueString only string
* valueString ^short = "A short summary string eg for display in References"
* valueString ^definition = "A short summary string eg for display in References"


