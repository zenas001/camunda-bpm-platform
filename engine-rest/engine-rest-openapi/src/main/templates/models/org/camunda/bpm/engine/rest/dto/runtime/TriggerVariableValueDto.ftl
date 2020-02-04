{
  "type": "object",
  "description": "Used in /process-instance/modification.\nCan be used with instructions of type startBeforeActivity, startAfterActivity, and startTransition. A JSON object containing variable key-value pairs. Each key is a variable name and each value a JSON variable value object.",
  "additionalProperties": {
    "properties": {
      "value": {
        "type": "string",
        "description": "The variable's value. For variables of type Object, the serialized value has to be submitted as a String value.\nFor variables of type File the value has to be submitted as Base64 encoded string."
      },
      "type": {
        "type": "string",
        "description": "The value type of the variable."
      },
      "valueInfo": {
        "description": "A JSON object containing additional, value-type-dependent properties.\nFor serialized variables of type Object, the following properties can be provided:\n\n* objectTypeName: A string representation of the object's type name.\n* serializationDataFormat: The serialization format used to store the variable.\nFor serialized variables of type File, the following properties can be provided:\n\n* filename: The name of the file. This is not the variable name but the name that will be used when downloading the file again.\n* mimetype: The MIME type of the file that is being uploaded.\n* encoding: The encoding of the file that is being uploaded.",
        "type": "object",
        "oneOf": [
          {
            "properties": {
              "objectTypeName": {
                "type": "string"
              },
              "serializationDataFormat": {
                "type": "string"
              }
            }
          },
          {
            "properties": {
              "filename": {
                "type": "string"
              },
              "mimetype": {
                "type": "string"
              },
              "encoding": {
                "type": "string"
              }
            }
          }
        ]
      },
      "local": {
        "type": "boolean",
        "description": "Indicates whether the variable should be a local variable or not. If set to true, the variable becomes a local variable of the execution entering the target activity."
      }
    }
  }
}