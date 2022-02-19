Extension: ExtensionYhcrTextSummary
Id: Extension-Yhcr-TextSummary
Description: "A short text string to summarise the resource. Intended to be used for the 'display' value in References"
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "Appointment" //R3 is just context
* ^context[+].type = #element   
* ^context[=].expression = "Encounter" 
* ^context[+].type = #element   
* ^context[=].expression = "DocumentReference" 
* ^context[+].type = #element   
* ^context[=].expression = "Location" 
* ^context[+].type = #element   
* ^context[=].expression = "Organization" 
* ^context[+].type = #element   
* ^context[=].expression = "Practitioner" 
* ^context[+].type = #element   
* ^context[=].expression = "Patient" 
* ^context[+].type = #element   
* ^context[=].expression = "Condition" 
* ^context[+].type = #element   
* ^context[=].expression = "Procedure" 
* ^context[+].type = #element   
* ^context[=].expression = "DiagnosticReport" 

* . ..1
* . ^short = "A short summary string eg for display in References"
* . ^definition = "A short summary string eg for display in References"

* valueString only string
* valueString ^short = "A short summary string eg for display in References"
* valueString ^definition = "A short summary string eg for display in References"

