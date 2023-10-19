Instance:   ex-patient
InstanceOf: PDQmPatient
Title:      "Example PDQm Patient"
Description: "Example Patient instance of the PDQm Patient profile."
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

Instance:   ex-patient-mothers-maiden-name
InstanceOf: PDQmPatient
Title:      "Example PDQm Patient with Mothers Maiden Name Extension"
Description: "Example Patient instance of the PDQm Patient profile where the Patient has the mother's maiden name specified."
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
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName"
  * valueString = "Frankie"