<td>{$aRow.id}</td>
<td>{$aRow.type_}</td>
<td>{$aRow.code}</td>
<td>{$aRow.priority}</td>
{if $oLanguage->GetConstant('template:show_name_field')}<td>{$aRow.name}</td>{/if}
<td>{$aRow.content|strip_tags|truncate:80:""}</td>
<td nowrap>{include file='addon/mpanel/base_lang_select.tpl'}</td>
<td nowrap>
	{include file='addon/mpanel/base_row_action.tpl' sBaseAction=$sBaseAction}
	{if $sNameDatabaseSite != 'auto' && $AdminRegulatiosEnableModule}
		{include file='addon/mpanel/sinxro_translate_action.tpl' sBaseAction=$sBaseAction}
	{/if}
</td>
