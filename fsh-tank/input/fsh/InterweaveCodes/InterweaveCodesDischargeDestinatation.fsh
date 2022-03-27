// This code list is based on CareConnect and the NHS Data Dictionary
// However the NHSDD has been updated since CareConnect was written - we therefore adopt the new and improved version

// Old list (used by Care Connect)  https://www.datadictionary.nhs.uk/attributes/discharge_destination.html
// New list  https://www.datadictionary.nhs.uk/attributes/destination_of_discharge.html 

ValueSet: InterweaveDischargeDestination
Id: Interweave-DischargeDestination-1
Description: "The destination of a Patient on completion of a Hospital Provider Spell, or a note that the Patient died or was a still birth."
* ^name = "Interweave Discharge Destination codes"

* include codes from system Interweave-DischargeDestination-1


CodeSystem: InterweaveDischargeDestination
Id: Interweave-DischargeDestination-1
Description: "The destination of a Patient on completion of a Hospital Provider Spell, or a note that the Patient died or was a still birth."
* ^name = "Interweave Discharge Destination codes"
* ^content = #complete
* ^caseSensitive = true

* #19 "Usual place of residence unless listed below, for example, a private dwelling whether owner occupied or owned by Local Authority, housing association or other landlord. This includes wardened accommodation but not residential accommodation where health care is provided. It also includes Patients with no fixed abode."
* #29 "Temporary place of residence when usually resident elsewhere (e.g. hotels, residential Educational Establishment)"
* #30 "Repatriation from high security psychiatric accommodation in an NHS Hospital Provider (NHS Trust or NHS Foundation Trust)"
* #37 "Court"

* #38 "DEPRECATED: Penal establishment or police station" //See 40 and 42
* #40 "Penal establishment" //new
* #42 "Police Station / Police Custody Suite" //new

* #48 "High Security Psychiatric Hospital, Scotland"
* #49 "NHS other Hospital Provider - high security psychiatric accommodation"
* #50 "NHS other Hospital Provider - medium secure unit"
* #51 "NHS other Hospital Provider - Ward for general Patients or the younger physically disabled"
* #52 "NHS other Hospital Provider - Ward for maternity Patients or Neonates"
* #53 "NHS other Hospital Provider - Ward for Patients who are mentally ill or have Learning Disabilities"

// Care homes now split by whether or not they include Nursing, rather than who runs the care home 
// (as most care homes are now run by independant sector anyway)
* #54 "DEPRECATED: NHS run Care Home"
* #55 "Care Home With Nursing" //new
* #56 "Care Home Without Nursing" //new
* #65 "DEPRECATED: Local Authority residential accommodation i.e. where care is provided"
* #85 "DEPRECATED: Non-NHS (other than Local Authority) run Care Home"

* #66 "Local Authority foster care"
* #79 "Patient died or still birth" //updated
* #84 "Independent Sector Healthcare Provide run hospital - medium secure unit" //updated

* #87 "Independent Sector Healthcare Provider run hospital - excluding medium secure unit" //updated
* #88 "Hospice" //updated
* #89 "Organisation responsible for forced repatriation" //new