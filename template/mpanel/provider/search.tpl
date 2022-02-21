<form id="filter_form" name="filter_form" class="form-inline" action="javascript:void(null)" onsubmit="submit_form(this)">

<div class="form-group">
				<label >{$oLanguage->GetdMessage('id')}:</label>
				<input type=text name=search[id]
					value="{$aSearch.id|escape}" maxlength=50 class="form-control btn-sm">
 </div>
 <div class="form-group">
				<label >{$oLanguage->GetMessage('login')}:</label>
				<input type=text name=search[login]
					value="{$aSearch.login|escape}" maxlength=50
					class="form-control btn-sm">
 </div>
 <div class="form-group">					
				<label >{$oLanguage->GetdMessage('name')}:</label>
				<input type=text name=search[name]
					value="{$aSearch.name|escape}" maxlength=50
					class="form-control btn-sm">
 </div>
 <div class="form-group">	
				<label >{$oLanguage->GetMessage('is_our_store')}:</label>
				<select name="search[is_our_store]" class="form-control btn-sm">
						<option value='1' {if $aSearch.is_our_store=='1'} selected {/if}
						>{$oLanguage->GetMessage('Yes')}</option>
						<option value='0' {if $aSearch.is_our_store=='0'} selected {/if}
						>{$oLanguage->GetMessage('No')}</option>
						<option value='' {if $aSearch.is_our_store==''} selected {/if}>{$oLanguage->GetMessage('Ignore')}</option>
					</select>
				
 </div>
 <div class="form-group">				
				<label >{$oLanguage->GetMessage('visible')}:</label>
				<select name="search[visible]" class="form-control btn-sm">
						<option value='1' {if $aSearch.visible=='1'} selected {/if}
						>{$oLanguage->GetMessage('Yes')}</option>
						<option value='0' {if $aSearch.visible=='0'} selected {/if}
						>{$oLanguage->GetMessage('No')}</option>
						<option value='' {if $aSearch.visible==''} selected {/if}>{$oLanguage->GetMessage('Ignore')}</option>
					</select>
 </div>
 <div class="form-group">
				   <label >{$oLanguage->getDMessage('id_provider_group')}:</label>
				   {html_options name=search[id_provider_group] options=$aProviderGroupList selected=$aSearch.id_provider_group class="form-control btn-sm"}
 </div>
 <div class="form-group">
<input type=button class='btn btn-primary btn-sm' value="{$oLanguage->getDMessage('Clear')}"
	onclick="xajax_process_browse_url('?{$sSearchReturn|escape}')">
<input type=submit value='Search' class='btn btn-primary btn-sm'>

<input type=hidden name=action value={$sBaseAction}_search>
<input type=hidden name=return value="{$sSearchReturn|escape}">
</div>
</form>