//Alias: $Extension-CareConnect-DeliveryChannel-1 = https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-DeliveryChannel-1

Profile: CareConnectSlot1
Parent: Slot
Id: CareConnect-Slot-1
Description: "CareConnectSlot profile."
* ^version = "1.1.0"
* ^status = #draft
* ^date = "2018-09-27T15:22:34.763+01:00"
* ^publisher = "NHS Digital"
* ^contact.name = "Interoperability Team"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "interoperabilityteam@nhs.net"
* ^contact.telecom.use = #work
* ^purpose = "NOT CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/"
* ^copyright = "Copyright © 2020 NHS Digital"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains Extension-CareConnect-DeliveryChannel-1 named deliveryChannel 0..1
* extension[deliveryChannel] ^short = "An extension to record the delivery channel of a scheduled Appointment"
* extension[deliveryChannel] ^definition = "An extension to record the delivery channel of a scheduled Appointment."
* identifier 1..1

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Slot-1"