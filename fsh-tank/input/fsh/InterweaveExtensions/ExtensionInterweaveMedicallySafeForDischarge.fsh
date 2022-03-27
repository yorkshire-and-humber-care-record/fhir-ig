Extension: ExtensionInterweaveMedicallySafeForDischarge
Id: Extension-Interweave-MedicallySafeForDischarge
Description: "An extension to add information about whether medically safe for discharge to the Encounter."
* ^status = #draft

* ^context[+].type = #element   // R3 is contextType = resource
* ^context[=].expression = "Encounter" //R3 is just context

//* . ..1
* . ^short = "Medically Safe for Discharge"
* . ^definition = "Information about whether the patient is medically safe for discharge. Useful to inform discharge planning and analysis"

* extension contains
    status 1..1 and
    predictedDate 0..1 and
    actualDate 0..1 

//* extension[status].valueCode only code
* extension[status].value[x] only code
* extension[status].valueCode from Interweave-MedicallySafeForDischargeStatus-1 (required)
* extension[status] ^short = "Medically safe for discharge status. ready | notready | unknown"

//* extension[predictedDate].valueDateTime only dateTime
* extension[predictedDate].value[x] only dateTime
* extension[predictedDate] ^short = "The date when it is predicted the patient will be medically safe for discharge"

//* extension[actualDate].valueDateTime only dateTime
* extension[actualDate].value[x] only dateTime
* extension[actualDate] ^short = "The date when the patient was actaully medically safe for discharge"


