ValueSet: CareConnectTreatmentCategory
Id: CareConnect-TreatmentCategory-1
Description: "A ValueSet that identifies the treatment category for this patient."
* ^name = "Care Connect Treatment Category"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* include codes from system CareConnect-TreatmentCategory-1

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-TreatmentCategory-1"





CodeSystem: CareConnectTreatmentCategory
Id: CareConnect-TreatmentCategory-1
Description: "A CodeSystem that identifies the treatment category for this patient."
* ^name = "Care Connect Treatment Category"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* ^caseSensitive = true
* ^content = #complete

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-TreatmentCategory-1"

* #1 "Exempt from payment - subject to reciprocal health agreement"
* #2 "Exempt from payment - other"
* #3 "To pay hotel fees only"
* #4 "To pay all fees"
* #9 "Charging rate not known"
* #8 "Not applicable" "Not an Overseas Visitor"