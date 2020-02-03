{
  "operationId": "getProcessInstancesCount",
  "description": "Queries for the number of process instances that fulfill given parameters.",
  "tags": [
    "Process instance"
  ],
  "parameters": [
    <#include "/paths/process-instance/pdq.ftl">
  ],
  "responses": {
    <@lib.response responseCode="200" refDto="CountResultDto" desc="Request successful."/>,
    <@lib.response responseCode="400" refDto="ExceptionDto"
                   desc="Bad Request
Returned if some of the query parameters are invalid, for example an invalid operator for variable comparison is used."/>
  }
}