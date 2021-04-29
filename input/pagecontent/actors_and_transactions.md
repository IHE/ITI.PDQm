
This section defines the actors and transactions in this implementation guide.
### PDQm – Patient Demographics Query for Mobile
The Patient Demographics for Mobile (PDQm) Profile provides a transaction for mobile and lightweight browser-based applications to query a patient demographics supplier for a list of patients based on user-defined search criteria and retrieve a patient’s demographic information. This profile provides a lightweight alternative to PDQ Patient Demographics Query [ITI-21] or PDQV3 Patient Demographics Query V3 [ITI-47].

#### PDQm Actors, Transactions, and Content Modules
Figure 38.1-1 shows the actors directly involved in the Patient Demographics Query for Mobile Profile and the relevant transactions between them. Note that the actors in this profile are the same as the actors defined in the PDQ Profile (ITI TF-1: 8.1).
<div>
{%insert PDQm-Actor-Diagram.svg %}
</div>
**Figure 38.1: PQDm Actor Diagram**

Table 38.1-1: PDQm; Profile - Actors and Transactions

| Actors  | Transactions  | Initiator or Responder | Optionality| Reference|
|---------|---------------|:----------------------:|:---------------:|-----------------------------------|
| Patient Demographics Consumer | Mobile Patient Demographics Query [ITI-78]  | Initiator | R  | ITI TF-2c: 3.78 |
| Patient Demographics Supplier | Mobile Patient Demographics Query [ITI-78] | Responder | R | ITI TF-2c: 3.78 |
{:.grid}

Note 1: The transaction defined in this profile corresponds to Patient Demographics Query [ITI-21] in the PDQ Profile (ITI TF-1: 8) and provides similar functionality. Note that there is no transaction which corresponds to the Patient Demographics and Visit Query [ITI-22].

##### Actor Descriptions and Actor Profile Requirements
No additional requirements.


#### PDQm Actor Options
Options that may be selected for each actor in this profile, if any, are listed in Table 38.2-1. Dependencies between options when applicable are specified in notes.
**Table 38.2-1: Patient Demographics Query for Mobile - Actors and Options**
Actor	| Option Name |	Reference
---|---|---
Patient Demographics Consumer |	Pediatric Demographics Option |	Section 38.2.1
Patient Demographics Supplier |	Pediatric Demographics Option |	Section 38.2.1
{:.grid}

##### Pediatric Demographics Option
The experience of immunization registries and other public health population databases has shown that retrieving patient records for an individual person in environments with large proportions of pediatric records requires additional demographic data.

Information about the mother of the patient or a household telephone number is helpful in retrieving records in large population databases where data quality may be uneven.

Certain other demographics fields are important to include in the query response as they may be used by the Patient Demographics Consumer in verifying the identity of the patient; in particular, they aid in distinguishing records for twins, triplets, and so forth.

Pediatric Demographics makes use of the following four additional demographic fields to aid record matching in databases with many pediatric records.

Field |	Reason for Inclusion |	Value
---|---|---
Mother’s Maiden Name |	Any information about the mother is helpful in making a match	| Helps creates true positive matches
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


#### PDQm Required Actor Groupings

No required groupings. The [Security Considerations](security_considerations.html) page describes some optional groupings that may be of interest for security considerations.  [Cross-Profile Considerations](grouping.html) describes some optional groupings in other related profiles.


### Transaction Descriptions
The transactions in this profile are summarized in the sections below.

#### PQDm Mobile Patient Demographics Query transaction

Mobile Patient Demographics Query is used by the Patient Demographics Consumer to solicit information about patients whose demographics data match data provided in the query parameters on the request message. The request is received by the Patient Demographics Supplier. The Patient Demographics Supplier processes the request and returns a response in the form of demographics information for the matching patients.

For more details see the detailed [transaction description](ITI-78.html)
