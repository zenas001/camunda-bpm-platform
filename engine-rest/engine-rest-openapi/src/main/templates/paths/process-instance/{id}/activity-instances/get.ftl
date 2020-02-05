{
  "operationId": "getActivityInstanceTree",
  "tags": [
    "Process instance"
  ],
  "description": "Retrieves an Activity Instance (Tree) for a given process instance by id.",
  "parameters" : [
    <@lib.parameter name="id"
        location="path"
        type="integer"
        required=true
        description="The id of the process instance for which the activity instance should be retrieved."/>
  ],
  "responses": {
    "200": {
      "description": "Request successful.",
      "content": {
        "application/json": {
          "schema": {
            "$ref" : "#/components/schemas/ActivityInstanceDto"
          }
        }
      }
    },
    "500": {
      "description": "Bad Request\nProcess instance with given id does not exist.",
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