### Foreword
The Patient Demographics Query for Mobile (PDQm) Profile defines a lightweight RESTful interface to a patient demographics supplier leveraging technologies readily available to mobile applications and lightweight browser based applications.

The functionality is identical to the PDQ Profile described in the ITI TF-1:8. The differences are transport and messaging format of messages and queries. The profile leverages HTTP transport, and the JavaScript Object Notation (JSON), Simple-XML, and Representational State Transfer (REST). The payload format is defined by the HL7 FHIR draft standard.

Using these patterns, the PDQm Profile exposes the functionality of a patient demographics supplier to mobile applications and lightweight browser applications.

The following list provides a few examples of how PDQm might be leveraged by implementers:
-   A health portal securely exposing demographics data to browser-based plugins
-   Medical devices which need to access patient demographic information
-   Mobile devices used by physicians (example bedside eCharts) which need to establish patient context by scanning a bracelet
-   Web based EHR/EMR applications which wish to provide dynamic updates of patient demographic information such as a non-postback search,  additional demographic detail, etc.
-   Any low resource application which exposes patient demographic search functionality
-   Any application using the MHD Profile to access documents may use PDQm to find an appropriate patient identifier

This supplement is intended to be fully compliant with the HL7 FHIR specification, providing only use-case driven constraints to aid with interoperability, deterministic results, and compatibility with existing PDQ and PDQv3 Profiles.

Currently the HL7 FHIR standard components used in this profile are at Normative state. Some portions of PDQm are relying on STU content (such as query parameters, mothersMaidenName).

### Introduction to this Supplement
This PDQm Profile uses content from Release 4 of the HL7®  FHIR®  specification. HL7 describes FHIR Change Management and Versioning at https://www.hl7.org/fhir/versions.html. HL7 provides a rating of the maturity of FHIR content based on the FHIR Maturity Model (FMM): level 0 (draft) through N (Normative). See http://hl7.org/fhir/versions.html#maturity.

The FMM levels for FHIR content used in this profile are:

FHIR Content|FMM level
---|---
Patient|normative
OperationOutcome|normative
Bundle|normative
{: .grid}

### 38.4.1 Concepts
The PDQm Profile supports all of the use cases of PDQ while keeping the technology as lightweight as possible. Example uses include:
•	Mobile devices used by physicians (for example: a mobile app for electronic patient charts) which need to establish patient context by scanning a bracelet,
*	Web based EHR/EMR applications which wish to provide dynamic updates of patient demographic information such as a non-postback search, additional demographic detail, etc.
*	A document source/consumer wishing to perform an operation in the IHE Mobile access to Health Documents (MHD) Profile, where patient ID in the appropriate patient ID domain needs to be resolved by the source/consumer,
*	A health portal securely exposing demographics data to browser-based plugins,
*	Medical devices which need to access patient demographic information.
Each of these specific use cases is generalized into two general use cases. The first is one where a system must obtain patient demographics to populate a user interface via a known demographic field (such as bracelet ID) or search parameters provided by a user. The second is as a prerequisite step whereby an application must obtain an identifier from another patient ID domain in order to complete another workflow.
This profile is applicable for use by any application which requires access to patient demographics where lightweight REST/JSON or REST/XML is a more suitable technology than traditional PDQ or PDQv3 Profiles.

### 38.4.2 Use Cases
[PDQm Use Cases](usecases.html)

#### 38.4.3 Basic Process Flow in Patient Demographics Query for Mobile Profile

<div>
{%include Basic-Process-Flow-in-PDQm-Profile.svg%}
</div>
**Figure 38.4.3-1: Basic Process Flow in PDQm Profile**
