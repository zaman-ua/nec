{if $aOtherProducts}
<!-- Divider-->
<div class="container">
	<div class="divider"></div>
</div>

<section class="section-sm bg-default">
	<div class="container text-center">
		<h5>{$oLanguage->GetMessage('Related Products')}</h5>
		<!-- Owl Carousel-->
		<div class="owl-carousel carousel-product" data-items="1"
			data-md-items="2" data-lg-items="3" data-xl-items="4"
			data-stage-padding="0" data-loop="false" data-margin="50"
			data-mouse-drag="false" data-nav="true">
			
{foreach from=$aOtherProducts item=aOther}
			<div class="item">
				<div class="product product-grid">
					<div class="product-img-wrap">
						<a href="/product/{$aOther.price_group_code_name}/{$aOther.id_cat_part}"><img
							src="{$aOther.images.0.image}"
							alt="" width="300" height="300" /></a>
						{*<div class="product-icon-wrap">
							<span class="icon icon-md linear-icon-heart"
								data-toggle="tooltip" data-original-title="Add to Wishlist"></span><span
								class="icon icon-md linear-icon-balance" data-toggle="tooltip"
								data-original-title="Add to Compare"></span>
						</div>*}
						<div class="product-label-wrap">
							{if $aOther.product_label=='featured'}<span class="featured">{$oLanguage->GetMessage('product_label:Featured')}</span>{/if}
							{if $aOther.product_label=='new'}<span class="new">{$oLanguage->GetMessage('product_label:New')}</span>{/if}
							{if $aOther.product_label=='sale'}<span class="sale">{$oLanguage->GetMessage('product_label:Sale')}</span>{/if}
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
							<a href="/product/{$aOther.price_group_code_name}/{$aOther.id_cat_part}">{$aOther.name}</a>
						</h6>
						
						<p class="product-price">
						{if $aOther.price>0}
							От {$oCurrency->PrintPrice($aOther.price)}
						{else}&nbsp;
						{/if}
						</p>
						{include file="catalog/link_add_cart.tpl" aRow=$aOther}
					</div>
				</div>
			</div>
			{/foreach}
		</div>
	</div>
</section>
{/if}