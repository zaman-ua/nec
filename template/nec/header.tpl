
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

                        {/literal}
                        <div class="navbar-cart" id="popup_cart">
                            {include file='nec/popup_cart.tpl'}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</header>