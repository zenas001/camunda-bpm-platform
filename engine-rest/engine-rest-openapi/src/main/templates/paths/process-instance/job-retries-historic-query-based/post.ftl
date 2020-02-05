{
  "operationId" : "setRetriesByProcessHistoricQueryBased",
  "description": "Create a batch to set retries of jobs asynchronously based on a historic process instance query.",
  "tags": [
    "Process instance"
  ],
  "requestBody" : {
    "content" : {
      "application/json" : {
        "schema" : {
          "allOf": [
            {
              "$ref": "#/components/schemas/SetJobRetriesByProcessDto"
            },
            {
              "type": "object",
              "properties": {
                "historicProcessInstanceQuery": {
                  "$ref": "#/components/schemas/HistoricProcessInstanceQueryDto"
                }
              }
            }
          ]
        }
      }
    },
   "description": "Please note that if both processInstances and processInstanceQuery are provided, then the resulting execution will be performed on the union of these sets."
  },
  "responses" : {
     "200": {
       "description": "Request successful.",
       "content": {
         "application/json": {
           "schema": {
             "$ref": "#/components/schemas/BatchDto"
           }
         }
       }
     },
     "400": {
       "description": "Returned if some of the query parameters are invalid, for example if neither processInstanceIds, nor historicProcessInstanceQuery is present. Or if the retry count is not specified. ",
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