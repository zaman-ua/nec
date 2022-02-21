<!-- CATALOG -->

	<div class="container catalog_element">
		<div class="col-md-12 header_container header_catalog">
		<h4>{$aPriceGroup.name}</h4>
		</div>
		
		{assign var="iTr" value="0"}
		{section name=d loop=$aItem}
		{assign var=aRow value=$aItem[d]}
		{assign var=iTr value=$iTr+1}
		{include file=$sDataTemplate}
		{/section}

		{if !$aItem}
		<p style="padding-top: 80px;">
		{if $sNoItem}
			{$oLanguage->getMessage($sNoItem)}
		{else}
			{$oLanguage->getMessage("No items found")}
		{/if}
		</p>
		{/if}
	</div>
