Instance: IHE.PDQm.PatientDemographicsSupplier
InstanceOf: CapabilityStatement
Title: "PDQm Patient Demographics Supplier Actor"
Usage: #definition
* description = """
The PDQm Patient Demographics Supplier Actor (server) requirements CapabililtyStatement expresses the requirements that SHALL be provided.

- Query against the FHIR endpoint to the Patient Resource endpoint
- Using FHIR R4
- SHALL support both json or xml encoding
- SHOULD use a security framework. Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)
- [Search Parameters that SHALL be supported](https://profiles.ihe.net/ITI/PDQm/ITI-78.html#23784121-query-search-parameters)
  - _id
  - active
  - family
  - given
  - identifier
  - telecom
  - birthdate
  - address
  - gender
  - mothersMaidenName
- SHALL return Patient Resources conforming to the PDQm Patient Profile
"""
* name = "IHE_PDQM_PATIENT_DEMOGRAPHICS_SUPPLIER"
* title = "IHE PDQm Patient Demographics Supplier"
* status = #active
* experimental = false
* date = "2023-09-25"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * documentation = "PDQm Patient Demographics Supplier provides capability to discover Patient Identities by demographics and identities."
  * security
    * description = "Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)"
  * resource[+]
    * type = #Patient
    * supportedProfile[+] = Canonical(IHE.PDQm.Patient)
    * documentation = """
Mobile Patient Demographics Query [ITI-78]
"""
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * searchParam[+]
      * name = "_lastUpdated"
      * type = #date
      * documentation = "When the resource version last changed"
    * searchParam[+]
      * name = "_id"
      * type = #token
      * documentation = "Logical id of this artifact"
    * searchParam[+]
      * name = "active"
      * type = #token
      * documentation = "Whether the patient record is active"
    * searchParam[+]
      * name = "family"
      * type = #string
      * documentation = "A portion of the family name of the patient"
    * searchParam[+]
      * name = "given"
      * type = #string
      * documentation = "A portion of the given name of the patient"
    * searchParam[+]
      * name = "identifier"
      * type = #token
      * documentation = "A patient identifier"
    * searchParam[+]
      * name = "telecom"
      * type = #token
      * documentation = "The value in any kind of telecom details of the patient"
    * searchParam[+]
      * name = "birthdate"
      * type = #date
      * documentation = "The patient's date of birth"
    * searchParam[+]
      * name = "address"
      * type = #string
      * documentation = "A server defined search that MAY match any of the string fields in the Address, including line, city, district, state, country, postalCode, and/or text"
    * searchParam[+]
      * name = "address-city"
      * type = #string
      * documentation = "A city specified in an address"
    * searchParam[+]
      * name = "address-country"
      * type = #string
      * documentation = "A country specified in an address"
    * searchParam[+]
      * name = "address-postalcode"
      * type = #string
      * documentation = "A postalCode specified in an address"
    * searchParam[+]
      * name = "address-state"
      * type = #string
      * documentation = "A state specified in an address"
    * searchParam[+]
      * name = "gender"
      * type = #token
      * documentation = "Gender of the patient"
    * searchParam[+]
      * name = "mothersMaidenName"
      * definition = "http://hl7.org/fhir/SearchParameter/patient-extensions-Patient-mothersMaidenName"
      * type = #string
      * documentation = "Mother's maiden (unmarried) name, commonly collected to help verify patient identity."
  * interaction.code = #search-system


Instance: IHE.PDQm.PatientDemographicsSupplierMatch
InstanceOf: CapabilityStatement
Title: "PDQm Patient Demographics Supplier Actor Implementing Match Operation Option"
Usage: #definition
* description = """
The PDQm Patient Demographics Supplier Actor (server) requirements CapabililtyStatement expresses the requirements that SHALL be provided. This capability statement implements the Match Operation Option.

- Query against the FHIR endpoint to the Patient Resource endpoint
- Using FHIR R4
- SHALL support both json or xml encoding
- SHOULD use a security framework. Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)
- [Search Parameters that SHALL be supported](https://profiles.ihe.net/ITI/PDQm/ITI-78.html#23784121-query-search-parameters)
  - _id
  - active
  - family
  - given
  - identifier
  - telecom
  - birthdate
  - address
  - gender
  - mothersMaidenName
- SHALL support the PDQm $match operation
- SHALL return Patient Resources conforming to the PDQm Patient Profile
"""
* name = "IHE_PDQM_PATIENT_DEMOGRAPHICS_SUPPLIER_Match"
* title = "IHE PDQm Patient Demographics Supplier Implementing Match Operation Option"
* status = #active
* experimental = false
* date = "2023-09-25"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #server
  * documentation = "PDQm Patient Demographics Supplier provides capability to discover Patient Identities by demographics and identities."
  * security
    * description = "Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)"
  * resource[+]
    * type = #Patient
    * supportedProfile[+] = Canonical(IHE.PDQm.Patient)
    * documentation = """
Mobile Patient Demographics Query [ITI-78] and Patient Demographics Match [ITI-119]
"""
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * searchParam[+]
      * name = "_lastUpdated"
      * type = #date
      * documentation = "When the resource version last changed"
    * searchParam[+]
      * name = "_id"
      * type = #token
      * documentation = "Logical id of this artifact"
    * searchParam[+]
      * name = "active"
      * type = #token
      * documentation = "Whether the patient record is active"
    * searchParam[+]
      * name = "family"
      * type = #string
      * documentation = "A portion of the family name of the patient"
    * searchParam[+]
      * name = "given"
      * type = #string
      * documentation = "A portion of the given name of the patient"
    * searchParam[+]
      * name = "identifier"
      * type = #token
      * documentation = "A patient identifier"
    * searchParam[+]
      * name = "telecom"
      * type = #token
      * documentation = "The value in any kind of telecom details of the patient"
    * searchParam[+]
      * name = "birthdate"
      * type = #date
      * documentation = "The patient's date of birth"
    * searchParam[+]
      * name = "address"
      * type = #string
      * documentation = "A server defined search that MAY match any of the string fields in the Address, including line, city, district, state, country, postalCode, and/or text"
    * searchParam[+]
      * name = "address-city"
      * type = #string
      * documentation = "A city specified in an address"
    * searchParam[+]
      * name = "address-country"
      * type = #string
      * documentation = "A country specified in an address"
    * searchParam[+]
      * name = "address-postalcode"
      * type = #string
      * documentation = "A postalCode specified in an address"
    * searchParam[+]
      * name = "address-state"
      * type = #string
      * documentation = "A state specified in an address"
    * searchParam[+]
      * name = "gender"
      * type = #token
      * documentation = "Gender of the patient"
    * searchParam[+]
      * name = "mothersMaidenName"
      * definition = "http://hl7.org/fhir/SearchParameter/patient-extensions-Patient-mothersMaidenName"
      * type = #string
      * documentation = "Mother's maiden (unmarried) name, commonly collected to help verify patient identity."
  * interaction.code = #search-system
  * operation
    * name = "PDQm $Match"
    * definition = Canonical(PDQmMatch)


Instance: IHE.PDQm.PatientDemographicsConsumerQuery
InstanceOf: CapabilityStatement
Title: "PDQm Patient Demographics Consumer Actor Implementing Patient Search Option"
Usage: #definition
* description = """
The PDQm Patient Demographics Consumer Actor (client) requirements CapabililtyStatement expresses the requirements that can be utilized while being compliant. This capability statement implements the Patient Search Option.

- Query against the FHIR endpoint to the Patient Resource endpoint
- Using FHIR R4
- MAY request json or xml encoding
- SHOULD use a security framework. Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)
- [Search Parameters that MAY be used](https://profiles.ihe.net/ITI/PDQm/ITI-78.html#23784121-query-search-parameters)
  - _id
  - active
  - family
  - given
  - identifier
  - telecom
  - birthdate
  - address
  - gender
  - mothersMaidenName
"""
* name = "IHE_PDQM_PATIENT_DEMOGRAPHICS_CONSUMER_SEARCH"
* title = "IHE PDQm Patient Demographics Consumer Implementing Patient Search Option"
* status = #active
* experimental = false
* date = "2022-10-28"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #client
  * documentation = "PDQm Patient Demographics Consumer provides capability to discover Patient Identities by demographics and identities."
  * security
    * description = "Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)"
  * resource[+]
    * type = #Patient
    * documentation = """
Mobile Patient Demographics Query [ITI-78]
"""
    * interaction[+].code = #read
    * interaction[+].code = #search-type
    * searchParam[+]
      * name = "_lastUpdated"
      * type = #date
      * documentation = "When the resource version last changed"
    * searchParam[+]
      * name = "_id"
      * type = #token
      * documentation = "Logical id of this artifact"
    * searchParam[+]
      * name = "active"
      * type = #token
      * documentation = "Whether the patient record is active"
    * searchParam[+]
      * name = "family"
      * type = #string
      * documentation = "A portion of the family name of the patient"
    * searchParam[+]
      * name = "given"
      * type = #string
      * documentation = "A portion of the given name of the patient"
    * searchParam[+]
      * name = "identifier"
      * type = #token
      * documentation = "A patient identifier"
    * searchParam[+]
      * name = "telecom"
      * type = #token
      * documentation = "The value in any kind of telecom details of the patient"
    * searchParam[+]
      * name = "birthdate"
      * type = #date
      * documentation = "The patient's date of birth"
    * searchParam[+]
      * name = "address"
      * type = #string
      * documentation = "A server defined search that MAY match any of the string fields in the Address, including line, city, district, state, country, postalCode, and/or text"
    * searchParam[+]
      * name = "address-city"
      * type = #string
      * documentation = "A city specified in an address"
    * searchParam[+]
      * name = "address-country"
      * type = #string
      * documentation = "A country specified in an address"
    * searchParam[+]
      * name = "address-postalcode"
      * type = #string
      * documentation = "A postalCode specified in an address"
    * searchParam[+]
      * name = "address-state"
      * type = #string
      * documentation = "A state specified in an address"
    * searchParam[+]
      * name = "gender"
      * type = #token
      * documentation = "Gender of the patient"
    * searchParam[+]
      * name = "mothersMaidenName"
      * definition = "http://hl7.org/fhir/SearchParameter/patient-extensions-Patient-mothersMaidenName"
      * type = #string
      * documentation = "Mother's maiden (unmarried) name, commonly collected to help verify patient identity."
  * interaction.code = #search-system

Instance: IHE.PDQm.PatientDemographicsConsumerMatch
InstanceOf: CapabilityStatement
Title: "PDQm Patient Demographics Consumer Actor Implementing Match Operation Option"
Usage: #definition
* description = """
The PDQm Patient Demographics Consumer Actor (client) requirements CapabililtyStatement expresses the requirements that can be utilized while being compliant. This capability statement implements the Match Operation Option.

- Invoke the $match operation on a FHIR endpoint
- Using FHIR R4
- Input and output parameters conform to the PDQm Profiles
- MAY request json or xml encoding
- SHOULD use a security framework. Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)
"""
* name = "IHE_PDQM_PATIENT_DEMOGRAPHICS_CONSUMER_MATCH"
* title = "IHE PDQm Patient Demographics Consumer Implementing Match Operation Option"
* status = #active
* experimental = false
* date = "2023-09-22"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest
  * mode = #client
  * documentation = "PDQm Patient Demographics Consumer provides capability to discover Patient Identities by invoking the ITI-119 $match operation."
  * security
    * description = "Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)"
  * resource[+]
    * type = #Patient
    * supportedProfile[+] = Canonical(IHE.PDQm.MatchInputPatient)
    * supportedProfile[+] = Canonical(IHE.PDQm.Patient)
    * documentation = "Patient Demographics Match [ITI-119]"
    * operation
      * name = "PDQm $Match"
      * definition = Canonical(PDQmMatch)