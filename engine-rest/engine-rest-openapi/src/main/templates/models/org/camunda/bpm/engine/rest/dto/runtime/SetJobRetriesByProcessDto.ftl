{
  "type" : "object",
  "properties" : {
    "processInstances" : {
      "type" : "array",
      "items" : {
        "type" : "string"
      },
      "description": "A list of process instance ids to fetch jobs, for which retries will be set."
    },
    "processInstanceQuery" : {
      "$ref" : "#/components/schemas/ProcessInstanceQueryDto"
    },
    "historicProcessInstanceQuery" : {
      "$ref" : "#/components/schemas/HistoricProcessInstanceQueryDto"
    },
    "retries" : {
      "type" : "integer",
      "format" : "int32",
      "description": "An integer representing the number of retries. Please note that the value cannot be negative or null."
    }
  }
}