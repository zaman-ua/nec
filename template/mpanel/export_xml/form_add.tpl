<FORM id='main_form' action='javascript:void(null);' onsubmit="submit_form(this,Array('data_description'))">
<table cellspacing=0 cellpadding=2 class=add_form>
<tr>
 <th>
 {$oLanguage->getDMessage('Export xml')}
 </th>
</tr>
<tr><td>

<table cellspacing=2 cellpadding=1>
<tr>
   <td width=50%>{$oLanguage->getDMessage('Code')}:{$sZir}</td>
   <td><input type=text name=data[code] value="{$aData.code|escape}"></td>
</tr>
<tr>
   <td width=50%>{$oLanguage->getDMessage('Name')}:{$sZir}</td>
   <td><input type=text name=data[name] value="{$aData.name|escape}"></td>
</tr>
<tr>
	<td width="100%">{$oLanguage->getDMessage('description')}:</td>
	<td>{$oAdmin->getFCKEditor('data_description',$aData.description, 700, 300)}</td>
</tr>
{* <tr>
	<td>{$oLanguage->getDMessage('price_link_suffix')}:</td>
	<td><input type=text name=data[price_link_suffix] value="{$aData.price_link_suffix|escape}"></td>
</tr> *}
<tr>
	<td>{$oLanguage->getDMessage('brand')}:
	<br><a href="#" onclick="for(i={$iMinBrandId};i<={$iMaxBrandId};i++) if(document.getElementById('chkb'+(i))) document.getElementById('chkb'+(i)).checked=true; return false;">{$oLanguage->getDMessage('select all')}</a>
	<br><a href="#" onclick="for(i={$iMinBrandId};i<={$iMaxBrandId};i++) if(document.getElementById('chkb'+(i))) document.getElementById('chkb'+(i)).checked=false; return false;">{$oLanguage->getDMessage('select none')}</a>
	</td>
	<td>
		<div style="height: 600px;width:100%;overflow: auto;border: 1px solid #000000;">
		<table border=0 width=100% cellpadding=0 cellspacing=0>
		{foreach from=$aBrand item=aItem}
		<tr><td style="padding:0; width:20px;"><input id="chkb{$aItem.id}" type="checkbox" name="data[id_brand][{$aItem.id}]" {if in_array($aItem.id,$aBrandId)}checked{/if}>
		</td><td nowrap><label for="chk{$aItem.id}">{$aItem.title}</td></tr>
		{/foreach}
		</table>
		</div>
	</td>
</tr>
<tr>
	<td>{$oLanguage->getDMessage('provider')}:
	<br><a href="#" onclick="for(i={$iMinProviderId};i<={$iMaxProviderId};i++) if(document.getElementById('chkp'+(i))) document.getElementById('chkp'+(i)).checked=true; return false;">{$oLanguage->getDMessage('select all')}</a>
	<br><a href="#" onclick="for(i={$iMinProviderId};i<={$iMaxProviderId};i++) if(document.getElementById('chkp'+(i))) document.getElementById('chkp'+(i)).checked=false; return false;">{$oLanguage->getDMessage('select none')}</a>
	</td>
	<td>
		<div style="height: 600px;width:100%;overflow: auto;border: 1px solid #000000;">
		<table border=0 width=100% cellpadding=0 cellspacing=0>
		{foreach from=$aProvider item=aItem}
		<tr><td style="padding:0; width:20px;"><input id="chkp{$aItem.id}" type="checkbox" name="data[id_provider][{$aItem.id}]" {if in_array($aItem.id,$aProviderId)}checked{/if}>
		</td><td nowrap><label for="chk{$aItem.id}">{$aItem.name}</td></tr>
		{/foreach}
		</table>
		</div>
	</td>
</tr>
<tr>
	<td>{$oLanguage->getDMessage('price group')}:
	<br><a href="#" onclick="for(i={$iMinPGId};i<={$iMaxPGId};i++) if(document.getElementById('chkpg'+(i))) document.getElementById('chkpg'+(i)).checked=true; return false;">{$oLanguage->getDMessage('select all')}</a>
	<br><a href="#" onclick="for(i={$iMinPGId};i<={$iMaxPGId};i++) if(document.getElementById('chkpg'+(i))) document.getElementById('chkpg'+(i)).checked=false; return false;">{$oLanguage->getDMessage('select none')}</a>
	</td>
	<td>
		<div style="height: 600px;width:100%;overflow: auto;border: 1px solid #000000;">
		<table border=0 width=100% cellpadding=0 cellspacing=0>
		{foreach from=$aPriceGroup item=aItem}
		<tr><td style="padding:0; width:20px;"><input id="chkpg{$aItem.id}" type="checkbox" name="data[id_price_group][{$aItem.id}]" {if in_array($aItem.id,$aPriceGroupId)}checked{/if}>
		</td><td nowrap><label for="chk{$aItem.id}">{$aItem.name}</td></tr>
		{/foreach}
		</table>
		</div>
	</td>
</tr>

<tr>
   <td width=50%>{$oLanguage->getDMessage('count limit')}:</td>
   <td><input type=text name=data[limit_count] value="{$aData.limit_count|escape}"></td>
</tr>
<tr>
   <td width=50%>{$oLanguage->getDMessage('filename')}:</td>
   <td><input type=text name=data[filename] value="{$aData.filename|escape}"></td>
</tr>

{include file='addon/mpanel/form_visible.tpl' aData=$aData}

</table>
</td></tr>
</table>

<input type=hidden name=data[id] value="{$aData.id|escape}">
{include file='addon/mpanel/base_add_button.tpl' sBaseAction=$sBaseAction}
</FORM>
