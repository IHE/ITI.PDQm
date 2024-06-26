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
- [Search Parameters that SHALL be supported](ITI-78.html#23784121-search-parameters)
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
- SHALL support the `:exact` modifier on search parameters of type string
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
      * name = "family:exact"
      * type = #string
      * documentation = "A portion of the family name of the patient, modified to use exact string matching"
    * searchParam[+]
      * name = "given"
      * type = #string
      * documentation = "A portion of the given name of the patient"
    * searchParam[+]
      * name = "given:exact"
      * type = #string
      * documentation = "A portion of the given name of the patient, modified to use exact string matching"
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
      * name = "address:exact"
      * type = #string
      * documentation = "A server defined search that MAY match any of the string fields in the Address, including line, city, district, state, country, postalCode, and/or text, modified to use exact string matching"
    * searchParam[+]
      * name = "address-city"
      * type = #string
      * documentation = "A city specified in an address"
    * searchParam[+]
      * name = "address-city:exact"
      * type = #string
      * documentation = "A city specified in an address, modified to use exact string matching"
    * searchParam[+]
      * name = "address-country"
      * type = #string
      * documentation = "A country specified in an address"
    * searchParam[+]
      * name = "address-country:exact"
      * type = #string
      * documentation = "A country specified in an address, modified to use exact string matching"
    * searchParam[+]
      * name = "address-postalcode"
      * type = #string
      * documentation = "A postalCode specified in an address"
    * searchParam[+]
      * name = "address-postalcode:exact"
      * type = #string
      * documentation = "A postalCode specified in an address, modified to use exact string matching"
    * searchParam[+]
      * name = "address-state"
      * type = #string
      * documentation = "A state specified in an address"
    * searchParam[+]
      * name = "address-state:exact"
      * type = #string
      * documentation = "A state specified in an address, modified to use exact matching"
    * searchParam[+]
      * name = "gender"
      * type = #token
      * documentation = "Gender of the patient"
    * searchParam[+]
      * name = "mothersMaidenName"
      * definition = "http://hl7.org/fhir/SearchParameter/patient-extensions-Patient-mothersMaidenName"
      * type = #string
      * documentation = "Mother's maiden (unmarried) name, commonly collected to help verify patient identity."
    * searchParam[+]
      * name = "mothersMaidenName:exact"
      * definition = "http://hl7.org/fhir/SearchParameter/patient-extensions-Patient-mothersMaidenName"
      * type = #string
      * documentation = "Mother's maiden (unmarried) name, commonly collected to help verify patient identity, modified to use exact string matching."
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
- [Search Parameters that SHALL be supported](ITI-78.html#23784121-search-parameters)
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
- SHALL support the `:exact` modifier on search parameters of type string
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
      * name = "family:exact"
      * type = #string
      * documentation = "A portion of the family name of the patient, modified to use exact string matching"
    * searchParam[+]
      * name = "given"
      * type = #string
      * documentation = "A portion of the given name of the patient"
    * searchParam[+]
      * name = "given:exact"
      * type = #string
      * documentation = "A portion of the given name of the patient, modified to use exact string matching"
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
      * name = "address:exact"
      * type = #string
      * documentation = "A server defined search that MAY match any of the string fields in the Address, including line, city, district, state, country, postalCode, and/or text, modified to use exact string matching"
    * searchParam[+]
      * name = "address-city"
      * type = #string
      * documentation = "A city specified in an address"
    * searchParam[+]
      * name = "address-city:exact"
      * type = #string
      * documentation = "A city specified in an address, modified to use exact string matching"
    * searchParam[+]
      * name = "address-country"
      * type = #string
      * documentation = "A country specified in an address"
    * searchParam[+]
      * name = "address-country:exact"
      * type = #string
      * documentation = "A country specified in an address, modified to use exact string matching"
    * searchParam[+]
      * name = "address-postalcode"
      * type = #string
      * documentation = "A postalCode specified in an address"
    * searchParam[+]
      * name = "address-postalcode:exact"
      * type = #string
      * documentation = "A postalCode specified in an address, modified to use exact string matching"
    * searchParam[+]
      * name = "address-state"
      * type = #string
      * documentation = "A state specified in an address"
    * searchParam[+]
      * name = "address-state:exact"
      * type = #string
      * documentation = "A state specified in an address, modified to use exact matching"
    * searchParam[+]
      * name = "gender"
      * type = #token
      * documentation = "Gender of the patient"
    * searchParam[+]
      * name = "mothersMaidenName"
      * definition = "http://hl7.org/fhir/SearchParameter/patient-extensions-Patient-mothersMaidenName"
      * type = #string
      * documentation = "Mother's maiden (unmarried) name, commonly collected to help verify patient identity."
    * searchParam[+]
      * name = "mothersMaidenName:exact"
      * definition = "http://hl7.org/fhir/SearchParameter/patient-extensions-Patient-mothersMaidenName"
      * type = #string
      * documentation = "Mother's maiden (unmarried) name, commonly collected to help verify patient identity, modified to use exact string matching."
    * operation
      * name = "match"
      * definition = Canonical(PDQmMatch)
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #SHALL
      * documentation = """Implementation SHALL conform to [ITI-119](ITI-119.html)"""   
  * interaction.code = #search-system



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
- [Search Parameters that MAY be used](ITI-78.html#23784121-search-parameters)
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
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #MAY
      * documentation = "When the resource version last changed"
    * searchParam[+]
      * name = "_id"
      * type = #token
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #MAY
      * documentation = "Logical id of this artifact"
    * searchParam[+]
      * name = "active"
      * type = #token
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #MAY
      * documentation = "Whether the patient record is active"
    * searchParam[+]
      * name = "family"
      * type = #string
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #MAY
      * documentation = "A portion of the family name of the patient"
    * searchParam[+]
      * name = "given"
      * type = #string
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #MAY
      * documentation = "A portion of the given name of the patient"
    * searchParam[+]
      * name = "identifier"
      * type = #token
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #MAY
      * documentation = "A patient identifier"
    * searchParam[+]
      * name = "telecom"
      * type = #token
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #MAY
      * documentation = "The value in any kind of telecom details of the patient"
    * searchParam[+]
      * name = "birthdate"
      * type = #date
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #MAY
      * documentation = "The patient's date of birth"
    * searchParam[+]
      * name = "address"
      * type = #string
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #MAY
      * documentation = "A server defined search that MAY match any of the string fields in the Address, including line, city, district, state, country, postalCode, and/or text"
    * searchParam[+]
      * name = "address-city"
      * type = #string
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #MAY
      * documentation = "A city specified in an address"
    * searchParam[+]
      * name = "address-country"
      * type = #string
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #MAY
      * documentation = "A country specified in an address"
    * searchParam[+]
      * name = "address-postalcode"
      * type = #string
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #MAY
      * documentation = "A postalCode specified in an address"
    * searchParam[+]
      * name = "address-state"
      * type = #string
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #MAY
      * documentation = "A state specified in an address"
    * searchParam[+]
      * name = "gender"
      * type = #token
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #MAY
      * documentation = "Gender of the patient"
    * searchParam[+]
      * name = "mothersMaidenName"
      * definition = "http://hl7.org/fhir/SearchParameter/patient-extensions-Patient-mothersMaidenName"
      * type = #string
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #MAY
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
      * name = "match"
      * definition = Canonical(PDQmMatch)
      * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * extension.valueCode = #SHALL
      * documentation = """Implementation SHALL conform to [ITI-119](ITI-119.html)"""   