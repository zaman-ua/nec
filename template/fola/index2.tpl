{include file='fola/header2.tpl'}
          
{if $aCrumbs}
<section class="breadcrumbs-custom">
	<div class="container">
		<div class="breadcrumbs-custom__inner">
			<p class="breadcrumbs-custom__title">{*Contacts*}</p>
			<ul class="breadcrumbs-custom__path">
			    {foreach from=$aCrumbs item=aItem name=crumb_ar}
			    {if $aItem.link}
				<li><a href="{$aItem.link}">{$aItem.name}</a></li>
				{else}
				<li class="active">{$aItem.name}</li>
				{/if}
				{/foreach}
			</ul>
		</div>
	</div>
</section>
{/if}

{$sGoogleMap}

<section class="section-md bg-default">
	<div class="container">
		<div class="{if $smarty.request.action=='price_group'}row row-60 flex-lg-row-reverse{else}row row-50{/if}">
			{$sText}
		</div>
	</div>
</section>

{if $smarty.request.action=='catalog'}
{include file='fola/related_products.tpl'}
{/if}