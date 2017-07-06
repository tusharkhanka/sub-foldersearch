<#assign controlId = fieldHtmlId + "-cntrl">

<style>
.yui-ac-content {
    max-height:30em;
overflow:auto !important;
overflow-x:hidden; /* set scrolling */ 

}
</style>

<div class="form-field">
      <label for="${controlId}">${field.label?html}:<#if field.endpointMandatory!false || field.mandatory!false><span class="mandatory-indicator">${msg("form.required.fields.marker")}</span></#if></label>
         <#if field.disabled == false>
             <div id="targetNodeRefAutoComplete" style="height:30px;">
              <input id="${controlId}-path" name="Path" type="text" size="128" />
              <input id="${controlId}-targetPath" name="targetPath" type="hidden" />
              <div id="${controlId}-targetPathAutoSuggestContainer" class="targetPathAutoSuggestContainer"></div>
            </div>
         </#if>
      </div>
</div>

<script type="text/javascript">//<![CDATA[
(function() {

    YAHOO.util.Event.onContentReady("${controlId}-targetPath", function() {
        var oDS = new YAHOO.util.XHRDataSource(Alfresco.constants.PROXY_URI + "contezza/advsearch-folders.json");
        oDS.responseType = YAHOO.util.XHRDataSource.TYPE_JSON;
        // This schema indicates where to find the tag name in the JSON response
        oDS.responseSchema = {
            resultsList: "data",
            fields: ["path", "qnamePath"]
        };
        
        var searchAutoComplete = new YAHOO.widget.AutoComplete("${controlId}-path", "${controlId}-targetPathAutoSuggestContainer", oDS);
        searchAutoComplete.maxCacheEntries = 100;
        searchAutoComplete.queryDelay = 0;
        searchAutoComplete.minQueryLength = 3;
        searchAutoComplete.maxResultsDisplayed = 50;
        
        function searchAutoCallback(e, args) {
            YAHOO.util.Dom.get("${controlId}-targetPath").value = args[2][1];
         }
        searchAutoComplete.itemSelectEvent.subscribe(searchAutoCallback);
        
        return {
            oDS: oDS,
            oAC: searchAutoComplete
        };
    });

})();
//]]></script>
