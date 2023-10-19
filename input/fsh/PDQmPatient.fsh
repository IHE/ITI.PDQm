Profile: PDQmPatient
Parent: http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-patient
Id: IHE.PDQm.Patient
Title: "PDQm Patient Profile"
Description: """
The PDQm Patient Profile, based on the IPA Patient Profile
- when any element in FHIR Core Patient are known, and when authorized to return the element, then all elements that are core to FHIR Patient should be returned
- forbids modifier extensions and implicit rules - so that all uses do not need to be concerned with changes to the meaning of the core elements of the Patient resource
- adds the `patient-mothersMaidenName` extension as an extension available to hold the mother's maiden name

Following the IPA Patient Profile, `Patient.identifier` is required. Including business identifiers in `Patient.identifier` is important for
allowing the Patient resource to maintain identity outside of the context of the FHIR server on which it resides. 
This would be the case when the resource is copied to another server, saved to a file, migrated to a new FHIR server, etc.

`Patient.identifier` is typically be populated with an identifier assigned by an assigning authority in the 
local patient identifier domain. Populating with identifiers issued by jurisdictional authorities, such as
the patient's national identifier, drivers license number, jurisdictional healthcare identifier, etc., is also 
typical when policy allows for those identifiers to be disclosed to the client system. 

When no existing business identifier exists, the Patient Demographics Supplier may construct one in one of the 
following ways:

**Option 1**:  Populate `Patient.identifier.value` with the full URL for the Patient resource as it would be accessed by
the client when doing a READ request. In this case, the corresponding value for `Patient.identifier.system`
shall be `urn:ietf:rfc:3986`.

**Option 2**:  Populate `Patient.identifier.value` with a [Universally Unique Identifier](https://en.wikipedia.org/wiki/Universally_unique_identifier),
including the `urn:uuid:` prefix. In this case, the corresponding value for `Patient.identifier.system` 
shall be `urn:ietf:rfc:3986`. The UUID should be persisted within the FHIR resource so that subsequent accesses 
return the same identifier, but it is not required in environments where doing so is not possible. 
"""

* modifierExtension 0..0
* implicitRules 0..0
* extension contains http://hl7.org/fhir/StructureDefinition/patient-mothersMaidenName named MothersMaidenName 0..1 

