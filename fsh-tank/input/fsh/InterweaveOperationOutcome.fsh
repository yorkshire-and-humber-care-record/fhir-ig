Profile: InterweaveOperationOutcome
Parent: OperationOutcome
Id: Interweave-OperationOutcome
Description: "Interweave Operation Outcome resource profile."
* ^status = #active

* insert Ruleset-InterweaveBaseFields

* meta.tag contains
    RequestId 0..1

* meta.tag[RequestId] ^short = "Auto-populated by Exchange. An id which links to Exchange diagnostic logs for troubleshooting purposes."
* meta.tag[RequestId].system =  "https://yhcr.nhs.uk/RequestId" (exactly)
* meta.tag[RequestId].code 1..1
* meta.tag[RequestId].code ^short = "Auto-populated by Exchange. An id which links to Exchange diagnostic logs for troubleshooting purposes."


// Issue - the main container for error information and at least one must be included
//    (There could be more than one, in which case the FIRST should contain a summary. See notes.)
* issue MS

// Severity and Code - already mandatory and with a required code list
* issue.severity MS
* issue.code MS

// Details - mandatory to include at least some text that can be shown to the user
* issue.details 1..1 MS
* issue.details.text 1..1 MS
* issue.details.text ^short = "Description of the error suitable for displaying to a user"

// Details.coding - optional (can include extra codes but they will not necessarily be understood by consumers)
//      (Possiblity for a  regional code list in future). 
//      But if used, must be populated properly with display text and code system.
* insert Ruleset-CodingWithSystemCodeDisplay(issue.details)

// Diagnostics - Must Support. (not mandatory, but will usually be relevant)
* issue.diagnostics MS

// issue.location - remove it. It is deprecated in FHIR R4, legacy field for XML.
* issue.location 0..0
* issue.location ^short = "Deprecated in R4, use expression instead"

// issue.expresion - leave optional.



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Examples
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: InterweaveOperationOutcomeExample
InstanceOf: InterweaveOperationOutcome
Description: "Interweave Operation Outcome example"

* meta.lastUpdated = "2022-02-01T09:37:00Z"
* meta.profile[0] = "https://fhir.yhcr.nhs.uk/StructureDefinition/Interweave-OperationOutcome"
* meta.versionId = "InterweaveOperationOutcomeExample-v1.0.0"

* meta.tag[0] =  https://yhcr.nhs.uk/Source#ABC-01 "Acme Ltd Data Systems"
* meta.tag[1] =  https://yhcr.nhs.uk/Provenance#RCB "York and Scarborough Teaching Hospitals NHS Foundation Trust"
* meta.tag[2] =  https://yhcr.nhs.uk/RequestId#8abf429f-3eab-4c38-b4af-911505568874


* issue.severity = #error
* issue.code = #timeout

* issue.details.text = "The query was abandoned as it took more than 2 seconds"

* issue.diagnostics = "timout exceeded 2000ms: module main, instance bk34243rs, line 57: Respond socket: LoadFHIR: PopulateTags"