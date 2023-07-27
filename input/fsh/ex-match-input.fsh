Instance:   ex-match-input
InstanceOf: PDQmMatchInput
Title:      "Example Patient input for PDQm $match"
Description: "Example of a Patient resource to be used as input for $match"
Usage: #example

* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[+].system = "http://example.org/exampleSystem"
* identifier[=].value = "8675310"
* name[+].family = "Schmidt"
* name[=].given = "John"
* gender = #other
* birthDate = "1923-07-25"
* address.state = "WI"
* address.country = "USA"
