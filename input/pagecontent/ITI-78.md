This section corresponds to transaction [ITI-78] of the IHE Technical Framework. Transaction [ITI-78] is used by the Client and Server Actors. The go [ITI-798] transaction is used to query and get back results.

### Scope

This transaction is used by the Patient Demographics Consumer to solicit information about patients whose demographics data match data provided in the query parameters on the request message. The request is received by the Patient Demographics Supplier. The Patient Demographics Supplier processes the request and returns a response in the form of demographics information for the matching patients.

### Actors Roles

**Table: Actor Roles**

|Actor | Role |
|---|---|
| Patient Demographics Consumer | Requests a list of patients matching the supplied set of demographics criteria (example: ID or Name) from the Patient Demographics Supplier. The Patient Demographics Consumer populates its attributes with demographic information received from the Patient Demographics Supplier. |
| Patient Demographics Supplier | Returns demographic information for all patients matching the demographics criteria provided by the Patient Demographics Consumer |
{:.grid}

### Referenced Standards

[HL7 FHIR Release 4](http://www.hl7.org/FHIR/R4)
[RFC2616	Hypertext Transfer Protocol – HTTP/1.1](https://tools.ietf.org/html/rfc2616)
[RFC7540	Hypertext Transfer Protocol – HTTP/2](https://tools.ietf.org/html/rfc7540)
[RFC3986	Uniform Resource Identifier (URI): Generic Syntax](https://tools.ietf.org/html/rfc3986)
[RFC4627	The application/json Media Type for JavaScript Object Notation (JSON)](https://tools.ietf.org/html/rfc4627)
[RFC6585	Additional HTTP Status Codes](https://tools.ietf.org/html/rfc6585)
[RFC1149  A Standard for the Transmission of IP Datagrams on Avian Carriers](https://tools.ietf.org/html/rfc1149)


### Interactions

<div>
{%include ITI-78-seq.svg%}
</div>

<div style="clear: left"/>

**Figure: Go Interactions**

### Messages
#### Query Patient Resource message
This message represents an HTTP GET parameterized query from the Patient Demographics Consumer to the Patient Demographics Supplier.
##### Trigger Events
When a Patient Demographics Consumer needs to select a patient based on demographic information about patients whose information matches a minimal set of known data, it issues a Query Patient Resource.
##### Message Semantics
The Query Patient Resource is conducted by the Patient Demographics Consumer by executing an HTTP GET against the Patient Demographics Supplier’s Patient Resource URL.
The search target follows the FHIR http specification, addressing the Patient Resource type  http://hl7.org/fhir/R4/http.html:

    GET [base]/Patient?<query>

The `<query>` represents a series of encoded name-value pairs representing the filter for the query specified below, as well as control parameters to modify the behavior of the Patient Demographics Supplier such as response format, or pagination.

##### Query Search Parameters
The Patient Demographics Consumer may supply, and the Patient Demographics Supplier shall be capable of processing, all query parameters listed below. All query parameter values shall be appropriately encoded per [RFC3986](https://tools.ietf.org/html/rfc3986) “percent” encoding rules. Note that percent encoding does restrict the character set to a subset of ASCII characters which is used for encoding all other characters used in the URL.
Patient Demographics Suppliers may choose to support additional query parameters beyond the subset listed below. Any additional query parameters supported shall be supported according to the core FHIR specification. Such additional parameters are considered out of scope for this transaction. Any additional parameters not supported should be ignored, See http://hl7.org/fhir/R4/search.html#errors.

Parameter | definitions
---|---
`_id` |This parameter of type string, when supplied, represents the resource identifier for the Patient Resource being queried. See [ITI TF-2x: Appendix Z.2.3](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_Appx-Z.pdf) for use of the string data type. Note: A search using `_id` is always an exact match search.
`active` | This parameter of type token, when supplied, specifies the active state. The active state indicates whether the patient record is active. Note: use `active=true`
`family and given` | These parameters of type string, when supplied, specify the name of the person whose information is being queried. For this parameter the Patient Demographics Consumer may use either family name, given name or a combination of both names to filter by family, given or family and given names respectively. See [ITI TF-2x: Appendix Z.2.3](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_Appx-Z.pdf) for use of the string data type.
`identifier` | This repeating parameter of type token, when supplied, specifies an identifier associated with the patient whose information is being queried (e.g., a local identifier, account identifier, etc.). See ITI TF-2x: Appendix Z.2.2 for use of the token data type. If multiple instances of this parameter are provided in the query, the query represents a logical AND condition (i.e., all of the associated identifiers must match). For example, a query searching for patients having identifier145 assigned by authority “1.2.3.4” and SSN 123456789 would be represented as:<br /> `?identifier=urn:oid:1.2.3.4\|145&identifier=urn:oid:2.16.840.1.113883.4.1\|123456789` <br />If no system portion of the identifier parameter is specified, then the matching would be performed on any identifier regardless of issuing system. The identifier specified in this parameter is expressed using the token search parameter type. Please see (ITI TF-2x: Appendix Z.2.2)[https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_Appx-Z.pdf] for use of the token data type for patient identifiers.
`telecom` | This parameter of type token, when supplied, specifies the telecommunications details
`birthdate` | This parameter of type date, when supplied, specifies the birth date of the person whose information is being queried. The Patient Demographics Consumer shall use the date and interval mechanism to indicate a specific date of birth or a date that lies within the range specified by the parameter. See http://hl7.org/fhir/R4/search.html#date
`address` | This parameter of type string, when supplied, specifies one or more address parts associated with the person whose information is being queried. For details on matching rules, see ITI TF-2x: Appendix Z.2.3.
`address-city,<br/> address-country,<br/> address-postalcode,<br/> address-state` | These parameters of type string, when supplied, specify a match against the specified address part associated with the person whose information is being queried. Note that national conventions for addresses may affect utility of these fields.
`gender` | This parameter of type token, when supplied, specifies the administrative gender of the person whose information is being queried. For this parameter item, a single administrative gender code from value set http://hl7.org/fhir/R4/valueset-administrative-gender.html shall be specified as the only value of the token. See [ITI TF-2x: Appendix Z.2.2](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_Appx-Z.pdf) for use of the token data type.
{:.grid}




#### Go Response Message


##### Trigger Events

''TODO: define the triggers''

##### Message Semantics

''TODO: define the message -- usually with a StructureDefintion''

##### Expected Actions

''TODO: define expected actions''


### CapabilityStatement Resource

Server implementing this transaction shall provide a CapabilityStatement Resource as described in ITI TF-2x: Appendix Z.3 indicating the transaction has been implemented.
* Requirements CapabilityStatement for [Client](IHE.FooBar.Client.html)
* Requirements CapabilityStatement for [Client](IHE.FooBar.Server.html)

### Security Considerations

See [MHD Security Considerations](3_security_considerations.html)

#### Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit

''TODO: the specifics''

##### Server Audit

''TODO: the specifics''
