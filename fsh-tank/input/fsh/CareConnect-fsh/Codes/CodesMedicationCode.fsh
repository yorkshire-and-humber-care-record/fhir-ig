ValueSet: CareConnectMedicationCode
Id: CareConnect-MedicationCode-1
Description: "A code from the SNOMED Clinical Terminology UK coding system with the expression (^999000541000001108 |National Health Service dictionary of medicines and devices actual medicinal product simple reference set| OR ^999000551000001106 |National Health Service dictionary of medicines and devices actual medicinal product pack simple reference set| OR ^999000561000001109 |National Health Service dictionary of medicines and devices virtual medicinal product simple reference set| OR ^999000571000001104 |National Health Service dictionary of medicines and devices virtual medicinal product pack simple reference set| OR ^999000581000001102 |National Health Service dictionary of medicines and devices virtual therapeutic moiety simple reference set|). "
* ^name = "Care Connect Medication Code"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."
* include codes from system SNOMED_CT
    where constraint = "(^999000541000001108 |National Health Service dictionary of medicines and devices actual medicinal product simple reference set| OR ^999000551000001106 |National Health Service dictionary of medicines and devices actual medicinal product pack simple reference set| OR ^999000561000001109 |National Health Service dictionary of medicines and devices virtual medicinal product simple reference set| OR ^999000571000001104 |National Health Service dictionary of medicines and devices virtual medicinal product pack simple reference set| OR ^999000581000001102 |National Health Service dictionary of medicines and devices virtual therapeutic moiety simple reference set|)"

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-MedicationCode-1"
