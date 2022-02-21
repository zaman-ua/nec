{capture name=add_link_href}./{strip}
	?action=cart_add_cart_item&id={$aRow.id}
{/strip}{/capture}

{if $aRow.price==0}
    {if $bProductPage}							
    <button class="button button-primary button-icon button-icon-left" type="submit" data-toggle="modal" data-target="#modalRegister2"
        onclick="$('#contact-message2').text('{$oLanguage->GetMessage('asking price message')} {$aRow.name} ID:{$aRow.id_cat_part}')">
    	<span class="icon icon-md linear-icon-telephone"></span><span>{$oLanguage->GetMessage('Asking price')}</span>
    </button>
    {else}
    <a class="button-black button button-icon button-icon-left" href="#" data-toggle="modal" data-target="#modalRegister2"
        onclick="$('#contact-message2').text('{$oLanguage->GetMessage('asking price message')} {$aRow.name} ID:{$aRow.id_cat_part}')">
        <span class="icon icon-md linear-icon-telephone"></span><span>{$oLanguage->GetMessage('Asking price')}</span>
    </a>
    {/if}
{else}
    {if $bProductPage}							
    <button class="button button-primary button-icon button-icon-left" type="submit" onclick="{strip}xajax_process_browse_url('{$smarty.capture.add_link_href}&xajax_request=1');return false;{/strip}">
    	<span class="icon icon-md linear-icon-cart"></span><span id="cart_{$aRow.id}">{$oLanguage->GetMessage('Add to cart')}</span>
    </button>
    {else}
    <a class="button-black button button-icon button-icon-left" href="#" onclick="{strip}xajax_process_browse_url('{$smarty.capture.add_link_href}&xajax_request=1');return false;{/strip}">
        <span class="icon icon-md linear-icon-cart"></span><span id="cart_{$aRow.id}">{$oLanguage->GetMessage('Add to cart')}</span>
    </a>
    {/if}
{/if}