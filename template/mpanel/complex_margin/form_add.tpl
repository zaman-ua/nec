<FORM id='main_form' action='javascript:void(null);' onsubmit="submit_form(this)" >
<table cellspacing=0 cellpadding=2 class=add_form>
<tr>
 <th>
 {$oLanguage->getDMessage('Complex Margin')}
 </th>
</tr>
<tr><td>

<table cellspacing=2 cellpadding=1>
<tr>
   <td width=50%>{$oLanguage->getDMessage('name')}:</td>
   <td><input type=text name=data[name] value="{$aData.name|escape}"></td>
</tr>
<tr>
   <td width=50%>{$oLanguage->getDMessage('currency')}:{$sZir}</td>
   <td>{html_options name=data[id_currency] options=$aCurrency selected=$aData.id_currency}</td>
</tr>
<tr>
   <td width=50%>{$oLanguage->getDMessage('price_before')}:</td>
   <td><input type=text name=data[price_before] value="{$aData.price_before|escape}"></td>
</tr>
<tr>
   <td width=50%>{$oLanguage->getDMessage('price_after')}:</td>
   <td><input type=text name=data[price_after] value="{$aData.price_after|escape}"></td>
</tr>
<tr>
   <td width=50%>{$oLanguage->getDMessage('margin')}:{$sZir}</td>
   <td><input type=text name=data[margin] value="{$aData.margin|escape}"></td>
</tr>
<tr>
	<td width=50%>{$oLanguage->getDMessage('Brand')}:{$sZir}</td>
	<td id="cat_col">{$sCat}</td>
</tr>
<tr>
	<td width=50%>{$oLanguage->getDMessage('Provider')}:{$sZir}</td>
	<td id="provider_col">{$sProviders}</td>
</tr>			
<tr>
	<td width=50%>{$oLanguage->getDMessage('price group')}:{$sZir}</td>
	<td id="group_col">{$sGroup}</td>
</tr>
{include file='addon/mpanel/form_visible.tpl' aData=$aData}
</table>

</td></tr>
</table>

<input type=hidden name=data[id] value="{$aData.id|escape}">
{include file='addon/mpanel/base_add_button.tpl' sBaseAction=$sBaseAction}

</FORM>