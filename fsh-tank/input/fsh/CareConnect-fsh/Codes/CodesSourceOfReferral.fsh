ValueSet: CareConnectSourceofReferral
Id: CareConnect-SourceOfReferral-1
Description: "A code from the SNOMED Clinical Terminology UK coding system that describes the source of the referral."
* ^name = "Care Connect Source of Referral"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."
* include codes from system SNOMED_CT where concept = "< 309013001 |Referred by person (finding)"
* include codes from system SNOMED_CT where concept = "< 306098008 |Self-referral (procedure)"

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-SourceOfReferral-1"

