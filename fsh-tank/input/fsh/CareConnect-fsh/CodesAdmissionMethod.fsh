ValueSet: NHSDataModelandDictionaryAdmissionMethod
Id: CareConnect-AdmissionMethod-1
Description: "The method of admission to a Hospital Provider Spell."
* ^name = "NHS Data Model and Dictionary Admission Method"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/valueset-sourceReference"
* ^extension.valueUri = "http://www.datadictionary.nhs.uk/data_dictionary/attributes/a/add/admission_method_de.asp?shownav=1"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* include codes from system CareConnect-AdmissionMethod-1

* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-AdmissionMethod-1"


CodeSystem: NHSDataModelandDictionaryAdmissionMethod
Id: CareConnect-AdmissionMethod-1
Description: "The method of admission to a Hospital Provider Spell."
* ^name = "NHS Data Model and Dictionary Admission Method"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/codesystem-sourceReference"
* ^extension.valueUri = "http://www.datadictionary.nhs.uk/data_dictionary/attributes/a/add/admission_method_de.asp?shownav=1"
* ^version = "1.1.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK"
* ^caseSensitive = true
* ^content = #complete
* #11 "Waiting list" "Elective Admission, when the Decision To Admit could be separated in time from the actual admission. Note that this does not include a transfer from another Hospital Provider (see 81)."
* #12 "Booked" "Elective Admission, when the Decision To Admit could be separated in time from the actual admission. Note that this does not include a transfer from another Hospital Provider (see 81)."
* #13 "Planned" "Elective Admission, when the Decision To Admit could be separated in time from the actual admission. Note that this does not include a transfer from another Hospital Provider (see 81)."
* #21 "Accident and emergency or dental casualty department of the Health Care Provider" "Emergency Admission, when admission is unpredictable and at short notice because of clinical need."
* #22 "General Practitioner: after a request for immediate admission has been made direct to a Hospital Provider, i.e. not through a Bed bureau, by a General Practitioner or deputy" "Emergency Admission, when admission is unpredictable and at short notice because of clinical need."
* #23 "Bed bureau" "Emergency Admission, when admission is unpredictable and at short notice because of clinical need."
* #24 "Consultant Clinic, of this or another Health Care Provider" "Emergency Admission, when admission is unpredictable and at short notice because of clinical need."
* #25 "Admission via Mental Health Crisis Resolution Team" "Emergency Admission, when admission is unpredictable and at short notice because of clinical need."
* #2A "Accident and Emergency Department of another provider where the Patient had not been admitted" "Emergency Admission, when admission is unpredictable and at short notice because of clinical need. Note - National Codes 2A, 2B, 2C and 2D have been introduced to replace National Code 28 'Other means'.  National Code 28 will be retired in the next version of the Commissioning Data Set."
* #2B "Transfer of an admitted Patient from another Hospital Provider in an emergency" "Emergency Admission, when admission is unpredictable and at short notice because of clinical need. Note - National Codes 2A, 2B, 2C and 2D have been introduced to replace National Code 28 'Other means'.  National Code 28 will be retired in the next version of the Commissioning Data Set."
* #2C "Baby born at home as intended" "Emergency Admission, when admission is unpredictable and at short notice because of clinical need. Note - National Codes 2A, 2B, 2C and 2D have been introduced to replace National Code 28 'Other means'.  National Code 28 will be retired in the next version of the Commissioning Data Set."
* #2D "Other emergency admission" "Emergency Admission, when admission is unpredictable and at short notice because of clinical need. Note - National Codes 2A, 2B, 2C and 2D have been introduced to replace National Code 28 'Other means'.  National Code 28 will be retired in the next version of the Commissioning Data Set."
* #28 "Other means" "Emergency Admission, when admission is unpredictable and at short notice because of clinical need. Note - National Code 28 is NOT valid for use in the Mental Health Services Data Set"
* #31 "Admitted ante-partum" "Maternity Admission, of a pregnant or recently pregnant woman to a maternity ward (including delivery facilities) except when the intention is to terminate the pregnancy."
* #32 "Admitted post-partum" "Maternity Admission, of a pregnant or recently pregnant woman to a maternity ward (including delivery facilities) except when the intention is to terminate the pregnancy."
* #82 "The birth of a baby in this Health Care Provider" "Other Admission not specified above"
* #83 "Baby born outside the Health Care Provider except when born at home as intended." "Other Admission not specified above"
* #81 "Transfer of any admitted Patient from other Hospital Provider other than in an emergency" "Other Admission not specified above"


* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-AdmissionMethod-1"