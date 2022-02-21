<FORM id='main_form' action='javascript:void(null);'onsubmit="submit_form(this)">

<table cellspacing=0 cellpadding=2 class=add_form>
<tr>
 <th>
 {$oLanguage->getDMessage('Caorusel')}
 </th>
</tr>
<tr><td>

<table cellspacing=2 cellpadding=1>
<tr>
   <td width=50%>{$oLanguage->getDMessage('name')}:{$sZir}</td>
   <td><input type=text name=data[name] value="{$aData.name|escape}"></td>
</tr>
<tr>
   <td width=50%>{$oLanguage->getDMessage('link')}:{$sZir}</td>
   <td><input type=text name=data[link] value="{$aData.link|escape}"></td>
</tr>
<tr>
   <td width=50%>{$oLanguage->getDMessage('description')}:</td>
   <td><input type=text name=data[description] value="{$aData.description|escape}"></td>
</tr>

{include file='addon/mpanel/form_image.tpl' aData=$aData}
{include file='addon/mpanel/form_visible.tpl' aData=$aData}
</table>

</td></tr>
</table>

<input type=hidden name=data[id] value="{$aData.id|escape}">

{include file='addon/mpanel/base_add_button.tpl' sBaseAction=$sBaseAction}

</FORM>