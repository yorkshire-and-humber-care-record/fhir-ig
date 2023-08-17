Profile: InterweaveEpisodeOfCare
Parent: CareConnect-EpisodeOfCare-1
Id: Interweave-EpisodeOfCare
Description: "Interweave Episode Of Care resource profile"
* ^status = #active

* insert Ruleset-InterweaveBaseFields

///////////////////////////////////////
// --- EXTENSIONS ---
///////////////////////////////////////

* identifier MS

* status MS

* statusHistory MS

* type 0..1
* type from Interweave-EpisodeOfCareType-1 (preferred)
* type ^short = "PrimaryCare | SecondaryCare | TertiaryCare | CommunityHealth"

* diagnosis MS

* patient 1..1 MS 
* patient only Reference(CareConnect-Patient-1)
* insert Ruleset-ReferenceWithReferenceAndDisplay(patient)
* patient ^short = "The patient who is the focus of this episode of care"

* period MS
* period.start 1..1 MS

* referralRequest MS

* careManager MS
* insert Ruleset-ReferenceWithReferenceAndDisplay(careManager)

* team MS

* account 0..0

