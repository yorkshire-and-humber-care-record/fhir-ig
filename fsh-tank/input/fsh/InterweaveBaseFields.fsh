////////////////////////////////////////////////////////////////////////////////////////////////////////////
// YInterweave Base Fields
////////////////////////////////////////////////////////////////////////////////////////////////////////////

// This ruleset defines the use of base fields - ie from the Resource, Resource.meta, and DomainResource
// It is intended to be inserted into all other Interweave profiles

RuleSet: Ruleset-InterweaveBaseFields

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
* meta.lastUpdated ^short = "MANDATORY except in Contained Resources. When the resource version last changed."

// Profile
//   All resources must conform to a Profile and should state it here. Also note that it’s an array and multiple profiles can be specified (e.g. Care Connect AND Interweave)
//   This MUST reference the relevant CareConnect profile (Resources not compliant with CareConnect will not be accepted)
//   This should normally also reference an Interweave profile (such as this one) which further constraints CareConnect. 
* meta.profile MS
* meta.profile ^short = "Profiles this resource claims to conform to. Should list (i) this profile (ii) underlying CareConnect profile"

// Security
//  This field is not used and will not be honoured. 
//  All data published to the Interweave Exchange will be shared with other participants. 
//  (Mechanisms for additional restrictions and “break glass” MAY be considered in future 
//    and it MAY be decided to use this field as part of that consultation. However this will be progressed as a change when-and-if that time comes)
* meta.security ^short = "DISCOURAGED - may not be honoured by Data Consumers"


// Tags
//  We require two tags to describe the source (system - Data Provider Id) and provenance (organisation - ODS Code) of the data
//  (They are mandatory, but make MS so they can be omitted in Contained Resources)
* meta.tag ^slicing.discriminator.type = #value
* meta.tag ^slicing.discriminator.path = "system"
* meta.tag ^slicing.ordered = false
* meta.tag ^slicing.rules = #open
* meta.tag contains
    Source 0..1 MS and
    Provenance 0..1 MS

* meta.tag[Source] ^short = "MANDATORY except in Contained Resources. The Data Provider Id (and display text) of the system supplying the data"
* meta.tag[Source].system =  "https://yhcr.nhs.uk/Source" (exactly)
* meta.tag[Source].code 1..1 MS
* meta.tag[Source].code ^short = "The Data Provider Id of the system supplying the data"
* meta.tag[Source].display 1..1 MS
* meta.tag[Source].display ^short = "Name of the system supplying the data"

* meta.tag[Provenance] ^short = "MANDATORY except in Contained Resources. The ODS Code (and display text) of the organisation responsible for the data"
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

// None at this stage


////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Rulesets to help with Examples
////////////////////////////////////////////////////////////////////////////////////////////////////////////

RuleSet: Ruleset-ExampleMetaForHospital(type)

//(Note - important to put our profile first, or else the website won't recognise it!)
* meta.lastUpdated = "2022-02-01T09:37:00Z"
* meta.profile[0] = "https://fhir.yhcr.nhs.uk/StructureDefinition/Interweave-{type}"
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-{type}-1"
* meta.versionId = "Interweave{type}Example-v1.0.0"

* meta.tag[0] =  https://yhcr.nhs.uk/Source#ABC-01 "Acme Ltd Data Systems"
* meta.tag[1] =  https://yhcr.nhs.uk/Provenance#RCB "York and Scarborough Teaching Hospitals NHS Foundation Trust"

RuleSet: Ruleset-ExampleMetaForSocialCare(type)

//(Note - important to put our profile first, or else the website won't recognise it!)
* meta.lastUpdated = "2022-02-01T09:37:00Z"
* meta.profile[0] = "https://fhir.yhcr.nhs.uk/StructureDefinition/Interweave-{type}"
* meta.versionId = "Interweave{type}Example-v1.0.0"

* meta.tag[0] =  https://yhcr.nhs.uk/Source#ABC-01 "Acme Ltd Data Systems"
* meta.tag[1] =  https://yhcr.nhs.uk/Provenance#212 "Leeds City Council"

RuleSet: Ruleset-ExampleLocalId(type, localId)

* identifier[0].system = "https://fhir.yhcr.nhs.uk/Id/local-{type}-identifier"
* identifier[0].value = "{localId}" 




////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Additional Rulesets to tighten up Local Id, CodeableConcept and Reference usage
////////////////////////////////////////////////////////////////////////////////////////////////////////////

RuleSet: Ruleset-AddIdentifierSlicing

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.ordered = false
* identifier ^slicing.rules = #open


RuleSet: Ruleset-AddLocalIdentifierMS(type)

* identifier contains
    localIdentifier 0..1 MS

* identifier[localIdentifier].system 1..1 MS
* identifier[localIdentifier].system = "https://fhir.yhcr.nhs.uk/Id/local-{type}-identifier" (exactly)
* identifier[localIdentifier].value 1..1 MS
* identifier[localIdentifier].value ^short = "The Local {type} Identifier. Please prefix with ODS code plus period (XXX.) to ensure unique"
// Period assumed to match that of the entity
* identifier[localIdentifier].period 0..0


RuleSet: Ruleset-AddLocalIdentifierOptional(type)

* identifier contains
    localIdentifier 0..1

* identifier[localIdentifier].system 1..1 MS
* identifier[localIdentifier].system = "https://fhir.yhcr.nhs.uk/Id/local-{type}-identifier" (exactly)
* identifier[localIdentifier].value 1..1 MS
* identifier[localIdentifier].value ^short = "The Local {type} Identifier. Please prefix with ODS code plus period (XXX.) to ensure unique"
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


RuleSet: Ruleset-ReferenceWithReferenceAndDisplay(path)
* {path}.display 1..1
* {path}.display ^short = "Description of the referenced resource"
* {path}.reference 1..1
* {path}.reference ^short = "Reference to a resource (could be Contained)"
* {path}.identifier 0..1
* {path}.identifier ^short = "If relevant could include an id"


RuleSet: Ruleset-ReferenceWithReferenceOnly(path)
* {path}.display 0..1
* {path}.display ^short = "If relevant, description of the referenced resource"
* {path}.reference 1..1
* {path}.reference ^short = "Reference to a resource (could be Contained)"
* {path}.identifier 0..1
* {path}.identifier ^short = "If relevant could include an id"

