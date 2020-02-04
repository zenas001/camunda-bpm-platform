{
  "operationId": "setProcessInstanceVariableBinary",
  "description": "Sets the serialized value for a binary variable or the binary value for a file variable.",
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
      "description": "The id of the process instance to retrieve the variable for."
    },
    {
      "name": "varName",
      "in": "path",
      "required": true,
      "schema": {
        "type": "string"
      },
      "description": "The name of the variable to retrieve."
    }
  ],
  "requestBody" : {
    "description": "For binary variables a multipart form submit with the following parts:",
      "content": {
        "multipart/form-data": {
          "schema": {
            "type": "object",
            "properties": {
              "data": {
                "type": "string",
                "format": "binary",
                "description": "The binary data to be set.\n\nFor File variables, this multipart can contain the filename, binary value and MIME type of the file variable to be set. Only the filename is mandatory."
              },
              "valueType": {
                "type": "string",
                "enum": [
                  "Bytes",
                  "File"
                ],
                "description": "The name of the variable type. Either Bytes for a byte array variable or File for a file variable."
              }
              <#-- ,
              "type": {
                "type": "string",
                "deprecated": true,
                "description": "Deprecated: This only works if the REST API is aware of the involved Java classes.\nThe canonical java type name of the process variable to be set. Example: foo.bar.Customer. If this part is provided, data must be a JSON object which can be converted into an instance of the provided class. The content type of the data part must be application/json in that case (see above)."
              },
              "data": {
                "type": "string",
                "deprecated": true,
                "description": "Deprecated: This only works if the REST API is aware of the involved Java classes.\nA JSON representation of a serialized Java Object. Form part type (see below) must be provided."
              } -->
            }
          }
        }
    }
  },
  "responses": {
    "204": {
      "description": "Request successful."
    },
    "400": {
      "description": "Bad Request\nThe variable value or type is invalid, for example if no filename is set.",
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