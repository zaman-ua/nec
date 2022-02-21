<FORM id='main_form' action='javascript:void(null);' onsubmit="submit_form(this)">

<table cellspacing=0 cellpadding=2 class=add_form>
<tr>
 <th>
 {$oLanguage->getDMessage('Cat Model')}
 </th>
</tr>
<tr><td>

<table cellspacing=2 cellpadding=1>

<tr>
   <td width=50%>{$oLanguage->getDMessage('Brand')}:{$sZir}</td>
   <td><input type=text name=data[brand] value="{$aData.brand|escape}"></td>
</tr>

<tr>
   <td width=50%>{$oLanguage->getDMessage('Name')}:{$sZir}</td>
   <td><input type=text name=data[name] value="{$aData.name|escape}"></td>
</tr>

<tr>
   <td width=50%>{$oLanguage->getDMessage('Month Start')}:{$sZir}</td>
   <td><input type=text name=data[month_start] value="{$aData.month_start|escape}"></td>
</tr>
<tr>
   <td width=50%>{$oLanguage->getDMessage('Year start')}:</td>
   <td><input type=text name=data[year_start] value="{$aData.year_start|escape}"></td>
</tr>

<tr>
   <td width=50%>{$oLanguage->getDMessage('Month End')}:</td>
   <td><input type=text name=data[month_end] value="{$aData.month_end|escape}"></td>
</tr>

<tr>
   <td width=50%>{$oLanguage->getDMessage('Yaer end')}:</td>
   <td><input type=text name=data[year_end] value="{$aData.year_end|escape}"></td>
</tr>

<tr>
	<td width="100%">{$oLanguage->getDMessage('description')}:</td>
	<td><textarea type=text name=data[description] rows=5 >{$aData.description|escape}</textarea></td>
</tr>
{include file='addon/mpanel/form_image.tpl' aData=$aData}

<!--tr>
   <td width=50%>{$oLanguage->getDMessage('Term To')}:</td>
   <td><input type=text name=data[term_to] value="{$aData.term_to|escape}"></td>
</tr>
-->

{include file='addon/mpanel/form_visible.tpl' aData=$aData}

</table>

</td></tr>
</table>

<input type=hidden name=data[id] value="{$aData.id|escape}">
<input type=hidden name=data[id_model] value="{$aData.tof_mod_id|escape}">

{include file='addon/mpanel/base_add_button.tpl' sBaseAction=$sBaseAction}

</FORM>