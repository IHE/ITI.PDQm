
The Patient Demographics Query for Mobile (PDQm) Profile defines a lightweight RESTful interface to a patient demographics supplier leveraging technologies readily available to mobile applications and lightweight browser based applications.

The functionality is similar to the [PDQ](https://profiles.ihe.net/ITI/TF/Volume1/ch-8.html) and [PDQv3](https://profiles.ihe.net/ITI/TF/Volume1/ch-24.html) Profiles. The differences are driven by the use of HL7 [FHIR](http://hl7.org/fhir/). The profile leverages HTTP transport, and the JavaScript Object Notation (JSON), Simple-XML, and Representational State Transfer (REST). The payload format is defined by the HL7 [FHIR](http://hl7.org/fhir/) standard.

The following list provides a few examples of how PDQm might be leveraged by implementers:
-   A health portal securely exposing demographics data to browser-based plugins
-   Medical devices which need to access patient demographic information
-   Mobile devices used by physicians (example bedside eCharts) which need to establish patient context by scanning a bracelet
-   Web based EHR/EMR applications which wish to provide dynamic updates of patient demographic information such as a non-postback search,  additional demographic detail, etc.
-   Any low resource application which exposes patient demographic search functionality
-   Any application using the MHD Profile to access documents may use PDQm to find an appropriate patient identifier

This implementation guide is intended to be fully compliant with the HL7 [FHIR](http://hl7.org/fhir/) specification, providing only use-case driven constraints to aid with interoperability, deterministic results, and compatibility with existing PDQ and PDQv3 Profiles.

## 1:38.1 PDQm Actors, and Transactions

Figure 38.1-1 shows the actors directly involved in the Patient Demographics Query for Mobile Profile and the relevant transactions between them. Note that the actors in this profile are the same as the actors defined in the PDQ Profile (ITI TF-1: 8.1).
<div>
{%include PDQm-Actor-Diagram.svg %}
</div>
<br clear="all">

**Figure 38.1: PQDm Actor Diagram**

Table 38.1-1: PDQm; Profile - Actors and Transactions

| Actors  | Transactions  | Initiator or Responder | Optionality| Reference|
|---------|---------------|:----------------------:|:---------------:|-----------------------------------|
| Patient Demographics Consumer | Mobile Patient Demographics Query [ITI-78]  | Initiator | R  | [ITI TF-2:3.78](ITI-78.html) |
| Patient Demographics Supplier | Mobile Patient Demographics Query [ITI-78] | Responder | R | [ITI TF-2:3.78](ITI-78.html) |
{:.grid}


Note 1: The Mobile Patient Demographics Query [\[ITI-78\]](ITI-78.html) transaction corresponds to the transactions used in the [PDQ](https://profiles.ihe.net/ITI/TF/Volume1/ch-8.html) and [PDQv3](https://profiles.ihe.net/ITI/TF/Volume1/ch-24.html) Profiles and provides similar functionality. 
There is no transaction which corresponds to the Patient Demographics and Visit Query [ITI-22].
See [ITI TF-2: Appendix M.4](https://profiles.ihe.net/ITI/TF/Volume2/ch-M.html#M.4) for a mapping of query fields for PDQ, PDQv3, and PDQm transactions.

### 1:38.1.1 Actor Descriptions and Actor Profile Requirements
No additional requirements.

### 1:38.1.2 Transaction Descriptions
The transactions in this profile are summarized in the sections below.

#### 1:38.1.2.1 PQDm Mobile Patient Demographics Query transaction

Mobile Patient Demographics Query is used by the Patient Demographics Consumer to solicit information about patients whose demographics data match data provided in the query parameters on the request message. The request is received by the Patient Demographics Supplier. The Patient Demographics Supplier processes the request and returns a response in the form of demographics information for the matching patients.

For more details see the detailed [transaction description](ITI-78.html)

## 1:38.2 PDQm Actor Options

Options that may be selected for each actor in this profile, if any, are listed in Table 38.2-1. Dependencies between options when applicable are specified in notes.

**Table 38.2-1: Patient Demographics Query for Mobile - Actors and Options**

Actor	| Option Name |	Reference
---|---|---
Patient Demographics Consumer |	Pediatric Demographics Option |	Section 1:38.2.1
Patient Demographics Supplier |	Pediatric Demographics Option |	Section 1:38.2.1
{:.grid}

### 1:38.2.1 Pediatric Demographics Option
The experience of immunization registries and other public health population databases has shown that retrieving patient records for an individual person in environments with large proportions of pediatric records requires additional demographic data.

Information about the mother of the patient or a household telephone number is helpful in retrieving records in large population databases where data quality may be uneven.

Certain other demographics fields are important to include in the query response as they may be used by the Patient Demographics Consumer in verifying the identity of the patient; in particular, they aid in distinguishing records for twins, triplets, and so forth.

Pediatric Demographics makes use of the following four additional demographic fields to aid record matching in databases with many pediatric records.

Field |	Reason for Inclusion |	Value
---|---|---
Mother’s Maiden Name |	Any information about the mother is helpful in making a match	| Helps create true positive matches
Patient Home Telephone | A telecom helps match into the right household | Helps create true positive matches
Patient Multiple Birth Indicator | Indicates this person is a multiple – twin, triplet, etc. | Helps avoid false positive matches of multiples
Patient Birth Order | Distinguishes among those multiples. | Helps avoid false positive matches of multiples
{:.grid}

Note that PDQ Profile includes support for Last Update Date/Time, Last Update Facility. These elements are not included in PDQm as they are elements of the Visit/Encounter which is not in scope for PDQm.

Patient Demographics Supplier which support the Pediatric Demographics Option shall support all the Patient elements specified and query parameters specified including Mother’s Maiden Name.

Patient Demographics Consumers which support the Pediatric Demographics Option shall be able to provide the below listed Pediatric Demographics query parameter fields in the Patient Demographics Query [ITI-78] transaction and shall be able to receive and process any values returned for the fields identified as Pediatric Demographics.

Pediatric Demographics query parameter fields are:  
*	Mother’s Maiden Name

Pediatric Demographics fields are defined as the following:  
*	Mother’s Maiden Name
*	Patient Home Telephone
*	Patient Multiple Birth Indicator
*	Patient Birth Order

Note that the Pediatric Demographics Option relies on STU extensions.

## 1:38.3 PDQm Required Actor Grouping


When the Patient Demographics Supplier is grouped with actors in other IHE profiles that perform patient information reconciliation activities (e.g., the ADT Actor in the IHE Radiology Scheduled Workflow.b Profile), the Patient Demographics Supplier may use the updated information to respond to PDQm Queries. In addition, the Patient Demographics Query for Mobile Profile may play an integral workflow role in conjunction with other IHE profiles.

Those systems that manage patient demographics could implement the Patient Demographics Supplier 
in all three profiles: PDQ, PDQv3, and PDQm. In this way the Patient Demographics Consumer can 
choose the technology stack that best fits. 
[ITI TF-2:Appendix M.4](https://profiles.ihe.net/ITI/TF/Volume2/ch-M.html#M.4) provides additional 
details about Patient Demographics Query Profiles and their relationship with one another. 

The Patient Demographics Supplier may act as a proxy to an existing PDQ or PDQv3 environment as shown in Figure 38.6-1. 

<div>
{%include Implementing-PDQm-as-a-gateway.svg%}
</div>
<br clear="all">
**Figure 38.6-1: Implementing PDQm as a gateway**

## 1:38.4 PDQm Overview

### 1:38.4.1 Concepts
The PDQm Profile supports all of the use cases of PDQ while keeping the technology as lightweight as possible. Example uses include:
*   Mobile devices used by physicians (for example: a mobile app for electronic patient charts) which need to establish patient context by scanning a bracelet,
*	Web based EHR/EMR applications which wish to provide dynamic updates of patient demographic information such as a non-postback search, additional demographic detail, etc.
*	A document source/consumer wishing to perform an operation in the IHE Mobile access to Health Documents (MHD) Profile, where patient ID in the appropriate patient ID domain needs to be resolved by the source/consumer,
*	A health portal securely exposing demographics data to browser-based plugins,
*	Medical devices which need to access patient demographic information.
Each of these specific use cases is generalized into two general use cases. The first is one where a system must obtain patient demographics to populate a user interface via a known demographic field (such as bracelet ID) or search parameters provided by a user. The second is as a prerequisite step whereby an application must obtain an identifier from another patient ID domain in order to complete another workflow.
This profile is applicable for use by any application which requires access to patient demographics where lightweight REST/JSON or REST/XML is a more suitable technology than traditional PDQ or PDQv3 Profiles.

### 1:38.4.2 Use Cases

#### 1:38.4.2.1 Use Case #1: Patient Information Entering at Bedside
In this use case an admitted patient is assigned a bed and may not be able to provide positive ID information. The nurse uses the PDQm Profile to establish patient context.

##### 1:38.4.2.1.1 Patient Information Entering at Bedside Use Case Description
An admitted patient is assigned to a bed. The patient may or may not be able to provide positive ID information. The nurse needs to enter patient identity information into some bedside equipment to establish the relationship of the assigned bed to the patient. The equipment issues a query for a patient pick list to a patient demographics supplier that provides data for a patient pick list. Search criteria entered by the nurse might include one or more of the following:

*	Partial or complete patient name (printed on the patient record or told by the patient)
*	Patient ID (this may be obtained from printed barcode, a bed-side chart, etc.)
*	Patient ID entry or scan.
*	Date of birth / age range

The system returns a list of patients showing Patient ID, full name, age, sex and displays the list to the nurse. The nurse then selects the appropriate record to enter the patient identity information into the bedside equipment application.

#### 1:38.4.2.2 Use Case #2: Patient Identity Information Entering in Physician Offices
In this use case a patient visits a physician for the first time. The physician system will use the PDQm Profile to import demographics information into the local application.

##### 1:38.4.2.2.1 Patient Identity Information Entering in Physician Offices Use Case Description
A patient visits a physician office for the first time. The nurse needs to register the patient; in doing so, it is desired to record the patient’s demographic data in the practice management information system (PMIS). The physician office is connected to a hospital enterprise’s central patient registry. The nurse issues a patient query request to the central patient registry acting as a Patient Demographics Supplier, with some basic patient demographics data as search criteria. In the returned patient list, she picks an appropriate record for the patient, including the hospital’s Patient ID, to enter into the PMIS. (Note the PMIS uses a different Patient ID domain than that of the central patient registry.)

#### 1:38.4.2.3 Use Case #3: Patient Demographics Query in an Enterprise with Multiple Patient ID Domains
In this use case a lab system obtains identities from multiple Patient ID domains for the purpose of reporting results.

##### 1:38.4.2.3.1 Patient Demographics Query in an Enterprise with Multiple Patient ID Domains Use Case Description
A lab technician enters some basic demographics data (e.g., patient name) into a lab application to query a patient demographics supplier to identify a patient for his lab exams. As the application also needs the patient identifier in another Patient ID Domain in the enterprise for results delivery, the application is configured to query for Patient IDs from other domains in the query response.


#### 1:38.4.3 Basic Process Flow in Patient Demographics Query for Mobile Profile

<div>
{%include Basic-Process-Flow-in-PDQm-Profile.svg%}
</div>
<br clear="all">
**Figure 38.4.3-1: Basic Process Flow in PDQm Profile**

## 1:38.5 PDQm Security Considerations


See [ITI TF-2:Appendix Z.8 “Mobile Security Considerations”](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations)

## 1:38.6 PDQm Cross-Profile Considerations


When the Patient Demographics Supplier is grouped with actors in other IHE profiles that perform patient information reconciliation activities (e.g., the ADT Actor in the IHE Radiology Scheduled Workflow.b Profile), the Patient Demographics Supplier may use the updated information to respond to PDQm Queries. In addition, the Patient Demographics Query for Mobile Profile may play an integral workflow role in conjunction with other IHE profiles.

Those systems that manage patient demographics could implement the Patient Demographics Supplier 
in all three profiles: PDQ, PDQv3, and PDQm. In this way the Patient Demographics Consumer can 
choose the technology stack that best fits. 
[ITI TF-2:Appendix M.4](https://profiles.ihe.net/ITI/TF/Volume2/ch-M.html#M.4) provides additional 
details about Patient Demographics Query Profiles and their relationship with one another. 

The Patient Demographics Supplier may act as a proxy to an existing PDQ or PDQv3 environment as shown in Figure 38.6-1. 

<div>
{%include Implementing-PDQm-as-a-gateway.svg%}
</div>
<br clear="all">
**Figure 38.6-1: Implementing PDQm as a gateway**


