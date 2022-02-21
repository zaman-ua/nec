<div class="col-md-6 col-lg-8">
	<!-- Slick Carousel-->
	<div class="slick-slider carousel-parent" data-arrows="false"
		data-loop="false" data-dots="false" data-swipe="true" data-items="1"
		data-child="#child-carousel" data-for="#child-carousel"
		data-photo-swipe-gallery="gallery">
		{foreach from=$aGraphic item=aImage}
		<div class="item">
			<a class="img-thumbnail-variant-2"
				href="{$aImage.image}"
				data-photo-swipe-item="" data-size="1248x586">
				<figure>
					<img
						src="{$aImage.image}"
						alt=""  />
				</figure>
				<div class="caption">
					<span class="icon icon-lg linear-icon-magnifier"></span>
				</div>
			</a>
		</div>
		{/foreach}
	</div>
	<div class="product-label-wrap">
		{if $aRowPrice.product_label=='featured'}<span class="featured">{$oLanguage->GetMessage('product_label:Featured')}</span>{/if}
		{if $aRowPrice.product_label=='new'}<span class="new">{$oLanguage->GetMessage('product_label:New')}</span>{/if}
		{if $aRowPrice.product_label=='sale'}<span class="sale">{$oLanguage->GetMessage('product_label:Sale')}</span>{/if}
	</div>
	<div class="slick-slider" id="child-carousel"
		data-for=".carousel-parent" data-arrows="false" data-loop="false"
		data-dots="false" data-swipe="true" data-items="3" data-xs-items="4"
		data-sm-items="4" data-md-items="4" data-lg-items="4"
		data-xl-items="5" data-slide-to-scroll="1">
		{foreach from=$aGraphic item=aImage}
		<div class="item">
			<img src="{$aImage.image}" alt="" width="89" height="89" />
		</div>
		{/foreach}
	</div>
</div>
<div class="col-md-6 col-lg-4">
	<div class="product-single">
		<h4>{$aRowPrice.name}</h4>
		{if $aRowPrice.price>0}
		<p class="product-price">
			От {$oCurrency->PrintPrice($aRowPrice.price)}
		</p>
		{/if}
		{*<ul class="rating-list">
			<li><span class="icon linear-icon-star icon-secondary-4"></span></li>
			<li><span class="icon linear-icon-star icon-secondary-4"></span></li>
			<li><span class="icon linear-icon-star icon-secondary-4"></span></li>
			<li><span class="icon linear-icon-star icon-secondary-4"></span></li>
			<li><span class="icon linear-icon-star icon-gray-4"></span></li>
		</ul>*}
		<p class="product-text">{$aRowPrice.information}</p>
		{*<div class="form-wrap product-select">
			<!--Select 2-->
			<select class="form-input select-filter"
				data-placeholder="Choose an option"
				data-minimum-results-for-search="Infinity">
				<option>Choose an option</option>
				<option value="2">Energy Star Compliant</option>
				<option value="3">Handmade</option>
				<option value="4">UL Listed</option>
				<option value="5">Clear</option>
			</select>
		</div>*}
		<div class="group group-middle">
			{include file="catalog/link_add_cart.tpl" aRow=$aRowPrice bProductPage=1}
		</div>
		{*<div class="product-icon-wrap">
			<span class="icon icon-md linear-icon-heart" data-toggle="tooltip"
				data-original-title="Add to Wishlist"></span><span
				class="icon icon-md linear-icon-balance" data-toggle="tooltip"
				data-original-title="Add to Compare"></span>
		</div>*}
		{*<ul class="product-meta">
			<li>
				<dl class="list-terms-minimal">
					<dt>SKU</dt>
					<dd>{$aRowPrice.code}</dd>
				</dl>
			</li>
			<li>
				<dl class="list-terms-minimal">
					<dt>Category</dt>
					<dd>
						<ul class="product-categories">
							<li><a href="/catalog/{$aRowPrice.code_name}">{$aRowPrice.price_group_name}</a></li>
						</ul>
					</dd>
				</dl>
			</li>
			<li>
				<dl class="list-terms-minimal">
					<dt>Tags</dt>
					<dd>
						<ul class="product-categories">
							<li><a href="single-product.html">Modern</a></li>
							<li><a href="single-product.html">Table</a></li>
						</ul>
					</dd>
				</dl>
			</li>
		</ul>*}
	</div>
</div>
<div class="col-sm-12">
	<!-- Bootstrap tabs-->
	<div class="tabs-custom tabs-horizontal" id="tabs-1">
		<!-- Nav tabs-->
		<ul
			class="nav-custom nav-custom-tabs nav-custom__align-left nav nav-tabs">
			<li class="nav-item" role="presentation"><a
				class="nav-link active" href="#tabs-1-1" data-toggle="tab">{$oLanguage->GetMessage('DESCRIPTION')}</a></li>
			<li class="nav-item" role="presentation"><a class="nav-link"
				href="#tabs-1-2" data-toggle="tab">{$oLanguage->GetMessage('ADDITIONAL INFORMATION')}</a></li>
		</ul>
	</div>
	<div class="tab-content text-left">
		<div class="tab-pane fade show active" id="tabs-1-1">
		{$aRowPrice.description}
		</div>
		<div class="tab-pane fade" id="tabs-1-2">
			<table class="table-product-info">
				<tbody>
			{if $aCriteria}
            {foreach from=$aCriteria item=aCrit}
					<tr>
						<td>{$aCrit.name}</td>
						<td>{$aCrit.code}</td>
					</tr>
			{/foreach}
			{/if}
				</tbody>
			</table>
		</div>
	</div>
</div>


{if $aSubParentProducts}
<!-- Divider-->
<div class="container">
	<div class="divider"></div>
</div>

<div class="container text-center">
<h5>{$oLanguage->GetMessage('sub Products')}</h5>
    <div class="table-responsive" {*style="overflow-x: hidden;"*}>
    <table class="table-cart">
      <thead>
        <tr>
          <th colspan="10"></th>
        </tr>
      </thead>
      <tbody>
    {foreach from=$aSubParentProducts item=aRow}
        <tr>
          <td>
            <div class="product-img-wrap">
              <img src="{$aRow.images.0.image}" alt="" width="426" height="200"/>
            </div>
          </td>
          <td>
              <h6><a class="thumbnail-classic-title" href="/product/{$aRow.price_group_code_name}/{$aRow.id_cat_part}">{$aRow.name}</a></h6>
          </td>
          <td>
              <ul>
                {foreach from=$aRow.criteria item=aCrit}
                <li>{$aCrit.name}: {$aCrit.code}</li>
                {/foreach}
              </ul>
          </td>
          <td>
              <div class="product-price">
              {if $aRow.price>0}
    			От {$oCurrency->PrintPrice($aRow.price)}
    			{else}&nbsp;
    		  {/if}
    		  </div>
    		  {include file="catalog/link_add_cart.tpl" aRow=$aRow}
          </td>
        </tr>
    {/foreach}
      </tbody>
    </table>
    </div>
</div>
{/if}