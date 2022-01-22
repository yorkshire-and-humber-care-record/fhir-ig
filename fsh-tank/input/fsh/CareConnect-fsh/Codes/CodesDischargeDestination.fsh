ValueSet: NHSDataModelandDictionaryDischargeDestination
Id: CareConnect-DischargeDestination-1
Description: "The destination of a Patient on completion of a Hospital Provider Spell, or a note that the Patient died or was a still birth."
* ^name = "NHS Data Model and Dictionary Discharge Destination"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/valueset-sourceReference"
* ^extension.valueUri = "http://www.datadictionary.nhs.uk/data_dictionary/attributes/d/disc/discharge_destination_de.asp?shownav=1"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* include codes from system CareConnect-DischargeDestination-1

* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-DischargeDestination-1"



CodeSystem: NHSDataModelandDictionaryDischargeDestination
Id: CareConnect-DischargeDestination-1
Description: "The destination of a Patient on completion of a Hospital Provider Spell, or a note that the Patient died or was a still birth."
* ^name = "NHS Data Model and Dictionary Discharge Destination"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/codesystem-sourceReference"
* ^extension.valueUri = "http://www.datadictionary.nhs.uk/data_dictionary/attributes/d/disc/discharge_destination_de.asp?shownav=1"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* ^content = #complete

* #19 "Usual place of residence unless listed below, for example, a private dwelling whether owner occupied or owned by Local Authority, housing association or other landlord. This includes wardened accommodation but not residential accommodation where health care is provided. It also includes Patients with no fixed abode."
* #29 "Temporary place of residence when usually resident elsewhere (e.g. hotels, residential Educational Establishment)"
* #30 "Repatriation from high security psychiatric accommodation in an NHS Hospital Provider (NHS Trust or NHS Foundation Trust)"
* #37 "Court"
* #38 "Penal establishment or police station"
* #48 "High Security Psychiatric Hospital, Scotland"
* #49 "NHS other Hospital Provider - high security psychiatric accommodation"
* #50 "NHS other Hospital Provider - medium secure unit"
* #51 "NHS other Hospital Provider - Ward for general Patients or the younger physically disabled"
* #52 "NHS other Hospital Provider - Ward for maternity Patients or Neonates"
* #53 "NHS other Hospital Provider - Ward for Patients who are mentally ill or have Learning Disabilities"
* #54 "NHS run Care Home"
* #65 "Local Authority residential accommodation i.e. where care is provided"
* #66 "Local Authority foster care"
* #79 "Not applicable - Patient died or still birth"
* #84 "Non-NHS run hospital - medium secure unit"
* #85 "Non-NHS (other than Local Authority) run Care Home"
* #87 "Non NHS run hospital"
* #88 "Non-NHS (other than Local Authority) run Hospice"

* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-DischargeDestination-1"