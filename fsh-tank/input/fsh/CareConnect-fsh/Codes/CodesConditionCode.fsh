ValueSet: CareConnectConditionCode
Id: CareConnect-ConditionCode-1
Description: "A code from the SNOMED Clinical Terminology UK with the expression (< 404684003 |Clinical finding| OR < 413350009 |Finding with explicit context| OR < 272379006 |Event|)."
* ^name = "Care Connect Condition Code"
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ConditionCode-1"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."
* include codes from system SNOMED_CT
    where constraint = "(< 404684003 |Clinical finding| OR < 413350009 |Finding with explicit context| OR < 272379006 |Event|)"

* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ConditionCode-1"