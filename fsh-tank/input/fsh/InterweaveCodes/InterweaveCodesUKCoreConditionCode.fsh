ValueSet: InterweaveUkCoreConditionCode
Id: Interweave-UkCoreCareConditionCode
Description: "A set of codes that define a clinical finding or a finding with explicit context or an event. Selected from the SNOMED CT UK coding system. Pre-adoped from UKCore."
* ^name = "Interweave UkCore Condition Code"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."

// This is the same as the upcoming UKCore value set for this field, which adds codes to the FHIR default list to cover social care
* include codes from system SNOMED_CT
    where constraint = "descendantOf 404684003 OR descendantOf 413350009 OR descendantOf 272379006"

// 404684003 = Clinical finding
// 243796009 = Context-dependent categories - NEW IN Uk Core, covers social care
// 272379006 = Events - NEW IN UKCore, covers A&E