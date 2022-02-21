
<div class="col-lg-9 section-divided__main section-divided__main-left">
	<section class="section-sm">
		{*<div class="filter-shop-box">
			<p>Showing 1–12 of 15 results</p>
			<div class="form-wrap">
				<!--Select 2-->
				<select class="form-input select-filter"
					data-placeholder="Default sorting"
					data-minimum-results-for-search="Infinity">
					<option>Default sorting</option>
					<option value="2">Sort by popularity</option>
					<option value="3">Sort by average rating</option>
					<option value="4">Sort by newness</option>
					<option value="5">Sort by price: low to high</option>
					<option value="6">Sort by price: high to low</option>
				</select>
			</div>
		</div>*}
		
		<div class="row justify-content-sm-center row-70">
		{foreach from=$aDataForTable item=aRow}
			<div class="col-sm-12">
				<div
					class="product product-list unit flex-column flex-md-row unit-spacing-lg">
					<div class="unit__left product-img-wrap">
						<a href="/product/{$aRow.price_group_code_name}/{$aRow.id_cat_part}"><img
							src="{$aRow.images.0.image}"
							alt="" /></a>
						
						<div class="product-label-wrap">
							{if $aRow.product_label=='featured'}<span class="featured">{$oLanguage->GetMessage('product_label:Featured')}</span>{/if}
							{if $aRow.product_label=='new'}<span class="new">{$oLanguage->GetMessage('product_label:New')}</span>{/if}
							{if $aRow.product_label=='sale'}<span class="sale">{$oLanguage->GetMessage('product_label:Sale')}</span>{/if}
						</div>
					</div>
					<div class="unit__body product-caption">
						{*<ul class="product-categories">
							<li><a href="#">Living Room</a></li>
							<li><a href="#">Dining room</a></li>
							<li><a href="#">Office</a></li>
							<li><a href="#">Bedroom</a></li>
						</ul>*}
						<h5 class="product-title">
							<a href="/product/{$aRow.price_group_code_name}/{$aRow.id_cat_part}">{$aRow.name}</a>
						</h5>
						<p class="product-price">
						{if $aRow.price>0}
							От {$oCurrency->PrintPrice($aRow.price)}
							{else}&nbsp;
						{/if}
						</p>
						{*<ul class="rating-list">
							<li><span class="icon linear-icon-star icon-secondary-4"></span></li>
							<li><span class="icon linear-icon-star icon-secondary-4"></span></li>
							<li><span class="icon linear-icon-star icon-secondary-4"></span></li>
							<li><span class="icon linear-icon-star icon-secondary-4"></span></li>
							<li><span class="icon linear-icon-star icon-gray-4"></span></li>
						</ul>*}
						<p class="product-text">{$aRow.information}</p>
						{include file="catalog/link_add_cart.tpl" aRow=$aRow}
						
						{*<div class="product-icon-wrap">
							<span class="icon icon-md linear-icon-heart"
								data-toggle="tooltip" data-original-title="Add to Wishlist"></span><span
								class="icon icon-md linear-icon-balance" data-toggle="tooltip"
								data-original-title="Add to Compare"></span>
						</div>*}
					</div>
				</div>
			</div>
			{/foreach}
		</div>
	</section>
	
	{*<!-- Pagination-->
	<section class="section-sm">
		<!-- Classic Pagination-->
		<nav>
			<ul class="pagination-classic">
				<li class="active"><span>1</span></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a class="icon linear-icon-arrow-right" href="#"></a></li>
			</ul>
		</nav>
	</section>*}
</div>
<div class="col-lg-3 section-divided__aside section__aside-left">
	<!-- Categories-->
	<section class="section-sm">
		<h5>{$oLanguage->GetMessage('Categories')}</h5>
		<ul class="small list">
		{foreach from=$aGroups item=aLv1}
		{if $aLv1.childs}
			{foreach from=$aLv1.childs item=aLv2}
			<li><a href="/catalog/{$aLv2.code}">{$aLv2.name}</a></li>
			{/foreach}
		{/if}
		{/foreach}
		</ul>
	</section>

	<!-- Filter color-->
	{*<section class="section-sm">
		<h5>Filter By Color</h5>
		<ul class="small list">
			<li><a href="#">Black (9)</a></li>
			<li><a href="#">Blue (3)</a></li>
			<li><a href="#">Brown (5)</a></li>
			<li><a href="#">Gray (7)</a></li>
			<li><a href="#">White (6)</a></li>
		</ul>
	</section>

	<!-- Range-->
	<section class="section-sm">
		<h5>Filter By Price</h5>
		<!--RD Range-->
		<div class="rd-range-wrap">
			<div class="rd-range-inner">
				<span>Price: </span><span class="rd-range-input-value-1"></span><span>—</span><span
					class="rd-range-input-value-2"></span>
			</div>
			<div class="rd-range" data-min="10" data-max="500"
				data-start="[75, 244]" data-step="1" data-tooltip="true"
				data-min-diff="10" data-input=".rd-range-input-value-1"
				data-input-2=".rd-range-input-value-2"></div>
		</div>
		<a class="button button-gray-light-outline" href="#">Filter</a>
	</section>*}

</div>