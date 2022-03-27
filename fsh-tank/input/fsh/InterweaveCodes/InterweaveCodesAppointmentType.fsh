ValueSet: InterweaveAppointmentType
Id: Interweave-AppointmentType-1
Description: "Appointment Type codes"
* ^name = "InterweaveAppointmentType"

// Include the standard HL7 codes
* include codes from valueset http://hl7.org/fhir/ValueSet/v2-0276

// And add some of our own
* include codes from system Interweave-AppointmentType-1



CodeSystem: InterweaveAppointmentType
Id: Interweave-AppointmentType-1
Description: "Additional Appointment Type codes"
* ^name = "InterweaveAppointmentType"
* ^content = #complete
* ^caseSensitive = true

* #URGENT "Urgent appointment"