<form id="filter_form" name="filter_form" class="form-inline" action="javascript:void(null)" onsubmit="submit_form(this)">

<div class="form-group">
				<label >{$oLanguage->GetdMessage('id')}:</label>
				<input type=text name=search[id]
					value="{$aSearch.id|escape}" maxlength=50 class="form-control btn-sm">
 </div>
 <div class="form-group">
				<label >{$oLanguage->GetMessage('code')}:</label>
				<input type=text name=search[code]
					value="{$aSearch.code|escape}" maxlength=50
					class="form-control btn-sm">
 </div>
 <div class="form-group">					
				<label >{$oLanguage->GetdMessage('code_name')}:</label>
				<input type=text name=search[code_name]
					value="{$aSearch.code_name|escape}" maxlength=50
					class="form-control btn-sm">
 </div>
 <div class="form-group">					
				<label >{$oLanguage->GetMessage('Name')}:</label>
				<input type=text name=search[name]
					value="{$aSearch.name|escape}" maxlength=50
					class="form-control btn-sm">
 </div>
 <div class="form-group">					
				<label >{$oLanguage->GetdMessage('level')}:</label>
				<input type=text name=search[level]
					value="{$aSearch.level|escape}" maxlength=50
					class="form-control btn-sm">
 </div>
 <div class="form-group">					
				<label >{$oLanguage->GetdMessage('id_parent')}:</label>
				<input type=text name=search[id_parent]
					value="{$aSearch.id_parent|escape}" maxlength=50
					style='width: 90px'>
 </div>
 <div class="form-group">
					<label >{$oLanguage->GetMessage('is_product_list_visible')}:</label>
					<select name="search[is_product_list_visible]" class="form-control btn-sm">
							<option value='1' {if $aSearch.is_product_list_visible=='1'} selected {/if}
							>{$oLanguage->GetMessage('Yes')}</option>
							<option value='0' {if $aSearch.is_product_list_visible=='0'} selected {/if}
							>{$oLanguage->GetMessage('No')}</option>
							<option value='' {if $aSearch.is_product_list_visible==''} selected {/if}>{$oLanguage->GetMessage('Ignore')}</option>
						</select>
 </div>
 <div class="form-group">					
					<label >{$oLanguage->GetdMessage('is_menu')}:</label>
					<select name="search[is_menu]" class="form-control btn-sm">
							<option value='1' {if $aSearch.is_menu=='1'} selected {/if}
							>{$oLanguage->GetMessage('Yes')}</option>
							<option value='0' {if $aSearch.is_menu=='0'} selected {/if}
							>{$oLanguage->GetMessage('No')}</option>
							<option value='' {if $aSearch.is_menu==''} selected {/if}>{$oLanguage->GetMessage('Ignore')}</option>
						</select>
 </div>
 <div class="form-group">					
					<label >{$oLanguage->GetMessage('is_main')}:</label>
					<select name="search[is_main]" class="form-control btn-sm">
							<option value='1' {if $aSearch.is_main=='1'} selected {/if}
							>{$oLanguage->GetMessage('Yes')}</option>
							<option value='0' {if $aSearch.is_main=='0'} selected {/if}
							>{$oLanguage->GetMessage('No')}</option>
							<option value='' {if $aSearch.is_main==''} selected {/if}>{$oLanguage->GetMessage('Ignore')}</option>
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
					
					<label >{$oLanguage->GetDMessage('language')}:</label>
				<input type=text name=search[language]
					value="{$aSearch.language|escape}" maxlength=50
					class="form-control btn-sm">
 </div>
 <div class="form-group">

<input type=button class='btn btn-primary btn-sm' value="{$oLanguage->getDMessage('Clear')}"
	onclick="xajax_process_browse_url('?{$sSearchReturn|escape}')">
<input type=submit value='Search' class='btn btn-primary btn-sm'>

<input type=hidden name=action value={$sBaseAction}_search>
<input type=hidden name=return value="{$sSearchReturn|escape}">
</div>
</form>