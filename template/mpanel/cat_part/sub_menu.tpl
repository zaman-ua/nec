<a class=submenu href="?action={$sBaseAction}_export&amp;not_null=1&amp;return={$sReturn|escape:"url"}"  onclick="xajax_process_browse_url(this.href); return false;">
	<img border=0 src="/libp/mpanel/images/small/outbox.png"
	hspace=3 align=absmiddle>{$oLanguage->getDMessage('Export > 0')}</a>
<a class=submenu href="?action={$sBaseAction}_export&amp;return={$sReturn|escape:"url"}"  onclick="xajax_process_browse_url(this.href); return false;">
	<img border=0 src="/libp/mpanel/images/small/outbox.png"
	hspace=3 align=absmiddle>{$oLanguage->getDMessage('Export')}</a>
<a href="?action={$sBaseAction}_import&amp;return={$sReturn|escape:"url"}"
	onclick="xajax_process_browse_url(this.href); return false;" class="submenu">
	<img hspace="3" border="0" align="absmiddle" src="/libp/mpanel/images/small/inbox.png"/
	>{$oLanguage->GetDMessage('Import')}</a>
<a href="?action={$sBaseAction}_settings&amp;return={$sReturn|escape:"url"}"
	onclick="xajax_process_browse_url(this.href); return false;" class="submenu">
	<img hspace="3" border="0" align="absmiddle" src="/libp/mpanel/images/small/gear.png"/
	>{$oLanguage->GetDMessage('Settings')}</a>

{include file='addon/mpanel/base_sub_menu.tpl' sBaseAction=$sBaseAction not_archive=1}