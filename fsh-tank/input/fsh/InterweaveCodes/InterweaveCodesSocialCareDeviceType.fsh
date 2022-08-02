ValueSet: InterweaveSocialCareDeviceType
Id: Interweave-SocialCareDeviceType
Description: "Defines the set of codes that can be used to identify the type of device/equipment which has been placed with a person."
* ^name = "Interweave Social Care Device Type"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."

* include codes from system SNOMED_CT where concept is-a #272243001 // Support Equipment
* include codes from system SNOMED_CT where concept is-a #390296002  // Assistive Equipment
* include codes from system SNOMED_CT where concept is-a #183135000 // Equipment to Aid Mobility


