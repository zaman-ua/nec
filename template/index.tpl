{include file='header.tpl'}
<body>
{literal}
<!-- Google Tag Manager (noscript) -->

<!-- End Google Tag Manager (noscript) -->
{/literal}
{$template.sOuterJavascript}

{if $aAuthUser.type_=='manager'}
<script type="text/javascript">var xajaxRequestUri="{if $smarty.server.HTTPS=='on'}https://{else}http://{/if}{$smarty.server.SERVER_NAME}/pages/manager/"</script>
{else}
<script type="text/javascript">var xajaxRequestUri="{if $smarty.server.HTTPS=='on'}https://{else}http://{/if}{$smarty.server.SERVER_NAME}/"</script>
{/if}

{if 
$smarty.request.action!='user_login' && 
$smarty.request.action!='user' && 
$smarty.request.action!='user_login_error' && 
$smarty.request.action!='user_logout' && 
$smarty.request.action!='manager' &&
$smarty.request.action!='manager_add_product' &&
$smarty.request.action!='manager_edit_product' && 
$smarty.request.action!='manager_add_subscribe' &&
$aAuthUser.type_!='manager'
}
	<div class="page">
        {include file='nec/header.tpl'}

        {$sText}

		{include file='nec/footer.tpl'}
	</div>

	{include file='nec/preloader.tpl'}
	<div class="notifications-area" id="notifications-area"></div>
{else}
    {if $smarty.request.action!='user_login' && 
        $smarty.request.action!='user' && 
        $smarty.request.action!='user_login_error' && 
        $smarty.request.action!='user_logout' }
            {include file='manager/index.tpl'}
    {else}
        {$sText}
    {/if}
{/if}
{include file="footer.tpl"}

<!--gtm begin-->
{*include file='gtm.tpl'*}
<!--gtm end-->