{
  "operationId" : "updateSuspensionState",
  "description": "Activates or suspends a given process instance by id.",
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
    "description": "The id of the process instance to activate or suspend."
  } ],
  "requestBody" : {
    "content" : {
      "application/json" : {
        "schema" : {
          "properties": {
            "suspended": {
              "type": "boolean",
              "description": "A Boolean value which indicates whether to activate or suspend a given process instance. When the value is set to true, the given process instance will be suspended and when the value is set to false, the given process instance will be activated."
            }
          }
        }
      }
    }
  },
  "responses" : {
     "204": {
       "description": "Request successful."
     }
   }
}