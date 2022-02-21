<FORM id='main_form' action='javascript:void(null);'
	onsubmit="submit_form(this)">



<table cellspacing=0 cellpadding=2 class=add_form>
	<tr>
		<th>{$oLanguage->getDMessage('Settings')}</th>
		<th></th>
	</tr>
	<tr><td>
	<table cellspacing=2 cellpadding=1>
		<tr>
			<td>{$oLanguage->getDMessage('id')}:</td>
			<td><input type=checkbox name=data[id] value='1' style="width:22px;" {if $aFieldSelected.id}checked{/if}></td>
		</tr>
		<tr>
			<td>{$oLanguage->getDMessage('brand')}:</td>
			<td><input type=checkbox name=data[brand] value='2' style="width:22px;" {if $aFieldSelected.brand}checked{/if}></td>
		</tr>
		<tr>
			<td>{$oLanguage->getDMessage('code')}:</td>
			<td><input type=checkbox name=data[code] value='3' style="width:22px;" {if $aFieldSelected.code}checked{/if}></td>
		</tr>
		<tr>
			<td>{$oLanguage->getDMessage('name')}:</td>
			<td><input type=checkbox name=data[name] value='4' style="width:22px;" {if $aFieldSelected.name}checked{/if}></td>
		</tr>
		<tr>
			<td>{$oLanguage->getDMessage('code_price_group')}:</td>
			<td><input type=checkbox name=data[code_price_group] value='5' style="width:22px;" {if $aFieldSelected.code_price_group}checked{/if}></td>
		</tr>
	</table>
	</td></tr>
</table>

{* <input type=hidden name=data[id] value="{$aData.id|escape}"> *}
{include file='addon/mpanel/base_add_button.tpl' sBaseAction=cat_part_settings}</FORM>