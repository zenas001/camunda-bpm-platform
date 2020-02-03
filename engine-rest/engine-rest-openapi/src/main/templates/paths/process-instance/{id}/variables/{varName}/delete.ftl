{
  "operationId": "deleteProcessInstanceVariable",
  "description": "Deletes a variable of a process instance by id.",
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
      "description": "The id of the process instance to delete the variable from."
    },
    {
      "name": "varName",
      "in": "path",
      "required": true,
      "schema": {
        "type": "string"
      },
      "description": "The name of the variable to delete."
    }
  ],
  "responses": {
    "204": {
      "description": "Request successful."
    }
  }
}