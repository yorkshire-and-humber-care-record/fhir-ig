Profile: YhcrPractitioner
Parent: CareConnect-Practitioner-1
Id: Yhcr-Practitioner
Description: "YHCR Practitioner resource profile."

// Extension - NHS Communication
// Leave alone as optional. 
// In general it is assumed that the employing organisation will make any necessary provisions, and so largely not relevant for regional sharing

// Identifier (sdsUserId) - CareConnect already defines a special identifier for the SDS user id
// Must Support - if they have an SDS User Id. 
// (It is possible that there might be practiioners - in voluntary sector etc - who don't have one?)
* identifier[sdsUserID] 1..1 MS
* identifier[sdsUserID].system MS
* identifier[sdsUserID].value MS

// Identifier (SDS Role Profile Id) - **TODO** not sure exactly why this is also provided? Leave as optional for now
// Identifier (Local) - Optional. OK if useful to the Data Provider, but we don't really need it, given the SDS code 


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

// Qualifications: Leave as optional
// May be useful if known, but not essential for regional sharing. (Envisaged that it will often not be easy to include)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Examples
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Instance: YhcrPractitionerExample
InstanceOf: YhcrPractitioner
Description: "YHCR Practitioner example"

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

