Instance:   ex-match-input-patient-only
InstanceOf: IHE.PDQm.MatchParametersIn
Title:      "Example $match Input Parameters Where Only Patient Is Specified"
Description: "Example of Parameters resource to be supplied for ITI-119 input when only the Patient parameter is specified. "
Usage: #example

* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* parameter[resource].resource = ex-match-input-patient


Instance:   ex-match-input-onlyCertainMatches
InstanceOf: IHE.PDQm.MatchParametersIn
Title:      "Example $match Input Parameters Where onlyCertainmatches Is Specified"
Description: "Example of Parameters resource to be supplied for ITI-119 input when onlyCertainMatches is specified."
Usage: #example

* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* parameter[resource].resource = ex-match-input-patient
* parameter[onlyCertainMatches].valueBoolean = true


Instance:   ex-match-input-count
InstanceOf: IHE.PDQm.MatchParametersIn
Title:      "Example $match Input Parameters Where count Is Specified"
Description: "Example of Parameters resource to be supplied for ITI-119 input when count is specified."
Usage: #example

* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* parameter[resource].resource = ex-match-input-patient
* parameter[count].valueInteger = 1