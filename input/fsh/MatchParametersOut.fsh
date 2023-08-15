Profile: MatchParametersOut
Parent: Bundle 
Id: IHE.PDQm.MatchParametersOut
Title: "PDQm Match Output Bundle Profile"
Description: """
The PDQm Match Output Bundle Profile describes the Bundle that shall be returned in response to an ITI-119 transaction.
This profile is consistent with the expections of the [Patient-match operation in FHIR core](http://hl7.org/fhir/R4/patient-operation-match.html),
except the Patient Resources shall be instances of the [PDQm Patient Profile](StructureDefinition-IHE.PDQm.Patient.html).

Since the response to the $match Operation contains only one parameter, the Bundle resource is returned directly rather
than inside of a Parameters resource. 
"""

* type = #searchset
* implicitRules 0..0

* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Bundle.entry should consist of only IHE.PDQm.Patient and OperationOutcome"
* entry ^slicing.ordered = false

* entry
  * request 0..0
  * response 0..0
* entry contains patient 0..*
* entry[patient]
  * resource only IHE.PDQm.Patient
  * search 1..1
  * search
    * score 1..1
    * mode 1..1
    * mode = #match
    * extension contains http://hl7.org/fhir/StructureDefinition/match-grade named MatchGrade 1..1
* entry contains operationOutcome 0..*
* entry[operationOutcome]
  * resource only OperationOutcome