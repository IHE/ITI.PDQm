Profile: PDQmMatchInput
Parent: Patient 
Id: IHE.PDQm.MatchInput
Title: "PDQm Patient Profile for $match Input"
Description: """
The PDQm Patient Profile for $match Input shall be provided as input to the ITI-119 transaction. 
- While it is not required that the input to $match be a valid FHIR instance, it is recommended to supply as many elements as possible to facilitate matching.
- modifierExtension and implicitRules SHALL not be specified.
- The patient-mothersMaidenName extension is available to hold the mothers maiden name
- The patient-genderIdentity extension is available to hold the patient's gender identity. See guidance in the [HL7 Cross Paradigm IG: Gender Harmony - Sex and Gender Representation](https://build.fhir.org/ig/HL7/fhir-gender-harmony/branches/main/fhirgenderharmony.html)
"""

* modifierExtension 0..0
* implicitRules 0..0
* extension contains http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName named MothersMaidenName 0..1 
* extension contains http://hl7.org/fhir/StructureDefinition/patient-genderIdentity named genderIdentity 0..1

