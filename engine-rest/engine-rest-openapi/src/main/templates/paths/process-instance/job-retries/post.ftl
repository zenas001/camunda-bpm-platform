{
  "operationId" : "setRetriesByProcess",
  "description": "Create a batch to set retries of jobs associated with given processes asynchronously.",
  "tags": [
    "Process instance"
  ],
  "requestBody" : {
    "content" : {
      "application/json" : {
        "schema" : {
          "$ref" : "#/components/schemas/SetJobRetriesByProcessDto"
        }
      }
    }
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
       "description": "Returned if some of the query parameters are invalid, for example if neither processInstanceIds, nor processInstanceQuery is present. Or if the retry count is not specified. ",
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