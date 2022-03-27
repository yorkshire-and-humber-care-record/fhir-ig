ValueSet: InterweaveSexualOrientation
Id: Interweave-SexualOrientation-1
Description: "Sexual Orientation, as per NHS Data Dictionary"
* ^name = "InterweaveSexualOrientation"
* include codes from system Interweave-SexualOrientation-1



CodeSystem: InterweaveSexualOrientation
Id: Interweave-SexualOrientation-1
Description: "Sexual Orientation, as per NHS Data Dictionary"
* ^name = "InterweaveSexualOrientation"
* ^content = #complete
* ^caseSensitive = true

// See https://www.datadictionary.nhs.uk/attributes/person_stated_sexual_orientation_code.html?hl=sexual%2Corientation 

* #1 "Heterosexual or Straight"
* #2 "Gay or Lesbian"
* #3 "Bisexual"
* #4 "Other sexual orientation not listed"
* #U "Person asked and does not know or is not sure"
* #Z "Not Stated (Person asked but declined to provide a response)"