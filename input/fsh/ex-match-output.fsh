Instance:   ex-match-output
InstanceOf: IHE.PDQm.MatchParametersOut
Title:      "Example $match Output Bundle - 1 Patient"
Description: "Example of Bundle resource to be returned for ITI-119 output. This is a simple case where only one patient is returned."
Usage: #example

* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* link
  * relation = "self"
  * url = "http://profiles.ihe.net/IHE/ITI.PDQm/branches/match/Bundle-ex-match-output.html"
* entry[patient] 
  * resource = ex-patient
  * search
    * score = 0.9
    * extension[MatchGrade] 
      * valueCode = #certain
  * fullUrl = "https://profiles.ihe.net/ITI/PDQm/Patient-ex-patient.html"
* total = 1


Instance:   ex-match-output-multiple
InstanceOf: IHE.PDQm.MatchParametersOut
Title:      "Example $match Output Bundle - 2 Patients"
Description: "Example of Bundle resource to be returned for ITI-119 output. 2 Patients are found in the search result."
Usage: #example

* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* link
  * relation = "self"
  * url = "http://profiles.ihe.net/IHE/ITI.PDQm/branches/match/Bundle-ex-match-output-multiple.html"
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
* total = 2


Instance:   ex-match-output-empty
InstanceOf: IHE.PDQm.MatchParametersOut
Title:      "Example $match Output Bundle - No Patients Found"
Description: "Example of Bundle resource to be returned for ITI-119 output. No Patients are found in the search result."
Usage: #example

* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* link
  * relation = "self"
  * url = "http://profiles.ihe.net/IHE/ITI.PDQm/branches/match/Bundle-ex-match-output-empty.html"
* total = 0


Instance:   ex-match-output-error
InstanceOf: IHE.PDQm.MatchParametersOut
Title:      "Example $match Output Bundle - Error"
Description: "Example of Bundle resource to be returned for ITI-119 output. The search failed due to an error."
Usage: #example

* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* link
  * relation = "self"
  * url = "http://profiles.ihe.net/IHE/ITI.PDQm/branches/match/Bundle-ex-match-output-empty.html"
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
* link
  * relation = "self"
  * url = "http://profiles.ihe.net/IHE/ITI.PDQm/branches/match/Bundle-ex-match-output-warning.html"
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
* total = 1