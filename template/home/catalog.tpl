<!-- CATALOG -->
<section class="text-center catalog_sofa">
    {foreach from=$aMainGroups item=aValue}
	<div class="container catalog_element">
		<div class="row">
			<div class="col-sm-12 col-md-12 header_container">
				<h4>{$aValue.name}</h4>
			</div>
			
			{if $aValue.childs}
			{foreach from=$aValue.childs item=aValueChild}
			<a href="/product/{$aValue.code_name}/{$aValueChild.id}">
				<div class="col-sm-4 col-md-4 catalog_list">
					<h3>{$aValueChild.name}</h3>
					<img src="{$aValueChild.images.0.image}" class="img-responsive">
				</div>
			</a>
			{/foreach}
			{else}
			<p>В этой категории нет товаров</p>
			{/if}
			
			<a href="/catalog/{$aValue.code_name}">
				<div class="col-sm-12 col-md-12 catalog_button">
					<h3>ВСЕ МОДЕЛИ</h3>
				</div>
			</a>
		</div>
	</div>
    {/foreach}
</section>