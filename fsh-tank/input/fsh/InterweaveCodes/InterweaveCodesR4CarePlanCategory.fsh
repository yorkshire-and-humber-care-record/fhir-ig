ValueSet: InterweaveR4PCarePlanCategory
Id: Interweave-R4CarePlanCategory
Description: "Example codes indicating the category a care plan falls within.  Note that these are in no way complete and might not even be appropriate for some uses."
* ^name = "Interweave R4 CarePlan Category Code"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."

// R4 adds one more code to the standard FHIR STU3 list, to cater for social care
* include codes from system SNOMED_CT where concept is-a #734163000

