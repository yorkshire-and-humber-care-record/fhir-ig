Profile: InterweavePractitioner
Parent: CareConnect-Practitioner-1
Id: Interweave-Practitioner
Description: "Interweave Practitioner resource profile."
* ^status = #draft

* insert Ruleset-InterweaveBaseFields

// Extension - NHS Communication
// Leave alone as optional. 
// In general it is assumed that the employing organisation will make any necessary provisions, and so largely not relevant for regional sharing


// Identifiers - mandatory to provide at least one identifier (but a lot of choice about which one!) 
* identifier 1..* MS
* identifier ^short = "A identifier for the person as this agent. Note that although CareConnect defines slices for SDS ids, use of other professional ids is also possible - see notes"
* identifier.system 1..1 MS
* identifier.value 1..1 MS

// Care Connect already defines slices for:
//   https://fhir.nhs.uk/Id/sds-user-id (SDS User Id)
//   https://fhir.nhs.uk/Id/sds-role-profile-id (SDS Role Profile Id)

// However these SDS ids are far from universally applicable.
// Therefore other valid and useful ids which could be used include:
// (It would be nice to update the slices to include these properly, but I can't work out how or if possible...)
//   https://fhir.hl7.org.uk/id/gmp-number (General Medical Practitioner)
//   https://fhir.hl7.org.uk/id/gmc-number (General Medical Council / Consultant Code)
//   https://fhir.hl7.org.uk/id/nmc-number (Nursing and Midwifery Council)
//   https://fhir.hl7.org.uk/id/gphc-number (General Pharmaceautical Council Code)
//   https://fhir.hl7.org.uk/id/hcpc-number (Health and Care Professional Council Code)

// Or failing any of these then as a last resort:
//   https://fhir.yhcr.nhs.uk/Id/local-practitioner-identifier


// Active:  Assumption is that it is "true" if not populated
// It is however important that both Providers and Consumers can handle appropriatly if "false"
// (Suggested good practice would just be to always populate it)
* active MS
* active ^short = "Whether this organization is still active - must be both populated and understood if 'false'"

// Name: Mandates that we want there to be exactly one name.
//   To some extent therefore the "use" is not so important
//   However here we also mandate at least a "family" name, plus note that given name, prefix and suffix must be supported if relevant
* name 1..1 MS
* name.family 1..1 MS
* name.given MS
* name.prefix MS
* name.suffix MS
* name.text ^short = "DISCOURAGED: Please do not rely on this. Providers might not populate and Consumers might not use. Instead display the name based on the detailed elements."


// Telcom: Leave as optional
// It is very useful to provide a contact phone number and/or email if at all possible – to enable further enquiries about any information seen.
// However care is needed, as these contact details may be widely seen throughout the region. 
* telecom ^short = "A contact detail for the practitioner (that apply to all roles). NB these contact details may be widely seen throughout the region. Only work details suitable for receiving external enquires should be included"

// Address: Discouraged
// Addresses should be provided instead on the relevant organisation / location records. 
// For the purposes of regional sharing then practitioner home addresses must NOT be shared.
* address ^short = "DISCOURAGED: Addresses should be provided instead on the relevant organisation / location records. For the purposes of regional sharing then practitioner home addresses should NOT be shared."

// Gender: Leave as optional
// Birth Date: Discouraged
* birthDate ^short = "DISCOURAGED: For the purposes of regional sharing then the birth date is not required - this is unnecessary personal information"

// Photo: At the present time then photos are NOT required. Excluded to avoid any complexities with sharing large image files
* photo 0..0

// Qualifications: (MS)
//   Identified as useful (in the absence of PractitionerRole) to undestand more about their status and skills.
//   (Envisaged however that it will often not be easy to include)
//   (Potentially more to do on refining the exact representation within)
* qualification MS
//The code is already mandatory in FHIR... but it could be just text. (If a code, then must be populated fully)
* qualification.code MS
* insert Ruleset-CodingWithSystemCodeDisplay(qualification.code)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Examples
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: InterweavePractitionerExample
InstanceOf: InterweavePractitioner
Description: "YHCInterweaveR Practitioner example"

* insert Ruleset-ExampleMetaForHospital(Practitioner)

// Text summary no longer needed
// (name.given + name.family)
//* extension[Extension-Interweave-TextSummary].valueString = "Jane Bloggs"

* identifier[0].system = "https://fhir.nhs.uk/Id/sds-user-id"
* identifier[0].value = "ABC123"

* active = true
* name[0].given[0] = "Jane"
* name[0].family = "Bloggs"
* name[0].prefix = "Dr"
* name[0].suffix = "RCOG"

* telecom[0].system = #phone "Phone"
* telecom[0].use = #work "Work"
* telecom[0].value = "01234 123412"

* qualification[0].code.text = "Membership of Royal College of General Practice"
