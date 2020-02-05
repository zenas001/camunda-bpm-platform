<#macro parameter name location type typeDefault=false typeDefaultValue=false required=false description="TODO">
  {
    "name": "${name}",
    "in": "${location}",
    "schema": {
      "type": "${type}"
      <#if typeDefault>
        ,"default": ${typeDefaultValue?c} <#-- ?c to print the value-->
      </#if>
    },
    <#if required>
      "required": true,
    </#if>
    "description": "${description}"
  }
</#macro>

<#macro property name type required=false description="TODO" itemType="string">
    "${name}": {
      "type": "${type}",
      <#if required>
        "required": true,
      </#if>
      <#if type="array">
        "items": {
          ${itemType}
        },
      </#if>
      "description": "${description}"
    }
</#macro>

<#macro response responseCode refDto desc array=false>
    "${responseCode}": {
       "description": "${desc}",
       "content": {
         "application/json": {
           "schema": {
             <#if array>
               "type" : "array",
               "items" : {
             </#if>
             "$ref": "#/components/schemas/${refDto}"
             <#if array>
               }
             </#if>
           }
         }
       }
     }
</#macro>