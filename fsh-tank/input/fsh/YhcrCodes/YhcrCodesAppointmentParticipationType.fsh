Alias: $ParticipationType = http://hl7.org/fhir/v3/ParticipationType

ValueSet: YhcrAppointmentParticipantType
Id: Yhcr-AppointmentParticipationType-1
Description: "This value set defines a set of codes that can be used to indicate how an individual participates in an appointment."

* include codes from valueset http://hl7.org/fhir/ValueSet/encounter-participant-type

// And now add the codes for "Subject" and "Location"
// These are also useful for an Appointment, where the "participant" field is very overloaded
* $ParticipationType#LOC
* $ParticipationType#SBJ