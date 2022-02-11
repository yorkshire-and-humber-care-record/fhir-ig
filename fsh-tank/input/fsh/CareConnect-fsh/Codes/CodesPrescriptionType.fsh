ValueSet: CareConnectPrescriptionType
Id: CareConnect-PrescriptionType-1
Description: "A ValueSet to identify the type of prescription."
* ^name = "Care Connect Prescription Type"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* include codes from system CareConnect-PrescriptionType-1

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-PrescriptionType-1"



CodeSystem: CareConnectPrescriptionType
Id: CareConnect-PrescriptionType-1
Description: "A CodeSystem to identify the type of prescription"
* ^name = "Care Connect Prescription Type"
* ^version = "1.2.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* ^caseSensitive = true
* ^content = #complete

* #acute "Acute"
* #repeat "Repeat"
* #repeat-dispensing "Repeat dispensing"
* #delayed-prescribing "Delayed prescribing"

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-PrescriptionType-1"