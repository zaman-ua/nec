<section class="section-sm section-limit">
	<div class="row justify-content-sm-center row-50">
		{$oLanguage->GetText('home:center_banner')}
	</div>
</section>
<section class="section-lg bg-default">
	<div class="container text-center">
		<h4>{$oLanguage->GetMessage('products')}</h4>
		<!-- Owl Carousel-->
		<div class="owl-carousel carousel-product" data-items="1"
			data-md-items="2" data-lg-items="3" data-xl-items="4"
			data-stage-padding="0" data-loop="false" data-margin="50"
			data-mouse-drag="false" data-nav="true">
			{foreach from=$aAllProducts item=aRow}
			<div class="item">
				<div class="product product-grid">
					<div class="product-img-wrap">
						<a href="/product/{$aRow.code_name}/{$aRow.id}"><img
							src="{$aRow.images.0.image}"
							alt="" width="300" height="300" /></a>
						{*<!--div class="product-icon-wrap">
							<span class="icon icon-md linear-icon-heart"
								data-toggle="tooltip" data-original-title="Add to Wishlist"></span><span
								class="icon icon-md linear-icon-balance" data-toggle="tooltip"
								data-original-title="Add to Compare"></span>
						</div-->*}
						<div class="product-label-wrap">
							{if $aRow.product_label=='featured'}<span class="featured">{$oLanguage->GetMessage('product_label:Featured')}</span>{/if}
							{if $aRow.product_label=='new'}<span class="new">{$oLanguage->GetMessage('product_label:New')}</span>{/if}
							{if $aRow.product_label=='sale'}<span class="sale">{$oLanguage->GetMessage('product_label:Sale')}</span>{/if}
						</div>
					</div>
					<div class="product-caption">
						{*<ul class="product-categories">
							<li><a href="#">Living Room</a></li>
							<li><a href="#">Dining room</a></li>
							<li><a href="#">Office</a></li>
							<li><a href="#">Bedroom</a></li>
						</ul>*}
						<h6 class="product-title">
							<a href="/product/{$aRow.code_name}/{$aRow.id}">{$aRow.name}</a>
						</h6>
						<p class="product-price">
						{if $aRow.price>0}
							От {$oCurrency->PrintPrice($aRow.price)}
							{else}&nbsp;
						{/if}
						</p>
						{include file="catalog/link_add_cart.tpl" aRow=$aRow}
					</div>
				</div>
			</div>
			{/foreach}
		</div>
	</div>
</section>