{if !$aAdmin.is_base_denied}
<nobr>
<A href="?action={$sBaseAction}_edit&id={$aRow.id}&return={$sReturn|escape:"url"}" onclick="
xajax_process_browse_url(this.href); return false;">
<IMG class=action_image border=0 src="/libp/mpanel/images/small/edit.png"
	hspace=3 align=absmiddle>{$oLanguage->getDMessage('Edit')}</A>
</nobr>
<br>
{/if}
{if $not_delete!=1 && !$aAdmin.is_base_denied && ($sBaseAction!='admin' || ($sBaseAction=='admin' && $aAdmin.id != $aRow.id))}
<nobr>
<A href="?action={$sBaseAction}_delete&id={$aRow.id}&return={$sReturn|escape:"url"}" onclick="if (confirm_delete_glg())
xajax_process_browse_url(this.href);  return false;">
<IMG border=0 class=action_image src="/libp/mpanel/images/small/del.png"
		hspace=3 align=absmiddle>{$oLanguage->getDMessage('Delete')}</A>
</nobr>
<br>
{/if}