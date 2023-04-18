ValueSet: InterweaveObservationStatus
Id: Interweave-ObservationStatus-1
Description: "Codes providing the status of an observation"
* ^name = "InterweaveObservationStatus"
* include codes from system Interweave-ObservationStatus-1



CodeSystem: InterweaveObservationStatus
Id: Interweave-ObservationStatus-1
Description: "Codes providing the status of an observation"
* ^name = "InterweaveObservationStatus"
* ^content = #complete
* ^caseSensitive = true

* #final "The observation is complete."
* #amended "Subsequent to being Final, the observation has been modified subsequent. This includes updates/new information and corrections."
* #corrected "Subsequent to being Final, the observation has been modified to correct an error in the test result."