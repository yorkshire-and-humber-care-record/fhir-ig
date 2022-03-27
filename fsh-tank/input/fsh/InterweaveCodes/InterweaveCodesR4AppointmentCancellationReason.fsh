ValueSet: InterweaveR4AppointmentCancellationReason
Id: Interweave-R4AppointmentCancellationReason
Description: "Defines a set of reasons for the cancellation of an appointment. Pre-adopted from R4."
* ^name = "Interweave R4 Appointment Cancellation Reason"

* include codes from system InterweaveR4AppointmentCancellationReason



CodeSystem: InterweaveR4AppointmentCancellationReason
Id: Interweave-R4AppointmentCancellationReason
Description: "Defines a set of reasons for the cancellation of an appointment. Pre-adopted from R4."
* ^name = "Interweave R4 Appointment Cancellation Reason"
* ^content = #complete
* ^caseSensitive = true
* ^caseSensitive = true

* #pat "Patient"
* #pat #pat-crs "Patient: Canceled via automated reminder system"
* #pat #pat-cpp "Patient: Canceled via Patient Portal"
* #pat #pat-dec "Patient: Deceased"
* #pat #pat-fb "Patient: Feeling Better"
* #pat #pat-lt "Patient: Lack of Transportation"
* #pat #pat-mt "Patient: Member Terminated"
* #pat #pat-mv "Patient: Moved"
* #pat #pat-preg "Patient: Pregnant"
* #pat #pat-swl "Patient: Scheduled from Wait List"
* #pat #pat-ucp "Patient: Unhappy/Changed Provider"
* #prov "Provider"
* #prov #prov-pers "Provider: Personal"
* #prov #prov-dch "Provider: Discharged"
* #prov #prov-edu "Provider: Edu/Meeting"
* #prov #prov-hosp "Provider: Hospitalized"
* #prov #prov-labs "Provider: Labs Out of Acceptable Range"
* #prov #prov-mri "Provider: MRI Screening Form Marked Do Not Proceed"
* #prov #prov-onc "Provider: Oncology Treatment Plan Changes"
* #maint "Equipment Maintenance/Repair"
* #meds-inc "Prep/Med Incomplete"
* #other "Other"
* #other #oth-cms "Other: CMS Therapy Cap Service Not Authorized"
* #other #oth-err "Other: Error"
* #other #oth-fin "Other: Financial"
* #other #oth-iv "Other: Improper IV Access/Infiltrate IV"
* #other #oth-int "Other: No Interpreter Available"
* #other #oth-mu "Other: Prep/Med/Results Unavailable"
* #other #oth-room "Other: Room/Resource Maintenance"
* #other #oth-oerr "Other: Schedule Order Error"
* #other #oth-swie "Other: Silent Walk In Error"
* #other #oth-weath "Other: Weather"

