Alias: $SCT = http://snomed.info/sct

Profile: InterweaveDiagnosticReport
Parent: CareConnect-DiagnosticReport-1
Id: Interweave-DiagnosticReport
Description: "Interweave Diagnostic Report resource profile."
* ^status = #active

* insert Ruleset-InterweaveBaseFields


// Identifier: (MS)
// This is a business identifier for the Diagnostic Report.
// The value for a local identifier must be populated and contain the internal id for this Diagnostic Report on the providing system
// Thus providing a link back for any follow-up and/or troubleshooting
* insert Ruleset-AddIdentifierSlicing
* insert Ruleset-AddLocalIdentifierMS(diagnostic-report)

// Based on (optional)
// Leave optional for now. If there is a referral request etc then useful to reference - but perhaps not that likely initially
// Also NB...an area of change in R4 however, so need caution about enforcing

// Status - already mandatory in FHIR with a required code list
* status MS

// Category - make this mandatory and enforce the code list.
//  Seems to be a simple and useful categorisation - not hard to map to and useful for searching
* category 1..1 MS
* category from http://hl7.org/fhir/ValueSet/diagnostic-service-sections (required)
* insert Ruleset-CodingWithSystemCodeDisplay(category)


// Code - this is already mandatory in FHIR
//   We certainly need something in here, but the exact code list is much more difficult to agree.
//   FHIR "prefers" LOINC codes
//   But Care Connect defines SNOMED, so we take that as our preference instead.
//   There is and also (for Imaging) there is NHS Digital's National Interim Clinical Imaging Procedure (NICIP)
//   Plus local codes seem to still be widely used in practice
* code MS
* code from CareConnect-ReportCodeSnCT-1 (preferred)
* insert Ruleset-CodingWithSystemCodeDisplay(code)
// CareConnect already defines a slide based on the snomed 371525003 | Clinical procedure report (extensible)
// Add a slice for NICIP
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.ordered = false
* code.coding ^slicing.rules = #open
* code.coding contains
    nicip 0..1 and
    loinc 0..1

* code.coding[nicip].system 1..1 MS
* code.coding[nicip].system = "https://fhir.yhcr.nhs.uk/CodeSystem/Interweave-NICIP-1" (exactly)
* code.coding[nicip].code 1..1 MS
* code.coding[nicip].code from Interweave-NICIP-1
* code.coding[nicip].code ^short = "National Interim Clinical Imaging Procedure code"
* code.coding[nicip].display 1..1 MS

* code.coding[loinc].system 1..1 MS
* code.coding[loinc].system = "http://loinc.org" (exactly)
* code.coding[loinc].code 1..1 MS
* code.coding[loinc].code from 	http://hl7.org/fhir/ValueSet/report-codes
* code.coding[loinc].code ^short = "LOINC code"
* code.coding[loinc].display 1..1 MS


// Subject - already mandatory in FHIR
//   We need it to be a Patient
* subject MS
* subject ^short = "The subject of the report - for our purposes the patient"
* subject only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(subject)

// Context (MS)
//   Link to the Encounter which led to this diagnostic report. Very useful to provide if relevant and have it
* encounter MS  // "context" is renamed "encounter" in R4
* insert Ruleset-ReferenceWithReferenceOnly(encounter)

// Effective and Issued dates
//   As-per the FHIR spec there are two dates with slighlty different purposes
//   Both seem to be commonly populated - issued date is mandatory, and effective date MS
* effective[x] 0..1 MS
* issued 1..1 MS

// Performer (leave optional)
//   Could be useful to provide if known, but may not always be... or more useful to contact the main person looking after the Encounter as a whole


// Specimen (leave optional)
//   Useful to provide a link if possible / relevant

// Result (MS)
//   Observations to provide structured results
//   Essential if they are relevant (not always the case, but often)
//   There will be more work to do on defining profiles for the many types of Observation possible
* result MS
* insert Ruleset-ReferenceWithReferenceOnly(result)

// Imaging Study (Discouraged)
//   There are other PACS solutions available - we are anticipating primarily sharing reports, not raw images
//   (As of this writing would need development to make the link even work)
* imagingStudy ^short = "DISCOURAGED: Intention is primarily to share reports and results, not raw images. Will be ignored if populated."
* media ^short = "DISCOURAGED: Intention is primarily to share reports and results, not raw images. Will be ignored if populated."
//   ("image" is renamed "media" in R4)

// Conclusion (leave optional)
//   This is intended for a brief summary of the findings - eg as may be found in "comments" on radiology / lab system
//   Extremely useful if possible (almost MS), but not always available or possible to extract reliably

// Coded diagnosis (leave optional)
//   Similar to above, but now coded. Seems quite unlikely to be realistically possible
//   (Renamed "conclusionCode" in R4)

// Presented Form (MS)
//    The actual report text
//    A few things to think about here - eg supported MIME types and use of embedded vs links
//      - links seem a good idea, but would need some more development to get working
//      - a particular issue is text extracted from old RIS / Lab systems which contains escape characters
//            (Ideally would be converted into HTML?)
* presentedForm MS
* presentedForm.contentType 1..1 MS
// Either data or url must be provided... consider further


////////////////////////////////////////////////////////////////////////////////////////
// Examples
////////////////////////////////////////////////////////////////////////////////////////

Instance: InterweaveDiagnosticReportBasicExample
InstanceOf: InterweaveDiagnosticReport
Description: "Interweave Diagnostic Report - basic example"

* insert Ruleset-ExampleMetaForHospital(DiagnosticReport)

// Text summary no longer needed
// (Issued date + code description)
//* extension[Extension-Interweave-TextSummary].valueString = "14/01/2022 - CT Abdomen"

* insert Ruleset-ExampleLocalId(diagnostic-report, RCB.DIAG-456-XYZ)

* status = #final

* category = http://hl7.org/fhir/v2/0074#RAD "Radiology"

* code.coding[0] = $SCT#4261000179100 "Computed tomography imaging report (record artifact)"
* code.coding[1] = Interweave-NICIP-1#CABDO "CT Abdomen"

* subject = Reference(InterweavePatientExample-MustSupport) 
* subject.display = "Mr Fred BLOGGS"

* encounter = Reference(InterweaveEncounterExample-MaturityLevel1) // R4 encounter -> STU3 context
//* encounter.display = "09/01/2022 09:00 - 11/01/2022 14:30 : Inpatient Actute : Dermatology"

* effectiveDateTime = "2022-01-10T09:00:00Z"
* issued = "2022-01-14T09:00:00Z"

* conclusion = "Severe fracture, may need surgery"
 
* presentedForm.contentType = #"text/html"
* presentedForm.data = "PGRpdj48cD48Yj5DbGluaWNhbCBpbmRpY2F0aW9uPC9wPjwvYj48cD48Yj53ZW50IHRvIGJlZCBub3JtYWxseSwgZm91bmQgaW4gc3RhdGUgb2Ygbm8gcmVzcG9uc2UsIGFuZDwvcD48L2I+PHA+PGI+bGVmdCBzaWRlZCB3ZWFrbmVzcywgaGFzIHJlZHVjZWQgR0NTIDExLzE1LCBzdHJva2UgcmVzcG9uZGVyPC9wPjwvYj48cD48Yj5hd2FyZTwvcD48L2I+PHA+PGI+RGlmZmVyZW50aWFsIERpYWdub3NpcyA6IHN0cm9rZSw8L3A+PC9iPjxwPjxiPjwvcD48L2I+PHA+PGI+UmVwb3J0IEJvZHk8L3A+PC9iPjxwPjxiPkNvcnJlbGF0ZWQgd2l0aCBwcmV2aW91cyBDVCBvZiAxMi8wMS8yMDE0LjwvcD48L2I+PHA+PGI+PC9wPjwvYj48cD48Yj5UaGVyZSBpcyBsb3NzIG9mIHRoZSBncmV5LXdoaXRlIG1hdHRlciBkaWZmZXJlbnRpYXRpb24gaW48L3A+PC9iPjxwPjxiPnRoZSBlbnRpcmUgcmlnaHQgTUNBIHRlcnJpdG9yeS48L3A+PC9iPjxwPjxiPkFzc29jaWF0ZWQgcmlnaHQgTUNBIGh5cGVyZGVuc2l0eSB3aXRoIHJlZHVjZWQgZmxvdyBvbiBDVDwvcD48L2I+PHA+PGI+YW5naW9ncmFwaHkuPC9wPjwvYj48cD48Yj5GaW5kaW5ncyBhcmUgaW4ga2VlcGluZyB3aXRoIGFuIGFjdXRlIHJpZ2h0IE1DQSBpbmZhcmN0LjwvcD48L2I+PHA+PGI+PC9wPjwvYj48cD48Yj5JbiB0aGUgcmlnaHQgQUNBIHRlcnJpdG9yeSwgdGhlcmUgaXMgbG9zcyBvZiBncmV5LXdoaXRlPC9wPjwvYj48cD48Yj5tYXR0ZXIgZGlmZmVyZW50aWF0aW9uIHdpdGggcGFyZW5jaHltYWwgaGFlbW9ycmhhZ2UuPC9wPjwvYj48cD48Yj5GaW5kaW5ncyBhcmUgbW9zdCBpbiBrZWVwaW5nIHdpdGggYWN1dGUgcmlnaHQgTUNBIHRlcnJpdG9yeTwvcD48L2I+PHA+PGI+aW5mYXJjdCB3aXRoIGxpa2VseSBoYWVtb3JyaGFnaWMgdHJhbnNmb3JtYXRpb24uPC9wPjwvYj48cD48Yj5QYXJlbmNoeW1hbCBoYWVtb3JyaGFnZSBpcyBzZWVuIHBvb2xlZCBpbiB0aGUgcmlnaHQgYW50ZXJpb3I8L3A+PC9iPjxwPjxiPmZyb250YWwgbG9iZSBwYXJhIG1lZGlhbiBsb2NhdGlvbi9nZW51IG9mIGNvcnB1cyBjYWxsb3N1bSw8L3A+PC9iPjxwPjxiPmFzc29jaWF0ZWQgd2l0aCBtYXNzIGVmZmVjdCBhbmQgMS4zIGNtIHN1YmZhbGNpbmUgaGVybmlhdGlvbjwvcD48L2I+PHA+PGI+dG8gdGhlIGxlZnQuIEZ1cnRoZXIgYWN1dGUgc3ViYXJhY2hub2lkIGJsb29kIHNlZW4gaW4gdGhlPC9wPjwvYj48cD48Yj5hbnRlcmlvciBpbnRlcmhlbWlzcGhlcmljIGZpc3N1cmUgYmlsYXRlcmFsbHkuPC9wPjwvYj48cD48Yj5BIHNtYWxsIGFtb3VudCBvZiBibG9vZCBleHRlbmRzIHVuZGVyIHRoZSBmYWx4IGludG8gdGhlIGxlZnQ8L3A+PC9iPjxwPjxiPmFudGVyaW9yIHBhcmEgbWVkaWFuIGZyb250YWwgbG9iZS48L3A+PC9iPjxwPjxiPk5vIGNvbnZpbmNpbmcgZmxvdyBzZWVuIHdpdGhpbiB0aGUgcmlnaHQgQTIgc2VnbWVudCBvZiB0aGU8L3A+PC9iPjxwPjxiPkFDQTwvcD48L2I+PHA+PGI+PC9wPjwvYj48cD48Yj5UaGUgYWJvdmUtbWVudGlvbmVkIHBhcmVuY2h5bWFsIGhhZW1vcnJoYWdlIGV4dGVuZHMgaW50byB0aGU8L3A+PC9iPjxwPjxiPmZvcmFtZW4gb2YgTW9ucm9lLjwvcD48L2I+PHA+PGI+QXNzb2NpYXRlZCBlbnRyYXBtZW50IG9mIHRoZSBiaWxhdGVyYWwgZnJvbnRhbCBob3JuIGxhdGVyYWw8L3A+PC9iPjxwPjxiPnZlbnRyaWNsZXMsIHdpdGggYWN1dGUgaHlkcm9jZXBoYWx1cy48L3A+PC9iPjxwPjxiPlBvc3Rjb250cmFzdCwgbm8gY29udmluY2luZyBhbnRlcmlvciBjb21tdW5pY2F0aW5nIG9yIEFDQTwvcD48L2I+PHA+PGI+YW5ldXJ5c20gc2hvd24uPC9wPjwvYj48cD48Yj48L3A+PC9iPjxwPjxiPkNocm9uaWMgbGVmdCBQQ0EgdGVycml0b3J5IGluZmFyY3Qgd2l0aCBnbGlvc2lzIGFuZDwvcD48L2I+PHA+PGI+ZW5jZXBoYWxvbWFsYWNpYSBub3RlZC48L3A+PC9iPjxwPjxiPjwvcD48L2I+PHA+PGI+VGhlcmUgaXMgbWFya2VkIGxlZnQgdmVydGVicmFsIGFydGVyeSBjYWxjaWZpY2F0aW9uLjwvcD48L2I+PHA+PGI+TWFya2VkIHJlZHVjZWQgZmxvdyBpbiB0aGUgbW9zdCBkaXN0YWwgYXNwZWN0IG9mIHRoZSByaWdodDwvcD48L2I+PHA+PGI+dmVydGVicmFsIGFydGVyeS48L3A+PC9iPjxwPjxiPjwvcD48L2I+PHA+PGI+SW1wcmVzc2lvbjo8L3A+PC9iPjxwPjxiPjwvcD48L2I+PHA+PGI+RXh0ZW5zaXZlIHJpZ2h0IE1DQSB0ZXJyaXRvcnkgaW5mYXJjdCAvbWFsaWduYW50IE1DQTwvcD48L2I+PHA+PGI+aW5mYXJjdC48L3A+PC9iPjxwPjxiPkV4dGVuc2l2ZSByaWdodCBBQ0EgdGVycml0b3J5IGluZmFyY3Qgd2l0aCBoYWVtb3JyaGFnaWM8L3A+PC9iPjxwPjxiPnRyYW5zZm9ybWF0aW9uLiBIYWVtb3JyaGFnZSBleHRlbmRzIGludG8gdGhlIGZvcmFtZW4gb2Y8L3A+PC9iPjxwPjxiPk1vbnJvLjwvcD48L2I+PHA+PGI+U3ViYXJhY2hub2lkIGhhZW1vcnJoYWdlIGFyb3VuZCBhbnRlcmlvciBiaWxhdGVyYWw8L3A+PC9iPjxwPjxiPmludGVyaGVtaXNwaGVyaWMgZmlzc3VyZXMsIGFuZCBhcm91bmQgdGhlIGxlZnQgYW50ZXJpb3IgcGFyYTwvcD48L2I+PHA+PGI+bWVkaWFuIGZyb250YWwgbG9iZS48L3A+PC9iPjxwPjxiPkVudHJhcG1lbnQgb2YgYmlsYXRlcmFsIGFudGVyaW9yIGhvcm4gbGF0ZXJhbCB2ZW50cmljbGVzLjwvcD48L2I+PHA+PGI+QWN1dGUgaHlkcm9jZXBoYWx1cy48L3A+PC9iPjxwPjxiPlVyZ2VudCBuZXVyb3N1cmdpY2FsIGFzc2Vzc21lbnQgc3VnZ2VzdGVkLjwvcD48L2I+PHA+PGI+VGVhbSBpbmZvcm1lZCBieSB0ZWxlcGhvbmUuPC9wPjwvYj48cD48Yj48L3A+PC9iPjxwPjxiPjwvcD48L2I+PHA+PGI+QUMgLSBVcmdlbnQgRmluZGluZzogVXJnZW50IGNsaW5pY2FsIHJldmlldyBpcyBzdWdnZXN0ZWQgaW48L3A+PC9iPjxwPjxiPmxpZ2h0IG9mIHRoZSByYWRpb2xvZ2ljYWwgZmluZGluZ3MgYXMgZGV0YWlsZWQgaW4gdGhpczwvcD48L2I+PHA+PGI+cmVwb3J0LjwvcD48L2I+PHA+PGI+PC9wPjwvYj48cD48Yj4oQUMtQ1RBKSBUaGlzIGV4YW1pbmF0aW9uIGhhcyBiZWVuIHJlcXVlc3RlZCBieSB0aGU8L3A+PC9iPjxwPjxiPm5ldXJvc3VyZ2ljYWwgdGVhbSBpbiBMZWVkcy4gVGhlIGltYWdpbmcgd2lsbCBiZSB0cmFuc2ZlcnJlZDwvcD48L2I+PHA+PGI+dG8gdGhlaXIgUEFDUyBzeXN0ZW0gZm9yIGZvcm1hbCBuZXVyb3JhZGlvbG9naWNhbCByZXBvcnRpbmcuPC9wPjwvYj48cD48Yj48L3A+PC9iPjxwPjxiPlJlcG9ydGVkIEJ5OiBEciBCbG9nZ3MgQ29uc3VsdGFudCBSYWRpb2xvZ2lzdDwvcD48L2I+PHA+PGI+R01DNDU2MTIzNDwvcD48L2I+PHA+PGI+VmVyaWZpZWQgQnk6IERyIEJsb2dncyBDb25zdWx0YW50IFJhZGlvbG9naXN0PC9wPjwvYj48cD48Yj5HTUM0NTYxMjM0PC9wPjwvYj48cD48Yj5WZXJpZmljYXRpb24gRGF0ZTogMTQtSnVuLTIwMjEsIDExOjExPC9wPjwvYj48cD48Yj48L3A+PC9iPjxwPjxiPkNsaW5pY2FsIGluZGljYXRpb248L3A+PC9iPjxwPjxiPndlbnQgdG8gYmVkIG5vcm1hbGx5LCBmb3VuZCBpbiBzdGF0ZSBvZiBubyByZXNwb25zZSwgYW5kPC9wPjwvYj48cD48Yj5sZWZ0IHNpZGVkIHdlYWtuZXNzLCBoYXMgcmVkdWNlZCBHQ1MgMTEvMTUsIHN0cm9rZSByZXNwb25kZXI8L3A+PC9iPjxwPjxiPmF3YXJlPC9wPjwvYj48cD48Yj5EaWZmZXJlbnRpYWwgRGlhZ25vc2lzIDogc3Ryb2tlLDwvcD48L2I+PHA+PGI+PC9wPjwvYj48cD48Yj5SZXBvcnQgQm9keTwvcD48L2I+PHA+PGI+Q29ycmVsYXRlZCB3aXRoIHByZXZpb3VzIENUIG9mIDEyLzAxLzIwMTQuPC9wPjwvYj48cD48Yj48L3A+PC9iPjxwPjxiPlRoZXJlIGlzIGxvc3Mgb2YgdGhlIGdyZXktd2hpdGUgbWF0dGVyIGRpZmZlcmVudGlhdGlvbiBpbjwvcD48L2I+PHA+PGI+dGhlIGVudGlyZSByaWdodCBNQ0EgdGVycml0b3J5LjwvcD48L2I+PHA+PGI+QXNzb2NpYXRlZCByaWdodCBNQ0EgaHlwZXJkZW5zaXR5IHdpdGggcmVkdWNlZCBmbG93IG9uIENUPC9wPjwvYj48cD48Yj5hbmdpb2dyYXBoeS48L3A+PC9iPjxwPjxiPkZpbmRpbmdzIGFyZSBpbiBrZWVwaW5nIHdpdGggYW4gYWN1dGUgcmlnaHQgTUNBIGluZmFyY3QuPC9wPjwvYj48cD48Yj48L3A+PC9iPjxwPjxiPkluIHRoZSByaWdodCBBQ0EgdGVycml0b3J5LCB0aGVyZSBpcyBsb3NzIG9mIGdyZXktd2hpdGU8L3A+PC9iPjxwPjxiPm1hdHRlciBkaWZmZXJlbnRpYXRpb24gd2l0aCBwYXJlbmNoeW1hbCBoYWVtb3JyaGFnZS48L3A+PC9iPjxwPjxiPkZpbmRpbmdzIGFyZSBtb3N0IGluIGtlZXBpbmcgd2l0aCBhY3V0ZSByaWdodCBNQ0EgdGVycml0b3J5PC9wPjwvYj48cD48Yj5pbmZhcmN0IHdpdGggbGlrZWx5IGhhZW1vcnJoYWdpYyB0cmFuc2Zvcm1hdGlvbi48L3A+PC9iPjxwPjxiPlBhcmVuY2h5bWFsIGhhZW1vcnJoYWdlIGlzIHNlZW4gcG9vbGVkIGluIHRoZSByaWdodCBhbnRlcmlvcjwvcD48L2I+PHA+PGI+ZnJvbnRhbCBsb2JlIHBhcmEgbWVkaWFuIGxvY2F0aW9uL2dlbnUgb2YgY29ycHVzIGNhbGxvc3VtLDwvcD48L2I+PHA+PGI+YXNzb2NpYXRlZCB3aXRoIG1hc3MgZWZmZWN0IGFuZCAxLjMgY20gc3ViZmFsY2luZSBoZXJuaWF0aW9uPC9wPjwvYj48cD48Yj50byB0aGUgbGVmdC4gRnVydGhlciBhY3V0ZSBzdWJhcmFjaG5vaWQgYmxvb2Qgc2VlbiBpbiB0aGU8L3A+PC9iPjxwPjxiPmFudGVyaW9yIGludGVyaGVtaXNwaGVyaWMgZmlzc3VyZSBiaWxhdGVyYWxseS48L3A+PC9iPjxwPjxiPkEgc21hbGwgYW1vdW50IG9mIGJsb29kIGV4dGVuZHMgdW5kZXIgdGhlIGZhbHggaW50byB0aGUgbGVmdDwvcD48L2I+PHA+PGI+YW50ZXJpb3IgcGFyYSBtZWRpYW4gZnJvbnRhbCBsb2JlLjwvcD48L2I+PHA+PGI+Tm8gY29udmluY2luZyBmbG93IHNlZW4gd2l0aGluIHRoZSByaWdodCBBMiBzZWdtZW50IG9mIHRoZTwvcD48L2I+PHA+PGI+QUNBPC9wPjwvYj48cD48Yj48L3A+PC9iPjxwPjxiPlRoZSBhYm92ZS1tZW50aW9uZWQgcGFyZW5jaHltYWwgaGFlbW9ycmhhZ2UgZXh0ZW5kcyBpbnRvIHRoZTwvcD48L2I+PHA+PGI+Zm9yYW1lbiBvZiBNb25yb2UuPC9wPjwvYj48cD48Yj5Bc3NvY2lhdGVkIGVudHJhcG1lbnQgb2YgdGhlIGJpbGF0ZXJhbCBmcm9udGFsIGhvcm4gbGF0ZXJhbDwvcD48L2I+PHA+PGI+dmVudHJpY2xlcywgd2l0aCBhY3V0ZSBoeWRyb2NlcGhhbHVzLjwvcD48L2I+PHA+PGI+UG9zdGNvbnRyYXN0LCBubyBjb252aW5jaW5nIGFudGVyaW9yIGNvbW11bmljYXRpbmcgb3IgQUNBPC9wPjwvYj48cD48Yj5hbmV1cnlzbSBzaG93bi48L3A+PC9iPjxwPjxiPjwvcD48L2I+PHA+PGI+Q2hyb25pYyBsZWZ0IFBDQSB0ZXJyaXRvcnkgaW5mYXJjdCB3aXRoIGdsaW9zaXMgYW5kPC9wPjwvYj48cD48Yj5lbmNlcGhhbG9tYWxhY2lhIG5vdGVkLjwvcD48L2I+PHA+PGI+PC9wPjwvYj48cD48Yj5UaGVyZSBpcyBtYXJrZWQgbGVmdCB2ZXJ0ZWJyYWwgYXJ0ZXJ5IGNhbGNpZmljYXRpb24uPC9wPjwvYj48cD48Yj5NYXJrZWQgcmVkdWNlZCBmbG93IGluIHRoZSBtb3N0IGRpc3RhbCBhc3BlY3Qgb2YgdGhlIHJpZ2h0PC9wPjwvYj48cD48Yj52ZXJ0ZWJyYWwgYXJ0ZXJ5LjwvcD48L2I+PHA+PGI+PC9wPjwvYj48cD48Yj5JbXByZXNzaW9uOjwvcD48L2I+PHA+PGI+PC9wPjwvYj48cD48Yj5FeHRlbnNpdmUgcmlnaHQgTUNBIHRlcnJpdG9yeSBpbmZhcmN0IC9tYWxpZ25hbnQgTUNBPC9wPjwvYj48cD48Yj5pbmZhcmN0LjwvcD48L2I+PHA+PGI+RXh0ZW5zaXZlIHJpZ2h0IEFDQSB0ZXJyaXRvcnkgaW5mYXJjdCB3aXRoIGhhZW1vcnJoYWdpYzwvcD48L2I+PHA+PGI+dHJhbnNmb3JtYXRpb24uIEhhZW1vcnJoYWdlIGV4dGVuZHMgaW50byB0aGUgZm9yYW1lbiBvZjwvcD48L2I+PHA+PGI+TW9ucm8uPC9wPjwvYj48cD48Yj5TdWJhcmFjaG5vaWQgaGFlbW9ycmhhZ2UgYXJvdW5kIGFudGVyaW9yIGJpbGF0ZXJhbDwvcD48L2I+PHA+PGI+aW50ZXJoZW1pc3BoZXJpYyBmaXNzdXJlcywgYW5kIGFyb3VuZCB0aGUgbGVmdCBhbnRlcmlvciBwYXJhPC9wPjwvYj48cD48Yj5tZWRpYW4gZnJvbnRhbCBsb2JlLjwvcD48L2I+PHA+PGI+RW50cmFwbWVudCBvZiBiaWxhdGVyYWwgYW50ZXJpb3IgaG9ybiBsYXRlcmFsIHZlbnRyaWNsZXMuPC9wPjwvYj48cD48Yj5BY3V0ZSBoeWRyb2NlcGhhbHVzLjwvcD48L2I+PHA+PGI+VXJnZW50IG5ldXJvc3VyZ2ljYWwgYXNzZXNzbWVudCBzdWdnZXN0ZWQuPC9wPjwvYj48cD48Yj5UZWFtIGluZm9ybWVkIGJ5IHRlbGVwaG9uZS48L3A+PC9iPjxwPjxiPjwvcD48L2I+PHA+PGI+PC9wPjwvYj48cD48Yj5BQyAtIFVyZ2VudCBGaW5kaW5nOiBVcmdlbnQgY2xpbmljYWwgcmV2aWV3IGlzIHN1Z2dlc3RlZCBpbjwvcD48L2I+PHA+PGI+bGlnaHQgb2YgdGhlIHJhZGlvbG9naWNhbCBmaW5kaW5ncyBhcyBkZXRhaWxlZCBpbiB0aGlzPC9wPjwvYj48cD48Yj5yZXBvcnQuPC9wPjwvYj48cD48Yj48L3A+PC9iPjxwPjxiPihBQy1DVEEpIFRoaXMgZXhhbWluYXRpb24gaGFzIGJlZW4gcmVxdWVzdGVkIGJ5IHRoZTwvcD48L2I+PHA+PGI+bmV1cm9zdXJnaWNhbCB0ZWFtIGluIExlZWRzLiBUaGUgaW1hZ2luZyB3aWxsIGJlIHRyYW5zZmVycmVkPC9wPjwvYj48cD48Yj50byB0aGVpciBQQUNTIHN5c3RlbSBmb3IgZm9ybWFsIG5ldXJvcmFkaW9sb2dpY2FsIHJlcG9ydGluZy48L3A+PC9iPjxwPjxiPjwvcD48L2I+PHA+PGI+UmVwb3J0ZWQgQnk6IERyIEJsb2dncyBDb25zdWx0YW50IFJhZGlvbG9naXN0PC9wPjwvYj48cD48Yj5HTUM0NTYxMjM0PC9wPjwvYj48cD48Yj5WZXJpZmllZCBCeTogRHIgQmxvZ2dzIENvbnN1bHRhbnQgUmFkaW9sb2dpc3Q8L3A+PC9iPjxwPjxiPkdNQzQ1NjEyMzQ8L3A+PC9iPjxwPjxiPlZlcmlmaWNhdGlvbiBEYXRlOiAxNC1KYW4tMjAyMiwgMTE6MTE8L3A+PC9iPjxwPjxiPjwvcD48L2I+PHA+PGI+PC9wPjwvYj48L2Rpdj4="



