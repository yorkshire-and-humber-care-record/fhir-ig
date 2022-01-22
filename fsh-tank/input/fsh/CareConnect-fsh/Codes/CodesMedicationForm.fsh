ValueSet: CareConnectMedicationForm
Id: CareConnect-MedicationForm-1
Description: "A code from the SNOMED Clinical Terminology UK coding system that describes a medication dose form. These will form part of the NHS dm+d. Any code from the SNOMED CT UK 'NHS dm+d Dose Form' subset with subset original id 837201000001137; the corresponding SNOMED CT UK Refset fully specified name is 'National Health Service dictionary of medicines and devices dose form simple reference set (foundation metadata concept)' with Refset Id 999000781000001107."
* ^name = "Care Connect Medication Form"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."
* include codes from system SNOMED_CT
    where constraint = "^999000781000001107 |NHS dm+d (dictionary of medicines and devices) dose form simple reference set|"


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-MedicationForm-1"