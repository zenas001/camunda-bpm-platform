{
  "operationId": "setProcessInstanceVariable",
  "description": "Sets a variable of a given process instance by id.",
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
      "description": "The id of the process instance to set the variable for."
    },
    {
      "name": "varName",
      "in": "path",
      "required": true,
      "schema": {
        "type": "string"
      },
      "description": "The name of the variable to set."
    }
  ],
          "requestBody" : {
          "content" : {
            "application/json" : {
              "schema" : {
                "$ref" : "#/components/schemas/VariableValueDto"
              }
            }
          }
        },
  "responses": {
    "204": {
      "description": "Request successful."
    },
    "400": {
      "description": "Bad Request\nThe variable value or type is invalid, for example if the value could not be parsed to an Integer value or the passed variable type is not supported. ",
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