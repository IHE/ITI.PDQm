Profile: PDQmPatient
Parent: Patient 
Id: IHE.PDQm.Patient
Title: "PDQm Patient Profile"
Description: """
The PDQm Patient Profile 
- when any element in FHIR Core Patient are known, and when authorized to return the element, then all elements that are core to FHIR Patient should be returned
- forbids modifier extensions - so that all uses do not need to be concerned with changes to the meaning of the core elements of the Patient resource
- adds the patient-mothersMaidenName extension as an extension available to hold the mothers maiden name
"""

* modifierExtension 0..0
* extension contains http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName named MothersMaidenName 0..1 

Profile:        QueryPatientResourceResponseMessage
Parent:         Bundle
Id:             IHE.PDQm.QueryPatientResourceResponseMessage
Title:          "PDQm Query Patient Resource Response message"
Description:    "A profile on the Query Patient Resource Response message for ITI-78"
* type = #searchset (exactly)
* total 1..
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.rules = #open
* entry.fullUrl 1..
* entry contains Patient 0..*
* entry[Patient] ^short = "Patient"
* entry[Patient].resource 1..
* entry[Patient].resource only PDQmPatient