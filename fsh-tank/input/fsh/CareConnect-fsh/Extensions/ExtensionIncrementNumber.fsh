Extension: ExtensionCareConnectIncrementNumber1
Id: Extension-CareConnect-IncrementNumber-1
Description: "An extension to the Task."
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2020-04-02T09:51:33.379+01:00"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^copyright = "Copyright © 2020 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"
//* ^contextType = "resource"
//* ^context = "Task"

* . ^short = "Task Extension"
* . ^definition = "Task Extension"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains incrementNumber 1..1
//* extension[incrementNumber].valueInteger contains valueInteger 0..1
* extension[incrementNumber].valueInteger[valueInteger] only integer
* extension[incrementNumber].valueInteger[valueInteger] ^short = "Value of extension IncrementNumber"
* extension[incrementNumber].valueInteger[valueInteger] ^definition = "Value of extension - IncrementNumber"

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-IncrementNumber-1"