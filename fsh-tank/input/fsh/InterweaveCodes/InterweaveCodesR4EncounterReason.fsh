ValueSet: YhcrR4EncounterReason
Id: Yhcr-R4EncounterReason
Description: "Defines the set of codes that can be used to indicate reasons for an encounter. Pre-adopted from R4 to gain additional codes for Social Care and A&E."
* ^name = "Yhcr R4 Encounter Reason"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."

* include codes from system SNOMED_CT where concept is-a #404684003 // Clinical finding
* include codes from system SNOMED_CT where concept is-a #71388002  // Procedure
* include codes from system SNOMED_CT where concept is-a #243796009 // Context-dependent categories - NEW IN R4, covers social care
* include codes from system SNOMED_CT where concept is-a #272379006 // Events - NEW IN R4, covers A&E

