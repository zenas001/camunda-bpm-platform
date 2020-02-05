{
  "operationId": "deleteProcessInstancesAsync",
  "description": "Deletes multiple process instances asynchronously (batch).",
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
                "processInstanceQuery": {
                  "$ref": "#/components/schemas/ProcessInstanceQueryDto"
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
       "description": "Bad Request\n* Returned if some of the query parameters are invalid, i.e., neither processInstanceIds, nor processInstanceQuery is present",
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