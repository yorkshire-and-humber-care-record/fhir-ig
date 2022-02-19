Profile: CareConnectTask1
Parent: Task
Id: CareConnect-Task-1
Description: "CareConnect-Task-1 profile"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2020-04-01T15:31:42.254+01:00"
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
* extension contains
    Extension-CareConnect-IncrementNumber-1 named incrementNumber 0..1 and
    Extension-CareConnect-FailsafeRuleVersion-1 named failsafeRuleVersion 0..1
* extension[failsafeRuleVersion] ^short = "Optional Extensions Element"
* extension[failsafeRuleVersion] ^definition = "Optional Extension Element - found in all resources."


//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Task-1"

