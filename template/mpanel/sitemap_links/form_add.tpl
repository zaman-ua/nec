<FORM id='main_form' action='javascript:void(null);' onsubmit="submit_form(this)" >
<table cellspacing=0 cellpadding=2 class=add_form>
<tr>
 <th>
 {$oLanguage->getDMessage('sitemap_links')}
 </th>
</tr>
<tr><td>

<table cellspacing=2 cellpadding=1>
<tr>
   <td width=50%>{$oLanguage->getDMessage('url')}:{$sZir}</td>
   <td><input type=text name=data[url] value="{$aData.url|escape}"></td>
</tr>
{include file='addon/mpanel/form_visible.tpl' aData=$aData}
</table>

</td></tr>
</table>

<input type=hidden name=data[id] value="{$aData.id|escape}">
{include file='addon/mpanel/base_add_button.tpl' sBaseAction=$sBaseAction}

</FORM>