Alias: $NullFlavor = http://hl7.org/fhir/v3/NullFlavor

ValueSet: CareConnectAllergyManifestation
Id: CareConnect-AllergyManifestation-1
Description: "A code from the SNOMED Clinical Terminology UK hierarchy with concept id '404684003' to record an allergy manifestation or a value from the HL7 FHIR nullFlavors code system."
* ^name = "Care Connect Allergy Manifestation"
* ^version = "1.2.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."
* include codes from system SNOMED_CT where concept in "404684003"
* include codes from system $NullFlavor
    where concept = "UNC" and
    concept = "ASKU" and
    concept = "NI"

* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-AllergyManifestation-1"