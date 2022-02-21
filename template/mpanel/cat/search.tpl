<form id="filter_form" name="filter_form" class="form-inline" action="javascript:void(null)" onsubmit="submit_form(this)">
<div class="form-group">
				<label >{$oLanguage->GetdMessage('id')}:</label>
				<input type=text name=search[id] class="form-control btn-sm"
					value="{$aSearch.id|escape}" maxlength=50>
</div>
<div class="form-group">
				<label >{$oLanguage->GetdMessage('name')}:</label>
				<input type=text name=search[name]
					value="{$aSearch.name|escape}" maxlength=50
					class="form-control btn-sm">
</div>
<div class="form-group">					
				<label >{$oLanguage->GetdMessage('pref')}:</label>
				<input type=text name=search[pref]
					value="{$aSearch.pref|escape}" maxlength=50
					class="form-control btn-sm">
</div>
<div class="form-group">					
				<label >{$oLanguage->GetdMessage('title')}:</label>
				<input type=text name=search[title]
					value="{$aSearch.title|escape}" maxlength=50
					class="form-control btn-sm">
</div>
<div class="form-group">					
				<label >{$oLanguage->GetMessage('id_tof')}:</label>
				<input type=text name=search[id_tof]
					value="{$aSearch.id_tof|escape}" maxlength=50
					class="form-control btn-sm">
</div>					
<div class="form-group">					
				<label >{$oLanguage->GetMessage('is_brand')}:</label>
					<select name="search[is_brand]" class="form-control btn-sm">
							<option value='1' {if $aSearch.is_brand=='1'} selected {/if}
							>{$oLanguage->GetMessage('Yes')}</option>
							<option value='0' {if $aSearch.is_brand=='0'} selected {/if}
							>{$oLanguage->GetMessage('No')}</option>
							<option value='' {if $aSearch.is_brand==''} selected {/if}>{$oLanguage->GetMessage('Ignore')}</option>
						</select>
					
</div>					
<div class="form-group">					
				<label >{$oLanguage->GetMessage('is_vin_brand')}:</label>
					<select name="search[is_vin_brand]" class="form-control btn-sm">
							<option value='1' {if $aSearch.is_vin_brand=='1'} selected {/if}
							>{$oLanguage->GetMessage('Yes')}</option>
							<option value='0' {if $aSearch.is_vin_brand=='0'} selected {/if}
							>{$oLanguage->GetMessage('No')}</option>
							<option value='' {if $aSearch.is_vin_brand==''} selected {/if}>{$oLanguage->GetMessage('Ignore')}</option>
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
<input type=button class="btn btn-danger btn-sm" value="{$oLanguage->getDMessage('Clear')}"
	onclick="xajax_process_browse_url('?{$sSearchReturn|escape}')">
<input type=submit value='Search' class="btn btn-success btn-sm">

<input type=hidden name=action value={$sBaseAction}_search>
<input type=hidden name=return value="{$sSearchReturn|escape}">
</div>
</form>