ValueSet: CareConnectDeathNotificationStatus
Id: CareConnect-DeathNotificationStatus-1
Description: "A ValueSet to identify the type of death notice as held on Personal Demographics Service (PDS)."
* ^name = "Care Connect Death Notification Status"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* include codes from system CareConnect-DeathNotificationStatus-1


* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-DeathNotificationStatus-1"



CodeSystem: CareConnectDeathNotificationStatus
Id: CareConnect-DeathNotificationStatus-1
Description: "A CodeSystem to identify the type of death notice as held on Personal Demographics Service (PDS)."
* ^name = "Care Connect Death Notification Status"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* ^caseSensitive = true
* ^content = #complete
* #1 "Informal - death notice received via an update from a local NHS Organisation such as GP or Trust"
* #2 "Formal - death notice received from Registrar of Deaths"
* #U "Removed"

* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-DeathNotificationStatus-1"