ValueSet: CareConnectReferralRequestMethod
Id: CareConnect-ReferralRequestMethod-1
Description: "A ValueSet to identify the form in which a referral is sent and received."
* ^name = "Care Connect Referral Request Method"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2019 HL7 UK"
* include codes from system CareConnect-ReferralRequestMethod-1

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ReferralRequestMethod-1"


CodeSystem: CareConnectReferralRequestMethod
Id: CareConnect-ReferralRequestMethod-1
Description: "A CodeSystem to identify the form in which a referral is sent and received."
* ^name = "Care Connect Referral Request Method"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2019 HL7 UK"
* ^caseSensitive = true
* ^content = #complete
* #1 "Fax"
* #2 "Phone"
* #3 "Secure Messaging"
* #4 "Secure Email"
* #5 "Letter"
* #6 "NHS E-Referral Service"
* #7 "Self Referral"

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-ReferralRequestMethod-1"

