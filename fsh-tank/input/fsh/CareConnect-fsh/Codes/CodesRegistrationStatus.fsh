ValueSet: CareConnectRegistrationStatus
Id: CareConnect-RegistrationStatus-1
Description: "A ValueSet that identifies the status of registration for a patient at the healthcare organisation."
* ^name = "Care Connect Registration Status"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* include codes from system CareConnect-RegistrationStatus-1

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-RegistrationStatus-1"



CodeSystem: CareConnectRegistrationStatus
Id: CareConnect-RegistrationStatus-1
Description: "A CodeSystem that identifies the status of registration for a patient at the healthcare organisation."
* ^name = "Care Connect Registration Status"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* ^caseSensitive = true
* ^content = #complete

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-RegistrationStatus-1"

* #A "Active"
* #D "Deduction Pending"
* #I "Inactive"
* #R "Registration Pending"