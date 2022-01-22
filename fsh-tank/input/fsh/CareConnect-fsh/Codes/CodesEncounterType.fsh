ValueSet: CareConnectEncounterType
Id: CareConnect-EncounterType-1
Description: "A code from the SNOMED Clinical Terminology UK coding system that describes an encounter between a care professional and the patient (or patient's record)."
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."
* include codes from system SNOMED_CT where constraint = "<<185316007 OR <<308467007 OR <<185201007"

* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-EncounterType-1"