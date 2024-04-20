// This code list is based on CareConnect and the NHS Data Dictionary
// However the NHSDD has been updated since CareConnect was written - we therefore adopt the new and improved version

// Old list (used by Care Connect)  https://www.datadictionary.nhs.uk/attributes/source_of_admission.html
// New list  https://www.datadictionary.nhs.uk/attributes/admission_source.html 

ValueSet: InterweaveAdmissionSource
Id: Interweave-AdmissionSource-1
Description: "The source of admission to a Hospital Provider Spell or a Nursing Episode when the PATIENT is in a Hospital Site or a Care Home.

Please note that the NHS Data Dictionary national codes for [Source of Admission](https://www.datadictionary.nhs.uk/attributes/source_of_admission.html) has been replaced with [Admission Source](https://www.datadictionary.nhs.uk/attributes/admission_source.html). The current Valueset contains codes from both codesystems, however please use the new Interweave code system for new data provision projects."
* ^name = "Interweave Admission Source codes"

* include codes from system CareConnect-SourceOfAdmission-1
* include codes from system Interweave-AdmissionSource-1


CodeSystem: InterweaveAdmissionSource
Id: Interweave-AdmissionSource-1
Description: "The source of admission to a Hospital Provider Spell or a Nursing Episode when the PATIENT is in a Hospital Site or a Care Home."
* ^name = "Interweave Admission Source codes"
* ^content = #complete
* ^caseSensitive = true


* #19 "Usual place of residence unless listed below, for example, a private dwelling whether owner occupied or owned by Local Authority, housing association or other landlord. This includes wardened accommodation but not residential accommodation where health care is provided. It also includes PATIENTS with no fixed abode."

* #29 "Temporary place of residence when usually resident elsewhere (e.g. hotels, residential Educational Establishments)"

* #37	"Court"
* #40	"Penal establishment"
* #42	"Police Station / Police Custody Suite"

* #49	"NHS other Hospital Provider - high security psychiatric accommodation in an NHS Hospital Provider  (NHS Trust  or NHS Foundation Trust)"

* #51	"NHS other Hospital Provider - WARD for general PATIENTS or the younger physically disabled or Emergency Care Department"

* #52	"NHS other Hospital Provider - WARD for maternity PATIENTS or Neonates"

* #53	"NHS other Hospital Provider - WARD for PATIENTS who are mentally ill or have Learning Disabilities"

* #55	"Care Home Services with Nursing"
* #56	"Care Home Services without Nursing"
* #66	"Local Authority foster care"

* #79	"Babies born in or on the way to hospital"
* #87	"Independent Sector Healthcare Provider run hospital"
* #88	"Hospice"