Extension: ExtensionCareConnectAllergyIntoleranceEnd1
Id: Extension-CareConnect-AllergyIntoleranceEnd-1
Description: "Supports the date and reason that the allergy was no longer valid."
* ^meta.lastUpdated = "2018-02-28T10:50:43.98+00:00"
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-AllergyIntoleranceEnd-1"
* ^version = "1.1.0"
* ^status = #draft
* ^date = "2018-11-05"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/"
* ^copyright = "Copyright © 2016 HL7 UK\r\n\r\nLicensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at\r\n\r\nhttp://www.apache.org/licenses/LICENSE-2.0\r\n\r\nUnless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.\r\n\r\nHL7® FHIR® standard Copyright © 2011+ HL7\r\n\r\nThe HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at\r\n\r\nhttps://www.hl7.org/fhir/license.html"
// * ^contextType = "resource"
// * ^context = "AllergyIntolerance"
// * . ^short = "Supports the date and reason that the allergy was no longer valid"
// * . ^definition = "Supports the date and reason that the allergy was no longer valid."
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    endDate 0..1 and
    reasonEnded 0..1
* extension[endDate] ^short = "The date the allergy or intolerance was recorded as no longer valid."
//* extension[endDate].valueDateTime contains valueDateTime 0..1
* extension[endDate].valueDateTime[valueDateTime] only dateTime
* extension[endDate].valueDateTime[valueDateTime] ^short = "The date the allergy was recorded as no longer valid"
* extension[endDate].valueDateTime[valueDateTime] ^definition = "The date the allergy was recorded as no longer valid."
* extension[reasonEnded] ^short = "The reason why the allergy or intolerance has been resolved."
//* extension[reasonEnded].valueString contains valueString 0..1
* extension[reasonEnded].valueString[valueString] only string
* extension[reasonEnded].valueString[valueString] ^short = "The reason why the allergy or intolerance has been resolved"
* extension[reasonEnded].valueString[valueString] ^definition = "The reason why the allergy or intolerance has been resolved."
//* value[x] only base64Binary or boolean or code or date or dateTime or decimal or id or instant or integer or markdown or oid or positiveInt or string or time or unsignedInt or uri or Address or Age or Annotation or Attachment or CodeableConcept or Coding or ContactPoint or Count or Distance or Duration or HumanName or Identifier or Money or Period or Quantity or Range or Ratio or Reference or SampledData or Signature or Timing

//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-AllergyIntoleranceEnd-1"