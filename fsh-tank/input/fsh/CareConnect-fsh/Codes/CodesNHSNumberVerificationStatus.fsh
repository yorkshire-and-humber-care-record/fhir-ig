ValueSet: CareConnectNHSNumberVerificationStatus
Id: CareConnect-NHSNumberVerificationStatus-1
Description: "A ValueSet that identifies the trace status of the NHS number.  The CodeSystem is comprised of codes from the NHS Data Model and Dictionary: NHS Number Status Indicator Code."
* ^name = "Care Connect NHS Number Verification Status"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/valueset-sourceReference"
* ^extension.valueUri = "http://www.datadictionary.nhs.uk/data_dictionary/data_field_notes/n/nhs/nhs_number_status_indicator_code_de.asp?shownav=1"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.2.1.3.2.4.17.70"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* include codes from system CareConnect-NHSNumberVerificationStatus-1

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-NHSNumberVerificationStatus-1"




CodeSystem: CareConnectNHSNumberVerificationStatus
Id: CareConnect-NHSNumberVerificationStatus-1
Description: "A CodeSystem that identifies the trace status of the NHS number.  This CodeSystem is comprised of codes from the NHS Data Model and Dictionary: NHS Number Status Indicator Code."
* ^name = "Care Connect NHS Number Verification Status"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/codesystem-sourceReference"
* ^extension.valueUri = "http://www.datadictionary.nhs.uk/data_dictionary/data_field_notes/n/nhs/nhs_number_status_indicator_code_de.asp?shownav=1"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* ^caseSensitive = true
* ^content = #complete

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-NHSNumberVerificationStatus-1"

* #01 "Number present and verified"
* #02 "Number present but not traced"
* #03 "Trace required"
* #04 "Trace attempted - No match or multiple match found"
* #05 "Trace needs to be resolved - (NHS number or patient detail conflict)"
* #06 "Trace in progress"
* #07 "Number not present and trace not required"
* #08 "Trace postponed (baby under six weeks old)"