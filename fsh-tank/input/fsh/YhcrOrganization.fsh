Profile: YhcrOrganization
Parent: CareConnect-Organization-1
Id: Yhcr-Organization
Description: "YHCR Organization resource profile."


// There are a couple of Care Connect extensions that we don't currently really need
* extension[Extension-CareConnect-MainLocation-1] ^short = "DISCOURAGED"
* extension[http://hl7.org/fhir/StructureDefinition/organization-period] ^short = "DISCOURAGED"

// Identifier (ODS) - CareConnect already defines a special identifier for ODS Code
// Let's be bold and say this is mandatory. To identify the organisation and tie in with regional master data downloaded from ODS
// (All organisations involved in care really should have an ODS code. Reconsider if something unforeseen turns up later)
* identifier[odsOrganisationCode] 1..1 MS
* identifier[odsOrganisationCode].system MS
* identifier[odsOrganisationCode].value MS

// Identifier (ODS Site Code) - **TODO** not sure exactly why this is also provided? Leave as optional for now
// Identifier (Local) - Optional. OK if useful to the Data Provider, but we don't really need it, given the ODS code 


// Active:  Assumption is that it is "true" if not populated
// It is however important that both Providers and Consumers can handle appropriatly if "false"
// (Suggested good practice would just be to always populate it)
* active MS
* active ^short = "Whether this organization is still active - must be both populated and understood if 'false'"

// Type - useful, to identify the type of location
// TODO - the code list can cover "Healthcare Provider", "Government", and "Other". So it should always be possible to populate,
//    but... it does not seem all that useful. Is there a better list we could use?
//    (Do we even REALLY need this type field? Or... would text be OK?. So leave the detail of how it is populated optional for now)
//    (But... for now fix the valueset, as we definately don't want other random codes) 
// *** What we want is the list from this dropdown! https://odsportal.digital.nhs.uk/Organisation/Search ***
// *** Could then potentially make it mandatory?
* type 0..1 MS
* type.coding ^short = "TBC: is there a better list of codes that could be used?"
* type from http://hl7.org/fhir/ValueSet/organization-type (required)


// Name - already mandatory in Care Connect
* name 1..1 MS
// Alias - optional, but probably rarely used. One current name should be enough

// Telecom - optional, probably not that useful in practice
* telecom ^short = "Contact details of the location. (However contact details of Locations and Practitioners are probably more useful)."

// Address - useful and probably easy to populate. (However is also available from regional master record downloaded from ODS)
* address 1..1 MS
* address.line MS
* address.city MS
* address.district MS
* address.postalCode MS
* address.use ^short = "DISCOURAGED: Not really relevant here - it is just the current address of the location."
* address.text ^short = "DISCOURAGED: Please do not rely on this. Providers might not populate and Consumers might not use. Instead display the address based on the detailed elements."
* address.period ^short = "DISCOURAGED: Preferably just relevant current details"

// PartOf and Contact - not currently needed
* partOf ^short = "DISCOURAGED: Currently require just top-level organisation identifiers - not attempting to build organisation tree"
* contact ^short = "DISCOURAGED: Not currently needed. Contact details of Locations and Practitioners are probably more useful"

// Endpoint - removed. Technical endpoints are captured elsewhere (ie via the Participant Registry)
* endpoint 0..0



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Examples
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: YhcrOrganizationExample
InstanceOf: YhcrOrganization
Description: "YHCR Organization example"

* identifier[0].system = "https://fhir.nhs.uk/Id/ods-organization-code"
* identifier[0].value = "RCB"

* active = true
* name = "York and Scarborough Teaching Hospitals NHS Foundation Trust"
* type.coding = http://hl7.org/fhir/organization-type#prov "Healthcare Provider"
* type.text = "TODO - this is not a good example, need to confirm a better code list"

* address[0].line[0] = "York Hospital"
* address[0].line[1] = "Wigginton Road"
* address.city = "York"
* address.postalCode = "YO31 8HE"

