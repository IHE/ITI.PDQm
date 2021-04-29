**Integrating the Healthcare Enterprise**

<img src="media\image1.jpeg" style="width:1.78681in;height:0.92014in" alt="IHE_LOGO_for_tf-docs" />

**IHE IT Infrastructure**

**Technical Framework Supplement**

**Patient Demographics Query for Mobile**

**(PDQm)**

HL7<sup>®</sup> FHIR<sup>®</sup> Release 4

Using FHIR Resources at Normative Level

**Rev. 2.2 – Trial Implementation**

Date: August 28, 2020

Author: IHE ITI Technical Committee

Email: iti@ihe.net

**Please verify you have the most recent version of this document.** See
[here](http://ihe.net/Technical_Frameworks/) for Trial Implementation
and Final Text versions and [here](http://ihe.net/Public_Comment/) for
Public Comment versions.

**Foreword**

This is a supplement to the IHE IT Infrastructure Technical Framework
V17.0. Each supplement undergoes a process of public comment and trial
implementation before being incorporated into the volumes of the
Technical Frameworks.

This supplement is published on August 28, 2020 for trial implementation
and may be available for testing at subsequent IHE Connectathons. The
supplement may be amended based on the results of testing. Following
successful testing it will be incorporated into the IT Infrastructure
Technical Framework. Comments are invited and can be submitted at
[http://www.ihe.net/ITI\_Public\_Comments](http://www.ihe.net/ITI_Public_Comments/).

This supplement describes changes to the existing technical framework
documents.

“Boxed” instructions like the sample below indicate to the Volume Editor
how to integrate the relevant section(s) into the relevant Technical
Framework volume.

Amend Section X.X by the following:

Where the amendment adds text, make the added text **<u>bold
underline</u>**. Where the amendment removes text, make the removed text
**~~bold strikethrough~~**. When entire new sections are added,
introduce with editor’s instructions to “add new text” or similar, which
for readability are not bolded or underlined.

General information about IHE can be found at
[http://ihe.net](http://ihe.net/).

Information about the IHE IT Infrastructure domain can be found at
[http://ihe.net/IHE\_Domains](http://ihe.net/IHE_Domains/).

Information about the organization of IHE Technical Frameworks and
Supplements and the process used to create them can be found at
[http://ihe.net/IHE\_Process](http://ihe.net/IHE_Process/) and
[http://ihe.net/Profiles](http://ihe.net/Profiles/).

The current version of the IHE IT Infrastructure Technical Framework can
be found at
[http://ihe.net/Technical\_Frameworks](http://ihe.net/Technical_Frameworks/).

CONTENTS

[Introduction to this Supplement 5](#introduction-to-this-supplement)

[Open Issues and Questions 6](#open-issues-and-questions)

[Closed Issues 6](#closed-issues)

[General Introduction 7](#general-introduction)

[Appendix A – Actor Summary Definitions
7](#appendix-a-actor-summary-definitions)

[Appendix B – Transaction Summary Definitions
7](#appendix-b-transaction-summary-definitions)

[Glossary 7](#glossary)

[**Volume 1 – Profiles 8**](#_Toc49502252)

[Copyright Licenses 8](#copyright-licenses)

[8.6 PDQ Cross Profile Considerations
8](#pdq-cross-profile-considerations)

[24.6 PDQv3 Cross Profile Considerations
8](#pdqv3-cross-profile-considerations)

[38 PDQm –Patient Demographics Query for Mobile
8](#pdqm-patient-demographics-query-for-mobile)

[38.1 PDQm Actors, Transactions, and Content Modules
9](#pdqm-actors-transactions-and-content-modules)

[38.1.1 Actor Descriptions and Actor Profile Requirements
10](#actor-descriptions-and-actor-profile-requirements)

[38.2 PDQm Actor Options 10](#pdqm-actor-options)

[38.2.1 Pediatric Demographics Option
10](#pediatric-demographics-option)

[38.3 PDQm Required Actor Groupings 11](#pdqm-required-actor-groupings)

[38.4 PDQm Overview 11](#pdqm-overview)

[38.4.1 Concepts 11](#concepts)

[38.4.2 Use Cases 12](#use-cases)

[38.4.2.1 Use Case \#1: Patient Information Entering at Bedside
12](#use-case-1-patient-information-entering-at-bedside)

[38.4.2.1.1 Patient Information Entering at Bedside Use Case Description
12](#patient-information-entering-at-bedside-use-case-description)

[38.4.2.2 Use Case \#2: Patient Identity Information Entering in
Physician Offices
13](#use-case-2-patient-identity-information-entering-in-physician-offices)

[38.4.2.2.1 Patient Identity Information Entering in Physician Offices
Use Case Description
13](#patient-identity-information-entering-in-physician-offices-use-case-description)

[38.4.2.3 Use Case \#3: Patient Demographics Query in an Enterprise with
Multiple Patient ID Domains
13](#use-case-3-patient-demographics-query-in-an-enterprise-with-multiple-patient-id-domains)

[38.4.2.3.1 Patient Demographics Query in an Enterprise with Multiple
Patient ID Domains Use Case Description
13](#patient-demographics-query-in-an-enterprise-with-multiple-patient-id-domains-use-case-description)

[38.4.3 Basic Process Flow in Patient Demographics Query for Mobile
Profile
13](#basic-process-flow-in-patient-demographics-query-for-mobile-profile)

[38.5 PDQm Security Considerations 14](#pdqm-security-considerations)

[38.6 PDQm Cross Profile Considerations
14](#pdqm-cross-profile-considerations)

[**Volume 2c – Transactions 16**](#_Toc336000611)

[3.78 Mobile Patient Demographics Query \[ITI-78\]
16](#mobile-patient-demographics-query-iti-78)

[3.78.1 Scope 16](#scope)

[3.78.2 Actor Roles 16](#actor-roles)

[3.78.3 Referenced Standards 16](#referenced-standards)

[3.78.4 Messages 17](#messages)

[3.78.4.1 Query Patient Resource message
17](#query-patient-resource-message)

[3.78.4.1.1 Trigger Events 17](#trigger-events)

[3.78.4.1.2 Message Semantics 17](#message-semantics)

[3.78.4.1.2.1 Query Search Parameters 18](#query-search-parameters)

[3.78.4.1.2.2 Pediatric Demographics Option
19](#pediatric-demographics-option-1)

[3.78.4.1.2.3 Parameter Modifiers 20](#parameter-modifiers)

[3.78.4.1.2.4 Populating Which Domains are Returned
20](#populating-which-domains-are-returned)

[3.78.4.1.2.5 Populating Expected Response Format
20](#populating-expected-response-format)

[3.78.4.1.3 Expected Actions 20](#expected-actions)

[3.78.4.2 Query Patient Resource Response message
23](#query-patient-resource-response-message)

[3.78.4.2.1 Trigger Events 23](#trigger-events-1)

[3.78.4.2.2 Message Semantics 23](#message-semantics-1)

[3.78.4.2.2.1 Patient Resource Definition in the Context of Query
Patient Resource Response
23](#patient-resource-definition-in-the-context-of-query-patient-resource-response)

[3.78.4.2.2.2 Mother’s Maiden Name 23](#mothers-maiden-name)

[3.78.4.2.2.3 Resource Bundling 23](#resource-bundling)

[3.78.4.2.2.4 Incremental Response Processing - Paging of Resource
Bundle 23](#incremental-response-processing---paging-of-resource-bundle)

[3.78.4.2.2.5 Quality of Match 23](#quality-of-match)

[3.78.4.2.3 Expected Actions 24](#expected-actions-1)

[3.78.4.2.4 CapabilityStatement Resource
24](#capabilitystatement-resource)

[3.78.4.3 Retrieve Patient Resource message
24](#retrieve-patient-resource-message)

[3.78.4.3.1 Trigger Events 24](#trigger-events-2)

[3.78.4.3.2 Message Semantics 24](#message-semantics-2)

[3.78.4.3.3 Expected Actions 25](#expected-actions-2)

[3.78.4.4 Retrieve Patient Resource Response message
25](#retrieve-patient-resource-response-message)

[3.78.4.4.1 Trigger Events 26](#trigger-events-3)

[3.78.4.4.2 Message Semantics 26](#message-semantics-3)

[3.78.4.4.2.1 Patient Resource Definition in the Context of Retrieve
Patient Resource Response
26](#patient-resource-definition-in-the-context-of-retrieve-patient-resource-response)

[3.78.5 Security Considerations 26](#security-considerations)

[3.78.5.1 Security Audit Considerations
26](#security-audit-considerations)

[Appendices 27](#_Toc49502309)

[~~Appendix M Using Patient Demographics Query in a Multi-Domain
Environment~~
28](#appendix-m-using-patient-demographics-query-in-a-multi-domain-environment)

[Appendix M Patient Demographics Query Implementation Guidance
28](#appendix-m-patient-demographics-query-implementation-guidance)

[M.4 Data Elements Patient Demographics Query Profiles
28](#m.4-data-elements-patient-demographics-query-profiles)

[M.4.1 Patient Demographics Query Data Fields
28](#m.4.1-patient-demographics-query-data-fields)

[M.4.2 Patient Demographics Query Parameters
29](#m.4.2-patient-demographics-query-parameters)

#  Introduction to this Supplement

<table>
<tbody>
<tr class="odd">
<td><p>Whenever possible, IHE profiles are based on established and stable underlying standards. However, if an IHE domain determines that an emerging standard has high likelihood of industry adoption, and the standard offers significant benefits for the use cases it is attempting to address, the domain may develop IHE profiles based on such a standard. During Trial Implementation, the IHE domain will update and republish the IHE profile as the underlying standard evolves.</p>
<p>Product implementations and site deployments may need to be updated in order for them to remain interoperable and conformant with an updated IHE profile.</p>
<p>This PDQm Profile uses content from Release 4 of the HL7<sup>®</sup><a href="#fn1" class="footnote-ref" id="fnref1" role="doc-noteref"><sup>1</sup></a> FHIR<sup>®</sup><a href="#fn2" class="footnote-ref" id="fnref2" role="doc-noteref"><sup>2</sup></a> specification. HL7 describes FHIR Change Management and Versioning at <a href="https://www.hl7.org/fhir/versions.html">https://www.hl7.org/fhir/versions.html</a>.</p>
<p>HL7 provides a rating of the maturity of FHIR content based on the FHIR Maturity Model (FMM): level 0 (draft) through N (Normative). See <a href="http://hl7.org/fhir/versions.html#maturity">http://hl7.org/fhir/versions.html#maturity</a>.</p>
<p>The FMM levels for FHIR content used in this profile are:</p>
<table>
<thead>
<tr class="header">
<th>FHIR Content</th>
<th>FMM Level</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Patient</td>
<td>normative</td>
</tr>
<tr class="even">
<td>OperationOutcome</td>
<td>normative</td>
</tr>
<tr class="odd">
<td>Bundle</td>
<td>normative</td>
</tr>
</tbody>
</table>
<p>Note that although Patient resource is normative, the query parameters on Patient are Standard for Trial Use (STU). Note that the Pediatric Demographics Option relies on STU extensions.</p></td>
</tr>
</tbody>
</table>
<section class="footnotes" role="doc-endnotes">
<hr />
<ol>
<li id="fn1" role="doc-endnote"><p>HL7 is the registered trademark of Health Level Seven International.<a href="#fnref1" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
<li id="fn2" role="doc-endnote"><p>FHIR is the registered trademark of Health Level Seven International.<a href="#fnref2" class="footnote-back" role="doc-backlink">↩︎</a></p></li>
</ol>
</section>

The Patient Demographics Query for Mobile (PDQm) Profile defines a
lightweight RESTful interface to a patient demographics supplier
leveraging technologies readily available to mobile applications and
lightweight browser based applications.

The functionality is identical to the PDQ Profile described in the ITI
TF-1:8. The differences are transport and messaging format of messages
and queries. The profile leverages HTTP transport, and the JavaScript
Object Notation (JSON), Simple-XML, and Representational State Transfer
(REST). The payload format is defined by the HL7 FHIR draft standard.

Using these patterns, the PDQm Profile exposes the functionality of a
patient demographics supplier to mobile applications and lightweight
browser applications.

The following list provides a few examples of how PDQm might be
leveraged by implementers:

-   A health portal securely exposing demographics data to browser-based
    plugins

-   Medical devices which need to access patient demographic information

-   Mobile devices used by physicians (example bedside eCharts) which
    need to establish patient context by scanning a bracelet

-   Web based EHR/EMR applications which wish to provide dynamic updates
    of patient demographic information such as a non-postback search,
    additional demographic detail, etc.

-   Any low resource application which exposes patient demographic
    search functionality

-   Any application using the MHD Profile to access documents may use
    PDQm to find an appropriate patient identifier

This supplement is intended to be fully compliant with the HL7 FHIR
specification, providing only use-case driven constraints to aid with
interoperability, deterministic results, and compatibility with existing
PDQ and PDQv3 Profiles.

Currently the HL7 FHIR standard components used in this profile are at
Normative state. Some portions of PDQm are relying on STU content (such
as query parameters, mothersMaidenName).

## Open Issues and Questions

-   none

## Closed Issues

-   Upgraded to FHIR R4

-   PDQm\_100: Added the mothersMaidenName extended search parameter.
    Note that PDO Option does require sub normative extensions to
    support mothersMaidenName

-   Addressed CP-ITI-826 – PDQm Clarify requirements for Pediatric
    Demographics

<!-- -->

-   Pediatric Demographics Option – original PDQ indicated a last update
    date/time, and last updated facility element. These were identified
    as R2 elements. These are not part of the Patient Resource, but
    rather the Encounter resource. These elements are thus not in scope
    of PDQm.

# General Introduction

Update the following Appendices to the General Introduction as indicated
below. Note that these are not appendices to Volume 1.

# Appendix A – Actor Summary Definitions

|                                           |
|-------------------------------------------|
| *No change to Appendix A (no new actors)* |

# Appendix B – Transaction Summary Definitions

Add the following transactions to the IHE Technical Frameworks General
Introduction list of Transactions:

| Transaction                                  | Definition                                                                                                |
|----------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| Mobile Patient Demographics Query \[ITI-78\] | Performs a query against a patient demographics supplier using HTTP, REST, and JSON/XML message encoding. |

# Glossary

No additions to the Glossary.

<span id="_Toc49502252" class="anchor"></span>Volume 1 – Profiles

## Copyright Licenses

Add the following to the IHE Technical Frameworks General Introduction
Copyright Section:

The HL7 FHIR standard License can be found at
<http://hl7.org/fhir/license.html>.

Add the following section as 8.6

## 8.6 PDQ Cross Profile Considerations

**<u>There are two additional profiles, PDQv3 (Patient Demographics
Query HL7v3) and PDQm (Patient Demographics Query for Mobile), which
provide similar functionality to Patient Demographics Query. These
profiles adapt the Patient Demographics Query transaction of the Patient
Demographics Supplier and Patient Demographics Consumer Actors for HL7v3
and HL7 FHIR. ITI TF-2x: Appendix M.4 provides additional details about
these Patient Demographics Query Profiles and their relationship with
one another.</u>**

Add the following section as 24.6

## 24.6 PDQv3 Cross Profile Considerations

**<u>There are two additional profiles, PDQ (Patient Demographics Query)
and PDQm (Patient Demographics Query for Mobile), which provide similar
functionality to Patient Demographics Query V3. These profiles adapt the
Patient Demographics Query transaction of the Patient Demographics
Supplier and Patient Demographics Consumer Actors for HL7v2 and HL7
FHIR. ITI TF-2x: Appendix M.4 provides additional details about these
Patient Demographics Query Profiles and their relationship with one
another.</u>**

Add new Section 38

# 38 PDQm –Patient Demographics Query for Mobile

The Patient Demographics for Mobile (PDQm) Profile provides a
transaction for mobile and lightweight browser-based applications to
query a patient demographics supplier for a list of patients based on
user-defined search criteria and retrieve a patient’s demographic
information. This profile provides a lightweight alternative to PDQ
Patient Demographics Query \[ITI-21\] or PDQV3 Patient Demographics
Query V3 \[ITI-47\].

## 38.1 PDQm Actors, Transactions, and Content Modules

Figure 38.1-1 shows the actors directly involved in the Patient
Demographics Query for Mobile Profile and the relevant transactions
between them. Note that the actors in this profile are the same as the
actors defined in the PDQ Profile (ITI TF-1: 8.1).

Figure 38.1-1: PDQm Actor Diagram

Table 38.1-1 lists the transactions for each actor directly involved in
the Patient Demographics Query for Mobile Profile. To claim compliance
with this profile, an actor shall support all required transactions
(labeled “R”).

Table 38.1-1: PDQm Profile - Actors and Transactions

<table>
<tbody>
<tr class="odd">
<td>Actors</td>
<td>Transactions</td>
<td>Initiator or Responder</td>
<td>Optionality</td>
<td>Reference</td>
</tr>
<tr class="even">
<td>Patient Demographics Consumer</td>
<td><p>Mobile Patient Demographics Query</p>
<p>[ITI-78]</p></td>
<td>Initiator</td>
<td>R</td>
<td>ITI TF-2c: 3.78</td>
</tr>
<tr class="odd">
<td>Patient Demographics Supplier</td>
<td><p>Mobile Patient Demographics Query</p>
<p>[ITI-78]</p></td>
<td>Responder</td>
<td>R</td>
<td>ITI TF-2c: 3.78</td>
</tr>
</tbody>
</table>

The transaction defined in this profile corresponds to Patient
Demographics Query \[ITI-21\] in the PDQ Profile (ITI TF-1: 8) and
provides similar functionality. Note that there is no transaction which
corresponds to the Patient Demographics and Visit Query \[ITI-22\].

### 38.1.1 Actor Descriptions and Actor Profile Requirements

No additional requirements.

## 38.2 PDQm Actor Options

Options that may be selected for each actor in this profile, if any, are
listed in Table 38.2-1. Dependencies between options when applicable are
specified in notes.

Table 38.2-1: Patient Demographics Query for Mobile - Actors and Options

|                               |                               |                |
|-------------------------------|-------------------------------|----------------|
| Actor                         | Option Name                   | Reference      |
| Patient Demographics Consumer | Pediatric Demographics Option | Section 38.2.1 |
| Patient Demographics Supplier | Pediatric Demographics Option | Section 38.2.1 |

### 38.2.1 Pediatric Demographics Option

The experience of immunization registries and other public health
population databases has shown that retrieving patient records for an
individual person in environments with large proportions of pediatric
records requires additional demographic data.

Information about the mother of the patient or a household telephone
number is helpful in retrieving records in large population databases
where data quality may be uneven.

Certain other demographics fields are important to include in the query
response as they may be used by the Patient Demographics Consumer in
verifying the identity of the patient; in particular, they aid in
distinguishing records for twins, triplets, and so forth.

Pediatric Demographics makes use of the following four additional
demographic fields to aid record matching in databases with many
pediatric records.

|                                  |                                                               |                                                 |
|----------------------------------|---------------------------------------------------------------|-------------------------------------------------|
| Field                            | Reason for Inclusion                                          | Value                                           |
| Mother’s Maiden Name             | Any information about the mother is helpful in making a match | Helps creates true positive matches             |
| Patient Home Telephone           | A telecom helps match into the right household                | Helps create true positive matches              |
| Patient Multiple Birth Indicator | Indicates this person is a multiple – twin, triplet, etc.     | Helps avoid false positive matches of multiples |
| Patient Birth Order              | Distinguishes among those multiples.                          | Helps avoid false positive matches of multiples |

Note that PDQ Profile includes support for Last Update Date/Time, Last
Update Facility. These elements are not included in PDQm as they are
elements of the Visit/Encounter which is not in scope for PDQm.

Patient Demographics Supplier which support the Pediatric Demographics
Option shall support all the Patient elements specified and query
parameters specified including Mother’s Maiden Name.

Patient Demographics Consumers which support the Pediatric Demographics
Option shall be able to provide the below listed Pediatric Demographics
query parameter fields in the Patient Demographics Query \[ITI-78\]
transaction and shall be able to receive and process any values returned
for the fields identified as Pediatric Demographics.

Pediatric Demographics query parameter fields are:

-   Mother’s Maiden Name

Pediatric Demographics fields are defined as the following:

-   Mother’s Maiden Name

-   Patient Home Telephone

-   Patient Multiple Birth Indicator

-   Patient Birth Order

## 38.3 PDQm Required Actor Groupings 

An actor from this profile (column 1) shall implement all of the
required transactions and/or content modules in this profile ***in
addition to*** all of the transactions required for the grouped actor
(column 2).

Section 38.5 describes some optional groupings that may be of interest
for security considerations and Section 38.6 describes some optional
groupings in other related profiles.

Table 38.3-1: Patient Demographics Query for Mobile - Required Actor
Groupings

|                               |                          |           |                            |
|-------------------------------|--------------------------|-----------|----------------------------|
| PDQm Actor                    | Actor to be grouped with | Reference | Content Bindings Reference |
| Patient Demographics Consumer | None                     | --        | --                         |
| Patient Demographics Supplier | None                     | --        | --                         |

## 38.4 PDQm Overview

### 38.4.1 Concepts

The PDQm Profile supports all of the use cases of PDQ while keeping the
technology as lightweight as possible. Example uses include:

-   Mobile devices used by physicians (for example: a mobile app for
    electronic patient charts) which need to establish patient context
    by scanning a bracelet,

-   Web based EHR/EMR applications which wish to provide dynamic updates
    of patient demographic information such as a non-postback search,
    additional demographic detail, etc.

-   A document source/consumer wishing to perform an operation in the
    IHE Mobile access to Health Documents (MHD) Profile, where patient
    ID in the appropriate patient ID domain needs to be resolved by the
    source/consumer,

-   A health portal securely exposing demographics data to browser-based
    plugins,

-   Medical devices which need to access patient demographic
    information.

Each of these specific use cases is generalized into two general use
cases. The first is one where a system must obtain patient demographics
to populate a user interface via a known demographic field (such as
bracelet ID) or search parameters provided by a user. The second is as a
prerequisite step whereby an application must obtain an identifier from
another patient ID domain in order to complete another workflow.

This profile is applicable for use by any application which requires
access to patient demographics where lightweight REST/JSON or REST/XML
is a more suitable technology than traditional PDQ or PDQv3 Profiles.

### 38.4.2 Use Cases

#### 38.4.2.1 Use Case \#1: Patient Information Entering at Bedside

In this use case an admitted patient is assigned a bed and may not be
able to provide positive ID information. The nurse uses the PDQm Profile
to establish patient context.

##### 38.4.2.1.1 Patient Information Entering at Bedside Use Case Description

An admitted patient is assigned to a bed. The patient may or may not be
able to provide positive ID information. The nurse needs to enter
patient identity information into some bedside equipment to establish
the relationship of the assigned bed to the patient. The equipment
issues a query for a patient pick list to a patient demographics
supplier that provides data for a patient pick list. Search criteria
entered by the nurse might include one or more of the following:

-   Partial or complete patient name (printed on the patient record or
    told by the patient)

-   Patient ID (this may be obtained from printed barcode, a bed-side
    chart, etc.)

-   Patient ID entry or scan.

-   Date of birth / age range

The system returns a list of patients showing Patient ID, full name,
age, sex and displays the list to the nurse. The nurse then selects the
appropriate record to enter the patient identity information into the
bedside equipment application.

#### 38.4.2.2 Use Case \#2: Patient Identity Information Entering in Physician Offices

In this use case a patient visits a physician for the first time. The
physician system will use the PDQm Profile to import demographics
information into the local application.

##### 38.4.2.2.1 Patient Identity Information Entering in Physician Offices Use Case Description

A patient visits a physician office for the first time. The nurse needs
to register the patient; in doing so, it is desired to record the
patient’s demographic data in the practice management information system
(PMIS). The physician office is connected to a hospital enterprise’s
central patient registry. The nurse issues a patient query request to
the central patient registry acting as a Patient Demographics Supplier,
with some basic patient demographics data as search criteria. In the
returned patient list, she picks an appropriate record for the patient,
including the hospital’s Patient ID, to enter into the PMIS. (Note the
PMIS uses a different Patient ID domain than that of the central patient
registry.)

#### 38.4.2.3 Use Case \#3: Patient Demographics Query in an Enterprise with Multiple Patient ID Domains

In this use case a lab system obtains identities from multiple Patient
ID domains for the purpose of reporting results.

##### 38.4.2.3.1 Patient Demographics Query in an Enterprise with Multiple Patient ID Domains Use Case Description

A lab technician enters some basic demographics data (e.g., patient
name) into a lab application to query a patient demographics supplier to
identify a patient for his lab exams. As the application also needs the
patient identifier in another Patient ID Domain in the enterprise for
results delivery, the application is configured to query for Patient IDs
from other domains in the query response.

### 38.4.3 Basic Process Flow in Patient Demographics Query for Mobile Profile

Figure 38.4.3-1: Basic Process Flow in PDQm Profile

## 38.5 PDQm Security Considerations

See ITI TF-2x: Appendix Z.8 “Mobile Security Considerations”

## 38.6 PDQm Cross Profile Considerations

When the Patient Demographics Supplier is grouped with actors in other
IHE profiles that perform patient information reconciliation activities
(e.g., the ADT Actor in the IHE Radiology Scheduled Workflow.b Profile),
the Patient Demographics Supplier may use the updated information to
respond to PDQm Queries. In addition, the Patient Demographics Query for
Mobile Profile may play an integral workflow role in conjunction with
other IHE profiles.

Those systems that manage patient demographics could implement the
Patient Demographics Supplier in all three profiles: PDQ, PDQv3, and
PDQm. In this way the Patient Demographics Consumer can choose the
technology stack that best fits. ITI TF-2x: Appendix M.4 provides
additional details about Patient Demographics Query Profiles and their
relationship with one another.

The Patient Demographics Supplier may act as a proxy to an existing PDQ
or PDQv3 environment as shown in Figures 38.6-1 and 38.6-2.

Figure 38.6-1: Implementing PDQm as a gateway

Figure 38.6-2: Sample PDQm gateway process flow

<span id="_Toc336000611" class="anchor"></span>Volume 2c – Transactions

Add Section 3.78

## 3.78 Mobile Patient Demographics Query \[ITI-78\]

This section corresponds to transaction \[ITI-78\] of the IHE IT
Infrastructure Technical Framework. Transaction \[ITI-78\] is used by
the Patient Demographics Consumer and Patient Demographics Supplier
Actors.

### 3.78.1 Scope

This transaction is used by the Patient Demographics Consumer to solicit
information about patients whose demographics data match data provided
in the query parameters on the request message. The request is received
by the Patient Demographics Supplier. The Patient Demographics Supplier
processes the request and returns a response in the form of demographics
information for the matching patients.

### 3.78.2 Actor Roles

| **Actor:** | Patient Demographics Consumer                                                                                                                                                                                                                                                         |
|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Role:**  | Requests a list of patients matching the supplied set of demographics criteria (example: ID or Name) from the Patient Demographics Supplier. The Patient Demographics Consumer populates its attributes with demographic information received from the Patient Demographics Supplier. |
| **Actor:** | Patient Demographics Supplier                                                                                                                                                                                                                                                         |
| **Role:**  | Returns demographic information for all patients matching the demographics criteria provided by the Patient Demographics Consumer.                                                                                                                                                    |

### 3.78.3 Referenced Standards

| HL7 FHIR | HL7 FHIR standard R4 <http://hl7.org/fhir/R4/index.html>              |
|----------|-----------------------------------------------------------------------|
| RFC2616  | Hypertext Transfer Protocol – HTTP/1.1                                |
| RFC7540  | Hypertext Transfer Protocol – HTTP/2                                  |
| RFC3986  | Uniform Resource Identifier (URI): Generic Syntax                     |
| RFC4627  | The application/json Media Type for JavaScript Object Notation (JSON) |
| RFC6585  | Additional HTTP Status Codes                                          |

### 3.78.4 Messages

Figure 3.78.4-1: Interaction Diagram

#### 3.78.4.1 Query Patient Resource message

This message represents an HTTP GET parameterized query from the Patient
Demographics Consumer to the Patient Demographics Supplier.

##### 3.78.4.1.1 Trigger Events

When a Patient Demographics Consumer needs to select a patient based on
demographic information about patients whose information matches a
minimal set of known data, it issues a Query Patient Resource.

##### 3.78.4.1.2 Message Semantics

The Query Patient Resource is conducted by the Patient Demographics
Consumer by executing an HTTP GET against the Patient Demographics
Supplier’s Patient Resource URL.

The search target follows the FHIR http specification, addressing the
Patient Resource type <http://hl7.org/fhir/R4/http.html>:

GET \[base\]/Patient?&lt;query&gt;

This URL is configurable by the Patient Demographics Supplier and is
subject to the following constraints.

The &lt;query&gt; represents a series of encoded name-value pairs
representing the filter for the query specified in Section 3.78.4.1.2.1,
as well as control parameters to modify the behavior of the Patient
Demographics Supplier such as response format, or pagination.

###### 3.78.4.1.2.1 Query Search Parameters

The Patient Demographics Consumer may supply, and the Patient
Demographics Supplier shall be capable of processing, all query
parameters listed below. All query parameter values shall be
appropriately encoded per RFC3986 “percent” encoding rules. Note that
percent encoding does restrict the character set to a subset of ASCII
characters which is used for encoding all other characters used in the
URL.

Patient Demographics Suppliers may choose to support additional query
parameters beyond the subset listed below. Any additional query
parameters supported shall be supported according to the core FHIR
specification. Such additional parameters are considered out of scope
for this transaction. Any additional parameters not supported should be
ignored, See <http://hl7.org/fhir/R4/search.html#errors>.

\_id

> This parameter of type string*,* when supplied, represents the
> resource identifier for the Patient Resource being queried. See ITI
> TF-2x: Appendix Z.2.3 for use of the string data type. Note: A search
> using \_id is always an exact match search.

active

> This parameter of type token*,* when supplied, specifies the active
> state. The active state indicates whether the patient record is
> active. Note: use active=true

identifier

> This repeating parameter of type token*,* when supplied, specifies an
> identifier associated with the patient whose information is being
> queried (e.g., a local identifier, account identifier, etc.). See ITI
> TF-2x: Appendix Z.2.2 for use of the token data type.
>
> If multiple instances of this parameter are provided in the query, the
> query represents a logical AND condition (i.e., all of the associated
> identifiers must match). For example, a query searching for patients
> having identifier145 assigned by authority “1.2.3.4” and SSN 123456789
> would be represented as:
>
> ?identifier=urn:oid:1.2.3.4\|145&identifier=urn:oid:2.16.840.1.113883.4.1\|123456789
>
> If no system portion of the identifier parameter is specified, then
> the matching would be performed on any identifier regardless of
> issuing system. The identifier specified in this parameter is
> expressed using the token search parameter type. Please see ITI TF-2x:
> Appendix Z.2.2 for use of the token data type for patient identifiers.

family and given

> These parameters of type string, when supplied, specify the name of
> the person whose information is being queried. For this parameter the
> Patient Demographics Consumer may use either family name, given name
> or a combination of both names to filter by family, given or family
> and given names respectively. See ITI TF-2x: Appendix Z.2.3 for use of
> the string data type.

telecom

> This parameter of type token*,* when supplied, specifies the
> telecommunications details

birthdate

> This parameter of type date*,* when supplied, specifies the birth date
> of the person whose information is being queried.
>
> The Patient Demographics Consumer shall use the date and interval
> mechanism to indicate a specific date of birth or a date that lies
> within the range specified by the parameter. See
> <http://hl7.org/fhir/R4/search.html#date>

address

> This parameter of type string*,* when supplied, specifies one or more
> address parts associated with the person whose information is being
> queried. For details on matching rules, see ITI TF-2x: Appendix Z.2.3.

address-city, address-country, address-postalcode, address-state

> These parameters of type string*,* when supplied, specify a match
> against the specified address part associated with the person whose
> information is being queried. Note that national conventions for
> addresses may affect utility of these fields.

gender

> This parameter of type token*,* when supplied, specifies the
> administrative gender of the person whose information is being
> queried. For this parameter item, a single administrative gender code
> from value set
> <http://hl7.org/fhir/R4/valueset-administrative-gender.html> shall be
> specified as the only value of the token. See ITI TF-2x: Appendix
> Z.2.2 for use of the token data type.

###### 3.78.4.1.2.2 Pediatric Demographics Option

Additional notes are available in FHIR on mother and newborn
relationship, see <http://hl7.org/fhir/R4/patient.html#maternity>

Patient Demographics Suppliers supporting the Pediatric Demographics
Option shall support the mothersMaidenName search extension.

Patient Demographics Consumers supporting the Pediatric Demographics
Option may use the additional mothersMaidenName search extension and the
additional elements returned by the Patient Demographics Suppliers. See
ITI TF 1: 38.2.1 Pediatric Demographics Option.

###### 3.78.4.1.2.3 Parameter Modifiers

Patient Demographics Suppliers shall support the “:exact” parameter
modifier on all query parameters of type string. When supplied by the
Patient Demographics Consumer, the “:exact” parameter modifier instructs
the Patient Demographics Supplier that exact matching should be
performed.

The Patient Demographics Consumer should not use, and Patient
Demographics Supplier may ignore, any additional parameter modifiers
listed in the FHIR standard, which are considered out of scope in the
context of this transaction.

###### 3.78.4.1.2.4 Populating Which Domains are Returned

The Patient Demographics Consumer may constrain the domains from which
patient identifiers are returned from the Patient Demographics Supplier
in the resulting bundle. The Patient Demographics Consumer shall convey
this by specifying the patient identity domains in the system component
of repeating identifier parameters using the OR format:

> &identifier=urn:oid:1.2.3\|,urn:oid:4.5.6\|

For example, a Patient Demographics Consumer wishing to filter for
patients with a last name of SMITH having identifiers from an identity
domain with OID 1.2.3.4.5 would convey this search as:

?family=SMITH&identifier=urn:oid:1.2.3.4.5\|

The Patient Demographics Consumer shall populate the patient identity
domain portion of the token with values described in ITI TF-2x: Appendix
E.3.

###### 3.78.4.1.2.5 Populating Expected Response Format

The FHIR standard provides encodings for responses as either XML or
JSON. Patient Demographics Suppliers shall support both message
encodings, whilst Patient Demographics Consumers shall support one and
may support both.

See ITI TF-2x: Appendix Z.6 for details.

##### 3.78.4.1.3 Expected Actions

The Patient Demographics Supplier shall return demographic records that
reflect the match to all of the search criteria provided by the Patient
Demographics Consumer. The Patient Demographics Supplier shall respond
with a Query Patient Resource Response message synchronously (i.e., on
the same connection as was used to initiate the request).

The Patient Demographics Supplier shall return all exact matches to the
query parameters sent by the Patient Demographics Consumer; IHE does not
further specify matching requirements. The Patient Demographics Supplier
may be able to perform other string matching (e.g., case insensitive,
partial matches, etc.) which shall be indicate in its
CapabilityStatement Resource (see ITI TF-2x: Appendix Z.4).

The information provided by the Patient Demographics Supplier to the
Patient Demographics Consumer is a list of matching patients from the
Patient Demographics Supplier’s information source. The mechanics of the
matching algorithms used are internal to the Patient Demographics
Supplier and are outside the scope of this framework.

The Patient Demographics Supplier shall support at least one patient
identifier domain and may support multiple identifier domains. Section
3.78.4.1.2.4 describes how the Patient Demographics Consumer may filter
results based on identifiers from one or more patient identifier
domains. Query responses may return patient identifiers from one or
multiple patient identifier domains.

See ITI TF-2x: Appendix Z.6 for more details on response format
handling. See ITI TF-2x: Appendix Z.7 for handling guidance for Access
Denied.

The Patient Demographics Supplier shall respond to the query request as
described by the following cases with a Query Patient Resource Response
message described in Section 3.78.4.2, and shall behave according to the
cases listed below:

**Case 1:** The Patient Demographics Supplier finds in its information
source at least one patient record matching the criteria sent as HTTP
query parameters. No patient identifier domains are requested via the
mechanism specified as specified in Section 3.78.4.1.2.4.

**HTTP 200** (OK) is returned as the HTTP status code.

A Resource Bundle is returned representing the result set. The Patient
Demographics Supplier populates the total property of the bundle with
the total number of matching results. One entry is returned from the
Patient Demographics Supplier for each Patient Resource found.

**Case 2:** The Patient Demographics Supplier finds at least one patient
record matching the criteria sent in the query parameters. One or more
patient identifier domains are requested via the mechanism specified in
Section 3.78.4.1.2.4, and Patient Demographics Supplier recognizes all
domains.

**HTTP 200** (OK) is returned as the HTTP status code.

The Patient Demographics Supplier performs its matching and returns a
bundle as described in Case 1. The Patient Demographics Supplier
eliminates identifiers from the result set which do not exist in the
list specified per Section 3.78.4.1.2.4 (domains to be returned). If all
entries in the list of patient identifiers are eliminated, which would
leave the patient identifiers list empty, then the entry shall not be
present in the response bundle.

**Case 3:** The Patient Demographics Supplier fails to find in its
information source, any patient record matching the criteria sent as
HTTP query parameters.

**HTTP 200** (OK) is returned as the HTTP status code.

A Resource Bundle is returned representing the zero result set. The
Patient Demographics Supplier populates the total with a value of 0
indicating no results were found. No entry attributes are provided in
the result.

**Case 4:** The Patient Demographics Supplier does not recognize one or
more of the domains specified per Section 3.78.4.1.2.4.

There are two different acceptable return results. Preferred response is
a **HTTP 404** to indicate that the domain is not recognized, but a
**HTTP 200** with an empty result is acceptable when the Patient
Demographics Supplier cannot determine that the domain is not
recognized.

An OperationOutcome Resource is returned indicating that the patient
identity domain is not recognized in an issue having:

|             |                          |
|-------------|--------------------------|
| Attribute   | Value                    |
| severity    | error                    |
| code        | not-found                |
| diagnostics | “targetSystem not found” |

The OperationOutcome Resource may indicate the query parameter used and
the domain in error within the diagnostics attribute. See FHIR
discussion of search error handling
<http://hl7.org/fhir/R4/search.html#errors>

**Case 5:** The Patient Demographics Supplier is not capable of
producing a response in the requested format specified by \_format
parameter (specified in Section 3.78.4.1.2.5).

**HTTP 406** (Not Acceptable) is returned as the HTTP status code.

An OperationOutcome Resource is returned indicating that the requested
response format is not supported in an issue having:

|           |               |
|-----------|---------------|
| Attribute | Value         |
| severity  | error         |
| code      | not-supported |

The Patient Demographics Supplier may be capable of servicing requests
for response formats not listed in Section 3.78.4.1.2.5, but shall, at
minimum, be capable of producing XML and JSON encodings.

The Patient Demographics Supplier may return other HTTP status codes to
represent specific error conditions. When HTTP error status codes are
returned by the Patient Demographics Supplier, they shall conform to the
HTTP standard RFC2616. Their use is not further constrained or specified
by this transaction.

#### 3.78.4.2 Query Patient Resource Response message

##### 3.78.4.2.1 Trigger Events

The Patient Demographics Supplier found patient demographics matching
the query parameters

specified by the Patient Demographics Consumer as a result of a Query
Patient Resource Request.

##### 3.78.4.2.2 Message Semantics

The Query Patient Resource Response is sent from the Patient
Demographics Supplier to the Patient Demographics Consumer as a Bundle
of Patient Resources. The “content-type” of the response will depend
upon the requested response format indicated by the Patient Demographics
Consumer.

See ITI TF-2x: Appendix Z.6 for more details on response format
handling. See ITI TF-2x: Appendix Z.7 for handling guidance for Access
Denied.

###### 3.78.4.2.2.1 Patient Resource Definition in the Context of Query Patient Resource Response

The components of the Patient Resource with cardinality greater than 0
(as shown below) are required, and the detailed description of the
message is provided here. All other attributes of the response are
optional.

The Patient Resource contained within the Query Patient Resource
Response message is described at <http://hl7.org/fhir/R4/patient.html>
and is not further constrained by this transaction.

###### 3.78.4.2.2.2 Mother’s Maiden Name 

Patient Demographics Suppliers shall include the mother’s maiden name,
if known, in an extension named mothers MaidenName. See
<http://hl7.org/fhir/R4/extension-patient-mothersmaidenname.html>

###### 3.78.4.2.2.3 Resource Bundling

Please see ITI TF-2x: Appendix Z.1 for details on the IHE guidelines for
implementing FHIR bundles.

###### 3.78.4.2.2.4 Incremental Response Processing - Paging of Resource Bundle

The Patient Demographics Supplier shall represent these incremental
responses as specified FHIR Paging
<http://hl7.org/fhir/R4/http.html#paging>

###### 3.78.4.2.2.5 Quality of Match

The Patient Demographics Supplier may convey the quality of each match
based on strength of the particular result to the supplied query
parameters. The mechanism for determining the confidence of match is
considered a product specific feature and is not specified in this
transaction.

If the Patient Demographics Supplier wishes to convey the quality of
match, it shall represent the confidence of a particular match within
the bundle as a score attribute. See FHIR Relevance section
<http://hl7.org/fhir/R4/search.html#score>

##### 3.78.4.2.3 Expected Actions

The constraints specified in Section 3.78.4.2.2 represent the minimum
set of demographics information that must be implemented by a Patient
Demographics Supplier. This does not prevent the Patient Demographics
Supplier from sending additional FHIR attributes in a response; such as
extensions, text, etc. The Patient Demographics Consumer shall ignore
additional attributes and extensions if not understood.

The consumer shall process the response in some manner specific to its
application function (for example: displaying on a user interface). This
application behavior is not specified by IHE.

##### 3.78.4.2.4 CapabilityStatement Resource

Patient Demographics Suppliers implementing \[ITI-78\] shall provide a
CapabilityStatement Resource as described in ITI TF-2x: Appendix Z.4
indicating the query operation for the Patient Resource has been
implemented and shall include all query parameters implemented for the
Patient Resource.

#### 3.78.4.3 Retrieve Patient Resource message

This message represents an HTTP GET from the Patient Demographics
Consumer to the Patient Demographics Supplier and provides a mechanism
for retrieving a single Patient Resource with a known resource
identifier.

##### 3.78.4.3.1 Trigger Events

When the Patient Demographics Consumer possesses a Patient Resource’s
identifier (either through query, database lookup, or other mechanism)
for which it requires additional or new information, it issues a
Retrieve Patient Resource operation.

##### 3.78.4.3.2 Message Semantics

The Retrieve Patient Resource is conducted by executing an HTTP GET
against the Patient Demographics Supplier’s Patient Resource URL,
providing the resource id of the patient being retrieved. The target is
formatted as:

> GET \[base\]/Patient/\[resourceId\]

The Patient Demographics Supplier shall respond to this query by sending
a single Patient Resource instance. The specification for \[base\] is
identified in Section 3.78.4.1.2.

The resourceId included in the request always represents the unique
identifier for the Resource within the scope of the URL. For example,
while http://example1.org/ihe/Patient/1 and
http://example2.com/ihe/Patient/1 both contain the same \[resourceId\],
they reference two different resource instances.

Note: The use of "http" or "https" in URL does not override requirements
to use TLS for security purposes.

##### 3.78.4.3.3 Expected Actions

The Patient Demographics Supplier shall retrieve the demographic record
indicated by the Resource identifier on the HTTP GET supplied by the
Patient Demographics Consumer. The Patient Demographics Supplier shall
respond to the retrieve request as described by the following cases:

**Case 1:** The Patient Demographics Supplier finds in its information
source the patient demographics record matching the resourceId sent in
the HTTP request.

**HTTP 200** (OK) is returned as the HTTP status code.

A Patient Resource is returned representing the result.

**Case 2:** The Patient Demographics Supplier fails to find in its
information source the patient demographics record matching the
resourceId sent in the HTTP request.

**HTTP 404** (Not Found) is returned as the HTTP status code

An OperationOutcome Resource is returned indicating that the Patient
Resource could not be found, in an issue having:

|           |           |
|-----------|-----------|
| Attribute | Value     |
| severity  | error     |
| code      | not-found |

The Patient Demographics Supplier may return other HTTP status codes to
represent specific error conditions. When HTTP error status codes are
returned by the Patient Demographics Supplier, they shall conform to the
HTTP standard RFC2616. Their use is not further constrained or specified
by this transaction.

#### 3.78.4.4 Retrieve Patient Resource Response message

The Patient Demographics Supplier’s response to a successful Retrieve
Patient Resource message shall be an **HTTP 200** (OK) Status code with
a Patient Resource, or an appropriate error code as defined in Section
3.78.4.2.2.1.

##### 3.78.4.4.1 Trigger Events

The Patient Demographics Supplier found patient demographic record
matching the Resource identifier specified by the Patient Demographics
Consumer.

##### 3.78.4.4.2 Message Semantics

The Retrieve Patient Resource response is sent from the Patient
Demographics Supplier to the Patient Demographics Consumer as a single
Patient Resource. See <http://hl7.org/fhir/R4/patient.html> for details
on this resource.

See ITI TF-2x: Appendix Z.6 for more details on response format
handling. See ITI TF-2x: Appendix Z.7 for handling guidance for Access
Denied.

If the Patient Demographics Supplier is unable to produce a response in
the requested format, it shall respond with an **HTTP 400** error
indicating that it was unable to fulfill the request. The Patient
Demographics Supplier may be capable of servicing requests for response
formats not listed, but shall, at minimum, be capable of producing XML
and JSON encodings.

###### 3.78.4.4.2.1 Patient Resource Definition in the Context of Retrieve Patient Resource Response

The Patient Resource definition in the context of a retrieve operation
is identical to the constraints placed on the Patient Resource for a
search (see Section 3.78.4.2.2.1)

For the complete FHIR definition of this Resource, see
<http://hl7.org/fhir/R4/patient.html>.

### 3.78.5 Security Considerations

See the general Security Consideration in ITI TF-1: 38.5

#### 3.78.5.1 Security Audit Considerations

The Security audit criteria are similar to those for the Patient
Demographics Query \[ITI-21\] as this transaction discloses the same
type of patient information. The Mobile Patient Demographics Query is a
Query Information event as defined in ITI TF-2a: Table 3.20.4.1.1.1-1.
The message shall comply with the requirements in ITI TF-2a: 3.21.5.1
following differences:

-   EventTypeCode = EV(“ITI-78”, “IHE Transactions”, “Mobile Patient
    Demographics Query”)

-   Query Parameters (AuditMessage/ParticipantObjectIdentification)

<!-- -->

-   ParticipantObjectIdTypeCode = EV(“ITI-78”, “IHE Transactions”,
    “Mobile Patient Demographics Query”)

-   ParticipantObjectQuery = Requested URL including query parameters

-   ParticipantObjectDetail = HTTP Request Headers contained in the
    query (e.g., Accept header)

<span id="_Toc49502309" class="anchor"></span>Appendices

Rename appendix M as follows in the Volume 2x Appendices

# ~~Appendix M Using Patient Demographics Query in a Multi-Domain Environment~~

# <u>Appendix M Patient Demographics Query Implementation Guidance</u>

Add the following section to the end of Volume 2x Appendix M:

## M.4 Data Elements Patient Demographics Query Profiles

This section describes the data elements that are used in IHE profiles
designed for the querying of patient demographics (Patient Demographics
Query Profiles) including PDQ, PDQv3, and PDQm.

While the semantic representation of the data elements differs across
the transaction in the PDQ Profiles, the common set of elements and
query parameters can be described using abstract terminology. This
section explains the data elements and query parameters used in PDQ
Profiles from an abstract definition standpoint, and then it provides a
map between the three profiles’ implementation specific concept.

Note: More data elements may be known by the Patient Demographics
Supplier and may be returned. Elements beyond those profiled are
encouraged but not required of the profile. Patient Demographics
Consumer Actors should be robust to receiving more data than is
profiled.

### M.4.1 Patient Demographics Query Data Fields 

Table M.4.1-1 outlines the abstract demographics fields which are common
to all Patient Demographics Query Profiles.

Table M.4.1-1: Patient Demographics Data Elements (abstract)

|                                |                                                                                                                                                             |
|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Field                          | Purpose                                                                                                                                                     |
| Identifier List                | Provides one or more identifiers that can be used to uniquely identify the patient within a medical system.                                                 |
| Name(s)                        | Identifies the patient’s preferred, legal, or alias names.                                                                                                  |
| Date / Time of Birth           | Identifies the date on which the patient was born.                                                                                                          |
| Gender                         | Identifies the patient’s gender used for administrative purposes.                                                                                           |
| Address(es)                    | Identifies the patient’s associated addresses (home, work, etc.)                                                                                            |
| Telecommunications Address(es) | Identifies the patient’s phone number, fax number, email addresses and other means of telecommunicating with the patient.                                   |
| Language(s) of communication   | Identifies languages which can be used when communicating with the patient.                                                                                 |
| Marital Status                 | Identifies the patient’s marital status at time of last update (married, divorced, etc.)                                                                    |
| Non-Medical Identifiers        | Identifies additional identifiers associated with the patient which are not used for medical purposes (ex: driver’s license, social insurance number, etc.) |
| Death Date/Time                | Identifies the time at which the patient died.                                                                                                              |

Table M.4.1-2 provides a mapping between these abstract data elements
and their transaction specific fields.

Table M.4.1-2: Patient Demographics Data Elements (concrete)

|                                |                   |                           |                             |
|--------------------------------|-------------------|---------------------------|-----------------------------|
| Abstract Field                 | PDQ               | PDQ HL7v3                 | PDQm                        |
| Identifier List                | PID.3 and PID.18  | id                        | identifier                  |
| Name(s)                        | PID.5 and PID.9   | name                      | name                        |
| Date / Time of Birth           | PID.7             | birthTime                 | birthdate                   |
| Gender                         | PID.8             | administrativeGenderCode  | gender                      |
| Address(es)                    | PID.11            | addr                      | address                     |
| Telecommunications Address(es) | PID.13 and PID.14 | telecom                   | telecom                     |
| Language(s) of communication   | PID.15            | languageCommunication     | communication.language      |
| Marital Status                 | PID.16            | maritalStatusCode         | maritalStatus               |
| Non-Medical Identifiers        | PID.19 and PID.20 | asOtherIds                | identifier                  |
| Death Date/Time                | PID.29            | deceasedTime              | deceasedDateTime            |
| Mother’s Maiden Name           | PID.6             | personalRelationship.name | See ITI TF-2c: 3.78.4.2.2.2 |
| Patient Birth Order            | PID.25            | multipleBirthOrderNumber  | multipleBirthInteger        |

### M.4.2 Patient Demographics Query Parameters

Table M.4.2-1 outlines the demographics query parameters which are
common to all Patient Demographics Query Profiles.

Table M.4.2-1: Patient Demographics Query Parameters (abstract)

<table>
<tbody>
<tr class="odd">
<td>Field</td>
<td>Purpose</td>
</tr>
<tr class="even">
<td>Identifier List</td>
<td>Filters the result set to a list of patients whose identifiers match the provided identifiers.</td>
</tr>
<tr class="odd">
<td>Name</td>
<td>Filters the result set to a list of patients whose name (legal, maiden, alias, etc.) matches the provided value. The mechanisms for match are not specified but can include exact match, pattern match, phonetic match, variant match, etc.</td>
</tr>
<tr class="even">
<td>Date / Time of Birth</td>
<td><p>Filters the result set to patients whose date/time of birth match the provided value.</p>
<p>Note: Birth time is not applicable in PDQm</p></td>
</tr>
<tr class="odd">
<td>Gender</td>
<td>Filters the result set to patients whose administrative gender matches the provided value.</td>
</tr>
<tr class="even">
<td>Address</td>
<td>Filters the result set to patients whose address (home, business, etc.) matches the provided value.</td>
</tr>
<tr class="odd">
<td>Domains to be Returned</td>
<td>Filters the result set to include only identifiers which have been assigned by the specified domains.</td>
</tr>
<tr class="even">
<td>Mother’s Maiden Name</td>
<td>Filters the result set to include only those patients which whose mother’s maiden name matches the specified name.</td>
</tr>
<tr class="odd">
<td>Patient Telecommunications Addresses</td>
<td>Filters the result set to include only those which have the specified telecommunications addresses.</td>
</tr>
</tbody>
</table>

Table M.4.2-2 provides a mapping between these abstract query parameters
and their transaction specific implementation.

Table M.4.2-2: Patient Demographics Query Parameters (concrete)

<table>
<tbody>
<tr class="odd">
<td>Abstract Parameter</td>
<td>PDQ</td>
<td>PDQ HL7v3</td>
<td>PDQm</td>
</tr>
<tr class="even">
<td>Identifier List</td>
<td>@PID.3 and @PID.18</td>
<td>livingSubjectId</td>
<td>identifier</td>
</tr>
<tr class="odd">
<td>Name</td>
<td>@PID.5</td>
<td>livingSubjectName</td>
<td>given and family</td>
</tr>
<tr class="even">
<td>Date / Time of Birth</td>
<td>@PID.7</td>
<td>livingSubjectBirthTime</td>
<td><p>birthdate</p>
<p>Note: Birth time is not applicable in PDQm</p></td>
</tr>
<tr class="odd">
<td>Gender</td>
<td>@PID.8</td>
<td>livingSubjectAdministrativeGender</td>
<td>gender</td>
</tr>
<tr class="even">
<td>Address</td>
<td>@PID.11</td>
<td>patientAddress</td>
<td>address</td>
</tr>
<tr class="odd">
<td>Domains to be Returned</td>
<td>QPD-8</td>
<td>otherIDsScopingOrganization</td>
<td>See ITI TF-2c: 3.78.4.1.2.4</td>
</tr>
<tr class="even">
<td>Mother’s Maiden Name</td>
<td>@PID.6</td>
<td>mothersMaidenName</td>
<td>mothersMaidenName</td>
</tr>
<tr class="odd">
<td>Patient Telecommunications Addresses</td>
<td>@PID.13</td>
<td>patientTelecom</td>
<td>telecom</td>
</tr>
</tbody>
</table>
