{
  "operationId" : "queryProcessInstances",
  "description": "Queries for process instances that fulfill given parameters through a JSON object. This method is slightly more powerful than the Get Instances method because it allows filtering by multiple process variables of types String, Number or Boolean.",
  "tags": [
    "Process instance"
  ],
  "parameters" : [
    <@lib.parameter name="firstResult"
        location="query"
        type="integer"
        description="Pagination of results. Specifies the index of the first result to return."/>,
    <@lib.parameter name="maxResults"
        location="query"
        type="integer"
        description="Pagination of results. Specifies the maximum number of results to return. Will return less results if there are no more results left."/>

   <#-- {
      "name": "firstResult",
      "in": "query",
      "schema": {
        "type": "integer"
      },
      "description": "Pagination of results. Specifies the index of the first result to return."
    },
    {
      "name": "maxResults",
      "in": "query",
      "schema": {
        "type": "integer"
      },
      "description": "Pagination of results. Specifies the maximum number of results to return. Will return less results if there are no more results left."
    }-->
   ],
  "requestBody" : {
    "content" : {
      "application/json" : {
        "schema" : {
          "$ref" : "#/components/schemas/ProcessInstanceQueryDto"
        }
      }
    }
  },
  "responses" : {
    <@lib.response responseCode="200" refDto="ProcessInstanceDto" desc="Request successful." array=true/>,
    <@lib.response responseCode="400" refDto="ExceptionDto"
                   desc="Bad Request\n*Returned if some of the query parameters are invalid, for example if a sortOrder parameter is supplied, but no sortBy, or if an invalid operator for variable comparison is used."/>

    <#-- "200" : {
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
     -->
  }
}