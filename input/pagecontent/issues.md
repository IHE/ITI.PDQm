<div markdown="1" class="stu-note">

### Significant changes from PDQm, Rev 2.2:
- FHIR Implementation Guide instead of [pdf - Rev. 2.2](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_PDQm.pdf)
- Patient is now profiled to forbid modifier extensions
- AuditEvent is fully profiled using structureDefinition with examples

### Open Issues

- PDQm_101: Are there some elements we can get global agreement should be marked as R2 (aka, Must-Support - required to be returned if known)?
- PDQm_102: Normative vs Trial-Implementation - Currently the HL7 FHIR standard components used (e.g., Patient, Bundle, etc) in this profile are at Normative state. Some portions of PDQm are relying on STU content (such as query parameters, mothersMaidenName).
- PDQm_103: PDQm has a small volume 1 content. Thus breaking each H2 out into independent html files makes it harder to address. We may choose to do similar to PIXm and have just one volume 1 content with deep links.

### Closed Issues

- Upgraded to FHIR R4
- Case 4, where one or more identifier domains are indicated by the client but are not authoritative by the server, has been extensively discussed. The conclusion is to stay with allowing a server to return 404 or 200, and to require an OperationOutcome to indicate a warning. There is concern that the clients may not notice that they did not get results for a domain they requested, the client must take the initiative to look for the OperationOutcome to determine if they got full authoritative results. This looking for an OperationOutcome should always be inspected to assure results are what was expected. As such we did update client requirements to explicitly look for patient safety reasons.
- PDQm_100: Added the mothersMaidenName extended search parameter. Note that PDO Option does require sub normative extensions to support mothersMaidenName
- Addressed CP-ITI-826 – PDQm Clarify requirements for Pediatric Demographics
  -	Pediatric Demographics Option – original PDQ indicated a last update date/time, and last updated facility element. These were identified as R2 elements. These are not part of the Patient Resource, but rather the Encounter resource. These elements are thus not in scope of PDQm.

</div>
