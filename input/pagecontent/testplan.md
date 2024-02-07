<div markdown="1" class="stu-note">

This Test Plan page is a prototype. We expect the maturity of the content will improve over time. For now, we summarize high level testing scope and available tools. Comments are welcome.
</div>

## Introduction

PDQm specifies a query transaction between two actors. The transaction between actors specify semantics of the data exchanged. The PDQm test plan focuses on these semantics and on the expected actions on the server-side actor.

## High-level Test Scope

### Patient Demographics Query for Mobile [[ITI-78]](ITI-78.html) 

* If supported, the Patient Demographics Consumer initiates the ITI-78 queries with various combinations of parameters, as supported.
* The Patient Demographics Supplier responds to the ITI-78 queries as appropriate.
* The Patient Demographics Supplier SHALL be capable of filtering the response search set by the following parameters individually, based on the content of the Patient resources it stores (it need not be capable of filtering on parameters where the corresponding data is never present in Patient Resources it might return):
  * `_id`
  * `active`
  * `family`
  * `given`
  * `identifier`
  * `telecom`
  * `birthdate`
  * `address`
  * `address-city`
  * `address-country`
  * `address-postalcode`
  * `address-state`
  * `gender`
  * `mothersMaidenName`
* The Patient Demographics Supplier SHALL be capable of filtering the response search set by the following combinations of search parameters:
  * `family` and `gender`
  * `birthdate` and `family`

### Patient Demographics Match [[ITI-119]](ITI-119.html) 

* If supported, the Patient Demographics Consumer initiates the ITI-119 operation with a Patient resource containing various demographics, as supported, and possibly also specifies the `onlyCertainMatches` and `count` parameters
* If supported, the Patient Demographics Supplier responds to the ITI-119 requests as appropriate 
* If supported, the Patient Demographics Consumer MAY initiate the ITI-119 transaction with a Patient resource containing various demographics, as supported. When prompted with such a request, the Patient Demographics Supplier SHALL be able to respond with the set of matching patients from its database. The methodology the Patient Demographics Supplier uses to determine matches is not specified by this profile. 
* The Patient Demographics Supplier SHALL populate Patient entries in the response Bundle with a `search.score` between 0 and 1, where higher values indicate higher match quality. The method used to compute the score is otherwise not specified by this profile. 
* The Patient Demographics Supplier SHALL populate Patient entries in the response Bundle with the [match-grade]({{site.data.fhir.path}}extension-match-grade.html) extension containing an [appropriate code]({{site.data.fhir.path}}valueset-match-grade.html) to describe the match quality. The method the Patient Demographics Supplier uses to assess the match grade is not specified by this profile. 
* The Patient Demographics Consumer MAY specify the `onlyCertainMatches` parameter in the request message. In response, the Patient Demographics Supplier SHALL include only results for which the `match-grade` is `certain`. 
* The Patient Demographics Consumer MAY specify the `count` parameter in the request message. In response, the Patient Demographics Supplier SHALL include no more than `count` Patients in the response. 
* When the request message does not match any Patient records in the Patient Demographics Supplier, and no error is encountered when performing the search, then the Patient Demographics Supplier SHALL respond with `HTTP 200 (OK)`. The response Bundle SHALL not contain any Patient entries, and any OperationOutcome entries SHALL not have `fatal` or `error` severity. 
* When the `count` and `onlyCertainMatches` parameters are not used, the Patient Demographics Consumer MAY invoke the ITI-119 transaction using either a raw Patient Resource, or a Parameters Resource containing a Patient Resource. The Patient Demographics Supplier SHALL be capable of handling both request formats in the same way.  

### Options 

* None

## Unit Test Procedure (Conformance Testing)

Unit testing this context entails testing a SUT with a simulator or validator tool. A simulator is an implementation of an actor that is designed specifically to test the opposite pair actor. The simulator might be a reference implementation or might be a specially designed test-bench. Often, when a reference implementation is used, the negative tests are harder to simulate. A validator is an implementation that can check conformance. A validator might be a simulator, but might also be a standalone tool used to validate only a message encoding. Some reference implementations might be able to validate to a StructureDefinition profile, but often these do not include sufficient constraints given the overall actor conformance criteria. 

### Available tools for PDQm unit testing

#### Gazelle PatientManager - Simulator 

* Provider: INRIA (Rennes, France), [KEREVAL](https://www.kereval.com/)
* [Gazelle PatientManager online](https://gazelle.ihe.net/PatientManager/home.seam)
* [User Manual](https://gazelle.ihe.net/gazelle-documentation/Patient-Manager/user.html)
* [Tool support](https://gazelle.ihe.net/jira/projects/PAM)
* Actors (options) tested: Patient Demographics Consumer, Patient Demographics Supplier for ITI-78:
  *  Consumer test definition: [PM_PDQ_Query-Patient_Demographics_Consumer](https://gazelle.ihe.net/content/pmpdqquery-patientdemographicsconsumer)
  *  Supplier test definition: [PM_PDQ_Query-Patient_Demographics_Supplier](https://gazelle.ihe.net/content/pmpdqquery-patientdemographicssupplier)

#### Gazelle External Validation Service (aka "EVS Client") - Validator

* Provider: INRIA (Rennes, France), [KEREVAL](https://www.kereval.com/), and Mallinckrodt Institute of Radiology (Saint Louis, USA) 
* [Gazelle EVSClient online](https://gazelle.ihe.net/evs/home.seam)
* [User Manual](https://gazelle.ihe.net/gazelle-documentation/EVS-Client/user.html)
* [Tool support](https://gazelle.ihe.net/jira/browse/EVSCLT)
* Scope of testing: validation using StructureDefinitions for PDQm IG
* Test documentation: https://gazelle.ihe.net/content/evsfhirvalidation
* Other notes: StructureDefinitions and other conformance resources are provided in this Implementation Guide on the [Artifacts](artifacts.html) page.


## Integration Test Procedure (Interoperability Testing)

Integration Testing in this context is where two SUT of paired actors test against each other. Integration testing is often limited by the capability of the client (Patient Demographics Consumer), which might support only a subset of the semantics REQUIRED to be supported by the server (Patient Demographics Supplier). Full message semantics and failure-modes are generally more thoroughly exercised with unit (conformance) tests.

The tests listed below are defined in [Gazelle Master Model](https://gazelle.ihe.net/GMM) and are performed by systems testing PDQm at IHE Connectathons.

### Patient Demographics Consumer --> Patient Demographics Supplier Interoperability Tests:

* ITI-78_(PDQm)_Search_Read
  * Assumes a pre-defined set of patient demographics on the Supplier actor
* ITI-78_Paging
