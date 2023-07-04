ValueSet: InterweaveEDDischargeDestination
Id: Interweave-EDDischargeDestination
Description: "Defines the set of codes that can be used to recording the discharge destination of patients which have attended ED."
* ^name = "Interweave ED Discharge Destination"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."

* include codes from system SNOMED_CT 
            where concept is-a #999003011000000105 // Emergency Care Discharge Destination