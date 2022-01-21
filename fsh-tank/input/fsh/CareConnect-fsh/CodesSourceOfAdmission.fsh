Alias: $CareConnect-SourceOfAdmission-1 = https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-SourceOfAdmission-1

ValueSet: NHSDataModelandDictionarySourceOfAdmission
Id: CareConnect-SourceOfAdmission-1
Description: "The source of admission to a Hospital Provider Spell or a Nursing Episode when the Patient is in a Hospital Site or a Care Home."
* ^name = "NHS Data Model and Dictionary Source Of Admission"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/valueset-sourceReference"
* ^extension.valueUri = "http://www.datadictionary.nhs.uk/data_dictionary/attributes/s/smo/source_of_admission_de.asp?shownav=1"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* include codes from system CareConnect-SourceOfAdmission-1

* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-SourceOfAdmission-1"



CodeSystem: NHSDataModelandDictionarySourceOfAdmission
Id: CareConnect-SourceOfAdmission-1
Description: "The source of admission to a Hospital Provider Spell or a Nursing Episode when the Patient is in a Hospital Site or a Care Home."
* ^name = "NHS Data Model and Dictionary Source Of Admission"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/codesystem-sourceReference"
* ^extension.valueUri = "http://www.datadictionary.nhs.uk/data_dictionary/attributes/s/smo/source_of_admission_de.asp?shownav=1"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* ^content = #complete
* #19 "Usual place of residence unless listed below, for example, a private dwelling whether owner occupied or owned by Local Authority, housing association or other landlord. This includes wardened accommodation but not residential accommodation where health care is provided. It also includes Patients with no fixed abode."
* #29 "Temporary place of residence when usually resident elsewhere (e.g. hotels, residential Educational Establishments)"
* #39 "Penal establishment, Court, or Police Station / Police Custody Suite"
* #49 "NHS other Hospital Provider - high security psychiatric accommodation in an NHS Hospital Provider (NHS Trust or NHS Foundation Trust)"
* #51 "NHS other Hospital Provider - Ward for general Patients or the younger physically disabled or A and E department" "National Code 51 'NHS other hospital provider - Ward for general Patients or the younger physically disabled or A and E department' should not be used if the Patient arrives at an Accident and Emergency Department and is admitted to the same Hospital Provider."
* #52 "NHS other Hospital Provider - Ward for maternity Patients or Neonates"
* #53 "NHS other Hospital Provider - Ward for Patients who are mentally ill or have Learning Disabilities"
* #54 "NHS run Care Home"
* #65 "Local Authority residential accommodation i.e. where care is provided"
* #66 "Local Authority foster care"
* #79 "Babies born in or on the way to hospital"
* #85 "Non-NHS (other than Local Authority) run Care Home"
* #87 "Non NHS run hospital"
* #88 "Non-NHS (other than Local Authority) run Hospice"

* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-SourceOfAdmission-1"