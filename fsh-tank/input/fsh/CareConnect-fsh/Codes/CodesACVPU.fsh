ValueSet: CareConnectACVPU
Id: CareConnect-ACVPU-1
Description: "A code from the SNOMED Clinical Terminology UK coding system which describes whether a patient is mentally alert, unresponsive, responds to voice, responds to pain or is acutely confused."
* ^name = "Care Connect ACVPU"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."
* include codes from system SNOMED_CT
    where constraint = "(248234008 |Mentally alert| OR 300202002 |Responds to voice| OR 450847001 |Responds to pain| OR 422768004 |Unresponsive| 130987000 |Acute confusion|)"