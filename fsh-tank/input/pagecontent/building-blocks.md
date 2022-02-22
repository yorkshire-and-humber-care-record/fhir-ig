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
   - ***A "coding" entry must always include "coding.display" wording***. (Noting some rare exceptions where no display value exists, in which case this is impossible)

   - The coding.system must always be populated. (For local codes it is suggested to devise a unique uri - for example based on the url of the local FHIR server)


### Data Consumer Implications

When displaying a Codeable Concept to the user then a Data Consumer should attempt to use in priority order:

 1. The "text" content
 
 2. The "coding.display" string from the coding entry marked as "userSelected"

 3. The "coding.display" string from the first (and probably only) other coding entry

 If none of these yield text to display then it is an error and cannot be displayed. 

## **Reference**

A Reference enables the creation of linkages between resources. This is an essential part of creating a rich web of interlinked data which users can browse. There are potentially three parts to a Reference:

**1. The "reference" URL**

***This MUST always be populated and MUST always be resolvable. That is, it MUST always be possible to "follow" it to retrive a FHIR resource.***

 - In most cases this will point at another locally hosted resource.

 - However there can be situations where this is not possible. This is particularly likely when referencing external items - for example locations where a patient is discharged to (their house, another care facility), and similarly for external practitioners and organisations. In this case the organisation authoring the resource will not hold definitive reference data about this item

 - The solution in this case is to use a [Contained Resource](https://www.hl7.org/fhir/STU3/references.html#contained). FHIR offers this mechanism to allow the referenced resource (eg a location in this example) to be incorporated within the main resource (eg Encounter). This allows the information to be shared as a one-off - without the need to store and maintain it on an ongoing basis. The "reference" is then an internal URL, providing an internal pointer within the same FHIR Resource.



**2. "Display" text**

 - This is a short string to describe the referenced item.

 - ***For straightforward reference data about people and places this MUST always be populated with the name.*** 

   Specifically:

   - **Patient**: name (eg prefix, given name, family name)

   - **Practitioner**: name (eg prefix, given name, family name)

   - **RelatedPerson**: name (eg prefix, given name, family name)

   - **Location**: name

   - **Organisation**: name

   These resource types are very commonly used, and it is a valuable optimisation to make these resources usable stand-alone without a data consumer having to retrieve numerous additional FHIR Resources just to provide a basic display.

   ***The standard FHIR Appliance will populate the above reference "display" texts automatically with up-to-date values***

 - For other resource types the display text MAY be populated, but there is more to consider:

   - Complex clinical resources cannot necessarily be summed up accurately and safely in a short string

   - Often the referencing resource already contains other fields (eg a code or string) which are intended to provide the necessary summary

   - It is, of course, also possible to instead use _include which - although less efficient - does retrieve the whole resource to inspect and select from for display

**3. An "identifer"**

This MAY be used to uniquely identify the referenced item
 
  - This is most useful for resources which have a recognised national identifier - specifically Patients, Organisations and Practitioners. In this case the "identifier" can provide a shortcut to discovering this unique national identifier. 
 - It may also be populated with other local identifiers, if a use-case suggests this to be a useful optimisation
 - If used then it MUST always include a "system" for the identifier, so that it can be categorised and uniquely distinguished

 

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
