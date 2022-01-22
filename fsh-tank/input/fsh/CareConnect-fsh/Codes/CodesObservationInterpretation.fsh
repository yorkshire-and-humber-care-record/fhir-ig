Alias: $v2-0078 = http://terminology.hl7.org/CodeSystem/v2-0078

ValueSet: CareConnectObservationInterpretation
Id: CareConnect-ObservationInterpretation-1
Description: "A ValueSet to identify the assessment made based on the result of the observation."
* ^name = "CareConnect Observation Interpretation"
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ObservationInterpretation-1"
* ^version = "1.0.0"
* ^status = #draft
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2021 HL7 UK"

* include codes from system CareConnect-ObservationInterpretation-1

* $v2-0078#< "Off scale low"
* $v2-0078#> "Off scale high"
* $v2-0078#A "Abnormal"
* $v2-0078#AA "Critically abnormal"
* $v2-0078#AC "Anti-complementary"
* $v2-0078#B "Better"
* $v2-0078#D "Significant change down"
* $v2-0078#DET "Detected"
* $v2-0078#H "High"
* $v2-0078#HH "Critically high"
* $v2-0078#HM "Hold for Medical Review"
* $v2-0078#HU "Very high"
* $v2-0078#I "Intermediate"
* $v2-0078#IE "Insufficient evidence"
* $v2-0078#IND "Indeterminate"
* $v2-0078#L "Low"
* $v2-0078#LL "Critically low"
* $v2-0078#LU "Very low"
* $v2-0078#MS "Moderately susceptible"
* $v2-0078#N "Normal"
* $v2-0078#ND "Not Detected"
* $v2-0078#NEG "Negative"
* $v2-0078#NR "Non-reactive"
* $v2-0078#NS "Non-susceptible"
* $v2-0078#null "No range defined, or normal ranges don't apply"
* $v2-0078#OBX "Interpretation qualifiers in separate OBX segments"
* $v2-0078#POS "Positive"
* $v2-0078#QCF "Quality Control Failure"
* $v2-0078#R "Resistant"
* $v2-0078#RR "Reactive"
* $v2-0078#S "Susceptible"
* $v2-0078#SDD "Susceptible-dose dependent"
* $v2-0078#SYN-R "Synergy - resistant"
* $v2-0078#SYN-S "Synergy - susceptible"
* $v2-0078#TOX "Cytotoxic substance present"
* $v2-0078#U "Significant change up"
* $v2-0078#VS "Very susceptible. Indicates for microbiology susceptibilities only."
* $v2-0078#W "Worse"
* $v2-0078#WR "Weakly reactive"

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-ObservationInterpretation-1"


CodeSystem: CareConnectObservationInterpretation
Id: CareConnect-ObservationInterpretation-1
Description: "A CodeSystem that identifies the assessment made based on the result of the observation. The code is taken from the oid 2.16.840.1.113883.2.1.3.2.4.17.304."
* ^name = "Care Connect Observation Interpretation"
* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-ObservationInterpretation-1"
* ^version = "1.0.0"
* ^status = #active
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2021 HL7 UK"
* ^caseSensitive = true
* ^content = #complete

* #PA "Potentially abnormal"

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-ObservationInterpretation-1"


