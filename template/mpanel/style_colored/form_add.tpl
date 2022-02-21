<FORM id='main_form' action='javascript:void(null);' onsubmit="submit_form(this)" >
<table cellspacing=0 cellpadding=2 class=add_form>
<tr>
 <th>
 {$oLanguage->getDMessage('style_colored')}
 </th>
</tr>
<tr><td>

<table cellspacing=2 cellpadding=1>
<tr>
   <td width=50%>{$oLanguage->getDMessage('name')}:{$sZir}</td>
   <td><input type=hidden name=data[name] value="{$aData.name|escape}">{$aData.name|escape}</td>
</tr>
<tr>
   <td width=50%>{$oLanguage->getDMessage('value')}:{$sZir}</td>
   <td>
    {if $aData.name=='@image1'}
        {include file='addon/mpanel/form_image.tpl' aData=$aData sFieldName=value}
    {else}
       <input type=text name=data[value] value="{$aData.value|escape}"></td>
    {/if}
</tr>
</table>

</td></tr>
</table>

<input type=hidden name=data[id] value="{$aData.id|escape}">
{include file='addon/mpanel/base_add_button.tpl' sBaseAction=$sBaseAction}

</FORM>