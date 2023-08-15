Instance:   ex-match-output
InstanceOf: IHE.PDQm.MatchParametersOut
Title:      "Example $match output Bundle"
Description: "Example of Bundle resource to be returned for ITI-119 output"
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

