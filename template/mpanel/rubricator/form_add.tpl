{literal}
<style>
.select2-selection {
    min-height: 200px !important;
}
</style>
{/literal}

<FORM id='main_form' action='javascript:void(null);' onsubmit="submit_form(this)">

<table cellspacing=0 cellpadding=2 class=add_form>
	<tr>
		<th>{$oLanguage->getDMessage('Rubricator')}</th>
	</tr>
	<tr>
		<td>

		<table cellspacing=2 cellpadding=1>
			<tr>
				<td width=50%>{$oLanguage->getDMessage('Name')}:{$sZir}</td>
				   <td><input type=text name=data[name] value="{$aData.name|escape}" style="width:800px"></td>
			</tr>
			<tr>
			   <td width=50%>{$oLanguage->getDMessage('Id Tree')}:</td>
			   <td>{html_options name=data[id_tree][] options=$aBaseTree selected=$aBaseTreeSelect multiple="multiple" size="25" id='select_tree' style='width: 100%;height:450px'}</td>
			</tr>
			<tr>
			   <td width=50%>{$oLanguage->getDMessage('Id group')}:</td>
			   <td id="id_group_list">{include file='mpanel/rubricator/change_group.tpl'}</td>
			</tr>
			<tr>
			   <td width=50%>{$oLanguage->getDMessage('ID Parent')}:</td>
			   <td>{html_options name=data[id_parent] options=$aBaseLevelGroups selected=$sBaseLevelGroups}</td>
			</tr>
			<tr>
			   <td width=50%>{$oLanguage->getDMessage('Level')}:</td>
			   <td>{html_options name=data[level] options=$aBaseLevels selected=$sBaseLevels}</td>
			</tr>
			<tr>
				<td width=50%>{$oLanguage->getDMessage('Url')}:{$sZir}</td>
				<td><input type=text name=data[url] value="{$aData.url|escape}" style="width:800px"></td>
			</tr>
			{include file='addon/mpanel/form_image.tpl' aData=$aData}
			{include file='addon/mpanel/form_visible.tpl' aData=$aData}
			<tr>
				<td width=50%>{$oLanguage->getDMessage('is_mainpage')}:</td>
				<td>{include file='addon/mpanel/form_checkbox.tpl' sFieldName='is_mainpage' bChecked=$aData.is_mainpage}</td>
			</tr>
			<tr>
				<td width=50%>{$oLanguage->getDMessage('is_menu_visible')}:</td>
				<td>{include file='addon/mpanel/form_checkbox.tpl' sFieldName='is_menu_visible' bChecked=$aData.is_menu_visible}</td>
			</tr>
			<tr>
				<td width=50%>{$oLanguage->getDMessage('sort')}:</td>
				<td><input type=text name=data[sort] value="{$aData.sort|escape}" style="width:800px"></td>
			</tr>
			<tr>
				<td width=50%>{$oLanguage->getDMessage('id_price_group')}:</td>
				<td>{html_options name=data[id_price_group] options=$aPriceGroups selected=$aData.id_price_group}</td>
			</tr>
		</table>

		</td>
	</tr>
</table>

<input type=hidden name=data[id] value="{$aData.id|escape}">
{include file='addon/mpanel/base_add_button.tpl' sBaseAction=$sBaseAction}