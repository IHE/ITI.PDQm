Invariant: val-audit-source
Description: "The Audit Source is this agent too."
Expression: "$this.who = %resource.source.observer"
Severity: #error


Profile:        AuditPdqmQuerySupplier
Parent:         IHE.BasicAudit.Query
Id:             IHE.PDQm.Query.Audit.Supplier
Title:          "Audit Event for PDQm Query at Supplier"
Description:    """
Defines constraints on the AuditEvent (AuditMessage) Resource when a Patient Demographics Supplier responds to a Patient Demographics Query [ITI-78](./ITI-78.html).
- Build off of the IHE BasicAudit Query event
- add the ITI-78 as a subtype
- client is Patient Demographics Consumer
- server is Patient Demographics Supplier
- entity slice for query are REQUIRED
- entity slice for transaction is available
- entity for patient SHOULD be used when one patient is explicitly identified in the query parameters
- source is the server
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti78 1..1
* subtype[iti78] = urn:ihe:event-type-code#ITI-78 "Mobile Patient Demographics Query"
* agent[server] obeys val-audit-source
* agent[client] ^short = "Patient Demographics Consumer"
* agent[server] ^short = "Patient Demographics Supplier"
* entity[query] ^short = "Search Parameters"
* entity contains patient 0..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[patient] ^short = "Patient"


Profile:        AuditPdqmQueryConsumer
Parent:         IHE.BasicAudit.Query
Id:             IHE.PDQm.Query.Audit.Consumer
Title:          "Audit Event for PDQm Query at Consumer"
Description:    """
Defines constraints on the AuditEvent (AuditMessage) Resource for a Patient Demographics Consumer to record when it performs a Patient Demographics Query [ITI-78](./ITI-78.html).
- Build off of the IHE BasicAudit Query event
- add the ITI-78 as a subtype
- client is Patient Demographics Consumer
- server is Patient Demographics Supplier
- entity slice for query are REQUIRED
- entity slice for transaction is available
- entity for patient SHOULD be used when one patient is explicitly identified in the query parameters
- source is the client
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti78 1..1
* subtype[iti78] = urn:ihe:event-type-code#ITI-78 "Mobile Patient Demographics Query"
* agent[client] obeys val-audit-source
* agent[client] ^short = "Patient Demographics Consumer"
* agent[server] ^short = "Patient Demographics Supplier"
* entity[query] ^short = "Search Parameters"
* entity contains patient 0..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[patient] ^short = "Patient"

Profile:        AuditPdqmMatchSupplier
Parent:         IHE.BasicAudit.Query
Id:             IHE.PDQm.Match.Audit.Supplier
Title:          "Audit Event for PDQm Match at Supplier"
Description:    """
Defines constraints on the AuditEvent (AuditMessage) Resource when a Patient Demographics Supplier responds to a Patient Demographics Match [ITI-119](./ITI-119.html).
- Build off of the IHE BasicAudit Query event
- add the ITI-119 as a subtype
- client is Patient Demographics Consumer
- server is Patient Demographics Supplier
- entity slice for query are REQUIRED
- entity slice for transaction is available
- entity for patient SHOULD be used when one patient is explicitly identified in the query parameters
- source is the server
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti119 1..1
* subtype[iti119] = urn:ihe:event-type-code#ITI-119 "Patient Demographics Match"
* agent[server] obeys val-audit-source
* agent[client] ^short = "Patient Demographics Consumer"
* agent[server] ^short = "Patient Demographics Supplier"
* entity[query] ^short = "Search Parameters"
* entity contains patient 0..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[patient] ^short = "Patient"

Profile:        AuditPdqmMatchConsumer
Parent:         IHE.BasicAudit.Query
Id:             IHE.PDQm.Match.Audit.Consumer
Title:          "Audit Event for PDQm Match at Consumer"
Description:    """
Defines constraints on the AuditEvent (AuditMessage) Resource for a Patient Demographics Consumer to record when it performs a Patient Demographics Match [ITI-119](./ITI-119.html).
- Build off of the IHE BasicAudit Query event
- add the ITI-119 as a subtype
- client is Patient Demographics Consumer
- server is Patient Demographics Supplier
- entity slice for query are REQUIRED
- entity slice for transaction is available
- entity for patient SHOULD be used when one patient is explicitly identified in the query parameters
- source is the client
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti119 1..1
* subtype[iti119] = urn:ihe:event-type-code#ITI-119 "Patient Demographics Match"
* agent[client] obeys val-audit-source
* agent[client] ^short = "Patient Demographics Consumer"
* agent[server] ^short = "Patient Demographics Supplier"
* entity[query] ^short = "Search Parameters"
* entity contains patient 0..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[patient] ^short = "Patient"