      Status: Draft - Work In Progress

## **Introduction**
This profile sets minimum expectations for the OperationOutcome resource. Note that the OperationOutcome is based around at least one top-level "issue" - and so the points below refer to the fields within the "issue". Also see further notes on usage below.


### **Mandatory fields**
The following mandatory fields are defined for an OperationOutcome:
1. **Severity** - this is mandatory in FHIR, with a short list of required codes provided. 

   *Note: For any notifications about deficiencies in the content (“Data Impairments”) then a severity of “information” should be used*

2. **Code** - this is again mandatory in FHIR, with a list of required codes provided. Note that this code list is hierarchical (see “Level”):
     - A Data Provider SHOULD, whenever possible, populate a Level 2 code to provide more granular and detailed categorisation of the error. 
     - A Data Consumer MAY wish to use these  codes to automate aspects of error handling. The Level 1 codes in particular offer a short list which indicates useful information about whether the error is technical, security-related, retryable, etc

3. **Details.text** - This MUST be populated and MUST contain a description of the error that is meaningful to an end-user. This is what will be displayed to the user on the screen.

   *Note: An Operation Outcome may be returned as part of a bundle containing multiple FHIR Resources, so the text should be as descriptive and self-contained as possible in terms of contextual information.*

   *Note: this text does NOT need to include information about the source of the error, as this is already provided by the meta tags for “source” and “provenance”*





### **Must Support fields**
In addition the following fields are "Must Support" - ie they must be populated if relevant and known:


1. **Diagnostics** - This should be populated with additional technical information about the error. It is anticipated that user interfaces will not display this to the user by default, but will be able to reveal it on request – eg to capture a screenshot for support purposes



### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them:

 - **Details.coding** - The primary mechanism for describing errors is based on the above "issue.code" plus the "details.text" – and for most types of errors this is anticipated to be adequate, with no need for additional detailed coding to be curated or populated.

   However it is also envisaged that in the near future Operation Outcomes may also be used to communicate data-related deficiencies (“Data Impairments”) - and that an additional level of coding will be needed to help identify and classify these. In summary therefore:
   - This field is reserved for future use, please do not use it without further consultation / guidance
   - In the near future it is anticipated that one or more regional code lists will be published. These codes will be linked to a top level issue.code and provide more granular categorisation of particular types of issue.


 - **Expression** - May be used to provide additional information about which part of the data is at issue. See guidance in FHIR Specification. (Although we are using STU3, the [FHIR R4 guidance notes](https://www.hl7.org/fhir/STU3/operationoutcome.html#loc) are more informative). See also Design Paper 17 on “Data Impairments” <https://yhcr.org/resources/technical-papers/> 


### **Discouraged or Removed fields**
 - **Location** - this is an XML-specific field and is deprecated in FHIR R4. Use "expression" instead. 



### **Additional notes**

1. **RequestId tag**
   All Operation Outcomes which pass through the Exchange will have a tag populated: https://yhcr.nhs.uk/RequestId. The "code" of this tag will contain a request id which can be used to uniquely identify the interaction and thus provide a link to diagnostic logs. 
   
   ***Please quote this RequestId for troubleshooting purposes***

2. **Narrative text**

   Some Operation Outcomes have historically populated the resource's narrative “text” with HTML information about the error. This is discouraged and it should not be assumed that the user will be shown this text. This is because it is difficult to predict the effect of this HTML formatting on a Data Consumer screen. Instead simple text should be provided in the "details.text".


3. **Multiple Issues**

   FHIR allows for an OperationOutcome to contain MUTLIPLE “issues”, and this may sometimes be the case. An important example is if a returned resource fails FHIR Profile Validation – in this case the original resource will be replaced with an OperationOutcome containing multiple “issues” to describe each of the validation problems detected.

   ***The convention in this case is that the FIRST issue in the list must contain a summary suitable for showing to the user.***

   Additional issues in the list can provide further detail and MAY be shown to the user if they choose to drill in and view full details of the error.

4. **HTTP error codes**

   - When an error occurs then a relevant HTTP failure code should also be returned, thus indicating to a consumer that they should look for an Operation Outcome rather than the originally anticipated response. 

   - If an Operation Outcome is returned then it should be expected that consumers will use this (rather than the HTTP response code) as the primary source of information to show users

   - It should be noted that the Exchange middleware may often return a HTTP 200 response (indicating that all central processing has completed successfully) - however the FHIR Bundle returned may still contain one or more Operation Outcomes to capture failures reported by individual Data Providers.
