Instance: PDQmMatch
InstanceOf: OperationDefinition
Title: "PDQm $Match"
Usage: #definition
Description: """
This operation implements the [Patient Demographics Match \[ITI-119\]](ITI-119.html) transaction.
It is fully compatible with the [$match Operation on Patient](http://hl7.org/fhir/R4/patient-operation-match.html). 
The only changes are to constrain the input parameters to use the [PDQm Patient Profile for $match Input](StructureDefinition-IHE.PDQm.MatchInputPatient.html) profile
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

Profile: MatchParametersIn
Parent: Parameters 
Id: IHE.PDQm.MatchParametersIn
Title: "PDQm Match Input Parameters Profile"
Description: """
The PDQm Match Input Parameters Profile describes the Parameters Resource that is to be posted to the $match endpoint when invoking ITI-119.
This profile is consistent with the expections of the [Patient-match operation in FHIR core](http://hl7.org/fhir/R4/patient-operation-match.html),
except the input resource shall be an instance of the [PDQm Patient Profile for $match Input](StructureDefinition-IHE.PDQm.MatchInputPatient.html).

Note that the only required parameter is the Patient Resource. When only the Patient is supplied, it can be POSTed directly to the $match endpoint
without being wrapped in a Parameters Resource, as long as it conforms to the [PDQm Patient Profile for $match Input](StructureDefinition-IHE.PDQm.MatchInputPatient.html).
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
  * resource only IHE.PDQm.MatchInputPatient
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

Profile: PDQmMatchInput
Parent: Patient 
Id: IHE.PDQm.MatchInputPatient
Title: "PDQm Patient Profile for $match Input"
Description: """
The PDQm Patient Profile for $match Input shall be provided as input to the ITI-119 transaction. 
- While it is not required that the input to $match be a valid FHIR instance, it is recommended to supply as many elements as possible to facilitate matching.
- modifierExtension and implicitRules SHALL not be specified.
- The patient-mothersMaidenName extension is available to hold the mothers maiden name
"""

* modifierExtension 0..0
* implicitRules 0..0
* extension contains http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName named MothersMaidenName 0..1 