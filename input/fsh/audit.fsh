Invariant: val-audit-source
Description: "The Audit Source is this agent too."
Expression: "$this.who = %resource.source.observer"
Severity: #error


Profile:        AuditProvideBundleRecipient
Parent:         AuditEvent
Id:             IHE.PDQm.DemographicsConsumer.Recipient
Title:          "Audit Event for Demographics Consumer Query at Recipient"
Description:    "Defines constraints on the AuditEvent Resource to record when a Demographics Consumer Query happens at the Recipient.
	EventTypeCode = EV(“ITI-78”, “IHE Transactions”, “Mobile Patient Demographics Query”)
	Query Parameters 
	ParticipantObjectIdTypeCode = EV(“ITI-78”, “IHE Transactions”, “Mobile Patient Demographics Query”)
	ParticipantObjectQuery = Requested URL including query parameters
	ParticipantObjectDetail = HTTP Request Headers contained in the query (e.g., Accept header)"
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
	DemographicsSource 1..1 and
	DemographicsConsumer 1..1 
	// may be many including app identity, user identity, etc
* agent[DemographicsConsumer].type = DCM#110153 "Source Role ID"
* agent[DemographicsConsumer].who 1..1
* agent[DemographicsConsumer].network 1..1
* agent[DemographicsSource].type = DCM#110152 "Destination Role ID"
* agent[DemographicsSource].who 1..1
* agent[DemographicsSource] obeys val-audit-source
* agent[DemographicsSource].network 1..1
* entity 1..* // patient records returned
* entity.type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity.role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity.query 1..1
* entity.what 1..1
* entity.what only Reference(Patient)

Profile:        AuditProvideBundleSSender
Parent:         AuditEvent
Id:             IHE.PDQm.DemographicsConsumer.Sender
Title:          "Audit Event for Demographics Consumer Query at Sender"
Description:    "Defines constraints on the AuditEvent Resource to record when a Demographics Consumer Query happens at the Sender.
	EventTypeCode = EV(“ITI-78”, “IHE Transactions”, “Mobile Patient Demographics Query”)
	Query Parameters 
	ParticipantObjectIdTypeCode = EV(“ITI-78”, “IHE Transactions”, “Mobile Patient Demographics Query”)
	ParticipantObjectQuery = Requested URL including query parameters
	ParticipantObjectDetail = HTTP Request Headers contained in the query (e.g., Accept header)"
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
	DemographicsSource 1..1 and
	DemographicsConsumer 1..1 
	// may be many including app identity, user identity, etc
* agent[DemographicsConsumer].type = DCM#110153 "Source Role ID"
* agent[DemographicsConsumer].who 1..1
* agent[DemographicsConsumer].network 1..1
* agent[DemographicsSource].type = DCM#110152 "Destination Role ID"
* agent[DemographicsSource].who 1..1
* agent[DemographicsSource] obeys val-audit-source
* agent[DemographicsSource].network 1..1
* entity 0..* // patient records returned
* entity.type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity.role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity.query 1..1
* entity.what 1..1
* entity.what only Reference(Patient)