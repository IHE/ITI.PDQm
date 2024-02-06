<div markdown="1" class="stu-note">

## Significant Changes

### Significant changes from PDQm, Rev 2.4:
- changed to AuditEvent profiling leveraging [Basic Audit Log Patterns (BALP) Release 1.1.0](https://profiles.ihe.net/ITI/BALP/index.html)
  - changes to RESTful type, and query subtype
- Introduced [ITI-119 Patient Demographics Match](ITI-119.html) as an alternative to [ITI-78 Mobile Patient Demographics Query](ITI-78.html)
- Added dependency on [HL7 IPA](http://hl7.org/fhir/uv/ipa/STU1/ImplementationGuide-hl7.fhir.uv.ipa.html) and updated the [PDQm Patient Profile](StructureDefinition-IHE.PDQm.Patient.html) to derive from [IPA Patient](http://hl7.org/fhir/uv/ipa/STU1/StructureDefinition-ipa-patient.html)
- Added requirements for which combinations of search parameters SHALL be supported by Patient Demographics consumers in section 2:3.78.4.1.2.1.1. 
  - Resolves [PDQm_issue_90](https://github.com/IHE/ITI.PDQm/issues/90)
- Added recommended response patterns for handling deprecated patient identifies to sections 2:3.78.4.1.3 and 2:3.78.4.3.3. 
  - Resolves [PDQm_issue_86](https://github.com/IHE/ITI.PDQm/issues/86)
- Added Use Case #4 - Patient Demographics Query by Known Business Identifier

### Significant changes from PDQm, Rev 2.2:
- FHIR Implementation Guide instead of [PDF - Rev. 2.2](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_PDQm_Rev2-2_TI_2020-08-28.pdf)
- Patient is now profiled to forbid modifier extensions
- AuditEvent is fully profiled using structureDefinition with examples

## Issues

### Submit an Issue

IHE welcomes [New Issues](https://github.com/IHE/ITI.PDQm/issues/new/choose) from the GitHub community. 
For those without GitHub access, issues may be submitted to the [Public Comment form](https://www.ihe.net/ITI_Public_Comments/).

As issues are submitted they will be managed on the [PDQm GitHub Issues](https://github.com/IHE/ITI.PDQm/issues), where discussion and workarounds may be found. These issues, when critical, will be processed using the normal [IHE Change Proposal](https://wiki.ihe.net/index.php/Category:CPs) management and balloting. 
It is important to note that as soon as a Change Proposal is approved, it carries the same weight as a published Implementation Guide (i.e., it is testable at an [IHE Connectathon](https://www.ihe.net/participate/connectathon/) from the time it is approved, even if it will not be integrated until several months later).

### Open Issues
These issues were known as part of the publication, and IHE invites comments.

- PDQm_101: Are there some elements we can get global agreement should be marked as R2 (aka, Must-Support - required to be returned if known)?
- PDQm_102: Normative vs Trial-Implementation - Currently the HL7 FHIR standard components used (e.g., Patient, Bundle, etc) in this profile are at Normative state. Some portions of PDQm are relying on STU content (such as query parameters, mothersMaidenName).
- PDQm_103: PDQm has a small volume 1 content. Thus breaking each H2 out into independent html files makes it harder to address. We might choose to do similar to PIXm and have just one volume 1 content with deep links.
- [PDQm_issue_66](https://github.com/IHE/ITI.PDQm/issues/66): PDQm has allowed clients to use GET or POST search, and thus mandated that servers must support both GET and POST. The previous versions of PDQm had only mentioned GET search, but we learned that FHIR core mandated POST and does not allow us to not also mandate it. This leaves regions that want to use only one of these verbs for search seemingly forced to support both verbs for search. The current discussion in FHIR core offers that "support" could include implementing a "policy" that forces an http 405 response. This seems to be a workable solution, and the alternative would not be much different than this anyway.
- [PDQm_issue_92](https://github.com/IHE/ITI.PDQm/issues/92): Currently we are mandating that Patient Demographics Suppliers support both ITI-78 with ITI-119 being optional, while Patient Demographics Consumers have the option to choose to support either one or both transactions. Is requiring support for ITI-78 a problem for any Patient Demographics Suppliers?
- [PDQm_issue_94](https://github.com/IHE/ITI.PDQm/issues/94): In PDQ, PDQv3, and PDQm ITI-78, we have the ability for the client to limit the search results to patients with an identifier issued by a particular patient identification domain. We do not have equivalent functionality in ITI-119. While a client could suggest that it is interested in a particular patient identification domain by including the assigning authority of that domain as an identifier system in the $match input parameters, the semantics of $match would not require the server to honor that request. Is this functionality needed in ITI-119?
- [PDQm_issue_101](https://github.com/IHE/ITI.PDQm/issues/101):  Currently the expected actions for ITI-78 and ITI-119 require that all Patient Resources returned by the Patient Demographics Supplier conform to the [PDQm Patient Profile](StructureDefinition-IHE.PDQm.Patient.html). The PDQm Patient Profile inherits from IPA Patient, so the requirements for Patient in IPA are inherited. 
Is this a reasonable requirement? While Patient Demographics Consumers SHOULD be robust in handling non-conformant Resources in the response, the intent of this requirement is to require that any Resources produced by the Patient Demographics Supplier are reasonably interoperable.  
- [PDQm_issue_112](https://github.com/IHE/ITI.PDQm/issues/112) The `onlyCertainMatches` parameter MAY be optionally set to `true` to indicate that the Patient Demographics Consumer would only like matches returned when they are certain to be matches for the subject of the request. 
The Patient Demographics Consumer might want to use `onlyCertainMatches` to prevent multiple Patient Resources from being returned in the response. This is often necessary in B2B cases where the Patient Demographics Consumer is operating in the background without a user confirming the Patient match. 
However, `onlyCertainMatches` does not guarantee that only a single Patient Resource will be returned. There might still be multiple results returned in the response when the same person has multiple records in the Patient Demographics Supplier. [FHIR-37361](https://jira.hl7.org/browse/FHIR-37361) and [FHIR-40880](https://jira.hl7.org/browse/FHIR-40880) request an additional parameter for specifying that matches should only be returned when there is exactly 1 certain match. 

When updating PDQm to a version of FHIR with FHIR-37361 and FHIR-40880 applied, the new parameter will need to be incorporated into the ITI-119 transaction. 

### Closed Issues
These issues have been decided and documented in the publication.

- Upgraded to FHIR R4
- Case 4, where one or more identifier domains are indicated by the client but are not authoritative by the server, has been extensively discussed. The conclusion is to stay with allowing a server to return 404 or 200, and to require an OperationOutcome to indicate a warning. There is concern that the clients might not notice that they did not get results for a domain they requested, the client must take the initiative to look for the OperationOutcome to determine if they got full authoritative results. This looking for an OperationOutcome should always be inspected to assure results are what was expected. As such we did update client requirements to explicitly look for patient safety reasons.
- Removed the Pediatric Demographics Option as unnecessary and confusing. Most of the functionality needed for the use-case is natural part of the normal path of PDQm. The additional search parameters and extensions are allowed for those that need them. There has been little to no implementation of this option in the PDQ or PDQv3 environments. 

</div>
