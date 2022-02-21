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
			<tr>
				<td width="100%">{$oLanguage->getDMessage('Table')}:{$sZir}</td>
				<td><input type=text id=data[table_] name=data[table_] value="{$aData.table_}"/></td>
			</tr>
			<tr>
				<td width="100%">{$oLanguage->getDMessage('Order number')}:{$sZir}</td>
				<td><input type=text id=data[number] name=data[number] value="{$aData.number}"/></td>
			</tr>
			<tr>
				<td width="100%">{$oLanguage->getDMessage('Collapsed')}:</td>
				<td>{include file='addon/mpanel/form_checkbox.tpl' sFieldName='is_collapsed' bChecked=$aData.is_collapsed}</td>
			</tr>
			
		</table>

		</td>
	</tr>
</table>

<input type=hidden name=data[id] value="{$aData.id|escape}">
{include file='addon/mpanel/base_add_button.tpl' sBaseAction=$sBaseAction}</FORM>