# Base Fields


FHIR defines structures such as the Resource and DomainResource which provide a base set of fields for all other FHIR Resources. We consider here how these base fields are used as part of the regional care record implementation.

 - **text**	(Discouraged)
 
   The text property is a “Narrative” which consists of a status and an xhtml “div” property – ie to contain a HTML representation of the resource.  It can be useful in some scenarios but as it’s optional, consumers can’t rely on it being there.  It also bloats resources and encourages unstructured use. The preferred approach is to offer structured data fields – which a Data Consumer can then render and present in a manner most suited to its users


 - **Id** (Must Support)

	An arbitrary unique id (eg guid) which is used to reference the resource. This is mandatory for most resource types, but may not be included for some transient resources (eg Bundle, OperationOutcome, etc)

 - **implicitRules** (Discouraged)	
   
   Not used


 - **language** (Optional)

	If not provided then English (EN) will be assumed. (Note that as of this writing Interweave is not a multilingual system)


 - **meta.versionId** (Must Support)
 
    Must be populated for a FHIR endpoint which supports versioning. It is appreciated that some systems cannot achieve this, however it is strongly encouraged as a mechanism for providing a fully history and audit trail of what has been shared


 - **meta.lastUpdated** (Mandatory)

	This is important and useful information


 - **meta.profile** (Must Support)
 
   All resources must conform to a Profile and should state it here. Also note that it’s an array and multiple profiles can be specified (e.g. Care Connect AND a regional profile from this Implementation Guide)


 - **meta.security** (Discouraged)
 
    This field is not used and will not be honoured. All data published to the Interweave Exchange will be shared with other participants. 

    (Mechanisms for additional restrictions and “break glass” MAY be considered in future and it MAY be decided to use this field as part of that consultation. However this will be progressed as a change when-and-if that time comes)


 - **meta.tag**	(Mandatory)
   
   The following tags will be used. Both are mandatory and MUST include descriptive text that is a proper readable description and not simply a repeat of the code

    - https://yhcr.nhs.uk/Source -  Data provider identifier as per the Participant Registry
    - https://yhcr.nhs.uk/Provenance - Originating organisation ODS code

    In many cases these will have a simple one-to-one relationship, however in more complex cases there may be, for example, one Data Provider system that provides a shared platform used by multiple organisations


 - **textSummary** (Optional - Extension) 

   This is an extension which can contain a short summary description of the resource. Details of how to construct it will be specified for each resource type – eg for a Patient it would be their name. An important use of this “summary description” is for it to be used as the “display” value when referencing a Resource.

   As this is an extension it is not mandatory to populate it (especially as it can always be recreated from the other data items). However the plan is to populate it as a useful optimisation for any FHIR Resources served from the standard “Interweave Connect” FHIR Appliance 