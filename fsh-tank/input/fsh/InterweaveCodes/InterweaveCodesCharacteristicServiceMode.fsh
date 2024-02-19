ValueSet: InterweaveCodesCharacteristicServiceMode
Id: Interweave-InterweaveCodesCharacteristicServiceMode-1
Description: "An example set of Service Modes that could be applicable to use to characterize HealthcareServices or PractitionerRoles."
* ^name = "InterweaveCodesCharacteristicServiceMode"

// Include the standard HL7 codes (which is a selection - replicate what the original ValueSet used here does)
* include codes from valueset http://hl7.org/fhir/ValueSet/service-mode