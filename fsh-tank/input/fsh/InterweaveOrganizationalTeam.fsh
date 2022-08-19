Profile: InterweaveOrganizationalTeam
Parent: CareConnect-Organization-1
Id: Interweave-OrganizationalTeam
Description: "Interweave Organizational Team resource profile (modelled using FHIR Organization) - DRAFT"
* ^status = #active

* insert Ruleset-InterweaveBaseFields

// There are a couple of Care Connect extensions that we don't currently really need
* extension[Extension-CareConnect-MainLocation-1] 0..0
* extension[http://hl7.org/fhir/StructureDefinition/organization-period] 0..0
* identifier[odsOrganisationCode] 0..0 

// Identifier (Local) - A local business identifier. 
* insert Ruleset-AddLocalIdentifierOptional(organization)

// Active:  Mandatory flag to indicate whether or not the Organisational Team is active
* active 1..1 MS
* active ^short = "Whether this organizational team is active"

// Type 
* type 1..1 MS
* insert Ruleset-CodingWithSystemCodeDisplay(type)
* type ^short = "Default to Organizational team."
* type.coding.code = #team (exactly)
* type.coding.display = "Organizational team" (exactly)
* type.coding.system = "http://hl7.org/fhir/organization-type" (exactly)

// Name - make this mandatory, at a minimum we always want the organisational team name
* name 1..1 MS
* name ^short = "Name used for the organizational team."

// Alias - optional, but probably rarely used. One current name should be enough
* alias ^short = "A list of alternate names that the organizational team is known as, or was known as in the past"

// Telecom - Must Support - Vital Information to contact the team to find out information on a person's care
* telecom MS
* telecom ^short = "Contact details of the Organisational team. To be used for the practical purpose of getting in touch about a person’s care."

// Address - Optional, more important to supply contact information
* address ^short = "An address for the organizational team"

// PartOf Mandatory to supply a link to the parent Organisation e.g. the Local Authority
* partOf 1..1 MS
* partOf ^short = "The organization of which this organizational team forms a part"
* insert Ruleset-ReferenceWithReferenceAndDisplay(partOf)

//Contact removed to avoid confusion with Telecom
* contact 0..0

// Endpoint - removed. Technical endpoints are captured elsewhere (ie via the Participant Registry)
* endpoint 0..0



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Examples
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: InterweaveOrganizationalTeamExampleMS
InstanceOf: InterweaveOrganizationalTeam
Description: "Interweave Organizational Team example - Must Support"

* insert Ruleset-ExampleMetaForSocialCare(OrganizationalTeam)
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Organization-1"

* active = true

* type.coding =  http://hl7.org/fhir/organization-type#team "Organizational team"

* name = "The reablement team"

* telecom[0].system = #phone "Phone"
* telecom[0].value = "01234 567891"
* telecom[0].use = #work

* telecom[1].system = #email "Email"
* telecom[1].value = "reablement@lcc.gov.uk"

* partOf[0] = Reference(InterweaveOrganizationExampleSocialCare) 
* partOf[0].display = "Leeds City Council"

Instance: InterweaveOrganizationalTeamExampleFull
InstanceOf: InterweaveOrganizationalTeam
Description: "Interweave Organizational Team example - Full"

* insert Ruleset-ExampleMetaForSocialCare(OrganizationalTeam)
* meta.profile[1] = "https://fhir.hl7.org.uk/STU3/StructureDefinition/CareConnect-Organization-1"

* insert Ruleset-ExampleLocalId(OrganizationalTeam, XXX.OT-ABC123)

* active = true

* type.coding =  http://hl7.org/fhir/organization-type#team "Organizational team"

* name = "The reablement team"

* alias = "The A Team"

* telecom[0].system = #phone "Phone"
* telecom[0].value = "01234 567891"
* telecom[0].use = #work

* telecom[1].system = #email "Email"
* telecom[1].value = "reablement@lcc.gov.uk"

* address[0].line[0] = "Civic Hall"
* address[0].line[1] = "Calverley Street"
* address.city = "Leeds"
* address.postalCode = "LS1 1UR"

* partOf[0] = Reference(InterweaveOrganizationExampleSocialCare) 
* partOf[0].display = "Leeds City Council"

