{assign var="sBaseUpload" value="upload_excel"}
{include file='addon/mpanel/form_upload.tpl' sBaseUpload=$sBaseUpload sFormAction="/single/mpanel_file_upload.php?BaseUpload=$sBaseUpload"}

<FORM id='main_form' action='javascript:void(null);' onsubmit="submit_form(this)">

<table cellspacing=0 cellpadding=2 class=add_form>
	<tr>
		<th>{$oLanguage->getDMessage('Part')}</th>
	</tr>
	<tr>
		<td>

		<table cellspacing=2 cellpadding=1>

			<tr>
				<td width=50%>{$oLanguage->getDMessage('Item Code')}:</td>
				   <td><b>{$aData.item_code}</b></td>
			</tr>
			<tr>
				<td width=50%>{$oLanguage->getDMessage('Pref')}:</td>
				   <td>{html_options name=data[pref] options=$aPref selected=$aData.pref}</td>
			</tr>
			<tr>
				<td width=50%>{$oLanguage->getDMessage('Code')}:{$sZir}</td>
				   <td><input type=text name=data[code] value="{$aData.code|escape}"></td>
			</tr>
			<tr>
				<td width=50%>{$oLanguage->getDMessage('Name Rus')}:</td>
				   <td><input type=text name=data[name_rus] value="{$aData.name_rus|escape}"></td>
			</tr>
			<tr>
				<td width=50%>{$oLanguage->getDMessage('Information')}:</td>
				   <td><textarea name=data[information] rows=4>{$aData.information}</textarea></td>
			</tr>
			<tr>
				<td width="100%">{$oLanguage->getDMessage('Price group')}:</td>
				<td>{html_options name=data[id_price_group] options=$aPriceGroup selected=$iPriceGroup}</td>
			</tr>

		</table>

		</td>
	</tr>
</table>

<input type=hidden name=data[id] value="{$aData.id|escape}">
{include file='addon/mpanel/base_add_button.tpl' sBaseAction=$sBaseAction}