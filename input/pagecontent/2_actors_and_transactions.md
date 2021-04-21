
This section defines the actors and transactions in this implementation guide.

Figure 38.1-1 shows the actors directly involved in the Patient Demographics Query for Mobile Profile and the relevant transactions between them. Note that the actors in this profile are the same as the actors defined in the PDQ Profile (ITI TF-1: 8.1).
<div>
{%insert ActorsAndTransactions.svg %}
</div>

<div style="clear: left"/>

**Figure: PQDm Actor Diagram**

Table 38.1-1: PDQm; Profile - Actors and Transactions

| Actors  | Transactions  | Initiator or Responder | Optionality     | Reference                         |
|---------|---------------|:----------------------:|:---------------:|-----------------------------------|
| Patient Demographics Consumer | Mobile Patient Demographics Query [ITI-78]  |          Initiator              | R               | ITI TF-2c: 3.78 |
| Patient Demographics Supplier | Mobile Patient Demographics Query [ITI-78] |             Responder           | R               | ITI TF-2c: 3.78 |
{:.grid}

Note 1: The transaction defined in this profile corresponds to Patient Demographics Query [ITI-21] in the PDQ Profile (ITI TF-1: 8) and provides similar functionality. Note that there is no transaction which corresponds to the Patient Demographics and Visit Query [ITI-22].

*

### Actors
The actors in this profile are described in more detail in the sections below.

#### Patient Demographics Supplier

The Document Source is the producer and publisher of documents and metadata.

##### Document Consumer

The Document Consumer queries for document metadata meeting certain criteria and may retrieve selected documents.

#### Document Recipient

The Document Recipient receives documents and metadata sent by another actor.

#### Document Responder

The Document Responder sends documents and/or metadata in response to a request from another actor.


### Actor Options

Options that may be selected for each actor in this implementation guide, are listed in Table 3.2-1 below. Dependencies
between options when applicable are specified in notes.

|         |             |
|---------|-------------|
| Actor   | Option Name |
| Actor A | [Option AB](2_actors_and_transactions.html#ab_option)  |
| Actor B | none |

#### AB Option

**TODO: describe this option and the Volume 1 requirements for this option

### Transaction Descriptions
The transactions in this profile are summarized in the sections below.

#### PQDm do transaction

This transaction is used to **do' things

For more details see the detailed [transaction description](domain-Y.html)
