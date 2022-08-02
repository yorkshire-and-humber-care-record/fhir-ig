      Status: DRAFT: Work in Progress

**Definition** A sub-unit of workers which act as a team within an Organisation.

## Introduction
This profile sets minimum expectations for the Organizational team, represented by an Organization FHIR resource. An Organizational Team is a sub-unit of workers which act as a team within an organisation. However, we do not need to model the individual team members here. It is simply enough to provide the name of the team, their contact details and which organisation they belong to (e.g. a local authority or private care provider). The resource is intended to be used for the practical purpose of getting in touch about a person's support. Typically, organisational teams will be the owners of assessments and services. 


### **Organizational Team coverage and references**
 - A Data Provider MUST offer Organizational Team FHIR resources to represent its own Organizational Teams.
 
 - When referencing an Organizational Team then the "reference" (URL of FHIR Resource) and "display" (organizational team name) MUST be populated.
 
### **Organizational Team hierarchy** 
We do not intend to model the full organizational structure here. This is a very simple two-tier hierarchy showing the very top (local authority or a private provider) and very bottom (Organizational Team) of the tree. This two-tier structure should be created by providing a reference to the Organization resource, to which the team belongs, within the “partOf” field.  

The diagram below depicts this hierarchy:

<img src=".\OrganizationalTeamStructure.png" alt="Organisational Team Hierarchy Diagram" style="clear:both; float:none">

### **Mandatory fields**
The following fields are mandatory:

- **name** - The descriptive name of the organizational team.

- **active** - A mandatory flag to indicate whether Organizational Team is active.

- **type** - Default to SCT 310136008: Social Services department duty team

- **partOf** - This is a mandatory field and is used to provide a reference to the organization to which the team belongs e.g. A local authority. (See notes above for further information)

### **Must Support fields**
In addition, the following fields are "Must Support" - i.e. they must be populated if relevant and known:

- **telecom** - The contact details for the team. This is important information that must be provided.

### **Optional fields**
These fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them:

- **identifier:localIdentifier** - As with most other resources, there is the option to include a local identifier which may help to identify the Organizational Team at a local level.

- **address** - Can be populated if known - although is not deemed to be that important.

### **Discouraged or Removed fields**
 
- **extensions** - Removed. Two extensions are defined by Care Connect, but do not appear to be vital for our usage here.
- **contact** - Removed. Not required, removed to avoid any confusion with the Telecom field.
- **endpoint** - Removed. Technical endpoints are captured elsewhere (i.e. via the Participant Registry).

