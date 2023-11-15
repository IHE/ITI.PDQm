Instance:   ex-QueryPatientResourceResponseMessage
InstanceOf: IHE.PDQm.QueryPatientResourceResponseMessage
Title:      "Example of a Query Patient Resource Response message"
Description: "Example of a Query Patient Resource Response message with a single Patient"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #searchset
* link[0].relation = "self"
* link[0].url = "test.fhir.net/R4/fhir/Patient?family=Schmidt"
* total = 1
* timestamp = 2023-09-25T15:42:00Z
* entry[0].fullUrl = "http://example.org/Patient/ex-patient"
* entry[0].resource = ex-patient