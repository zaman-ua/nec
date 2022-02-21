<form id="filter_form" name="filter_form" class="form-inline" action="javascript:void(null)" onsubmit="submit_form(this)">

<div class="form-group">
				<label >{$oLanguage->GetMessage('login')}:</label>
				<input type=text name=search[login]
					value="{$aSearch.login|escape}" maxlength=50
					class="form-control btn-sm">

</div>
<div class="form-group">					
				<label >{$oLanguage->GetdMessage('id')}:</label>
				<input type=text name=search[id]
					value="{$aSearch.id|escape}" maxlength=50 class="form-control btn-sm">
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
				<label >{$oLanguage->GetMessage('approved')}:</label>
				<select name="search[approved]" class="form-control btn-sm">
						<option value='1' {if $aSearch.approved=='1'} selected {/if}
						>{$oLanguage->GetMessage('Yes')}</option>
						<option value='0' {if $aSearch.approved=='0'} selected {/if}
						>{$oLanguage->GetMessage('No')}</option>
						<option value='' {if $aSearch.approved==''} selected {/if}>{$oLanguage->GetMessage('Ignore')}</option>
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