Alias: $SCT = http://snomed.info/sct

Profile: YhcrProcedure
Parent: CareConnect-Procedure-1
Id: Yhcr-Procedure
Description: "YHCR Procedure resource profile."
* ^status = #draft

* insert YhcrBaseFieldsRuleset


// Extension - CareConnect Anesthetic Issues: Excluded
* extension[Extension-CareConnect-AnaestheticIssues-1]  ^short = "DISCOURAGED: May be risky if not consistently used. Consider using AllergyIntolerance or AdverseEvent instead."


// Identifier: (MS)
// This is a business identifier for the Procedure.
// The value for a local identifier must be populated and contain the internal id for this Procedure on the providing system
// Thus providing a link back for any follow-up and/or troubleshooting
* insert Ruleset-AddLocalIdentifier(procedure)


// Definition: Leave optional
//   A detailed definition of the procedure – eg protocol.
//   Could be useful, but unlikely to be available in early implementations? Return to in future when and if being offered

// Based On: Leave optional
//   Useful to describe the Care Plan, Referral or ProcedureRequest that led to this Procedure
//   Again suspect this will may be available for early implementations. 
//   Do we need to support all three options? Return to in future based on further consultation

// Part Of: Leave optional
//   Again could be useful to describe if the procedure is part of a wider overall procedure, or involved in an observation or medication administration.
//   However suspect will not be available in early implementations? Return to in future based on further consultation

// Not Done / Not Done Reason: Leave optional
//   Could be useful, but unlikely to be available in early implementations? Return to in future when and if being offered
//   (Note - in R4 then renamed into a single field "Status Reason")


// Status: Already mandatory in FHIR
* status MS

// Category: Mandatory
//   A simple and short list of SNOMED codes to describe the overall category of procedure eg “Surgical Procedure”, “Diagnostic Procedure”
* category 1..1 MS
* category from http://hl7.org/fhir/ValueSet/procedure-category (required)
* insert Ruleset-CodingWithSystemCodeDisplay(category)
	

// Code: Mandatory
//   Essential information about what the procedure actually was.
* code 1..1 MS
* code from http://hl7.org/fhir/ValueSet/procedure-code (required)
* insert Ruleset-CodingWithSystemCodeDisplay(code)
* code.coding[snomedCT] 1..1 MS
* code.coding[snomedCT] from http://hl7.org/fhir/ValueSet/procedure-code (required)


// Subject: Is already mandatory. Essential reference to the patient (only)
* subject MS 
//   We only want Patients - not Groups
* subject only Reference(CareConnect-Patient-1)
* subject ^short = "Who the procedure was performed on. (A patient, NOT group)"
* insert Ruleset-ReferencePatient(subject)

// Context: (MS)
//   A reference to the Encounter where the procedure was performed.
//   This is likely to be very useful and should be provided if at all possible. .
* encounter MS  // R4 encounter -> STU3 Context
* encounter only Reference(CareConnect-Encounter-1)
* insert Ruleset-ReferenceWithAtLeastDisplay(encounter)

// Performed: (Mandatory) (But difficult to specify this for a choice!)
//  performedDateTime is easier to deal with, and would be simpler to exclude performedPeriod, but perhaps over-simplistic.
//  However implication is that consumers must be able to deal with both - eg on a timeline
* performed[x] 1..1 MS


// Performer: (leave optional)
//  Useful to provide if known, although it may be more relevant in some scenarios than others. 
//  For example some procedures are quite transactional and the person in overall charge of the care may be more useful as a contact.

// Location: (leave optional)
//  Generally speaking the exact location where the procedure was performed is unlikely to be vital for a regional care record. 
//  The organisation involved (from the source tags) is often likely to be sufficient, 
//  and further details can also be provided by the Context linking to an Encounter.

// Reason Code and Reason Reference (leave optional)
//  Could be useful to provide more detail, or Could be useful to link to a Condition or Observation. 
//  But unlikely to be available in early implementations? Return to in future when and if being offered

// Body Site: (leave Optional)
//  Useful to populate if known, and if not already obvious from the definition of the procedure

// Outcome (MS)
//   A short and simple list of “successful”, “unsuccessful”, “partially successful”. Must be populated when relevant and known.
//   (Accepting that for some types of procedure then this may be impossible if there is no simple definition of “success”)
* outcome MS
* outcome from http://hl7.org/fhir/ValueSet/procedure-outcome (required)
* insert Ruleset-CodingWithSystemCodeDisplay(outcome)

// Report (leave optional)
//  Could be useful, but unlikely to be available in early implementations? 

// Complication and Complication Detail (leave optional)
//  Optional, to populate with any complication codes / Conditions if relevant and known

// Follow Up (MS)
//  This is very useful to populate in a regional care record as, 
//  for example, it allows community teams to see that follow up care is needed
* followUp MS
* followUp from http://hl7.org/fhir/ValueSet/procedure-followup (required)
* insert Ruleset-CodingWithSystemCodeDisplay(followUp)

// Note (Optional)
* note ^short = "Additional information about the Procedure. NB: Any notes may be shared widely across the region, including being viewed by the patient themselves"


// Focal Device (MS)
//  This is useful to provide if relevant (ie if a device has been fitted or changed).
//  May inform community teams with follow up care.
* focalDevice MS
* focalDevice.action MS
* focalDevice.action from http://hl7.org/fhir/ValueSet/device-action (required)
* insert Ruleset-CodingWithSystemCodeDisplay(focalDevice.action)
* focalDevice.manipulated MS
* insert Ruleset-ReferenceWithAtLeastDisplay(focalDevice.manipulated)

// Used Code and Used Reference (discouraged)
* usedCode ^short = "DISCOURAGED: relevant to stock control within an organisation, but less so for a regional record"
* usedReference ^short = "DISCOURAGED: relevant to stock control within an organisation, but less so for a regional record"



////////////////////////////////////////////////////////////////////////////////////////
// Examples
////////////////////////////////////////////////////////////////////////////////////////

Instance: YhcrProcedureExample
InstanceOf: YhcrProcedure
Description: "YHCR Procedure example"


//(Note - important to put our profile first, or else the website won't recognise it!)
* meta.lastUpdated = "2022-02-01T09:37:00Z"
* meta.profile[0] = "http://yhcr.org/StructureDefinition/Yhcr-Procedure"
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Procedure-1"
* meta.versionId = "YhcrProcedureExample-v1.0.0"

* meta.tag[0] =  https://yhcr.nhs.uk/Source#ABC-01 "Acme Ltd Data Systems"
* meta.tag[1] =  https://yhcr.nhs.uk/Provenance#RCB "York and Scarborough Teaching Hospitals NHS Foundation Trust"
// (PerformedDateTime + Code description)
* extension[Extension-Yhcr-TextSummary].valueString = "09/01/2022 09:00: Repair of malunion of tibia"



* identifier[localIdentifier].system = "https://yhcr.org/Id/local-procedure-identifier"
* identifier[localIdentifier].value = "PROC-456-XYZ"

* status = http://hl7.org/fhir/event-status#completed "Completed"

* category = $SCT#387713003 "Surgical procedure"
* code.coding[0] = $SCT#445004 "Repair of malunion of tibia"

* subject = Reference(YhcrPatientExample-MustSupport) 
* subject.display = "Fred Bloggs"

* encounter = Reference(YhcrEncounterExample) // R4 encounter -> STU3 context
* encounter.display = "09/01/2022 09:00 - 11/01/2022 14:30 : Inpatient Actute : Dermatology"


* performedDateTime = "2022-01-09T09:00:00Z"

* outcome = $SCT#385669000 "Successful"
* followUp = $SCT#18949003 "Change of dressing"

* focalDevice.action = $SCT#129426002 "Adjustment - action"
* focalDevice.manipulated.display = "Pacemaker"
//  Note - add better reference once tackled Devices. Probably to a contained resource.

