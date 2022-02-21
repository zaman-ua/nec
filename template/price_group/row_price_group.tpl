<div class="row">
	<div class="col-md-12 header_element">
	<a href="/product/{$aRow.price_group_code_name}/{$aRow.id_cat_part}"><h3>{$aRow.name_translate}</h3></a>
	</div>
	
	{if $aRow.images}
	
	{foreach from=$aRow.images item=aImgValue}
	<div class="col-sm-4 col-md-4 catalog_list list_model">
	<img src="{$aImgValue.image}" class="img-responsive">
	</div>
	{/foreach}
	{/if}
	
	<div class="col-md-12 catalog_description">
	<p>{$aRow.description}</p>
	</div>
</div>