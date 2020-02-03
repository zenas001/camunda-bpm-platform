{
  "operationId" : "getProcessInstances",
  "description": "Queries for process instances that fulfill given parameters. Parameters may be static as well as dynamic runtime properties of process instances. The size of the result set can be retrieved by using the Get Instance Count method.",
  "tags": [
    "Process instance"
  ],
  "parameters" : [ 
    <#include "/paths/process-instance/pdq.ftl">,
    <@lib.parameter name="sortBy" location="query" type="string" description="Sort the results lexicographically by a given criterion. Valid values are instanceId, definitionKey, definitionId, tenantId and businessKey. Must be used in conjunction with the sortOrder parameter."/>,
    <@lib.parameter name="sortOrder" location="query" type="string" description="Sort the results in a given order. Values may be asc for ascending order or desc for descending order. Must be used in conjunction with the sortBy parameter."/>,
    <@lib.parameter name="firstResult" location="query" type="integer" description="Pagination of results. Specifies the index of the first result to return."/>,
    <@lib.parameter name="maxResults" location="query" type="integer" description="Pagination of results. Specifies the maximum number of results to return. Will return less results if there are no more results left."/>
  ],
  "responses" : {
    "200" : {
      "description" : "Request successful.",
      "content" : {
        "application/json" : {
          "schema" : {
            "type" : "array",
            "items" : {
              "$ref" : "#/components/schemas/ProcessInstanceDto"
            }
          }
        }
      }
    },
    "400": {
      "description": "Bad Request\n*Returned if some of the query parameters are invalid, for example if a sortOrder parameter is supplied, but no sortBy, or if an invalid operator for variable comparison is used.",
      "content": {
        "application/json": {
          "schema": {
            "$ref": "#/components/schemas/ExceptionDto"
          }
        }
      }
    }
  }
}