Profile: InterweaveLocation
Parent: CareConnect-Location-1
Id: Interweave-Location
Description: "Interweave Location resource profile."
* ^status = #active

* insert Ruleset-InterweaveBaseFields

// Identifier (ODS) - CareConnect already defines a special identifier for ODS Site Code
// Optional - as some locations are not part of an ODS Site (eg patient's house). 
// And not all sites are ODS registed, especially in community / social care.
// But useful if applicable - to help formally identify the site.
/////* identifier[odsSiteCode] MS (no longer must support, as only quite rarely relevant)
* identifier[odsSiteCode] ^short = "ODS Site code to identify the organisation at site level. Should be provided for locations that have one"
* identifier[odsSiteCode].system MS
* identifier[odsSiteCode].value MS

// Identifier (Local) - A local business identifier, over-and-above the name. 
// Must Support - to assist with more definately identifying the location
* insert Ruleset-AddLocalIdentifierMS(location)


// Should normally be “active”, and only active locations should be used in new references.
// However it may be necessary to retain locations at other statuses (eg inactive) if they have already been used in references
* status 1..1 MS

// Operational Status - we do not need this level of operational detail
* operationalStatus ^short = "DISCOURAGED - this level of operational detail may be difficult to keep up-to-date and is not necessary for regional sharing"


// Name - mandatory, we do need to know what the location is called.
//     A short name for the location. eg “Ward 27” 
//     For a house it could be “Patient’s home”, “Foster home”, etc
* name 1..1 MS
* name ^short = "Name of the location as used by humans. Does not need to be unique, but preferably incorporates any hierarchy for more meaningful display. Eg 'Green Road Hospital, Ward 27, Room 5"

// Alias - optional, but probably rarely used. One current name should be enough
// Description - optional. Could be useful to describe further, eg about the types of care typically performed there.

// Mode - always "instance" if provided. (OK to leave it out, in which case that is what will be assumed)
* mode = http://hl7.org/fhir/location-mode#instance "Instance" (exactly)
* mode ^short = "Always a specific instance of a location (not a generic class of location). Assume 'instance' if missing"

// Type - mandatory, as we always want to know what type of location it is - as useful to help understand why the patient may have been going there.
// The standard code list has some very generic entries eg "Hospital", "Community Location", "Community Service Centre", "Patient's Residence"
// which should cover most eventualities at a high level, plus some much more useful and preferable specific entries focused on healthcare.
// So in order of preference we would get:
// 1) An existing specific entry from the list 
// 2) A new specific entry which we curate regionally and add to the list (ie by request, eg to improve the list for social care)
// 3) A generic entry from the list, plus a more descriptive "text" entry
// 4) Just text (still useful as the main purpose of this field is likely to be informing Direct Care)
* type 1..1 MS 
//(Retain optionality about whether code or text is provided)
// If a code is provided then it must be from the original FHIR list, or from an extension code that is curated and added to the regional list
* type from http://hl7.org/fhir/ValueSet/v3-ServiceDeliveryLocationRoleType (extensible)
* type ^short = "Type of function performed. Useful to indicate the type of activity that is likely to have happened there. EXTENSIBLE on request, eg to cover other care settings"
* insert Ruleset-CodingWithSystemCodeDisplay(type)

// Telecom - required to provide if at all possible, as this is extremely useful if external clinicians want to get in touch to find out more
// If provided then need at least the "system" and "value"
* telecom MS 
* telecom ^short = "Contact details of the location. Very useful for getting in touch to find out more."
* telecom.system 1..1 MS
* telecom.value 1..1 MS
* telecom.period ^short = "DISCOURAGED: Preferably just relevant current details"
* telecom.use ^short = "DISCOURAGED: Not really relevant here - it is just the current telecom details of the location."

// Address - must be provided if relevant (eg for Site and House)
//    Not relevant for a Ward or Room.
//    Just the current address for contact purposes (no history)
* address MS
* address ^short = "Physical location. Required when relevant (not for ward or room)"
* address.line MS
* address.city MS
* address.district MS
* address.postalCode MS
* address.use ^short = "DISCOURAGED: Not really relevant here - it is just the current address of the location."
* address.text ^short = "DISCOURAGED: Please do not rely on this. Providers might not populate and Consumers might not use. Instead display the address based on the detailed elements."
* address.period ^short = "DISCOURAGED: Preferably just relevant current details"

// Physical Type - mandatory, to identify whether a site, ward, room, house, etc
// Define a cut-down subset of the FHIR example list for our purposes
* physicalType 1..1 MS
* physicalType.coding 1..1 MS
* physicalType ^short = "Physical form of the location. Extensible by request if additional types needed"
* physicalType from http://hl7.org/fhir/ValueSet/location-physical-type (required)
* insert Ruleset-CodingWithSystemCodeDisplay(physicalType)


// Position - optional. Currently there is no requirement to track exact geographical coordinates.

// Managing Organisation - required if relevant (eg only if belonging to an organisation, not relevant for a house)
//    Shows who the location "belongs" to. Although often the same as the provenance of the message, it might be different (eg if refering to a location elsewhere)
//    (Should normally be known and easy to populate)
* managingOrganization MS
* insert Ruleset-ReferenceWithReferenceAndDisplay(managingOrganization)

// Part Of - must support if relevant
//   (The aim is to build a very simple structure with a maximum of 3 levels - that is easy for a data consumer to display - based on Rooms (optional), which belong to Wards, which belong to a Site. The purpose is to provide basic information about where a patient has been – not necessarily to build a complete and accurate model of the organisation structure.)
//   For a Site – not used
//   For a Ward – points to the owning Site
//   For  Room – points to the owning Ward
//   For a House – not used
* partOf MS
* partOf ^short = "Another Location this one is physically part of. Must be provided for Ward->Site and Room->Ward to build the hierarchy"
* insert Ruleset-ReferenceWithReferenceAndDisplay(partOf)

// Endpoint - removed. Technical endpoints are captured elsewhere (ie via the Participant Registry)
* endpoint 0..0


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Examples
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Site ////////////////////////////////////////////////////////////////////////////////
Instance: InterweaveLocationSiteExample
InstanceOf: InterweaveLocation
Description: "Interweave Location example - Site"



* insert Ruleset-ExampleMetaForHospital(Location)
* meta.versionId = "InterweaveLocationExampleSite-v1.0.0"

// Text summary no longer needed
// (Name + Type)
//* extension[Extension-Interweave-TextSummary].valueString = "York Hospital: Hospital"


* identifier[0].system = "https://fhir.nhs.uk/Id/ods-site-code"
* identifier[0].value = "G5A1J"

* insert Ruleset-ExampleLocalId(location, RCB.LOC-ABC123)

* status = http://hl7.org/fhir/location-status#active "Active"
* name = "York Hospital"

* mode = http://hl7.org/fhir/location-mode#instance "Instance"
* type.coding = http://hl7.org/fhir/v3/RoleCode#HOSP "Hospital"
* physicalType.coding = http://hl7.org/fhir/location-physical-type#si "Site"

* telecom[0].system = #phone "Phone"
* telecom[0].value = "01234 123412"

* address[0].line[0] = "York Hospital"
* address[0].line[1] = "Wigginton Road"
* address.city = "York"
* address.postalCode = "YO31 8HE"

* managingOrganization = Reference(InterweaveOrganizationExample)
* managingOrganization.display = "York and Scarborough Teaching Hospitals NHS Foundation Trust"
* managingOrganization.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* managingOrganization.identifier.value = "RCB"

// (partOf = not relevant)


// Ward //////////////////////////////////////////////////////////////////////////////////
Instance: InterweaveLocationBuildingExample
InstanceOf: InterweaveLocation
Description: "Interweave Location example - Building"


* insert Ruleset-ExampleMetaForHospital(Location)
* meta.versionId = "InterweaveLocationExampleBuilding-v1.0.0"

* insert Ruleset-ExampleLocalId(location, RCB.LOC-BUILD01)

* status = http://hl7.org/fhir/location-status#active "Active"
* name = "York Hospital: Jubilee Building"

* mode = http://hl7.org/fhir/location-mode#instance "Instance"
* type.coding = http://hl7.org/fhir/v3/RoleCode#HU "Hospital unit"
* physicalType.coding = http://hl7.org/fhir/location-physical-type#bu "Building"

* telecom[0].system = #phone "Phone"
* telecom[0].value = "01234 345346"

* managingOrganization = Reference(InterweaveOrganizationExample)
* managingOrganization.display = "York and Scarborough Teaching Hospitals NHS Foundation Trust"
* managingOrganization.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* managingOrganization.identifier.value = "RCB"

* partOf = Reference(InterweaveLocationSiteExample)
* partOf.display = "York Hospital"


// Ward //////////////////////////////////////////////////////////////////////////////////
Instance: InterweaveLocationWardExample1
InstanceOf: InterweaveLocation
Description: "Interweave Location example - Ward 27"


* insert Ruleset-ExampleMetaForHospital(Location)
* meta.versionId = "InterweaveLocationExampleWard27-v1.0.0"

// Text summary no longer needed
// (Name + Type)
//* extension[Extension-Interweave-TextSummary].valueString = "York Hospital: Ward 27: Dermatology clinic"


* insert Ruleset-ExampleLocalId(location, RCB.LOC-XYZ456)

* status = http://hl7.org/fhir/location-status#active "Active"
* name = "York Hospital: Jubilee Building: Ward 27"

* mode = http://hl7.org/fhir/location-mode#instance "Instance"
* type.coding = http://hl7.org/fhir/v3/RoleCode#DERM "Dermatology clinic"
* physicalType.coding = http://hl7.org/fhir/location-physical-type#wa "Ward"

* telecom[0].system = #phone "Phone"
* telecom[0].value = "01234 345345"

* managingOrganization = Reference(InterweaveOrganizationExample)
* managingOrganization.display = "York and Scarborough Teaching Hospitals NHS Foundation Trust"
* managingOrganization.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* managingOrganization.identifier.value = "RCB"

* partOf = Reference(InterweaveLocationBuildingExample)
* partOf.display = "York Hospital:Jubilee Building"

////////////////////////////////////
Instance: InterweaveLocationWardExample2
InstanceOf: InterweaveLocation
Description: "Interweave Location example - Ward 28"


* insert Ruleset-ExampleMetaForHospital(Location)
* meta.versionId = "InterweaveLocationExampleWard28-v1.0.0"

// Text summary no longer needed
// (Name + Type)
//* extension[Extension-Interweave-TextSummary].valueString = "York Hospital: Ward 28: Allergy clinic"

* insert Ruleset-ExampleLocalId(location, RCB.LOC-ABC789)

* status = http://hl7.org/fhir/location-status#active "Active"
* name = "York Hospital: Jubilee Building: Ward 28"

* mode = http://hl7.org/fhir/location-mode#instance "Instance"
* type.coding = http://hl7.org/fhir/v3/RoleCode#ALL "Allergy clinic"
* physicalType.coding = http://hl7.org/fhir/location-physical-type#wa "Ward"

* telecom[0].system = #phone "Phone"
* telecom[0].value = "05678 111222"

* managingOrganization = Reference(InterweaveOrganizationExample)
* managingOrganization.display = "York and Scarborough Teaching Hospitals NHS Foundation Trust"
* managingOrganization.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* managingOrganization.identifier.value = "RCB"

* partOf = Reference(InterweaveLocationBuildingExample)
* partOf.display = "York Hospital:Jubilee Building"



////////////////////////////////////
Instance: InterweaveLocationWardExampleAandE
InstanceOf: InterweaveLocation
Description: "Interweave Location example - A&E"


* insert Ruleset-ExampleMetaForHospital(Location)
* meta.versionId = "InterweaveLocationExampleWardAandE-v1.0.0"

// Text summary no longer needed
// (Name + Type)
//* extension[Extension-Interweave-TextSummary].valueString = "York Hospital: Accident and Emergency"

* insert Ruleset-ExampleLocalId(location, RCB.LOC-AE789)

* status = http://hl7.org/fhir/location-status#active "Active"
* name = "York Hospital: Jubilee Building: Accident and Emergency"

* mode = http://hl7.org/fhir/location-mode#instance "Instance"
* type.coding = http://hl7.org/fhir/v3/RoleCode#ER "Emergency room"
* physicalType.coding = http://hl7.org/fhir/location-physical-type#wa "Ward"

* telecom[0].system = #phone "Phone"
* telecom[0].value = "05678 111999"

* managingOrganization = Reference(InterweaveOrganizationExample)
* managingOrganization.display = "York and Scarborough Teaching Hospitals NHS Foundation Trust"
* managingOrganization.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* managingOrganization.identifier.value = "RCB"

* partOf = Reference(InterweaveLocationBuildingExample)
* partOf.display = "York Hospital:Jubilee Building"




// Room //////////////////////////////////////////////////////////////////////////////////////////
Instance: InterweaveLocationRoomExample
InstanceOf: InterweaveLocation
Description: "Interweave Location example - Room"


* insert Ruleset-ExampleMetaForHospital(Location)
* meta.versionId = "InterweaveLocationExampleRoom-v1.0.0"

// Text summary no longer needed
// (Name + Type)
//* extension[Extension-Interweave-TextSummary].valueString = "York Hospital: Ward 27: Room 1: Dermatology clinic"


* insert Ruleset-ExampleLocalId(location, RCB.LOC-XYZ456-1)

* status = http://hl7.org/fhir/location-status#active "Active"
* name = "York Hospital: Jubilee Building: Ward 27: Room 1"
* description = "Go to the main desk, then turn left by the green door at the end of the corridor"

* mode = http://hl7.org/fhir/location-mode#instance "Instance"
* type.coding = http://hl7.org/fhir/v3/RoleCode#DERM "Dermatology clinic"
* physicalType.coding = http://hl7.org/fhir/location-physical-type#ro "Room"

* managingOrganization = Reference(InterweaveOrganizationExample)
* managingOrganization.display = "York and Scarborough Teaching Hospitals NHS Foundation Trust"
* managingOrganization.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* managingOrganization.identifier.value = "RCB"

* partOf = Reference(InterweaveLocationWardExample1)
* partOf.display = "York Hospital: Jubilee Building: Ward 27"


// House ///////////////////////////////////////////////////////////////////////////////////////
Instance: InterweaveLocationHouseExample
InstanceOf: InterweaveLocation
Description: "Interweave Location example - House"


* insert Ruleset-ExampleMetaForHospital(Location)
* meta.versionId = "InterweaveLocationExampleHouse-v1.0.0"

// Text summary no longer needed
// (Name + Type)
//* extension[Extension-Interweave-TextSummary].valueString = "42 Grove Street, LS21 1P: Patient's Residence"

* status = http://hl7.org/fhir/location-status#active "Active"
* name = "42 Grove Street, LS21 1PF"

* mode = http://hl7.org/fhir/location-mode#instance "Instance"
* type.coding = http://hl7.org/fhir/v3/RoleCode#PTRES "Patient's Residence"
* physicalType.coding = http://hl7.org/fhir/location-physical-type#ho "House"

* address[0].line[0] = "42 Grove Street"
* address[0].line[1] = "Northville"
* address[0].city = "Overtown"
* address[0].district = "West Yorkshire"
* address[0].postalCode = "LS21 1PF"


// Social Care Dept ///////////////////////////////////////////////////////////////////////////////
Instance: InterweaveLocationSocialCareExample
InstanceOf: InterweaveLocation
Description: "Interweave Location example - Care Home"

* insert Ruleset-ExampleMetaForHospital(Location)
// Overwrite the hospital with a social care organisation tag
* meta.tag[1] =  https://yhcr.nhs.uk/Provenance#212 "Leeds City Council"
* meta.versionId = "InterweaveLocationExampleSocialCare-v1.0.0"

// Text summary no longer needed
// (Name + Type)
//* extension[Extension-Interweave-TextSummary].valueString = "Leeds Social Services: Adult Services Department: community service center"

* insert Ruleset-ExampleLocalId(location, 212.LOC-1234)

* status = http://hl7.org/fhir/location-status#active "Active"
* name = "St Hildas Care Home"

* mode = http://hl7.org/fhir/location-mode#instance "Instance"
* type.coding = http://hl7.org/fhir/v3/RoleCode#CSC "community service center"
* type.text = "Care Home"
* physicalType.coding = http://hl7.org/fhir/location-physical-type#si "Site"

* telecom[0].system = #phone "Phone"
* telecom[0].value = "01234 345347"

* managingOrganization = Reference(InterweaveOrganizationExampleSocialCare)
* managingOrganization.display = "Leeds City Council"
* managingOrganization.identifier.system = "https://fhir.nhs.uk/Id/ods-organization-code"
* managingOrganization.identifier.value = "212"


