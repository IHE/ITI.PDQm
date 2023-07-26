<div markdown="1" class="stu-note">

## Significant changes from PDQm, Rev 2.4:
- changed to AuditEvent profiling leveraging [Basic Audit Log Patterns (BALP) Release 1.1.0](https://profiles.ihe.net/ITI/BALP/index.html)
  - changes to RESTful type, and query subtype
- TODO

## Significant changes from PDQm, Rev 2.2:
- FHIR Implementation Guide instead of [pdf - Rev. 2.2](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_PDQm.pdf)
- Patient is now profiled to forbid modifier extensions
- AuditEvent is fully profiled using structureDefinition with examples

## Issues

IHE welcomes [New Issues](https://github.com/IHE/ITI.PDQm/issues/new/choose) from the GitHub community. 
For those without GitHub access, issues may be submitted to the [Public Comment form](https://www.ihe.net/resources/public_comment/).

As issues are submitted they will be managed on the [PDQm GitHub Issues](https://github.com/IHE/ITI.PDQm/issues), where discussion and workarounds may be found. These issues, when critical, will be processed using the normal [IHE Change Proposal](https://wiki.ihe.net/index.php/Category:CPs) management and balloting. 
It is important to note that as soon as a Change Proposal is approved, it carries the same weight as a published Implementation Guide (i.e., it is testable at an [IHE Connectathon](https://www.ihe.net/participate/connectathon/) from the time it is approved, even if it will not be integrated until several months later).

### Open Issues
These issues were known as part of the publication, and IHE invites comments.

- PDQm_101: Are there some elements we can get global agreement should be marked as R2 (aka, Must-Support - required to be returned if known)?
- PDQm_102: Normative vs Trial-Implementation - Currently the HL7 FHIR standard components used (e.g., Patient, Bundle, etc) in this profile are at Normative state. Some portions of PDQm are relying on STU content (such as query parameters, mothersMaidenName).
- PDQm_103: PDQm has a small volume 1 content. Thus breaking each H2 out into independent html files makes it harder to address. We may choose to do similar to PIXm and have just one volume 1 content with deep links.
- [PDQm_issue_66](https://github.com/IHE/ITI.PDQm/issues/66): PDQm has allowed clients to use GET or POST search, and thus mandated that servers must support both GET and POST. The previous versions of PDQm had only mentioned GET search, but we learned that FHIR core mandated POST and does not allow us to not also mandate it. This leaves regions that want to use only one of these verbs for search seemingly forced to support both verbs for search. The current discussion in FHIR core offers that "support" could include implementing a "policy" that forces an http 405 response. This seems to be a workable solution, and the alternative would not be much different than this anyway.
- [PDQm_issue_92](https://github.com/IHE/ITI.PDQm/issues/92): Currently we are mandating that Patient Demographics Suppliers support both ITI-78 and ITI-119, while Patient Demographics Consumers have the option to choose to support either one or both transactions. Is requiring support for both transactions a problem for any Patient Demographics Suppliers? We note that prior versions of the specification included only ITI-78, meaning this is new functionality existing suppliers will need to incorporate. Do we want named options here?

### Closed Issues
These issues have been decided and documented in the publication.

- Upgraded to FHIR R4
- Case 4, where one or more identifier domains are indicated by the client but are not authoritative by the server, has been extensively discussed. The conclusion is to stay with allowing a server to return 404 or 200, and to require an OperationOutcome to indicate a warning. There is concern that the clients may not notice that they did not get results for a domain they requested, the client must take the initiative to look for the OperationOutcome to determine if they got full authoritative results. This looking for an OperationOutcome should always be inspected to assure results are what was expected. As such we did update client requirements to explicitly look for patient safety reasons.
- Removed the Pediatric Demographics Option as unnecessary and confusing. Most of the functionality needed for the use-case is natural part of the normal path of PDQm. The additional search parameters and extensions are allowed for those that need them. There has been little to no implementation of this option in the PDQ or PDQv3 environments. 

</div>
