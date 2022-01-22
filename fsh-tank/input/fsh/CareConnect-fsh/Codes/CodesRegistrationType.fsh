ValueSet: CareConnectRegistrationType
Id: CareConnect-RegistrationType-1
Description: "A ValueSet that identifies the type of registration for a patient at a healthcare organisation."
* ^name = "Care Connect Registration Type"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* include codes from system CareConnect-RegistrationType-1

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-RegistrationType-1"



CodeSystem: CareConnectRegistrationType
Id: CareConnect-RegistrationType-1
Description: "A CodeSystem that identifies the type of registration for a patient at a healthcare organisation."
* ^name = "Care Connect Registration Type"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* ^caseSensitive = true
* ^content = #complete

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-RegistrationType-1"

* #R "Regular"
* #E "Emergency"
* #IN "Immediately necessary"
* #T "Temporary"
* #P "Private"
* #O "Other"
* #S "Synthetic Record"