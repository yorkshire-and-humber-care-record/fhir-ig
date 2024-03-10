ValueSet: InterweaveObservationMethod
Id: Interweave-ObservationMethod
Description: "Defines the set of codes that can be used to indicate method used to obtain the observation."
* ^name = "Interweave Observation Method"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."

* include codes from system SNOMED_CT where concept is-a #386053000 // Patient evaluation procedure
* include codes from system SNOMED_CT where concept is-a #272394005 // Technique