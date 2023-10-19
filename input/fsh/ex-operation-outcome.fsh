Instance:   ex-match-failure
InstanceOf: OperationOutcome
Title:      "Example OperationOutcome - $match Failure"
Description: "Example OperationOutcome resulting from a failure to invoke $match"
Usage: #example

* issue
  * severity = #error
  * code = #timeout
  * details.text = "The operation timed out waiting for the backend server."
  

Instance:   ex-match-warning
InstanceOf: OperationOutcome
Title:      "Example OperationOutcome - $match Warning"
Description: "Example OperationOutcome containing a warning to be returned for $match"
Usage: #example

* issue
  * severity = #warning
  * code = #incomplete
  * details.text = "The search operation timed out after reaching the limit."