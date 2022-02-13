ValueSet: YhcrDocumentType
Id: Yhcr-DocumentType
Description: "A code from the SNOMED Clinical Terminology UK coding system that describes a clinical document type."
* ^name = "Yhcr Document Type"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."

// Care Connect uses 999000391000000109, but this doesn't seem to actaully have any members?!
// This alternative set of codes (EHR Composition Types) recommended by DADA
// (There is also recent good work by PRSB - should we be using that?? https://theprsb.org/standards/documentnaming/)
* include codes from system SNOMED_CT where concept in "24501000000105"
