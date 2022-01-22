ValueSet: CareConnectConditionCategory
Id: CareConnect-ConditionCategory-1
Description: "A ValueSet to identify the category of a condition."
* ^name = "Care Connect Condition Category"
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ConditionCategory-1"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* include codes from system CareConnect-ConditionCategory-1

* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ConditionCategory-1"


CodeSystem: CareConnectConditionCategory
Id: CareConnect-ConditionCategory-1
Description: "A CodeSystem to identify the category of a condition."
* ^name = "Care Connect Condition Category"
* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-ConditionCategory-1"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* ^caseSensitive = true
* ^content = #complete
* #problem-list-item "Problem List Item" "An item on a problem list which can be managed over time and can be expressed by a practitioner (e.g. physician, nurse), patient, or related person."
* #encounter-diagnosis "Encounter Diagnosis" "A point in time diagnosis (e.g. from a physician or nurse) in context of an encounter."
* #presenting-complaint "Presenting Complaint"
* #co-morbidity "Co-morbidity"
* #issue "Issue"

* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-ConditionCategory-1"