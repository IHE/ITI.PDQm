Profile: MatchParametersIn
Parent: Parameters 
Id: IHE.PDQm.MatchParametersIn
Title: "PDQm Match Input Parameters Profile"
Description: """
The PDQm Match Input Parameters Profile describes the Parameters Resource that is to be posted to the $match endpoint when invoking ITI-119.
This profile is consistent with the expections of the [Patient-match operation in FHIR core](http://hl7.org/fhir/R4/patient-operation-match.html),
except the input resource shall be an instance of the [PDQm Patient Profile for $match Input](StructureDefinition-IHE.PDQm.MatchInput.html).

Note that the only required parameter is the Patient Resource. When only the Patient is supplied, it can be POSTed directly to the $match endpoint
without being wrapped in a Parameters Resource, as long as it conforms to the [PDQm Patient Profile for $match Input](StructureDefinition-IHE.PDQm.MatchInput.html).
"""

* implicitRules 0..0

* parameter 1..3
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed
* parameter ^slicing.description = "Parameters should match those of the $match input, with PDQm Profile Restrictions"
* parameter ^slicing.ordered = false

* parameter contains resource 1..1
* parameter[resource]
  * name = "resource"
  * value[x] 0..0
  * resource 1..1
  * resource only IHE.PDQm.MatchInput
  * part 0..0
* parameter contains onlyCertainMatches 0..1
* parameter[onlyCertainMatches]
  * name = "onlyCertainMatches"
  * value[x] 1..1
  * value[x] only boolean
  * resource 0..0
  * part 0..0
* parameter contains count 0..1
* parameter[count]
  * name = "count"
  * value[x] 1..1
  * value[x] only integer
  * resource 0..0
  * part 0..0

* parameter
  * modifierExtension 0..0