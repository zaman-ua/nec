
<!--RD Navbar-->
<header class="section rd-navbar-wrap">
    <nav class="rd-navbar navbar-store">
        <div class="navbar-container">
            <div class="navbar-cell navbar-sidebar">
                <ul class="navbar-navigation rd-navbar-nav">
                    {foreach from=$aDropdownMenu item=aItem name=menu key=sKey}
                    <li class="navbar-navigation-root-item {if $smarty.request.action==$aItem.code || ($aItem.code=='home' && ($smarty.request.action=='' || $smarty.request.action=='home'))}active{/if}">
                        <a class="navbar-navigation-root-link" href="{if $aItem.code=='home'}/{else}/pages/{$aItem.code}{/if}" >{$aItem.name}</a>
                    </li>
                    {/foreach}
                </ul>
            </div>


            {literal}

            <div class="navbar-cell">
                <div class="navbar-panel">
                    <button class="navbar-switch int-hamburger novi-icon" data-multi-switch='{"targets":".rd-navbar","scope":".rd-navbar","isolate":"[data-multi-switch]"}'></button>
                    <div class="navbar-logo"><a class="navbar-logo-link" href="/"><img class="lazy-img navbar-logo-default" src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs%3D" data-src="/images/logo-default-114x27.svg" alt="Intense" width="114" height="27"><img class="lazy-img navbar-logo-inverse" src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs%3D" data-src="/images/logo-inverse-114x27.svg" alt="Intense" width="114" height="27"></a></div>
                </div>
            </div>
            <div class="navbar-cell">
                <div class="navbar-subpanel">

                    <div class="navbar-subpanel-item">
                        <button class="navbar-button int-cart novi-icon" data-multi-switch='{"targets":".rd-navbar","scope":".rd-navbar","class":"navbar-cart-active","isolate":"[data-multi-switch]"}'></button>
                        <div class="navbar-cart">
                            <h5 class="navbar-cart-heading">Shopping cart</h5>
                            <div class="navbar-cart-item">
                                <div class="navbar-cart-item-left"><a class="thumbnail-small" href="product-page.html"><img class="lazy-img" src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs%3D" data-src="/images/products/product-03-80x103.jpg" alt="" width="80" height="103"></a></div>
                                <div class="navbar-cart-item-body"><a class="navbar-cart-item-heading" href="product-page.html">Ombré vinyl backpack</a>
                                    <div class="navbar-cart-item-price">$29</div>
                                    <div class="navbar-cart-item-parameter">Size: S</div>
                                    <div class="navbar-cart-item-parameter">Color: Black</div>
                                    <div class="navbar-cart-item-parameter">Dimension: 80X120mm</div>
                                    <div class="navbar-cart-item-parameter">Qty:
                                        <input class="form-control navbar-cart-item-qty" type="number" value="1" name="qty" data-spinner='{"classes":{"ui-spinner":"navbar-cart-spinner"}}'>
                                    </div>
                                </div>
                                <div class="navbar-cart-item-right">
                                    <button class="navbar-cart-remove int-trash novi-icon"></button>
                                </div>
                            </div>

                            <div class="navbar-cart-line">
                                <div class="navbar-cart-line-name">Subtotal:</div>
                                <div class="navbar-cart-line-value">$63.00</div>
                            </div>
                            <div class="navbar-cart-line">
                                <div class="navbar-cart-line-name">Shipping:</div>
                                <div class="navbar-cart-line-value">Free</div>
                            </div>
                            <div class="navbar-cart-line">
                                <div class="navbar-cart-line-name">Taxes:</div>
                                <div class="navbar-cart-line-value">$0.00</div>
                            </div>
                            <div class="navbar-cart-line">
                                <div class="navbar-cart-line-name">Total:</div>
                                <div class="navbar-cart-total">$63</div>
                            </div>
                            <div class="navbar-cart-buttons">
                                <div class="navbar-cart-group"><a class="btn btn-dark btn-sm" href="list-shop-right-sidebar.html">Continue shopping</a><a class="btn btn-primary btn-sm" href="cart.html"><span class="btn-icon int-check novi-icon"></span><span>Checkout</span></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>
{/literal}