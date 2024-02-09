Profile: PDQmPatient
Parent: Patient
Id: IHE.PDQm.Patient
Title: "PDQm Patient Profile"
Description: """
#### Overview

The PDQm Patient Profile establiashes the following base requirements:
- when any element in FHIR Core Patient are known, and when authorized to return the element, then all elements that are core to FHIR Patient SHOULD be returned
- forbids modifier extensions and implicit rules - so that all uses do not need to be concerned with changes to the meaning of the core elements of the Patient resource
- adds the `patient-mothersMaidenName` extension as an extension available to hold the mother's maiden name

#### Use of Business Identifiers

To facilitate working with and matching resources across specifications and servers, `Patient.identifier` is REQUIRED. Including business identifiers in `Patient.identifier` is important for
allowing the Patient resource to maintain identity outside of the context of the FHIR server on which it resides. 
This would be the case when the resource is copied to another server, saved to a file, migrated to a new FHIR server, etc.

`Patient.identifier` is typically populated with an identifier assigned by an assigning authority in the 
local patient identifier domain. Populating with identifiers issued by jurisdictional authorities, such as
the patient's national identifier, drivers license number, jurisdictional healthcare identifier, etc., is also 
typical when policy allows for those identifiers to be disclosed to the client system. 

When no existing business identifier exists, the Patient Demographics Supplier might construct one in one of the 
following ways:

**Option 1**:  Populate `Patient.identifier.value` with the full URL for the Patient resource as it would be accessed by
the client when doing a READ request. In this case, the corresponding value for `Patient.identifier.system`
SHALL be `urn:ietf:rfc:3986`.

**Option 2**:  Populate `Patient.identifier.value` with a [Universally Unique Identifier](https://en.wikipedia.org/wiki/Universally_unique_identifier),
including the `urn:uuid:` prefix. In this case, the corresponding value for `Patient.identifier.system` 
SHALL be `urn:ietf:rfc:3986`. The UUID SHOULD be persisted within the FHIR resource so that subsequent accesses 
return the same identifier, but it is not REQUIRED in environments where doing so is not possible. 

#### Handling of Patient.link
When multiple Patient Resources are used to represent the same Patient, Patient.link SHALL be used to describe
the relationship between the resources. 

When returning Patient Resources, the Patient Demographics SHALL ensure that:
* No more that one Patient Resource referencing a Patient Identity contains `active=true`
* When returning multiple Patient Resources for the same Patient, `Patient.link` SHALL be used to describe the relationship between each Patient Resource
* When one Patient Resource has become subsumed by another, the subsumed Patient SHALL use `Patient.link` to point at the surviving Patinet Resource and `Patient.link.type` SHALL be `replaced-by`.

Patient Demographics Consumers SHOULD be able to traverse Patient.link and use Patient.active to determine if a given Patient is currently active in the system.
"""

* modifierExtension 0..0
* implicitRules 0..0
* identifier 1..*
  * system 1..1 
    * ^short = "Assigning Authority ID or other identifiation namespace" 
    * ^definition = "Establishes the namespace for the value - that is, a URL that describes a set values that are unique. If the identifier is issued by an Assigning Authority, then the system SHALL be set to the Assigning Authority ID in the format \"urn:oid:[AAID]\". If the identifier value is a URI then system SHALL be set to \"urn:ietf:rfc:3986\"."
  * value 1..1
* active MS
  * ^condition = iti-pdqm-linkstatus
* name obeys iti-pdqm-patname
* name MS
* telecom MS
* birthDate MS
* address MS
* link MS
  * ^condition = iti-pdqm-linkstatus
  * type
    * ^definition = "The type of link between this patient resource and another patient resource. When this Patient Resource has been subsumed by another, the type SHALL be replaced-by."
* extension contains http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName named MothersMaidenName 0..1 
* obeys iti-pdqm-linkstatus

Invariant:   iti-pdqm-patname
Description: "Either Patient.name.given and/or Patient.name.family and/or Patient.name.text SHALL be present or a Data Absent Reason Extension SHALL be present."
Expression:  "(family.exists() or given.exists() or text.exists()) xor extension.where(url='http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"
Severity:    #error

Invariant:   iti-pdqm-linkstatus
Description: "If Patient.link is present, then Patient.active SHALL be present"
Expression:  "link.exists() implies active.exists()"
Severity:    #error
XPath:       "not(f:link) or f:active"

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