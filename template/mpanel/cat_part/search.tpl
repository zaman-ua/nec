<form id="filter_form" name="filter_form" action="javascript:void(null)" onsubmit="submit_form(this)">

<table cellspacing=0 cellpadding=2 class=add_form>
	<tr>
		<th>Filter</th>
	</tr>
	<tr>
		<td>

		<table cellspacing=2 cellpadding=1 width=1570>
			<tr>
			
				<td>{$oLanguage->GetdMessage('id')}:</td>
				<td><input type=text name=search[id] value="{$aSearch.id|escape}" maxlength=50 style='width: 110px'></td>
				
				<td>{$oLanguage->GetMessage('pref')}:</td>
				<td><input type=text name=search[pref] value="{$aSearch.pref|escape}" maxlength=50 style='width: 110px'></td>

				<td>{$oLanguage->GetMessage('brand')}:</td>
				<td>
					<input type=text name=search[brand] value="{$aSearch.brand|escape}" maxlength=50 style='width: 110px'>
				</td>
				
				<td>{$oLanguage->GetMessage('code')}:</td>
				<td><input type=text name=search[code] value="{$aSearch.code|escape}" maxlength=50 style='width: 110px'></td>
					
				<td>{$oLanguage->GetdMessage('name_rus')}:</td>
				<td><input type=text name=search[name_rus] value="{$aSearch.name_rus|escape}" maxlength=50 style='width: 110px'></td>

				<td>{$oLanguage->GetdMessage('name price group')}:</td>
				<td><input type=text name=search[name_price_group] value="{$aSearch.name_price_group|escape}" maxlength=50 style='width: 110px'></td>

				<td>{$oLanguage->GetdMessage('code_price_group')}:</td>
				<td>
					<input type=text name=search[code_price_group] value="{$aSearch.code_price_group|escape}" maxlength=50 style='width: 110px'>
				</td>
			</tr>
			<tr>
				<td >{$oLanguage->GetdMessage('Only with brand')}:</td>
				<td><input type=checkbox name=search[with_brand] value='1' style="width:22px;" {if $aSearch.with_brand}checked{/if}></td>
				<td >{$oLanguage->GetdMessage('Only with price group')}:</td>
				<td><input type=checkbox name=search[with_id_price_group] value='1' style="width:22px;" {if $aSearch.with_id_price_group}checked{/if}></td>
	
			</tr>
		</table>

		</td>
	</tr>
</table>

<input type=button class='bttn' value="{$oLanguage->getDMessage('Clear')}"
	onclick="xajax_process_browse_url('?{$sSearchReturn|escape}')">
<input type=submit value="{$oLanguage->getMessage('Search')}" class='bttn'>

<input type=hidden name=action value={$sBaseAction}_search>
<input type=hidden name=return value="{$sSearchReturn|escape}">

</form>