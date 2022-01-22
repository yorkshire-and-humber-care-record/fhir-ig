ValueSet: CareConnectResidentialStatus
Id: CareConnect-ResidentialStatus-1
Description: "A ValueSet that identifies the residential status of a patient."
* ^name = "Care Connect Residential Status"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* include codes from system CareConnect-ResidentialStatus-1

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ResidentialStatus-1"



CodeSystem: CareConnectResidentialStatus
Id: CareConnect-ResidentialStatus-1
Description: "A CodeSystem that identifies the residential status of a patient."
* ^name = "Care Connect Residential Status"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* ^caseSensitive = true
* ^content = #complete

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-ResidentialStatus-1"

* #H "UK Resident"
* #O "Overseas Resident"