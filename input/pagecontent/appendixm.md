### M.4 Patient Demographics Query Implementation Guidance

*<p style="padding: 5px; border: 1px solid black;">Add the following section to the end of Volume 2 Appendix M:</p>*

This section describes the data elements that are used in IHE profiles designed for the querying of patient demographics (Patient Demographics Query Profiles) including PDQ, PDQv3, and PDQm.

While the semantic representation of the data elements differs across the transaction in the PDQ Profiles, the common set of elements and query parameters can be described using abstract terminology. This section explains the data elements and query parameters used in PDQ Profiles from an abstract definition standpoint, and then it provides a map between the three profiles’ implementation specific concept.

Note: More data elements may be known by the Patient Demographics Supplier and may be returned. Elements beyond those profiled are encouraged but not required of the profile. Patient Demographics Consumer Actors should be robust to receiving more data than is profiled.

#### M.4.1 Patient Demographics Query Data Fields
Table M.4.1-1 outlines the abstract demographics fields which are common to all Patient Demographics Query Profiles.

__Table M.4.1-1: Patient Demographics Data Elements (abstract)__

Field|Purpose
---|---
Identifier List|Provides one or more identifiers that can be used to uniquely identify the patient within a medical system.
Name(s)|Identifies the patient’s preferred, legal, or alias names.
Date/Time of Birth|Identifies the date on which the patient was born.
Gender|Identifies the patient’s gender used for administrative purposes.
Address(es)|Identifies the patient’s associated addresses (home, work, etc.)
Telecommunications Address(es)|Identifies the patient’s phone number, fax number, email addresses and other means of telecommunicating with the patient.
Language(s) of communication|Identifies languages which can be used when communicating with the patient.
Marital Status|Identifies the patient’s marital status at time of last update (married, divorced, etc.)
Non-Medical Identifiers|Identifies additional identifiers associated with the patient which are not used for medical purposes (ex: driver’s license, social insurance number, etc.)
Death Date/Time|Identifies the time at which the patient died.
{:.grid}

Table M.4.1-2 provides a mapping between these abstract data elements and their transaction specific fields.

__Table M.4.1-2: Patient Demographics Data Elements (concrete)__

Abstract Field|PDQ|PDQ HL7v3|PDQm
---|---|---|---
Identifier List|PID.3 and PID.18|id|identifier
Name(s)|PID.5 and PID.9|name|name
Date / Time of Birth|PID.7|birthTime|birthdate
Gender|PID.8|administrativeGenderCode|gender
Address(es)|PID.11|addr|address
Telecommunications Address(es)|PID.13 and PID.14|telecom|telecom
Language(s) of communication|PID.15|languageCommunication|communication.language
Marital Status|PID.16|maritalStatusCode|maritalStatus
Non-Medical Identifiers|PID.19 and PID.20|asOtherIds|identifier
Death Date/Time|PID.29|deceasedTime|deceasedDateTime
Mother’s Maiden Name|PID.6|personalRelationship.name|See ITI TF-2c: 3.78.4.2.2.2
Patient Birth Order|PID.25|multipleBirthOrderNumber|multipleBirthInteger
{:.grid}

#### M.4.2 Patient Demographics Query Parameters
Table M.4.2-1 outlines the demographics query parameters which are common to all Patient Demographics Query Profiles.

__Table M.4.2-1: Patient Demographics Query Parameters (abstract)__

Field|Purpose
---|---
Identifier List|Filters the result set to a list of patients whose identifiers match the provided identifiers.
Name|Filters the result set to a list of patients whose name (legal, maiden, alias, etc.) matches the provided value. The mechanisms for match are not specified but can include exact match, pattern match, phonetic match, variant match, etc.
Date / Time of Birth|Filters the result set to patients whose date/time of birth match the provided value. <br />Note: Birth time is not applicable in PDQm
Gender|Filters the result set to patients whose administrative gender matches the provided value.
Address|Filters the result set to patients whose address (home, business, etc.) matches the provided value.
Domains to be Returned|Filters the result set to include only identifiers which have been assigned by the specified domains.
Mother’s Maiden Name|Filters the result set to include only those patients which whose mother’s maiden name matches the specified name.
Patient Telecommunications Addresses|Filters the result set to include only those which have the specified telecommunications addresses.
{:.grid}

Table M.4.2-2 provides a mapping between these abstract query parameters and their transaction specific implementation.

__Table M.4.2-2: Patient Demographics Query Parameters (concrete)__

Abstract Parameter|PDQ|PDQ HL7v3|PDQm
---|---|---|---
Identifier List|@PID.3 and @PID.18|livingSubjectId|identifier
Name|@PID.5|livingSubjectName|given and family
Date / Time of Birth|@PID.7|livingSubjectBirthTime|birthdate <br />Note: Birth time is not applicable in PDQm
Gender|@PID.8|livingSubjectAdministrativeGender|gender
Address|@PID.11|patientAddress|address
Domains to be Returned|QPD-8|otherIDsScopingOrganization|See ITI TF-2c: 3.78.4.1.2.4
Mother’s Maiden Name|@PID.6|mothersMaidenName|mothersMaidenName
Patient Telecommunications Addresses|@PID.13|patientTelecom|telecom
{:.grid}