Extension: ExtensionCareConnectEncounterTransport1
Id: Extension-CareConnect-EncounterTransport-1
Description: "An extension to the Encounter resource to include the Transport used by the subject for an encounter."
* ^meta.lastUpdated = "2017-08-25T14:38:34.782+01:00"
* ^version = "0.0.1"
* ^status = #draft
* ^date = "2017-07-11T09:46:04.4958234+01:00"
* ^publisher = "HL7 UK"
* ^copyright = "Copyright © 2016 HL7 UK\r\n\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"
* . ..1
* . ^short = "Encounter transport"
* . ^definition = "Encounter transport."
* . ^slicing.discriminator.type = #value
* . ^slicing.discriminator.path = "url"
* . ^slicing.rules = #open
* extension contains
    transportType 1..1 and
    transportPeriod 0..1 and
    reasonForTransport 0..1
* extension[transportType].valueCodeableConcept only CodeableConcept
* extension[transportType].valueCodeableConcept ^sliceName = "valueCodeableConcept"
* extension[transportType].valueCodeableConcept ^short = "Transport Type"
* extension[transportType].valueCodeableConcept ^definition = "Transport Type."
* extension[transportPeriod].valuePeriod only Period
* extension[transportPeriod].valuePeriod ^sliceName = "valuePeriod"
* extension[transportPeriod].valuePeriod ^short = "Transport Period"
* extension[transportPeriod].valuePeriod ^definition = "Transport Period."
* extension[reasonForTransport].valueString only string
* extension[reasonForTransport].valueString ^sliceName = "valueString"
* extension[reasonForTransport].valueString ^short = "Reason for transport"
* extension[reasonForTransport].valueString ^definition = "Reason for transport."

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-EncounterTransport-1"