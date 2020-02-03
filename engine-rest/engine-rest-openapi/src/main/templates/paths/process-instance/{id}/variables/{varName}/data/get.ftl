{
  "operationId": "getProcessInstanceVariableBinary",
  "description": "Retrieves the content of a Process Variable by the Process Instance id and the Process Variable name. Applicable for byte array or file Process Variables.",
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
  "responses": {
    "200": {
      "description": "Request successful.\nFor binary variables or files without any MIME type information, a byte stream is returned. File variables with MIME type information are returned as the saved type. Additionally, for file variables the Content-Disposition header will be set.",
      "content": {
        "application/octet-stream": {
          "schema": {
            "description": "For binary variables or files without any MIME type information, a byte stream is returned."
          }
        },
        "text/plain": {
          "schema": {
            "description": "File variables with MIME type information are returned as the saved type. Additionally, for file variables the Content-Disposition header will be set."
          }
        }
      }
    },
    "400": {
      "description": "Bad Request\nA Process Variable with the given id exists but does not serialize as binary data.",
      "content": {
        "application/json": {
          "schema": {
            "$ref": "#/components/schemas/ExceptionDto"
          }
        }
      }
    },
    "404": {
      "description": "Not Found",
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