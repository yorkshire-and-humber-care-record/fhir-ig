Alias: $ParticipationType = http://hl7.org/fhir/v3/ParticipationType
Alias: $participant-type = http://hl7.org/fhir/participant-type

ValueSet: YhcrAppointmentParticipantType
Id: Yhcr-AppointmentParticipationType-1
Description: "This value set defines a set of codes that can be used to indicate how an individual participates in an appointment."

* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.840.1.113883.4.642.3.245"

* include codes from system $ParticipationType where concept is-a #_ParticipationAncillary
* $ParticipationType#SPRF
* $ParticipationType#PPRF
* $ParticipationType#PART
* include codes from system $participant-type
* exclude $ParticipationType#_ParticipationAncillary

// And now add the codes for "Subject" and "Location"
// These are also useful for an Appointment, where the "participant" field is very overloaded
* $ParticipationType#LOC
* $ParticipationType#SBJ