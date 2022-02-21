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
 <th>
 {$oLanguage->getDMessage('Cat Model group')}
 </th>
</tr>
<tr><td>

<table cellspacing=2 cellpadding=1>

<tr>
   <td width=50%>{$oLanguage->getDMessage('Brand')}:{$sZir}</td>
   <td>{html_options name=data[id_make] options=$aCat selected=$sCatSelected}</td>
</tr>{*<input type="hidden" name=data[id_make] value="{$aData.id_make|escape}">*}

<tr>
   <td width=50%>{$oLanguage->getDMessage('Name')}:{$sZir}</td>
   <td><input type=text name=data[name] value="{$aData.name|escape}"></td>
</tr>

<tr>
   <td width=50%>{$oLanguage->getDMessage('code')}:{$sZir}</td>
   <td><input type=text name=data[code] value="{$aData.code|escape}"></td>
</tr>
<tr>
	<td width="100%">{$oLanguage->getDMessage('id_models')}:</td>
	<td>{html_options name=data[id_models_selected][] options=$aModels selected=$aModelsPreview multiple="multiple" size="15" id='select_model' style='width: 700px;height:350px'}
	
	
	
	{*<select name="data[id_models_selected][]" multiple="multiple" size="6">
		{foreach from=$aModels key=iKey item=sValue}
			<option value="{$iKey}" 
		  	{if $iKey==$aModelsPreview[$iKey]}
		  		selected
		  	{/if}
		  	>{$sValue}</option>
		{/foreach}
	</select>*}
  </td>
</tr>

{include file='addon/mpanel/form_visible.tpl' aData=$aData}

</table>

</td></tr>
</table>

<input type=hidden name=data[id] value="{$aData.id|escape}">

{include file='addon/mpanel/base_add_button.tpl' sBaseAction=$sBaseAction}

</FORM>