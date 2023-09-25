Instance: IHE.PDQm.PatientDemographicsConsumerMatch
InstanceOf: CapabilityStatement
Title: "PDQm Patient Demographics Consumer Actor Implementing ITI-119"
Usage: #definition
* description = """
The PDQm Patient Demographics Consumer Actor (client) requirements CapabililtyStatement expresses the requirements that can be utilized while being compliant. This capability statement implements the ITI-119 transaction.

- Invoke the $match operation on a FHIR endpoint
- Using FHIR R4
- Input and output parameters conform to the PDQm Profiles
- may request json or xml encoding
- should use a security framework. Recommend [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html), encouraged [IHE-IUA](https://profiles.ihe.net/ITI/IUA/index.html) or [SMART-app-launch](http://www.hl7.org/fhir/smart-app-launch/)
"""
* name = "IHE_PDQM_PATIENT_DEMOGRAPHICS_CONSUMER_ITI_119"
* title = "IHE PDQm Patient Demographics Consumer Implementing ITI-119"
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
    * supportedProfile[+] = Canonical(IHE.PDQm.MatchInput)
    * supportedProfile[+] = Canonical(IHE.PDQm.Patient)
    * documentation = "Patient Demographics Match [ITI-119]"
    * operation
      * name = "PDQm $Match"
      * definition = Canonical(PDQmMatch)

