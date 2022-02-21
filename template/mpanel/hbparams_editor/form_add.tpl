<FORM id='main_form' action='javascript:void(null);'
	onsubmit="submit_form(this)">

<table cellspacing=0 cellpadding=2 class=add_form>
	<tr>
		<th>{$oLanguage->getDMessage('Handbooks')}</th>
	</tr>
	<tr>
		<td>

		<table cellspacing=2 cellpadding=1>
			<tr>
				<td width="100%">{$oLanguage->getDMessage('Name')}:{$sZir}</td>
				<td><input type=text id=data[name] name=data[name] value="{$aData.name}"/></td>
			</tr>
			{include file='addon/mpanel/form_visible.tpl' aData=$aData}
			
		</table>

		</td>
	</tr>
</table>

<input type=hidden name=data[id] value="{$aData.id|escape}">
<input type="hidden" name="table" value="{$sSelectedTable}">
{include file='addon/mpanel/base_add_button.tpl' sBaseAction=$sBaseAction}</FORM>