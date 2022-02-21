<div class="row">
    <div class="col">
		<select id=filter_select_id name="filter_select" id="filter_select_id" class="form-control btn btn-sm btn-default">
			{foreach key=sField item=aRow from=$oTable->aColumn}
			{if $aRow.sOrder!=''}
			<option value="{$sField}"{if $sFilter==$sField} selected{/if}>{$aRow.sTitle}</option>
			{/if}
			{/foreach}
		</select>
	</div>
    <div class="col">
      <label class="sr-only">Искомая фраза</label>
         <input type="text" id="filter_input_id" class="form-control btn-sm" placeholder="Искомая фраза" value="{$sFilterValue}" 
         	onkeyup="{literal}
         	if (event.keyCode === 13) {
         		xajax_process_browse_url(document.getElementById('find_by_filter').href
         		        +(document.getElementById('filter_input_id').value!=''?
         		        '&filter='+document.getElementById('filter_select_id').options[document.getElementById('filter_select_id').selectedIndex].value
         		        +'&filter_value='+document.getElementById('filter_input_id').value
         		        :'')
         		        );
         		return false;
        	}{/literal}"
         />

	</div>
    <div class="col">
		 <a class="btn btn-success" id='find_by_filter' href="?{$sQueryString}"
		onclick="
        xajax_process_browse_url(this.href
        +(document.getElementById('filter_input_id').value!=''?
        '&filter='+document.getElementById('filter_select_id').options[document.getElementById('filter_select_id').selectedIndex].value
        +'&filter_value='+document.getElementById('filter_input_id').value
        :'')
        );
return false;
"
><i class="fa fa-search" aria-hidden="true"></i></a>

  <a class="btn btn-danger" href="?{$sQueryString}"
onclick="xajax_process_browse_url(this.href);return false;">
  <i class="fa fa-eraser" aria-hidden="true"></i>
  </a>
   </div>
</div>