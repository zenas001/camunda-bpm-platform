{
  "operationId" : "queryProcessInstancesCount",
  "description": "Queries for the number of process instances that fulfill the given parameters. This method takes the same message body as the Get Instances (POST) method and therefore it is slightly more powerful than the Get Instance Count method.",
  "tags": [
    "Process instance"
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
    "200" : {
      "description" : "Request successful.",
      "content" : {
        "application/json" : {
          "schema" : {
            "type" : "array",
            "items" : {
              "$ref" : "#/components/schemas/CountResultDto"
            }
          }
        }
      }
    },
    "400": {
      "description": "Bad Request\n*Returned if some of the query parameters are invalid, for example if an invalid operator for variable comparison is used.",
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