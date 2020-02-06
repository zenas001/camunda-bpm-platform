<#macro parameter name location type typeDefault=false typeDefaultValue=false required=false description="TODO" last=false>
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

  <#if !last> , </#if> <#-- if not a last parameter add a comma-->
</#macro>

<#macro property name type required=false description="TODO" itemType="string" last=false>
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

    <#if !last> , </#if> <#-- if not a last property add a comma-->
</#macro>

<#macro response code dto desc array=false last=false>
    "${code}": {
       "description": "${desc}",
       "content": {
         "application/json": {
           "schema": {

             <#if array>
               "type" : "array",
               "items" : {
             </#if>

             "$ref": "#/components/schemas/${dto}"

             <#if array>
               }
             </#if>

           }
         }
       }
     }

    <#if !last> , </#if> <#-- if not a last response add a comma-->
</#macro>