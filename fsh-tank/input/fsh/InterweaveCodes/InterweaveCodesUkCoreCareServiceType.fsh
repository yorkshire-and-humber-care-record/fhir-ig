ValueSet: InterweaveUkCoreCareServiceType
Id: Interweave-UkCoreCareServiceType
Description: "A code from the SNOMED Clinical Terminology UK coding system that describes a care setting. Pre-adoped from UKCore to use with EncounterType and AppointmentType."
* ^name = "Interweave UkCore Care Service Type"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."

// This is the same as the UKCore value set for this field, which is more relevant than the default FHIR example and also covers social care
// This is based on SNOMED 1127531000000102: Services Simple Reference Set
* include codes from system SNOMED_CT where concept in "1127531000000102"