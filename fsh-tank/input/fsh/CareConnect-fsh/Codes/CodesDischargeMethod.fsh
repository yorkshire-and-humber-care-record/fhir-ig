ValueSet: NHSDataModelandDictionaryDischargeMethod
Id: CareConnect-DischargeMethod-1
Description: "The method of discharge from a Hospital Provider Spell."
* ^name = "NHS Data Model and Dictionary Discharge Method"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/valueset-sourceReference"
* ^extension.valueUri = "http://www.datadictionary.nhs.uk/data_dictionary/attributes/d/disc/discharge_method_de.asp?shownav=1"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* include codes from system CareConnect-DischargeMethod-1

* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-DischargeMethod-1"


CodeSystem: NHSDataModelandDictionaryDischargeMethod
Id: CareConnect-DischargeMethod-1
Description: "The method of discharge from a Hospital Provider Spell."
* ^name = "NHS Data Model and Dictionary Discharge Method"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/codesystem-sourceReference"
* ^extension.valueUri = "http://www.datadictionary.nhs.uk/data_dictionary/attributes/d/disc/discharge_method_de.asp?shownav=1"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* ^content = #complete
* #1 "Patient discharged on clinical advice or with clinical consent"
* #2 "Patient discharged him/herself or was discharged by a relative or advocate"
* #3 "Patient discharged by mental health review tribunal, Home Secretary or Court"
* #4 "Patient died"
* #5 "Stillbirth"
* #6 "Patient discharged him/herself" "National Codes 6 and 7 have been introduced for the Mental Health Services Data Set only to add further granularity to National Code 2. However, National Code 2 is still valid for the Mental Health Services Data Set where extra detail cannot be collected. National Codes 6 and 7 are NOT valid in any other data set including Commissioning Data Set version 6-2."
* #7 "Patient discharged by a relative or advocate" "National Codes 6 and 7 have been introduced for the Mental Health Services Data Set only to add further granularity to National Code 2. However, National Code 2 is still valid for the Mental Health Services Data Set where extra detail cannot be collected. National Codes 6 and 7 are NOT valid in any other data set including Commissioning Data Set version 6-2."


* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-DischargeMethod-1"