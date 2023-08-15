Profile: PDQmPatient
Parent: http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-patient
Id: IHE.PDQm.Patient
Title: "PDQm Patient Profile"
Description: """
The PDQm Patient Profile, based on the IPA Patient Profile
- when any element in FHIR Core Patient are known, and when authorized to return the element, then all elements that are core to FHIR Patient should be returned
- forbids modifier extensions and implicit rules - so that all uses do not need to be concerned with changes to the meaning of the core elements of the Patient resource
- adds the patient-mothersMaidenName extension as an extension available to hold the mothers maiden name
"""

* modifierExtension 0..0
* implicitRules 0..0
* extension contains http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName named MothersMaidenName 0..1 

