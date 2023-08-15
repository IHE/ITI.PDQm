Instance: PDQmMatch
InstanceOf: OperationDefinition
Title: "PDQm $Match Operation"
Usage: #definition
Description: """
This operation implements the [Patient Demographics Match \[ITI-119\]](ITI-119.html) transaction.
It is fully compatible with the [$match Operation on Patient](http://hl7.org/fhir/R4/patient-operation-match.html). 
The only changes are to constrain the input parameters to use the [PDQm Patient Profile for $match Input](StructureDefinition-IHE.PDQm.MatchInput.html) profile
and to constring the output parameters to use the [PDQm Patient Profile](StructureDefinition-IHE.PDQm.Patient.html) profile.
"""

* base = "http://hl7.org/fhir/OperationDefinition/Patient-match"
* name = "Find_Patient_Matches_PDQm"
* status = #draft
* kind = #operation
* affectsState = false
* resource = #Patient
* system = false
* type = true
* instance = false
* code = #match
* inputProfile = Canonical(IHE.PDQm.MatchParametersIn)
* outputProfile = Canonical(IHE.PDQm.MatchParametersOut)

* parameter[+]
  * name = #resource
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Use this to provide an entire set of patient details for the MPI to match against (e.g. POST a patient record to Patient/$match)."
  * type = #Patient
* parameter[+]
  * name = #onlyCertainMatches
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "If there are multiple potential matches, then the match should not return the results with this flag set to true. When false, the server may return multiple results with each result graded accordingly."
  * type = #boolean
* parameter[+]
  * name = #count
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "The maximum number of records to return. If no value is provided, the server decides how many matches to return. Note that clients should be careful when using this, as it may prevent probable - and valid - matches from being returned."
  * type = #integer
* parameter[+]
  * name = #return
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "A bundle contain a set of Patient records that represent possible matches, optionally it may also contain an OperationOutcome with further information about the search results (such as warnings or information messages, such as a count of records that were close but eliminated) If the operation was unsuccessful, then an OperationOutcome may be returned along with a BadRequest status Code (e.g. security issue, or insufficient properties in patient fragment - check against profile).\n\nNote: as this is the only out parameter, it is a resource, and it has the name 'return', the result of this operation is returned directly as a resource"
  * type = #Bundle

