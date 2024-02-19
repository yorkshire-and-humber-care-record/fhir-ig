Profile: CareConnectQuestionnaireResponse1
Parent: QuestionnaireResponse
Id: CareConnect-QuestionnaireResponse-1
Description: "A structured set of questions and their answers. The questions are ordered and grouped into coherent subsets, corresponding to the structure of the grouping of the questionnaire being responded to."
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2019-05-16T11:02:47.121+01:00"
* ^publisher = "NHS Digital"
* ^contact.name = "Interoperability Team"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "interoperabilityteam@nhs.net"
* ^contact.telecom.use = #work
* ^purpose = "[NOT CURATED BY INTEROPEN see: http://www.interopen.org/careconnect-curation-methodology/]"
* ^copyright = "Copyright © 2019 HL7 UK"
* . ^comment = "The QuestionnaireResponse contains enough information about the questions asked and their organization that it can be interpreted somewhat independently from the Questionnaire it is based on.  I.e. You don't need access to the Questionnaire in order to extract basic information from a QuestionnaireResponse. For use with CareConnect."

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-QuestionnaireResponse-1"