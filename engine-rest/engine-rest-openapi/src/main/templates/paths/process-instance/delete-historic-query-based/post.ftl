{
  "operationId": "deleteAsyncHistoricQueryBased",
  "description": "Deletes a set of process instances asynchronously (batch) based on a historic process instance query.",
  "tags": [
    "Process instance"
  ],
  "requestBody" : {
    "content" : {
      "application/json" : {
        "schema" : {
          "allOf": [
            {
              "$ref": "#/components/schemas/DeleteProcessInstancesDto"
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
    }
  },
  "responses": {
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
       "description": "Bad Request\n* Returned if some of the query parameters are invalid, i.e., neither processInstanceIds, nor historicProcessInstanceQuery is present",
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