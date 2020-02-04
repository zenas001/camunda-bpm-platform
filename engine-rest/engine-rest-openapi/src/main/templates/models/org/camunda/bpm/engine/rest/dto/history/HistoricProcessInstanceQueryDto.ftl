{
  "type" : "object",
  "properties" : {
    "sortBy" : {
      "type" : "string",
      "writeOnly" : true
    },
    "sortOrder" : {
      "type" : "string",
      "writeOnly" : true
    },
    "processInstanceId" : {
      "type" : "string",
      "writeOnly" : true
    },
    "processInstanceIds" : {
      "uniqueItems" : true,
      "type" : "array",
      "writeOnly" : true,
      "items" : {
        "type" : "string"
      }
    },
    "processDefinitionId" : {
      "type" : "string"
    },
    "processDefinitionKey" : {
      "type" : "string",
      "writeOnly" : true
    },
    "processDefinitionName" : {
      "type" : "string",
      "writeOnly" : true
    },
    "processDefinitionNameLike" : {
      "type" : "string",
      "writeOnly" : true
    },
    "processDefinitionKeyNotIn" : {
      "type" : "array",
      "writeOnly" : true,
      "items" : {
        "type" : "string"
      }
    },
    "processInstanceBusinessKey" : {
      "type" : "string",
      "writeOnly" : true
    },
    "processInstanceBusinessKeyLike" : {
      "type" : "string",
      "writeOnly" : true
    },
    "rootProcessInstances" : {
      "type" : "boolean",
      "writeOnly" : true
    },
    "finished" : {
      "type" : "boolean",
      "writeOnly" : true
    },
    "unfinished" : {
      "type" : "boolean",
      "writeOnly" : true
    },
    "withIncidents" : {
      "type" : "boolean",
      "writeOnly" : true
    },
    "withRootIncidents" : {
      "type" : "boolean",
      "writeOnly" : true
    },
    "incidentType" : {
      "type" : "string"
    },
    "incidentStatus" : {
      "type" : "string",
      "writeOnly" : true
    },
    "incidentMessage" : {
      "type" : "string",
      "writeOnly" : true
    },
    "incidentMessageLike" : {
      "type" : "string",
      "writeOnly" : true
    },
    "startedBefore" : {
      "type" : "string",
      "format" : "date-time",
      "writeOnly" : true
    },
    "startedAfter" : {
      "type" : "string",
      "format" : "date-time",
      "writeOnly" : true
    },
    "finishedBefore" : {
      "type" : "string",
      "format" : "date-time",
      "writeOnly" : true
    },
    "finishedAfter" : {
      "type" : "string",
      "format" : "date-time",
      "writeOnly" : true
    },
    "executedActivityAfter" : {
      "type" : "string",
      "format" : "date-time",
      "writeOnly" : true
    },
    "executedActivityBefore" : {
      "type" : "string",
      "format" : "date-time",
      "writeOnly" : true
    },
    "executedJobAfter" : {
      "type" : "string",
      "format" : "date-time",
      "writeOnly" : true
    },
    "executedJobBefore" : {
      "type" : "string",
      "format" : "date-time",
      "writeOnly" : true
    },
    "startedBy" : {
      "type" : "string",
      "writeOnly" : true
    },
    "superProcessInstanceId" : {
      "type" : "string",
      "writeOnly" : true
    },
    "subProcessInstanceId" : {
      "type" : "string",
      "writeOnly" : true
    },
    "superCaseInstanceId" : {
      "type" : "string",
      "writeOnly" : true
    },
    "subCaseInstanceId" : {
      "type" : "string",
      "writeOnly" : true
    },
    "caseInstanceId" : {
      "type" : "string",
      "writeOnly" : true
    },
    "withoutTenantId" : {
      "type" : "boolean",
      "writeOnly" : true
    },
    "executedActivityIdIn" : {
      "type" : "array",
      "writeOnly" : true,
      "items" : {
        "type" : "string"
      }
    },
    "activeActivityIdIn" : {
      "type" : "array",
      "writeOnly" : true,
      "items" : {
        "type" : "string"
      }
    },
    "active" : {
      "type" : "boolean",
      "writeOnly" : true
    },
    "suspended" : {
      "type" : "boolean",
      "writeOnly" : true
    },
    "completed" : {
      "type" : "boolean",
      "writeOnly" : true
    },
    "externallyTerminated" : {
      "type" : "boolean",
      "writeOnly" : true
    },
    "internallyTerminated" : {
      "type" : "boolean",
      "writeOnly" : true
    },
    "variables" : {
      "type" : "array",
      "writeOnly" : true,
      "items" : {
        "$ref" : "#/components/schemas/VariableQueryParameterDto"
      }
    },
    "variableNamesIgnoreCase" : {
      "type" : "boolean",
      "writeOnly" : true
    },
    "variableValuesIgnoreCase" : {
      "type" : "boolean",
      "writeOnly" : true
    },
    "orQueries" : {
      "type" : "array",
      "items" : {
        "$ref" : "#/components/schemas/HistoricProcessInstanceQueryDto"
      }
    },
    "tenantIdIn" : {
      "type" : "array",
      "writeOnly" : true,
      "items" : {
        "type" : "string"
      }
    },
    "processDefinitionKeyIn" : {
      "type" : "array",
      "writeOnly" : true,
      "items" : {
        "type" : "string"
      }
    },
    "sorting" : {
      "type" : "array",
      "items" : {
        "$ref" : "#/components/schemas/SortingDto"
      }
    }
  }
}