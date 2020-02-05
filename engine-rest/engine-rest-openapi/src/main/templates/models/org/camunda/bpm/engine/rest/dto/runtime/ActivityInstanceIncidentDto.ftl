{
  "type": "object",
  "description": "An activity instance, incident pair.",
  "properties": {
    <@lib.property name="id"
        type="string"
        description="The id of the incident."/>,
    <@lib.property name="parentActivityInstanceId"
        type="string"
        description="The activity id in which the incident happened."/>
  }
}
