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



////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Additional Rulesets to tighten up Local Id, CodeableConcept and Reference usage
////////////////////////////////////////////////////////////////////////////////////////////////////////////

RuleSet: Ruleset-AddLocalIdentifier(type)

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.ordered = false
* identifier ^slicing.rules = #open
* identifier contains
    localIdentifier 0..1 MS

* identifier[localIdentifier].system 1..1 MS
* identifier[localIdentifier].system = "https://yhcr.org/Id/local-{type}-identifier" (exactly)
* identifier[localIdentifier].value 1..1 MS
* identifier[localIdentifier].value ^short = "The Local {type} Identifier"
// Period assumed to match that of the entity
* identifier[localIdentifier].period 0..0



RuleSet: Ruleset-CodingWithSystemCodeDisplay(path)
// Don't have to provide coding
// But if we do then properly populated with system, code, AND display text
* {path}.coding.system 1..1
* {path}.coding.code 1..1
* {path}.coding.display 1..1


RuleSet: Ruleset-RawCodingWithSystemCodeDisplay(path)
// For raw coding, not in a CodeableConcept
// Properly populate with system, code, AND display text
* {path}.system 1..1
* {path}.code 1..1
* {path}.display 1..1


RuleSet: Ruleset-ReferenceWithAtLeastDisplay(path)
* {path}.display 1..1 
* {path}.display ^short = "As a minimum explain in words"
* {path}.reference 0..1 
* {path}.reference ^short = "Preferably reference a resource"
* {path}.identifier 0..1 
* {path}.identifier ^short = "If relevant could include a local id"


RuleSet: Ruleset-ReferenceWithDisplayAndReference(path)
* {path}.display 1..1 
* {path}.display ^short = "Description of the referenced resource"
* {path}.reference 1..1 
* {path}.reference ^short = "Reference to a resource"
* {path}.identifier 0..1 
* {path}.identifier ^short = "If relevant could include a local id"


RuleSet: Ruleset-ReferencePatient(path)
* {path}.display 1..1 
* {path}.display ^short = "The patient's name"
* {path}.reference 1..1 
* {path}.reference ^short = "Reference to Patient Resource"
* {path}.identifier 0..1 
* {path}.identifier ^short = "Ideally also include NHS Number"


RuleSet: Ruleset-ReferenceInternalLocation(path)
* {path}.display 1..1 
* {path}.display ^short = "Description of the location"
* {path}.reference 1..1 
* {path}.reference ^short = "Reference to internal Location Resource"
* {path}.identifier 0..1 
* {path}.identifier ^short = "Ideally also include a local id"


RuleSet: Ruleset-ReferenceExternalLocation(path)
* {path}.display 1..1 
* {path}.display ^short = "Description of the location"
* {path}.reference 0..1 
* {path}.reference ^short = "Reference to Location Resource if relevant/possible (could be Contained)"
* {path}.identifier 0..1 
* {path}.identifier ^short = "Ideally also include a local id"


RuleSet: Ruleset-ReferenceInternalPractitioner(path)
* {path}.display 1..1 
* {path}.display ^short = "The practitioner's name"
* {path}.reference 1..1 
* {path}.reference ^short = "Reference to internal Practitioner Resource"
* {path}.identifier 1..1 
* {path}.identifier ^short = "Include a practitioner id"


RuleSet: Ruleset-ReferenceExternalPractitioner(path)
* {path}.display 1..1 
* {path}.display ^short = "The practitioner's name"
* {path}.reference 0..1 
* {path}.reference ^short = "Reference to Practitioner Resource if relevant/possible"
* {path}.identifier 1..1 
* {path}.identifier ^short = "Include a practitioner id to formally identify"


RuleSet: Ruleset-ReferenceOrganization(path)
* {path}.display 1..1 
* {path}.display ^short = "The organisation name"
* {path}.reference 0..1 
* {path}.reference ^short = "Reference to Organisation Resource if relevant/possible"
* {path}.identifier 1..1 
* {path}.identifier ^short = "The ODS code to formally identify"