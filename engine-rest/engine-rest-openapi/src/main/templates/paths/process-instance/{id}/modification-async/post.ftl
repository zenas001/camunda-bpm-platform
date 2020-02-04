{
  "operationId" : "modifyProcessInstanceAsync",
  "description": "Submits a list of modification instructions to change a process instance's execution state async. A modification instruction is one of the following:\n* Starting execution before an activity\n* Starting execution after an activity on its single outgoing sequence flow\n* Starting execution on a specific sequence flow\n* Cancelling an activity instance, transition instance, or all instances (activity or transition) for an activity\nInstructions are executed asynchronous and in the order they are provided in this request's body. Variables can be provided with every starting instruction.\nThe exact semantics of modification can be read about in the user guide. (https://docs.camunda.org/manual/develop/user-guide/process-engine/process-instance-modification/).",
  "tags": [
    "Process instance"
  ],
  "parameters" : [ {
    "name" : "id",
    "in" : "path",
    "required" : true,
    "schema" : {
      "type" : "string"
    },
    "description": "The id of the process instance to modify."
  } ],
  "requestBody" : {
    "content" : {
      "application/json" : {
        "schema" : {
          "$ref" : "#/components/schemas/ProcessInstanceModificationDto"
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
       "description": "At least one modification instruction misses required parameters.",
       "content": {
         "application/json": {
           "schema": {
             "$ref": "#/components/schemas/ExceptionDto"
           }
         }
       }
     },
     "403": {
       "description": "If the user is not allowed to execute batches. See the Introduction for the error response format.",
       "content": {
         "application/json": {
           "schema": {
             "$ref": "#/components/schemas/ExceptionDto"
           }
         }
       }
     },
     "500": {
       "description": "The modification cannot be performed, for example because it starts a failing activity.",
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