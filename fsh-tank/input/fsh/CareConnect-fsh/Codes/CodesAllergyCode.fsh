Alias: $NullFlavor = http://hl7.org/fhir/v3/NullFlavor

ValueSet: CareConnectAllergyCode
Id: CareConnect-AllergyCode-1
Description: "A code from the SNOMED Clinical Terminology UK with the expression (<105590001 |Substance OR <373873005 |Pharmaceutical / biologic product| OR <716186003 |No known allergy| OR 196461000000101 |Transfer-degraded drug allergy| OR 196471000000108 |Transfer-degraded non-drug allergy), or a code from the v3 Code System NullFlavor specifying why a valid value is not present."
* ^name = "Care Connect Allergy Code"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."
* include codes from system SNOMED_CT
    where constraint = "(<<105590001 |Substance OR <<373873005 |Pharmaceutical / biologic product| OR <<716186003 |No known allergy| OR 196461000000101 |Transfer-degraded drug allergy| OR 196471000000108 |Transfer-degraded non-drug allergy)"
* include codes from system $NullFlavor where concept = "NI"


* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-AllergyCode-1"