{
  "data" :
  [
    <#list results?sort_by("displayPath") as result>
    {
      "path"    : "${result.displayPath?replace("/Startpagina van bedrijf/Sites/","")?replace("/Company Home/Sites/","")}",
      "nodeRef" : "${result.nodeRef}",
      "qnamePath" : "${result.qnamePath}"
    }<#if result_has_next>,</#if>
    </#list>
  ]
}