# Building Blocks

## **Introduction**

FHIR provides a set of "complex datatypes" which act as building blocks for all other resources. Several in particular have been found to be extremely important to a successful implementation:
 - Codeable Concept: <https://www.hl7.org/fhir/STU3/datatypes.html#codeableconcept>
 - Reference: <https://www.hl7.org/fhir/STU3/references.html>

FHIR provides extensive and helpful guidance at the above links, and this should be studied. However this page highlights key points and offers additional guidance on how these building blocks are used for a Shared Care Record implementation.

## **Codeable Concept**
A fundamental challenge for any Shared Care Record is to balance two different goals:

1. Providing rich textual information for human-to-human communication between care professionals
2. Providing machine-readable coding to enable automated processing and analysis

The CodableConcept tackles this challenge by offering a data structure which can include:
 - Free text information
 - One or more codes (along with display text) 


### Data Provider Implications
To meet the above two goals, a data provider must consider:

a) Capturing *exactly what the user entered*
 - This could mean populating the "text" field with exactly what the user typed. Thus capturing the full richness of human-to-human information, which standard coding cannot always fully represent
 - Or it could mean populating the "coding" section with a non-standard local code which reflects exactly what the user picked on their screen. ***FHIR offers the "coding.userSelected" flag which should be used to indicate this***

 b) Capturing *standard coding for machine analysis*

  - This will mean populating the coding section with a code from the standard code list specified. (This may involve a mapping if different codes are used locally).

Looking at it another way, this means that:
 - There will almost always be at least a "coding" entry - based on the standard specified code list (eg SNOMED, ICD-10, NHS Data Dictionary, etc)
  - For a modern system where users are picking from standards-based code lists then this coding entry should be marked as "userSelected", and nothing more is required.
   - Also if it is purely a system populated field then nothing more is required (eg essentially a fixed value to represent the type / category of an item)
  - If this standard coding is a mapping and users are actually picking from a different, local, code list then a SECOND coding should also be populated to capture this local code. This should be marked as "userSelected"
  - And/or if the user has entered further descriptive text this should also be populated into the "text" field.

  Other points of note:
   - A "coding" entry must always include "coding.display" wording. (Noting some exceptions where no display value exists, in which case this is impossible)

   - The coding.system must always be populated. (For local codes it is suggested to devise a unique uri - for example based on the url of the FHIR server)


### Data Consumer Implications

When displaying a Codeable Concept to the user then a Data Consumer should attempt to use in priority order:

 1. The "text" content
 
 2. The "coding.display" string from the coding entry marked as "userSelected"

 3. The "coding.display" string from the first (and probably only) other coding entry

 If none of these yield text to display then it is an error and cannot be displayed. 

## **Reference**

A Reference enables the creation of linkages between resources. This is an essential part of creating a rich web of interlinked data which users can browse. There are potentially three parts to a Reference:

1. The "reference" URL, pointing at the linked resource
2. An "indentifer", to uniquely identify the referenced item
3. "Display" text, to describe the referenced item

**The simplest and most common case will be for the "reference" url to point at another locally hosted resource, and for the "display" text to offer a summary.**

For example, a Data Provider might offer an Encounter resource, with a "reference" url pointing to their associated Patient resource, and the "display" containing the patient's name.

**However complications can arise when the referenced item is NOT locally hosted.** 

For example, an Encounter can also reference the Location where a patient is discharged to. This could be a wide variety of external places (including their own house), and it is not necessarily reasonable to suppose that a Data Provider will always offer and maintain an up-to-date set of reference resources describing ALL of these external locations. Similar considerations may also apply to Organisations and Practitioners. Alternatives for this scenario therefore include:
 - **Using a "Contained Resource".** FHIR offers this mechanism to allow the referenced resource (eg Location in this example) to be incorporated within the main resource (eg Encounter). This allows the information to be shared as a one-off - without the need to store and maintain it on an ongoing basis. The "reference" is then an internal URL, providing an internal pointer within the same FHIR Resource.
  - **"Display" text only.** For example this might just say "Patient's home" - without any attempt to offer the full location resource. Whilst obviously a less complete and informative solution, this may be adequate in some cases.
  
  Another difficulty is if the reference is to a type of Resource which the Data Provider has not yet implemented. For example an Encounter can also reference the diagnosed Condition. But maybe the Condition resource is scheduled for a future project phase and has not yet been implemented.

  In this case it is obviously not yet possible to populate the reference with a link to the full, rich Condition dataset. As an interim measure it may however be possible to populate just the "display" text with an indication of the Condition's name.

  **The use of the "identifier" field is the final topic to consider**
  
  This is most useful for resources which have a recognised national identifier - specifically Organisations and Practitioners. In this case the "identifier" provides a shortcut to discovering this unique national identifier. A Data Consumer can then either:

  a) Follow the "reference" link for the full details of the locally held data. (Which may include extra information and contact details)

  b) Use the identifier to search for the regionally hosted "master" record - which offers definitive basic details, as downloaded from the relevant national systems 

  **In summary therefore, the three fields of the Reference data structure are used as follows:**
   - **reference**
     - Will normally contain the url of a locally hosted FHIR Resource. This is the usual scenario, which should be assumed in the absence of other guidance.
     - May occasionally contain a url pointing internally to a Contained Resource. (Relevant for transitory or externally managed items where up-to-date reference data is not necessarily locally maintained)
     - May exceptionally be omitted. If all that is known is a short text summary (eg a person's name), then the "display" text alone may be sufficient - with no further "reference" pointers being necessary.
     - May temporarily be omitted if the target Resource type has not yet been implemented by the Data Provider. (Again the "display" text might still be used to provide at least some indication)
     - ***NB: A reference url MUST always be resolvable. That is, if provided then it MUST always be possible to "follow" it to retrive a FHIR resource.*** 

 - **identifier**
   - Should be populated with the National identifier for Organisations and Practitioners. Thus providing quick identification without  having to follow the reference and retrieve the whole resource, as well as providing a way to search for the regionally downloaded national master data.
    - May be populated with other identifiers, if a use-case suggests this to be a useful optimisation
    - MUST always include a "system" for the identifier, so that it can be categorised and uniquely distinguished

 - **display**
   - Should ALWAYS be populated with a short summary description of the referenced resource
      - This is a useful optimisation, allowing meaningful text to be displayed by a Data Consumer without having to unnecessarily retrieve additional data from numerous url links
      - The expected contents of this short summary description will be defined in this Implementation Guide for each type of FHIR Resource (eg the name of a Patient, etc)
      - The Interweave Connect FHIR Appliance will assist with achieving this by automatically populating the "display" text when References are returned. Other implementations will need to consider how best to populate and keep updated these short resource summaries.
    - May sometimes be the ONLY information provided
      - For example, if it is a transitory data item and nothing more than the name is relevant / known
      - Or if the Data Provider has not yet implemented the target Resource Type
    - Despite the above, this "display" text should NOT be totally relied on by Data Consumers
      - They must be robust and able to cope with Data Providers who are less mature and unable to populate "display" text
      - Depending on use-case the fallback option will be EITHER to indicate there is a link with no further information about what it might contain OR to automatically pre-follow the link and retrieve further information to generate a summary for display



## **Local Identifiers**

FHIR offers the "id" field, to contain a unique identifier for each resource (often a guid). 

However most FHIR Resources also offer an "identifier" field to capture a more meaningful and/or business-related identifier. 

In some cases there is an obvious recognised identifier to use, for example:
 - NHS Number for patients
 - ODS Code for organisations

However in many cases there is no such widely recognised identifier. Still, it can be useful to provide a local identifier - that helps to identify the item and may, for example, be useful to quote in enquiries and correspondence.

The pattern for this is established by Care Connect, which has chosen to use a single code system to denote a local identifier for a particular type of resource from ANY source. For example on the patient ***https://fhir.nhs.uk/Id/local-patient-identifier***. This has the advantage of making local identifiers consistent to find, as well as enabling their use to be defined in a Profile via "slicing".

Building on this approach we have defined similar code systems for other types of FHIR Resource.

A downside of this approach is that the local identifiers from different sources may overlap. We therefore propose a simple mitigation, based on prefixing the identifier with the organisation's ODS code (with a period as separator)

> Example:
>  The organisation with ODS code "ABC" has an item with an identifier "12345". The local identifier to be used in FHIR Resources is therefore "**ABC.12345**"
