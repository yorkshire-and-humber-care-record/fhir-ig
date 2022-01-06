ValueSet: CareConnectReligiousAffiliation
Id: CareConnect-ReligiousAffiliation-1
Description: "A code from the SNOMED Clinical Terminology UK coding system that describes the religious or other belief system affiliation of a person. Any code from the SNOMED CT UK 'Religious Affiliation SnCT' subset with subset original id 10791000000130; the corresponding SNOMED CT UK Refset fully specified name is 'Religious or other belief system affiliation simple reference set (foundation metadata concept)' with Refset Id 999000531000000100."
* ^name = "Care Connect Religious Affiliation"
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ReligiousAffiliation-1"
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.2.1.3.2.4.16.21"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."
* include codes from system SNOMED_CT where concept in "999000531000000100"

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ReligiousAffiliation-1"