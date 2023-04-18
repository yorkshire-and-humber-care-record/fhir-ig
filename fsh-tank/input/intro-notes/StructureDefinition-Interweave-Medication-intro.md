     Status: DRAFT: For Review.


## **Introduction**

This profile sets out the expectations for the Interweave medication resource. For shared care, the importance needs to be placed on “What” the medication is and its form. We therefore have defined a very minimal dataset and removed all unnecessary fields.

### **Mandatory fields**
The following fields are mandatory:

- **code** – This field is the most important, we need to know what the medication is. A SNOMED dm+d code MUST be supplied.

### **Must Support fields**
In addition, the following fields are "Must Support" - i.e. they must be populated if relevant and known:

- **form** – This field is recommended by PRSB. Useful information if it is available.

### **Optional fields**
Other fields are optional and may be populated if known - on the understanding that not all data consumers will necessarily make use of them. Optional fields to note include:

- **identifier** –  Allows for an additional local medication identifier to be shared in addition to the official DM&D identifier.

- **manufacturer** – Option to provide a reference to the organization which manufactured the medication.

### **Discouraged or Removed fields**
     
- **ingredient** – DISCOURAGED. This field has been discouraged to removed complexity. No real use case was identified at the time of writing, however, it was recognised that it may have a part to play in relation to allergies/intolerances, so it has been left in rather than removed. To keep this field inline with R4, the subfield ‘amount’ is removed and the field ‘strength’ introduced.

- The following fields have been removed to keep the medication model clear:

    - package
    - image 
    - status
    - isBrand
    - isOverTheCounter