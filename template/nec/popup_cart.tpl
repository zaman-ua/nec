<h5 class="navbar-cart-heading">{$oLanguage->GetMessage('Shopping cart')}</h5>

{if $aAllProductsCart}
{foreach from=$aAllProductsCart item=aProductCart}
<div class="navbar-cart-item">
    <div class="navbar-cart-item-left">
        <a class="thumbnail-small" href="/">
            <img class="lazy-img" src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs%3D" data-src="{$aProductCart.image}" alt="" width="80" height="103">
        </a>
    </div>
    <div class="navbar-cart-item-body">
        <a class="navbar-cart-item-heading" href="/">{$aProductCart.name}</a>
        <div class="navbar-cart-item-price">{$oCurrency->PrintPrice($aProductCart.price)}</div>
        <div class="navbar-cart-item-parameter">{$oLanguage->GetMessage('Qty')}: {$aProductCart.number}</div>
    </div>
    <div class="navbar-cart-item-right">
        <button class="navbar-cart-remove int-trash novi-icon"
                onclick="{strip}xajax_process_browse_url('/?action=cart_delete&id={$aProductCart.id}'); return false;{/strip}"></button>
    </div>
</div>

<div class="navbar-cart-line">
    <div class="navbar-cart-line-name">{$oLanguage->GetMessage('Total')}:</div>
    <div class="navbar-cart-total">{$oCurrency->PrintPrice($aSubtotalCart.dSubtotal)}</div>
</div>
<div class="navbar-cart-buttons">
    <div class="navbar-cart-group">
        <a class="btn btn-primary btn-sm" href="/pages/cart_onepage_order">
            <span class="btn-icon int-check novi-icon"></span>
            <span>{$oLanguage->GetMessage('Checkout')}</span>
        </a>
    </div>
</div>
{/foreach}
{else}
    <h3 class="navbar-cart-heading">{$oLanguage->GetMessage('empty cart')}</h3>
{/if}