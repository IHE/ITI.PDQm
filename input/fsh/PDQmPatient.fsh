Profile: PDQmPatient
Parent: Patient 
Id: IHE.PDQm.Patient
Title: "PDQm Patient Profile"
Description: """
The PDQm Patient Profile 
- when any element in FHIR Core Patient are known, and when authorized to return the element, then all elements that are core to FHIR Patient should be returned
- forbids modifier extensions - so that all uses do not need to be concerned with changes to the meaning of the core elements of the Patient resource
"""

* modifierExtension 0..0

