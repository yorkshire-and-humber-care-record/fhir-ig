ValueSet: CareConnectReportCodeSnCT
Id: CareConnect-ReportCodeSnCT-1
Description: "A code from the SNOMED Clinical Terminology UK coding system that describes a diagnotic report"
* ^name = "Care Connect Report Code SnCT"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement."
* include codes from system SNOMED_CT
    where constraint = "(<<371525003 | Clinical procedure report (record artifact))"


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ReportCodeSnCT-1"
