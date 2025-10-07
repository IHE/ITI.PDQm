Instance:   ex-match-output
InstanceOf: IHE.PDQm.MatchParametersOut
Title:      "Example $match Output Bundle - 1 Patient"
Description: "Example of Bundle resource to be returned for ITI-119 output. This is a simple case where only one patient is returned."
Usage: #example

* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* entry[patient] 
  * resource = ex-patient
  * search
    * score = 0.9
    * extension[MatchGrade] 
      * valueCode = #certain
  * fullUrl = "https://profiles.ihe.net/ITI/PDQm/Patient-ex-patient.html"


Instance:   ex-match-output-multiple
InstanceOf: IHE.PDQm.MatchParametersOut
Title:      "Example $match Output Bundle - 2 Patients"
Description: "Example of Bundle resource to be returned for ITI-119 output. 2 Patients are found in the search result."
Usage: #example

* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* entry[patient] 
  * resource = ex-patient
  * search
    * score = 0.9
    * extension[MatchGrade] 
      * valueCode = #probable
  * fullUrl = "https://profiles.ihe.net/ITI/PDQm/Patient-ex-patient.html"
* entry[patient][+]
  * resource = ex-patient-mothers-maiden-name
  * search
    * score = 0.5
    * extension[MatchGrade]
      * valueCode = #possible
  * fullUrl = "https://profiles.ihe.net/ITI/PDQm/Patient-ex-patient-mothers-maiden-name.html"


Instance:   ex-match-output-empty
InstanceOf: IHE.PDQm.MatchParametersOut
Title:      "Example $match Output Bundle - No Patients Found"
Description: "Example of Bundle resource to be returned for ITI-119 output. No Patients are found in the search result."
Usage: #example

* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST


Instance:   ex-match-output-error
InstanceOf: IHE.PDQm.MatchParametersOut
Title:      "Example $match Output Bundle - Error"
Description: "Example of Bundle resource to be returned for ITI-119 output. No Patients are found in the search result."
Usage: #example

* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* entry[operationOutcome]
  * resource = ex-match-failure
  * search.mode = #outcome
  * fullUrl = "https://profiles.ihe.net/ITI/PDQm/OperationOutcome-ex-match-failure.html"


Instance:   ex-match-output-warning
InstanceOf: IHE.PDQm.MatchParametersOut
Title:      "Example $match Output Bundle - 1 Patient and 1 Warning"
Description: "Example of Bundle resource to be returned for ITI-119 output. 1 patient is returned alongside a warning."
Usage: #example

* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* entry[patient] 
  * resource = ex-patient
  * search
    * score = 0.9
    * extension[MatchGrade] 
      * valueCode = #probable
  * fullUrl = "https://profiles.ihe.net/ITI/PDQm/Patient-ex-patient.html"
* entry[operationOutcome]
  * resource = ex-match-failure
  * search.mode = #outcome
  * fullUrl = "https://profiles.ihe.net/ITI/PDQm/OperationOutcome-ex-match-warning.html"