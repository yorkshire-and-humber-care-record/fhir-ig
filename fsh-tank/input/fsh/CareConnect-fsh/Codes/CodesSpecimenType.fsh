ValueSet: CareConnectSpecimenType
Id: CareConnect-SpecimenType-1
Description: "A code from the SNOMED Clinical Terminology UK coding system to record a specimen type."
* ^name = "Care Connect Specimen Type"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."
* include codes from system SNOMED_CT
    where constraint = "(<105590001 |Substance (substance)|(in which case method and site should also be populated)OR <49755003 |Morphologically abnormal structure (morphologic abnormality)|OR < 260787004 |Physical object (physical object))"


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-SpecimenType-1"