Invariant: val-audit-source
Description: "The Audit Source is this agent too."
Expression: "$this.who = %resource.source.observer"
Severity: #error


Profile:        AuditPdqmQuerySupplier
Parent:         AuditEvent
Id:             IHE.PDQm.Query.Audit.Supplier
Title:          "Audit Event for PDQm Query at Supplier"
Description:    """
Defines constraints on the AuditEvent (AuditMessage) Resource to record when a Patient Demographics Query using ITI-78 as recorded at the Supplier.
- type (EventTypeCode) = EV(`110112`, `DCM`, `Query`)
- action (EventActionCode) = `E`
- subtype (EventTypeCode) = EV(`ITI-78`, `urn:ihe:event-type-code`, `Mobile Patient Demographics Query`)
- agent (ActiveParticipant)
  - supplier as the Destination
    - this agent is the source of the auditEvent
  - consumer as the Source
  - other agents are allowed including identity of the application or infrastructure
- entity (ParticipantObjectIdentification) 
  - query parameters
  - other entity are allowed including one to identify a patient when explicitly identified in the query parameters
"""
* modifierExtension 0..0
* type = DCM#110112 "Query"
* action = #E
* subtype = urn:ihe:event-type-code#ITI-78 "Mobile Patient Demographics Query"
// * severity in R5
* recorded 1..1 // already required
* outcome 1..1
* outcomeDesc MS // encouraged
// source is already required, see invariant val-audit-source use
* agent 2..*
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent ^slicing.description = "source and recipient of the query"
* agent contains 
	supplier 1..1 and
	consumer 1..1 
	// may be many including app identity, user identity, etc
* agent[consumer].type = DCM#110153 "Source Role ID"
* agent[consumer].who 1..1
* agent[consumer].network 1..1
* agent[supplier].type = DCM#110152 "Destination Role ID"
* agent[supplier].who 1..1
* agent[supplier] obeys val-audit-source
* agent[supplier].network 1..1
* entity 1..2
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #closed
* entity ^slicing.description = "query involved, patient if found"
* entity contains
	patient 0..1 and
	queryParameters 1..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[queryParameters].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[queryParameters].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[queryParameters].query 1..1

Profile:        AuditPdqmQueryConsumer
Parent:         AuditEvent
Id:             IHE.PDQm.Query.Audit.Consumer
Title:          "Audit Event for PDQm Query at Consumer"
Description:    """
Defines constraints on the AuditEvent (AuditMessage) Resource to record when a Patient Demographics Query using ITI-78 as recorded at the Supplier.
- type (EventTypeCode) = EV(`110112`, `DCM`, `Query`)
- action (EventActionCode) = `E`
- subtype (EventTypeCode) = EV(`ITI-78`, `urn:ihe:event-type-code`, `Mobile Patient Demographics Query`)
- agent (ActiveParticipant)
  - supplier as the Destination
  - consumer as the Source
    - this agent is the source of the auditEvent
  - other agents are allowed including identity of the application or infrastructure
- entity (ParticipantObjectIdentification) 
  - query parameters
  - no patient, because the consumer does not know the patient they are looking for or they wouldn't be using this transaction.
"""
* modifierExtension 0..0
* type = DCM#110112 "Query"
* action = #E
* subtype = urn:ihe:event-type-code#ITI-78 "Mobile Patient Demographics Query"
// * severity in R5
* recorded 1..1 // already required
* outcome 1..1
* outcomeDesc MS // encouraged
// source is already required, see invariant val-audit-source use
* agent 2..*
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent ^slicing.description = "source and recipient of the query"
* agent contains 
	supplier 1..1 and
	consumer 1..1 
	// may be many including app identity, user identity, etc
* agent[consumer].type = DCM#110153 "Source Role ID"
* agent[consumer].who 1..1
* agent[consumer] obeys val-audit-source
* agent[consumer].network 1..1
* agent[supplier].type = DCM#110152 "Destination Role ID"
* agent[supplier].who 1..1
* agent[supplier].network 1..1
// No slice on the consumer side, because the consumer does not know the patient they are looking for or they wouldn't be using this transaction.
* entity 1..1
* entity.type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity.role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity.query 1..1