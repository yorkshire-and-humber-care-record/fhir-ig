ValueSet: InterweaveUkCoreProcedureCode
Id: Interweave-UkCoreCareProcedureCode
Description: "A set of codes that define a procedure or a procedure with explicit context. Selected from the SNOMED CT UK coding system. Pre-adoped from UKCore."
* ^name = "Interweave UkCore Procedure Code"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."

// This is the same as the upcoming UKCore value set for this field, which adds codes to the FHIR default list to cover social care
* include codes from system SNOMED_CT
    where constraint = "descendantOrSelfOf 71388002 OR descendantOrSelfOf 129125009"

// 71388002 = Procedure
// 129125009 =  Procedure with explicit context - NEW IN Uk Core, covers social care
