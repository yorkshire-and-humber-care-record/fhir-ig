Extension: ExtensionCareConnectMedicationRepeatInformation1
Id: Extension-CareConnect-MedicationRepeatInformation-1
Description: "Indicates the specific repeat information of a medication item."
* ^meta.lastUpdated = "2018-03-06T09:11:13.51+00:00"
* ^version = "1.2.0"
* ^status = #draft
* ^date = "2019-11-22"
* ^publisher = "HL7 UK"
* ^contact.name = "INTEROPen"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "admin@interopen.org"
* ^contact.telecom.use = #work
* ^purpose = "CURATED BY INTEROPen see: http://www.interopen.org/careconnect-curation-methodology/"
* ^copyright = "Copyright © 2019 HL7 UK  Licensed under the Apache License, Version 2.0 (the \"License\"); you may not use this file except in compliance with the License. You may obtain a copy of the License at  http://www.apache.org/licenses/LICENSE-2.0  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.  HL7® FHIR® standard Copyright © 2011+ HL7  The HL7® FHIR® standard is used under the FHIR license. You may obtain a copy of the FHIR license at  https://www.hl7.org/fhir/license.html"
//* ^contextType = "resource"
//* ^context = "MedicationRequest"
* . ..1
* . ^short = "Medication repeat information"
* . ^definition = "Medication repeat information."
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    numberOfRepeatPrescriptionsAllowed 0..1 and
    numberOfRepeatPrescriptionsIssued 0..1 and
    authorisationExpiryDate 0..1
* extension[numberOfRepeatPrescriptionsAllowed] ^short = "Number of repeat prescriptions authorised"
* extension[numberOfRepeatPrescriptionsAllowed] ^definition = "Number of repeat prescriptions authorised."
//* extension[numberOfRepeatPrescriptionsAllowed].valueUnsignedInt contains valueUnsignedInt 1..1
* extension[numberOfRepeatPrescriptionsAllowed].valueUnsignedInt[valueUnsignedInt] only unsignedInt
* extension[numberOfRepeatPrescriptionsAllowed].valueUnsignedInt[valueUnsignedInt] ^short = "Number of issues authorised"
* extension[numberOfRepeatPrescriptionsAllowed].valueUnsignedInt[valueUnsignedInt] ^definition = "Number of issues authorised."
* extension[numberOfRepeatPrescriptionsIssued] ^short = "Number of repeat prescriptions issued"
* extension[numberOfRepeatPrescriptionsIssued] ^definition = "Number of repeat prescriptions issued."
//* extension[numberOfRepeatPrescriptionsIssued].valueUnsignedInt contains valueUnsignedInt 0..1
* extension[numberOfRepeatPrescriptionsIssued].valueUnsignedInt[valueUnsignedInt] only unsignedInt
* extension[numberOfRepeatPrescriptionsIssued].valueUnsignedInt[valueUnsignedInt] ^short = "Number of issues issued"
* extension[numberOfRepeatPrescriptionsIssued].valueUnsignedInt[valueUnsignedInt] ^definition = "Number of issues issued."
* extension[authorisationExpiryDate] ^short = "Repeat prescription review date"
* extension[authorisationExpiryDate] ^definition = "Repeat prescription review date."
//* extension[authorisationExpiryDate].valueDateTime contains valueDateTime 0..1
* extension[authorisationExpiryDate].valueDateTime[valueDateTime] only dateTime
* extension[authorisationExpiryDate].valueDateTime[valueDateTime] ^short = "Repeat review date"
* extension[authorisationExpiryDate].valueDateTime[valueDateTime] ^definition = "Repeat review date."



//Add correct Care Connect URL
* ^url = "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-MedicationRepeatInformation-1"