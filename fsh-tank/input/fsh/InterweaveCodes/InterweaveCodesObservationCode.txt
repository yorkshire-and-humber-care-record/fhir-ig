ValueSet: InterweaveObservationCode
Id: Interweave-ObservationCode
Description: "Defines the set of codes that can be used to indicate method used to obtain the observation."
* ^name = "Interweave Observation Code"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."

* include codes from system SNOMED_CT 
            where concept is-a #363788007 // observable entity