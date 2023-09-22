Instance: ex-auditPdqmMatch-consumer
InstanceOf: IHE.PDQm.Match.Audit.Consumer
Title: "Audit Example of ITI-119 at Consumer"
Description: """
Audit Event for PDQm Query Transaction by the Patient Identifier Cross-reference Consumer

Where the $match operation was executed with the [example request parameters Bundle](Parameters-ex-match-input.html).

"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* subtype[anySearch] = http://hl7.org/fhir/restful-interaction#search "search"
* recorded = 2023-09-20T19:17:32Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "fancy mobile app"
* source.observer = Reference(Device/ex-device)
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#1 "User Device"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].who = Reference(Device/ex-device)
* agent[client].requestor = false
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
// not clear how a server uses the IUA Oauth token here
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].who.display = "http://server.example.com/fhir"
* agent[server].requestor = false
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].query = "ew0KICAicmVzb3VyY2VUeXBlIiA6ICJQYXJhbWV0ZXJzIiwNCiAgImlkIiA6ICJleC1tYXRjaC1pbnB1dCIsDQogICJtZXRhIiA6IHsNCiAgICAicHJvZmlsZSIgOiBbDQogICAgICAiaHR0cHM6Ly9wcm9maWxlcy5paGUubmV0L0lUSS9QRFFtL1N0cnVjdHVyZURlZmluaXRpb24vSUhFLlBEUW0uTWF0Y2hQYXJhbWV0ZXJzSW4iDQogICAgXSwNCiAgICAic2VjdXJpdHkiIDogWw0KICAgICAgew0KICAgICAgICAic3lzdGVtIiA6ICJodHRwOi8vdGVybWlub2xvZ3kuaGw3Lm9yZy9Db2RlU3lzdGVtL3YzLUFjdFJlYXNvbiIsDQogICAgICAgICJjb2RlIiA6ICJIVEVTVCINCiAgICAgIH0NCiAgICBdDQogIH0sDQogICJwYXJhbWV0ZXIiIDogWw0KICAgIHsNCiAgICAgICJuYW1lIiA6ICJyZXNvdXJjZSIsDQogICAgICAicmVzb3VyY2UiIDogew0KICAgICAgICAicmVzb3VyY2VUeXBlIiA6ICJQYXRpZW50IiwNCiAgICAgICAgImlkIiA6ICJleC1tYXRjaC1pbnB1dC1wYXRpZW50IiwNCiAgICAgICAgIm1ldGEiIDogew0KICAgICAgICAgICJwcm9maWxlIiA6IFsNCiAgICAgICAgICAgICJodHRwczovL3Byb2ZpbGVzLmloZS5uZXQvSVRJL1BEUW0vU3RydWN0dXJlRGVmaW5pdGlvbi9JSEUuUERRbS5NYXRjaElucHV0Ig0KICAgICAgICAgIF0sDQogICAgICAgICAgInNlY3VyaXR5IiA6IFsNCiAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAgInN5c3RlbSIgOiAiaHR0cDovL3Rlcm1pbm9sb2d5LmhsNy5vcmcvQ29kZVN5c3RlbS92My1BY3RSZWFzb24iLA0KICAgICAgICAgICAgICAiY29kZSIgOiAiSFRFU1QiDQogICAgICAgICAgICB9DQogICAgICAgICAgXQ0KICAgICAgICB9LA0KICAgICAgICAidGV4dCIgOiB7DQogICAgICAgICAgInN0YXR1cyIgOiAiZW1wdHkiLA0KICAgICAgICAgICJkaXYiIDogIjxkaXYgeG1sbnM9XCJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hodG1sXCI+VGhpcyBQYXRpZW50IFJlc291cmNlIGNvbnRhaW5zIGEgc2V0IG9mIGRpc2NyZXRlIGRlbW9ncmFwaGljcyB0byBzZXJ2ZSBhcyBpbnB1dCB0byB0aGUgJG1hdGNoIG9wZXJhdGlvbi48L2Rpdj4iDQogICAgICAgIH0sDQogICAgICAgICJpZGVudGlmaWVyIiA6IFsNCiAgICAgICAgICB7DQogICAgICAgICAgICAic3lzdGVtIiA6ICJodHRwOi8vZXhhbXBsZS5vcmcvZXhhbXBsZVN5c3RlbSIsDQogICAgICAgICAgICAidmFsdWUiIDogIjg2NzUzMTAiDQogICAgICAgICAgfQ0KICAgICAgICBdLA0KICAgICAgICAibmFtZSIgOiBbDQogICAgICAgICAgew0KICAgICAgICAgICAgImZhbWlseSIgOiAiU2NobWlkdCIsDQogICAgICAgICAgICAiZ2l2ZW4iIDogWw0KICAgICAgICAgICAgICAiSm9obiINCiAgICAgICAgICAgIF0NCiAgICAgICAgICB9DQogICAgICAgIF0sDQogICAgICAgICJnZW5kZXIiIDogIm90aGVyIiwNCiAgICAgICAgImJpcnRoRGF0ZSIgOiAiMTkyMy0wNy0yNSIsDQogICAgICAgICJhZGRyZXNzIiA6IFsNCiAgICAgICAgICB7DQogICAgICAgICAgICAic3RhdGUiIDogIldJIiwNCiAgICAgICAgICAgICJjb3VudHJ5IiA6ICJVU0EiDQogICAgICAgICAgfQ0KICAgICAgICBdDQogICAgICB9DQogICAgfQ0KICBdDQp9"

Instance: ex-auditPdqmMatch-supplier
InstanceOf: IHE.PDQm.Match.Audit.Supplier
Title: "Audit Example of ITI-119 at Supplier"
Description: """
Audit Event for PDQm Match Transaction by the Patient Identifier Cross-reference Supplier

Where the $match operation was executed with the [example request parameters Bundle](Parameters-ex-match-input.html).

Note the Supplier may choose to record patient identities found, but is not required to.

Given the Supplier chooses to record a patient in the AuditEvent 
When the search finds multiple Patients, 
Then the Supplier would create an AuditEvent for each of those Patients. 

This example shows where ex-patient is returned. This single result does not affect the response returned on the ITI-119 that would include all results.
"""
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* action = #E
* subtype[anySearch] = http://hl7.org/fhir/restful-interaction#search "search"
//* severity = #Informational
* recorded = 2023-09-21T19:17:32Z
* outcome = http://terminology.hl7.org/CodeSystem/audit-event-outcome#0 "Success"
* source.site = "HIE PDQm api example"
* source.observer.display = "http://server.example.com/fhir"
* source.type = http://terminology.hl7.org/CodeSystem/security-source-type#4 "Application Server"
* agent[client].type = DCM#110153 "Source Role ID"
* agent[client].who = Reference(Device/ex-device)
* agent[client].requestor = false
* agent[client].network.address = "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
* agent[client].network.type = http://hl7.org/fhir/network-type#2 "IP Address"
// not clear how a server uses the IUA Oauth token here
* agent[server].type = DCM#110152 "Destination Role ID"
* agent[server].who.display = "http://server.example.com/fhir"
* agent[server].requestor = false
* agent[server].network.address = "http://server.example.com/fhir"
* agent[server].network.type = http://hl7.org/fhir/network-type#5 "URI"
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what = Reference(Patient/ex-patient)
* entity[query].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[query].role = http://terminology.hl7.org/CodeSystem/object-role#24 "Query"
* entity[query].query = "ew0KICAicmVzb3VyY2VUeXBlIiA6ICJQYXJhbWV0ZXJzIiwNCiAgImlkIiA6ICJleC1tYXRjaC1pbnB1dCIsDQogICJtZXRhIiA6IHsNCiAgICAicHJvZmlsZSIgOiBbDQogICAgICAiaHR0cHM6Ly9wcm9maWxlcy5paGUubmV0L0lUSS9QRFFtL1N0cnVjdHVyZURlZmluaXRpb24vSUhFLlBEUW0uTWF0Y2hQYXJhbWV0ZXJzSW4iDQogICAgXSwNCiAgICAic2VjdXJpdHkiIDogWw0KICAgICAgew0KICAgICAgICAic3lzdGVtIiA6ICJodHRwOi8vdGVybWlub2xvZ3kuaGw3Lm9yZy9Db2RlU3lzdGVtL3YzLUFjdFJlYXNvbiIsDQogICAgICAgICJjb2RlIiA6ICJIVEVTVCINCiAgICAgIH0NCiAgICBdDQogIH0sDQogICJwYXJhbWV0ZXIiIDogWw0KICAgIHsNCiAgICAgICJuYW1lIiA6ICJyZXNvdXJjZSIsDQogICAgICAicmVzb3VyY2UiIDogew0KICAgICAgICAicmVzb3VyY2VUeXBlIiA6ICJQYXRpZW50IiwNCiAgICAgICAgImlkIiA6ICJleC1tYXRjaC1pbnB1dC1wYXRpZW50IiwNCiAgICAgICAgIm1ldGEiIDogew0KICAgICAgICAgICJwcm9maWxlIiA6IFsNCiAgICAgICAgICAgICJodHRwczovL3Byb2ZpbGVzLmloZS5uZXQvSVRJL1BEUW0vU3RydWN0dXJlRGVmaW5pdGlvbi9JSEUuUERRbS5NYXRjaElucHV0Ig0KICAgICAgICAgIF0sDQogICAgICAgICAgInNlY3VyaXR5IiA6IFsNCiAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAgInN5c3RlbSIgOiAiaHR0cDovL3Rlcm1pbm9sb2d5LmhsNy5vcmcvQ29kZVN5c3RlbS92My1BY3RSZWFzb24iLA0KICAgICAgICAgICAgICAiY29kZSIgOiAiSFRFU1QiDQogICAgICAgICAgICB9DQogICAgICAgICAgXQ0KICAgICAgICB9LA0KICAgICAgICAidGV4dCIgOiB7DQogICAgICAgICAgInN0YXR1cyIgOiAiZW1wdHkiLA0KICAgICAgICAgICJkaXYiIDogIjxkaXYgeG1sbnM9XCJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hodG1sXCI+VGhpcyBQYXRpZW50IFJlc291cmNlIGNvbnRhaW5zIGEgc2V0IG9mIGRpc2NyZXRlIGRlbW9ncmFwaGljcyB0byBzZXJ2ZSBhcyBpbnB1dCB0byB0aGUgJG1hdGNoIG9wZXJhdGlvbi48L2Rpdj4iDQogICAgICAgIH0sDQogICAgICAgICJpZGVudGlmaWVyIiA6IFsNCiAgICAgICAgICB7DQogICAgICAgICAgICAic3lzdGVtIiA6ICJodHRwOi8vZXhhbXBsZS5vcmcvZXhhbXBsZVN5c3RlbSIsDQogICAgICAgICAgICAidmFsdWUiIDogIjg2NzUzMTAiDQogICAgICAgICAgfQ0KICAgICAgICBdLA0KICAgICAgICAibmFtZSIgOiBbDQogICAgICAgICAgew0KICAgICAgICAgICAgImZhbWlseSIgOiAiU2NobWlkdCIsDQogICAgICAgICAgICAiZ2l2ZW4iIDogWw0KICAgICAgICAgICAgICAiSm9obiINCiAgICAgICAgICAgIF0NCiAgICAgICAgICB9DQogICAgICAgIF0sDQogICAgICAgICJnZW5kZXIiIDogIm90aGVyIiwNCiAgICAgICAgImJpcnRoRGF0ZSIgOiAiMTkyMy0wNy0yNSIsDQogICAgICAgICJhZGRyZXNzIiA6IFsNCiAgICAgICAgICB7DQogICAgICAgICAgICAic3RhdGUiIDogIldJIiwNCiAgICAgICAgICAgICJjb3VudHJ5IiA6ICJVU0EiDQogICAgICAgICAgfQ0KICAgICAgICBdDQogICAgICB9DQogICAgfQ0KICBdDQp9"
