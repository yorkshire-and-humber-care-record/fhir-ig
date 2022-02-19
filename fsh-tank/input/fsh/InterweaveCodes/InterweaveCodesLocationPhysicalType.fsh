ValueSet: InterweaveLocationPhysicalType
Id: Interweave-LocationPhysicalType-1
Description: "A ValueSet to identify the physical type of a location. A subset of the example FHIR list"

// Simplified 3 level heirarchy within an organisation
* include http://hl7.org/fhir/location-physical-type#si "Site"
* include http://hl7.org/fhir/location-physical-type#wa "Ward" // Broad interpretation, could be a department too
* include http://hl7.org/fhir/location-physical-type#ro "Room"

* include http://hl7.org/fhir/location-physical-type#ho "House"
* include http://hl7.org/fhir/location-physical-type#ve "Vehicle" //Could be useful for ambulances?

