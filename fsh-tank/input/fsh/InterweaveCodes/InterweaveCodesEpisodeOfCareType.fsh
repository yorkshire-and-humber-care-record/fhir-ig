Alias: $ActCode = http://hl7.org/fhir/v3/ActCode

ValueSet: InterweaveEpisodeOfCareType
Id: Interweave-EpisodeOfCareType-1
Description: "Defines the set of EpisodeOfCare Type codes"
* ^name = "InterweaveEpisodeOfCareType"

* include codes from system Interweave-EpisodeOfCareType-1


CodeSystem: InterweaveEpisodeOfCareType
Id: Interweave-EpisodeOfCareType-1
Description: "EpisodeOfCare Type codes"
* ^name = "InterweaveEpisodeOfCareType"
* ^content = #complete
* ^caseSensitive = true

* #PrimaryCare "Primary Care"
* #SecondaryCare "Secondary Care"
* #TertiaryCare "Tertiary Care"
* #CommunityHealth "Community Health"