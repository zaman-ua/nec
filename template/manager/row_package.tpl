<td>
    <div class="order-num">{$oLanguage->GetMessage('#')}</div>
    <a href="/?action=manager_package_edit&id={$aRow.id}&return={$sReturn|escape:"url"}">{$aRow.id}</a>
    <br>
    <div class="order-num">{$oLanguage->GetMessage('date')}</div>
    {$oLanguage->getPostDateTime($aRow.post_date)}
    <br>
    <div class="order-num">{$oLanguage->GetMessage('order status')}</div>
    {$oLanguage->getOrderStatus($aRow.order_status)} {if $aRow.is_reclamation}<b>{$oLanguage->getMessage('reclamation')}</b>{/if}
    {if $aRow.is_need_check}
    <br>
    <div class="order-num">{$oLanguage->GetMessage('need check')}</div>
    	<span id="auto_{$aRow.id}" 
        	onclick="set_checked_auto(this,{if ($aRow.is_checked_auto)}'0'{else}'1'{/if})" 
        	onmouseover="$('#tip_auto_{$aRow.id}').show();" 
        	onmouseout="$('#tip_auto_{$aRow.id}').hide();">
        	{if $aRow.is_checked_auto == 0}
        		<a><img src="/image/design/not_sel_chk.png"></img></a>
        	{else}
        		<a><img src="/image/design/sel_chk.png"></img></a>
        	{/if}
        	<div align="left" style="width: 500px;" class="tip_div" id="tip_auto_{$aRow.id}">{$aRow.sAutoInfo}</div>
    	</span>
    {/if}
    <br>
    <div class="order-num">{$oLanguage->GetMessage('customer')}</div>
    {assign var="Id" value=$aRow.id_user|cat:"_"|cat:$aRow.id}
    {$oLanguage->AddOldParser('customer_uniq',$Id)}
</td>
<td>
    <div class="order-num">{$oLanguage->GetMessage('parts')}</div>
    {if $aRow.aCart}
    {foreach key=iCart item=aCart from=$aRow.aCart}
    
    <img src="{$aCart.images.0.image}" alt="" style="max-height: 100px; max-width: 100px"/>
    {if $aCart.order_status=='refused'}<strike>{/if}
    {$aCart.code} {if $aCart.code_changed}=>({$aCart.code_changed}){/if} <b>{if $aCart.cat_name_changed}{$aCart.cat_name_changed}{else}{$aCart.cat_name}{/if}
    	[ <font color="red">{$aCart.number}</font> ] 
    {if $aCart.order_status=='refused'}</strike>{/if}
    <br>
    {/foreach}
    {/if}
</td>
<td>
    <div class="order-num">{$oLanguage->GetMessage('total')}</div>
    {$oCurrency->PrintPrice($aRow.price_total)}
    <br>
    
    <div class="order-num">{$oLanguage->GetMessage('Is payed')}</div>
    {include file='addon/mpanel/yes_no.tpl' bData=$aRow.is_payed}
</td>
</tr>
<tr>
    <td colspan="8" style="border-bottom: 3px double #2f86c2; text-align: center;">
	{if $aRow.order_status=='pending' || $aRow.order_status=='new' || $aRow.order_status==''}
	<a href="/?action=manager_package_confirm&id={$aRow.id}&return={$sReturn|escape:"url"}"
	   onclick="if (!confirm('{$oLanguage->getMessage("Are you sure?")}')) return false;"
		><img src="/image/apply.png" border=0 width=16 align=absmiddle />{$oLanguage->getMessage("Send Package to Work")}</a>
	{/if}
	{if $aRow.order_status=='work'}
	<a href="/?action=manager_package_end&id={$aRow.id}&return={$sReturn|escape:"url"}"
	   onclick="if (!confirm('{$oLanguage->getMessage("Are you sure?")}')) return false;"
		><img src="/image/redo.png" border=0 width=16 align=absmiddle />{$oLanguage->getMessage("Send Package to end")}</a>
	{/if}
	{if $aRow.order_status=='pending' || $aRow.order_status=='new' || $aRow.order_status=='work'}
	<a href="/?action=manager_package_refused&id={$aRow.id}&return={$sReturn|escape:"url"}"
	   onclick="if (!confirm('{$oLanguage->getMessage("Are you sure?")}')) return false;"
		><img src="/image/delete.png" border=0 width=16 align=absmiddle />{$oLanguage->getMessage("Send Package to refused")}</a>
	{/if}
    <a href="/?action=manager_order_print&id={$aRow.id}&id_user={$aRow.id_user}" target=_blank
    	><img src="/image/fileprint.png" border=0 width=16 align=absmiddle hspace=1/>{$oLanguage->getMessage("Print")}</a>


    {if !$aRow.is_payed}
    <a {strip}href="/?action=manager_package_payed&id={$aRow.id}&return={$sReturn|escape:"url"}"
        onclick="if (!confirm('{$oLanguage->getMessage("Are you sure?")}')) return false;"
        {/strip}><img src="/image/inbox.png" border=0 width=16 align=absmiddle />{$oLanguage->getMessage("Set cart package payed")}</a>
    {/if}
    </td>