# Code List Options

## **Introduction**

An important, and sometimes challenging, aspect of defining a profile is agreeing on the most appropriate code list to use for certain concepts. FHIR of course provides a starting point - and for many of the shorter and simpler code lists this is helpful and uncontroversial. However some of the more complex code lists are classified only as "example" or "preferred" by FHIR - and making the right choice for these can be much more difficult.

This page therefore elaborates in more detail on the choices and decisions made regarding these more challenging code lists.

In making these decisions, the following sources of code lists have been considered:

 - **FHIR STU3 and Care Connect** - this is our starting point and default choice

    <https://www.hl7.org/fhir/STU3/resourcelist.html>

    <https://fhir.hl7.org.uk/StructureDefinition>


 - **FHIR R4 and UK Core** - sometimes the code lists evolve and are improved in these later versions. This is relatively rare, but worth watching for. Where it happens then the changes are generally significant, useful, and relatively uncontroversial to pre-adopt. As of this writing (Feb 2022) then UK Core is still incomplete and under development.
 
   <https://hl7.org/fhir/R4/resourcelist.html>

   <https://simplifier.net/hl7fhirukcorer4>


 - **PRSB and NHS Data Dictionary** - whereas FHIR is an international standard, these standards are more focused on the UK. Sometimes therefore they contain a more relevant list which can be used in preference. In some cases this decision has already been made by Care Connect and/or UK Core - in which case it is simple to adopt. However in other cases the "world of FHIR" appears to be at odds with the "world of NHS" - and these cases are more difficult to resolve.

   <https://prsb2.vercel.app/page/core-information-standard>

   <https://www.datadictionary.nhs.uk/about/about.html>


 A further complication is the need to ensure that both Health AND Social Care are catered for. All of the above standards are historically "Health" focused, but they have both begun to make some consideration of Social Care more recently. Sometimes one is more advanced than the other in this regard - and so this also needs to be taken into consideration.

***NB: Of course many of the above lists end up referencing SNOMED codes, see <https://termbrowser.nhs.uk/?>***


## **Encounter Class**
This is relatively uncontroversial and basically refers to the "setting". 
 - FHIR provides a short list which seems stable eg "Emergency", "Inpatient Acute", "Ambulatory", etc
 - CareConnect and UK Core adopt the standard FHIR list unchanged
 - PRSB defines the "Contact Type", which it denotes only as "free text"

 > ***We will use the standard FHIR list. The main issue is that this seems rather focused towards acute healthcare. It is however classified by FHIR as "Extensible", and so we would be open to requests for additional regional codes to be added to the list, as need arises.***


## **Encounter Type**
This is a tricky field, as the FHIR definition is not all that clear. However it seems to be mostly about categorising the type of place where the encounter took place.
 - FHIR provides a very sketchy "example" list with four random values
 - CareConnect and UK Core replace this with a much better list. This is still only an "example" in CareConnect, but is tightened to be mandated as "extensible" in UKCore. This list is based on the following SNOMED reference sets: 
   - **185316007: Indirect Encounter** - this lists mechanisms such as email, video link, letter, etc
   - **308467007: Seen in Establishment** - this provides a short list of 22 top level codes which cover a good range of care settings eg "Seen in clinic", "Seen in own home", "Seen in supervised accomodation", etc. 
   
     However... some of these expand into a much longer list. For example "Seen in clinic" expands into a list of 118 different types of cinic.
     >Our understanding is that the purpose of this field is to describe the type of place where the encounter occured (not the service provided), and so it is not required to expand down to the level of the specific clinic type.

   - **185201007: Site of Encounter** - this contains a single value for "Seen in street"   

- PRSB defines "Consultation Method", which uses the NHSDD list "Consultation Medium". This essentially overlaps with the first SNOMED list to enumerate "email", "telephone" etc, and then has only "face to face" to cover all the rest
  > ***Based on the greater richness of the above SNOMED lists, plus their mandating in UKCore then these will be used - as per the defaults in CareConnect and UKCore***


## **Encounter Service Type (R4 Only!)**
This is an important field that covers what everyone really wants to know about an Encounter - what the service was.

 - FHIR STU3 and CareConnect do not have it. This is a glaring omission! It leads to all kinds of problems with trying to shoehorn additional meaning into "Encounter Type", or else to infer what is going on from the preceeding appointment / referral, or from the linked Problem / Procedure-based "reason". But really the issue is that this field is "missing" in FHIR STU3.
 - FHIR R4 adds the field. FHIR R4 provides an "example" list of 629 codes. These cover a wide range of care settings including social care topics, but perhaps almost at the expense of properly covering some of the acute clinic scenarios?
 - UK Core replaces this with a different list (which it mandates as "extensible") based on SNOMED refset **1127531000000102: Services Simple Reference Set**. This is a UK based list of about 400 services - with a good coverage of acute services, but also including community and social care services - it looks a good list.
  - PRSB defines "Service" and uses the same SNOMED refset
  - PRSB also defines "Specialty" which links to "Activity Treatment Function Code" in the NHSDD. This is a shorter list of services, and really only acute focused. However this appears to overlap with the alternatives above, and does not have an obvious home in the FHIR Encounter (which would consider "specialty" as a feature of the Pratitioner)

  > ***Our conclusion is that this is an important field, with good consensus around the above SNOMED refset. As it is only available in R4, it is proposed to add an extension to pre-adopt it.***


## **Encounter Reason (or ReasonCode)**
This provides information about the purpose of the Encounter. (There are some subtleties here - eg the reason is why you came, the Service Type is the clinic you want to, and the diagnosis is what was learned).

 - FHIR STU3 and CareConnect both suggest a "preferred" list based on two SNOMED refsets:
   - **404684003: Clinical Finding** - this is a huge heirarchy of every imaginable kind of medical problem
   - **71388002: Procedure** - another huge heirarchy of every imaginable clinical procedure
  (The two together offer over 100,000 codes)

 - FHIR R4 and UK Core build upon this by adding two additional SNOMED refsets to this list. This is significant because they broaden the coverage to emergency and social care scenarios:
   - **243796009: Context-dependent categories** - this is obscurely named, but actually covers a wide range of social and community care scenarios
   - **272379006: Events** - these appear to be "bad" events, ie basically different types of "accident"

 - FHIR R4 also renames this field to "Reason Code" and adds the ability to also have a "Reason Reference" which points to a full dataset about the Condition. To some extent this dilutes the need for a "Reason Code", but only in R4, and only in a fully mature implementation which offers all of these extra FHIR Resource types. The use of a basic reason code on the Encounter itself therefore still seems valid.

  - PRSB does not directly have this concept, but it does consider "Problems" (aka "Conditions") and "Procedures" separately and uses slightly different (but overlapping) SNOMED refsets - see further discussion below - with the conclusion that we will stick with the above FHIR lists

  > ***Our conclusion is that this is a useful field, but with important additions to the code lists for emergency and social care in R4. We will therefore pre-adopt the FHIR R4 code lists.***
 

## **Appointment Service Category**
Gives a high-level summary of the Service Type.

 - FHIR STU3 and R4 offer an "example" list of about 30 high-level categories of service. It covers both health and social care and looks quite good.
 - CareConnect unfortunately replaces this with a mandated list (extensible) of SDS Job Roles. As the name suggests, this is not really the same concept at all, and really renders this field unusable.
 - UK Core appears (so far) to be reverting to the standard FHIR list, which is good, and might restore this field to use in future.
  - PRSB goes straight to the lower-level Service Type and does not have this concept

  > ***This is potentially a useful summary field, but unfortunately "broken" by CareConnect. Therefore we cannot use for now.***

## **Appointment Service Type**
This is essentially the same field as Encounter Service Type. However:
 - It is also available in STU3 (not R4 only)
 - Both CareConnect and UK Core have stuck with the default FHIR example list - rather than being consistent it with UKCore Encounter and replacing with the PRSB recommended SNOMED refset **1127531000000102: Services Simple Reference Set**

 > ***Proposed to replace the FHIR default with the above SNOMED refset, as it looks a better list, and is then consistent with Encounter***

 
## **Appointment Specialty**
This is about the type of practitioner needed (eg for scheduling):

 - FHIR STU3 (and CareConnect) suggests a "preferred" list of SNOMED codes for various specialities. It doesn't look a very complete list even for healthcare, and certainly does not cover social care
 - FHIR R4 and UK Core - no change
 - PRSB uses the NHSDD "Activity Treatment Function Code" list - but this is really a list of Services, and only covers healthcare

 *Strangely enough, the list of "SDS Job Roles" which CareConnect (mis)uses for the Service Category would actaully be rather good here. But for some reason no-one is using it?*

 > ***Proposed to replace the FHIR default (which is not very useful anyway) with the list of SDS Job Roles***

## **Appointment Reason**
This is the same field and same considerations as Encounter Reason.


## **Condition Code**

 - FHIR STU3 (and CareConnect) goes with SNOMED **404684003: Clinical Finding** - the same is a huge heirarchy of medical problems that forms part of Encounter Reason. (Plus an extra code for "no problems")
 - FHIR R4 does the same
 - UKCore however adds in **243796009: Context-dependent categories** and **272379006: Events**. (And mandates the list as "extensible"). These are the same items as discussed above in Encounter Reason and, as discussed there, greatly broaden the reach into Social Care
 - PRSB instead goes with **1127581000000103: Health issues simple reference set**. Despite the word "simple" this is another huge list with over 100,000 entries. A superficial inspection suggests a lot of overlap with the "Clinical Findings" list

  > ***Proposed to pre-adopt the UK Core mandated approach, incorporating additional reference sets for Social Care. (A question remains however as to the role of the overlapping but slightly different PRSB preferred list)***


## **Procedure Category**

 - FHIR STU3 has a simple list of 6 high-level SNOMED codes
 - FHIR R4 has the same list, but adds one more for "Social Service Procedure"
 - PRSB does not have this concept and deals only at the detailed level

 > ***Use the standard FHIR code list, but pre-adopt R4 list to get the additional Social Care entry***

## **Procedure Code**

 - FHIR STU3 (and CareConnect) uses the SNOMED list **71388002: Procedure** - the same as the huge heirarchy of procedures that forms part of Encounter Reason
 - FHIR R4 does the same
 - UKCore however adds in **129125009: Context-dependent procedure** (And mandates the list as "extensible"). This broadens the reach into Social Care
 - PRSB uses these same two SNOMED lists

  > ***Proposed to pre-adopt the UK Core mandated approach, incorporating additional reference sets for Social Care. This is also well-aligned with PRSB***


## **Procedure Follow Up**

This could be especially relevant for Community and Social Care, to understand if there are any follow-up actions once a patient leaves the initial care setting
 - All of the FHIR-based standards use the same "example" FHIR list of 10 SNOMED codes. This is not a great list, and is very surgery focused
 - PRSB does not have this concept

  > ***Proposed to tentatively adopt the FHIR example list, acknowledging that although not great it appears to be the only option. Remain open to potential extension or replacement in future***

## **Organisation Type**

 - All of the FHIR-based standards use the same "example" list of approx 10 organisation types including "insurance company" etc - it is not a very useful list
 - PRSB does not really have this concept
 - There is a good list on the ODS website here: <https://odsportal.digital.nhs.uk/Organisation/Search>. And obviously this will align exactly with the organisation types allocated by ODS. 
 - However a more formal version of the list can be found via the TRUD ODS dataset <https://isd.digital.nhs.uk/trud/users/authenticated/filters/0/categories/5/items/341/releases>

   The first part of the (very large) download file provides the list from which this is taken:

       CodeSystem name="OrganisationRole" oid="2.16.840.1.113883.2.1.3.2.4.17.507"

  > ***Adopt this list of organisation types as provided by ODS / TRUD***


## **Location Type**

 - All of the FHIR-based standards mandate the same "extensible" list of location types. It is an OK list, although with some inconsistencies and variation in detail (eg several options for a hospital, and a lot more detail about acute care clinics than anything else).
 - PRSB uses the NHSDD "Activity Location Type Code". This is at first-glance a much clearer and more holistic list - although perhaps lacking in detail for locations below the "site" level

  > ***Given that the FHIR list is mandated then there is not much choice. Remain open to requests for extending with additional values***


## **DocumentReference Class**

 - All of the FHIR-based standards use the same "example" list, based on a short set of high-level LOINC codes. It looks a reasonable list.
 - PRSB has a single concept called "class" that probably straddles both FHIR Class and Type. Only "Free Text" is specificed. (Although see also notes below about Document Reference Type)

> ***Tentatively adopt the FHIR example list, however understanding that this is an active area which may need revisiting in future***



## **DocumentReference Type**

 - FHIR STU3 and R4 use the same "prefered" list, based on a long list of LOINC codes. Much of the list consists of very detailed specification of various diagnostic report documents, but there are also some more general entries included too.
 - CareConnect replaces this with SNOMED refset **999000391000000109: Correspondence document type simple reference**. However... this does not appear to have any members?
 - UKCore instead mandates ("extensible") a different SNOMED refset **1127551000000109: Record composition type simple reference set**. This is a long list with 1600 members, but certainly looks more intuitive than the FHIR list and also comprehensive, covering many care settings.
 - The regional Data Archtitecture Design Authority has previously recommended the use of yet another SNOMED refset **24501000000105: EHR composition types**. This is a much shorter list (162 members), so both less comprehensive but also easier to use. Several sites have already implemented using this list.
 - PRSB has the concept of a document "class" which is specified only as "Free Text"
 - Other work is also in progress eg see **<https://theprsb.org/standards/documentnaming/>**. This has 17 high-level (class) and 182 lower level (type) entries - and again it looks good. (Although perhaps more focused on health than social care?) It ultimately maps to SNOMED codes - quite possibly overlapping with some of the other lists! The status of this work is currently (Feb 2022) unclear - as although it appears to be published, contacts at PRSB suggest that discussion is still ongoing.

> ***This is clearly a difficult and confusing area, with no clear standard defined. Having sucessfully started using the "EHR Composition Types" there therefore seems no strong driver to move away from this immediately. However this remains an area to monitor - and implementers need to be aware that there may be a need for a mapping / migration exercise in future if a different list achieves clear prominence. Sites who wish to be future-proofed could also choose to provide more than one of these codes.***
