Extension: ExtensionCareConnectDeathNotificationStatus1
Id: Extension-CareConnect-DeathNotificationStatus-1
Description: "This extension is constrained to represent a patient's death notification (as held on Personal Demographics Service (PDS))."
* ^meta.lastUpdated = "2018-02-20T15:00:37.531+00:00"
* ^version = "1.1.0"
* ^status = #draft
* ^date = "2018-11-05"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/"
* ^copyright = "Copyright © 2016 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"
//* ^contextType = "resource"
//* ^context = "Patient"
* . ^short = "Representation of a patient's death notification status (as held on Personal Demographics Service (PDS))"
* . ^definition = "This extension is constrained to represent a patient's death notification (as held on Personal Demographics Service (PDS))."

//NB: Can't get this to build. But we don't even intend to use it! So just comment out.
// (Remember that we overcopy the original CareConnect defintions for the website anyway)

/**************************************
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    deathNotificationStatus 1..1 and
    systemEffectiveDate 0..1

* extension[deathNotificationStatus] ^short = "To identify the type of death notice as held on Personal Demographics Service (PDS)"
* extension[deathNotificationStatus] ^definition = "To identify the type of death notice as held on Personal Demographics Service (PDS)."
* extension[deathNotificationStatus].valueCodeableConcept contains valueCodeableConcept 1..1
* extension[deathNotificationStatus].valueCodeableConcept[valueCodeableConcept] only CodeableConcept
* extension[deathNotificationStatus].valueCodeableConcept[valueCodeableConcept] ^short = "To identify the type of death notice as held on Personal Demographics Service (PDS)"
* extension[deathNotificationStatus].valueCodeableConcept[valueCodeableConcept] ^definition = "To identify the type of death notice as held on Personal Demographics Service (PDS)."
* extension[deathNotificationStatus].valueCodeableConcept[valueCodeableConcept] ^binding.strength = #required
* extension[deathNotificationStatus].valueCodeableConcept[valueCodeableConcept] ^binding.description = "To identify the type of death notice as held on Personal Demographics Service (PDS)."
//TODO?
* extension[deathNotificationStatus].valueCodeableConcept[valueCodeableConcept] ^binding.valueSet = "https://fhir.hl7.org.uk/STU3/ValueSet/CareConnect-DeathNotificationStatus-1"
* extension[deathNotificationStatus].valueCodeableConcept[valueCodeableConcept].coding.system = "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-DeathNotificationStatus-1" (exactly)

* extension[systemEffectiveDate] ^short = "System effective date for the death notification status"
* extension[systemEffectiveDate] ^definition = "System effective date for the death notification status."
* extension[systemEffectiveDate].valueDateTime contains valueDateTime 0..1
* extension[systemEffectiveDate].valueDateTime[valueDateTime] only dateTime
* extension[systemEffectiveDate].valueDateTime[valueDateTime] ^short = "System effective date"
* extension[systemEffectiveDate].valueDateTime[valueDateTime] ^definition = "System effective date for the death notification status"

************************/

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-DeathNotificationStatus-1"