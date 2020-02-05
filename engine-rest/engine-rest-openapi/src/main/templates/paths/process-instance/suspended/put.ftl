{
  "operationId" : "updateSuspensionStateByProcessDefinition",
  "description": "Activates or suspends process instances with the given process definition.",
  "tags": [
    "Process instance"
  ],
  "requestBody" : {
    "content" : {
      "application/json" : {
        "schema" : {
          "oneOf": [
            {
              "properties": {
                "suspended": {
                  "type": "boolean",
                  "description": "A Boolean value which indicates whether to activate or suspend a given process instance. When the value is set to true, the given process instance will be suspended and when the value is set to false, the given process instance will be activated."
                },
                "processDefinitionId": {
                  "type": "string",
                  "description": "The process definition id of the process instances to activate or suspend."
                }
              }
            },
            {
              "properties": {
                "suspended": {
                  "type": "boolean",
                  "description": "A Boolean value which indicates whether to activate or suspend all process instances with the given process definition key. When the value is set to true, all process instances with the given process definition key will be suspended and when the value is set to false, all process instances with the given process definition key will be activated."
                },
                "processDefinitionKey": {
                  "type": "string",
                  "description": "The process definition key of the process instances to activate or suspend."
                },
                "processDefinitionTenantId": {
                  "type": "string",
                  "description": "Only activate or suspend process instances of a process definition which belongs to a tenant with the given id."
                },
                "processDefinitionWithoutTenantId": {
                  "type": "string",
                  "default": false,
                  "description": "Only activate or suspend process instances of a process definition which belongs to no tenant. Value may only be true, as false is the default behavior."
                }
              }
            },
            {
              "properties": {
                "suspended": {
                  "type": "boolean",
                  "description": "A Boolean value which indicates whether to activate or suspend all process instances that were defined with the other parameters. When the value is set to true, all process instances defined will be suspended and when the value is set to false, all process instances defined will be activated."
                },
                "processInstanceIds": {
                  "type": "array",
                  "items": {
                    "type": "string"
                  },
                  "description": "A list of process instance ids which defines a group of process instances which will be activated or suspended by the operation."
                },
                "processInstanceQuery": {
                  "$ref": "#/components/schemas/ProcessInstanceQueryDto"
                },
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
  "responses" : {
     "204": {
       "description": "Request successful."
     },
     "400": {
        "description": "Bad Request\nReturned if some of the request parameters are invalid, for example if the provided processDefinitionId or processDefinitionKey parameter is null.",
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