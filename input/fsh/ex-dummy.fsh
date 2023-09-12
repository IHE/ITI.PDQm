Instance:   ex-device
InstanceOf: Device
Title:      "Dummy Device example"
Description: "Dummy Device example for completeness sake. No actual use of this resource other than an example target"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST


Instance:   ex-patient
InstanceOf: PDQmPatient
Title:      "Dummy Patient example"
Description: "Dummy patient example for completeness sake. No actual use of this resource other than an example target"
Usage: #example
// history - http://playgroundjungle.com/2018/02/origins-of-john-jacob-jingleheimer-schmidt.html
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* identifier[+].system = "http://example.org/exampleSystem"
* identifier[=].value = "8675309"
* name[+].use = #usual
* name[=].family = "Schmidt"
* name[=].given = "John"
* name[=].text = "John Schmidt"
* name[+].use = #old
* name[=].family = "Schnidt"
* name[=].given[+] = "John"
* name[=].given[+] = "Jacob"
* name[=].given[+] = "Jingle"
* name[=].given[+] = "Heimer"
* name[=].text = "John Jacob Jingle Heimer Schnidt"
* name[=].period.end = "1960"
* name[+].use = #official
* name[=].family = "Schmidt"
* name[=].given[+] = "John"
* name[=].given[+] = "Jacob"
* name[=].given[+] = "Jingleheimer"
* name[=].period.start = "1960-01-01"
* name[=].text = "John Jacob Jingleheimer Schmidt"
* name[+].use = #nickname
* name[=].family = "Schmidt"
* name[=].given = "Jack"
* name[=].text = "Jack Schmidt"
* gender = #other
* birthDate = "1923-07-25"
* address.state = "WI"
* address.country = "USA"
