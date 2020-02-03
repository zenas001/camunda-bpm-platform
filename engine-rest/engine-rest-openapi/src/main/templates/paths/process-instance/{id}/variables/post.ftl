{
  "operationId": "modifyProcessInstanceVariables",
  "description": "Updates or deletes the variables of a process instance by id. Updates precede deletions. So, if a variable is updated AND deleted, the deletion overrides the update.",
  "tags": [
    "Process instance"
  ],
  "parameters": [
    {
      "name": "id",
      "in": "path",
      "required": true,
      "schema": {
        "type": "string"
      },
      "description": "The id of the process instance to set variables for."
    }
  ],
        "requestBody" : {
          "content" : {
            "application/json" : {
              "schema" : {
                "$ref" : "#/components/schemas/PatchVariablesDto"
              }
            }
          }
        },
  "responses": {
     "204": {
       "description": "Request successful."
     },
     "400": {
       "description": "The variable value or type is invalid, for example if the value could not be parsed to an Integer value or the passed variable type is not supported.",
       "content": {
         "application/json": {
           "schema": {
             "$ref": "#/components/schemas/ExceptionDto"
           }
         }
       }
     },
    "500": {
      "description": "Bad Request\nUpdate or delete could not be executed, for example because the process instance does not exist.",
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