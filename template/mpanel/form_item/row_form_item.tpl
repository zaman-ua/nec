<td>{$aRow.id}</td>
<td>{$aRow.caption}</td>
<td>{$aRow.type}</td>
<td>{$aRow.num}</td>
<td>
{if $aRow.type == 'select' || $aRow.type == 'email_select' || $aRow.type == 'multiple_checkbox'}
	<a href="?action=form_value&id_form={$aRow.id_form}&id_item={$aRow.id}" onclick="xajax_process_browse_url(this.href); return false;">
	<img class=action_image border=0 src="/libp/mpanel/images/small/list.png" hspace=3 align=absmiddle>{$oLanguage->getDMessage('Values')}</a>
{/if}
</td>
<td nowrap>{include file='addon/mpanel/base_lang_select.tpl'}</td>
<td>
<nobr>
<A href="?action={$sBaseAction}_edit&id={$aRow.id}&id_form={$aRow.id_form}&return={$sReturn|escape:"url"}" onclick="
xajax_process_browse_url(this.href); return false;">
<IMG class=action_image border=0 src="/libp/mpanel/images/small/edit.png"  hspace=3 align=absmiddle>{$oLanguage->getDMessage('Edit')}</A>
</nobr>

<nobr>
<A href="?action={$sBaseAction}_delete&id={$aRow.id}&id_form={$aRow.id_form}&return={$sReturn|escape:"url"}" onclick="if (confirm_delete_glg())
xajax_process_browse_url(this.href);  return false;">
<IMG border=0 class=action_image src="/libp/mpanel/images/small/del.png" hspace=3 align=absmiddle>{$oLanguage->getDMessage('Delete')}</A></nobr>
</td>
