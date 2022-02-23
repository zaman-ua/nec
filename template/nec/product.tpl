{foreach from=$aAllProducts item=aProduct}
<!-- Product overview-->
<section class="section section-lg bg-transparent novi-background">
    <div class="container">
        <div class="row row-50">
            <div class="col-md-6 col-lg-7">
                <div class="slick-modern">
                    <div class="slick-slider slider-nav"
                         data-slick='{ldelim}"slidesToShow":5,"slidesToScroll":5,"arrows":false,"asNavFor":".slider-for","focusOnSelect":true,"vertical":true{rdelim}'>
                        {foreach from=$aProduct.images item=aImage}
                        <div class="slick-content">
                            <img class="lazy-img" src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs%3D" data-src="{$aImage.image}" alt="" width="542" height="694">
                        </div>
                        {/foreach}
                    </div>
                    <div class="slick-slider slider-for"
                         data-slick='{ldelim}"arrows":false,"asNavFor":".slider-nav","autoplay":true,"autoplaySpeed":2000,"fade":true{rdelim}'>
                        {foreach from=$aProduct.images item=aImage}
                        <div class="slick-content">
                            <img class="lazy-img" src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs%3D" data-src="{$aImage.image}" alt="" width="542" height="694">
                        </div>
                        {/foreach}
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-5">
                <div class="product-overview ps-xxl-5">
                    <div class="product-overview-item">
                        <h3 class="product-overview-name">{$aProduct.name}</h3>
                        <div class="product-overview-price">
                            <span>{$oCurrency->PrintPrice($aProduct.price)}</span>
                        </div>
{*                        <div class="product-overview-rating">*}
{*                            <div class="rating rating-orange">*}
{*                                <div class="rating-body">*}
{*                                    <div class="rating-empty"><span class="int-star"></span><span class="int-star"></span><span class="int-star"></span><span class="int-star"></span><span class="int-star"></span>*}
{*                                    </div>*}
{*                                    <div class="rating-fill" style="width: 90%"><span class="int-star"></span><span class="int-star"></span><span class="int-star"></span><span class="int-star"></span><span class="int-star"></span>*}
{*                                    </div>*}
{*                                </div>*}
{*                            </div><a class="product-overview-review ms-4" href="#reviews" data-anchor-link="">3 customer reviews</a>*}
{*                        </div>*}
                    </div>
                    <div class="product-overview-item">
                        <div class="d-flex flex-wrap align-items-end group-20">
                            <div class="form-group">
                                <label class="d-block" for="input-quality">{$oLanguage->GetMessage('Qty')}:</label>
                                <input class="form-control form-control-inline" id="input-quality" data-spinner type="number" name="spinner" value="1">
                            </div>
                            <div class="flex-grow-1">
                                {capture name=add_link_href}./{strip}
                                    ?action=cart_add_cart_item&id={$aProduct.id}&xajax_request=1
                                {/strip}{/capture}
                                <a class="btn btn-block btn-lg btn-dark" href="#" id="cart_add_class"
                                   onclick="{strip}xajax_process_browse_url('{$smarty.capture.add_link_href}&number='+$('#input-quality').val());return false;{/strip}">
                                    <span class="btn-icon int-cart novi-icon"></span>
                                    <span id="cart_add_text">{$oLanguage->GetMessage('Add to Cart')}</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="product-overview-description">
                        <p>{$aProduct.information}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product details-->
<section class="section section-lg bg-transparent novi-background" id="reviews">
    <div class="container">
        <div class="row justify-content-lg-end">
            <div class="col-lg-11">
                <div class="tab">
                    <ul class="nav nav-classic" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link h4 active" data-bs-toggle="tab" href="#navClassic1-1" role="tab" aria-selected="true">{$oLanguage->GetMessage('Information')}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link h4" data-bs-toggle="tab" href="#navClassic1-2" role="tab" aria-selected="false">{$oLanguage->GetMessage('criterias')}</a>
                        </li>
{*                        <li class="nav-item">*}
{*                            <a class="nav-link h4" data-bs-toggle="tab" href="#navClassic1-3" role="tab" aria-selected="false">{$oLanguage->GetMessage('Video')}</a>*}
{*                        </li>*}
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="navClassic1-1" role="tabpanel">
                            <p>{$aProduct.description}</p>
                        </div>
                        <div class="tab-pane fade" id="navClassic1-2" role="tabpanel">
                            <ul class="list list-marked">
                                {foreach from=$aProduct.criteria item=aCriteria}
                                <li class="list-item">{$aCriteria.name}: {$aCriteria.code}</li>
                                {/foreach}
                            </ul>
                        </div>
{*                        <div class="tab-pane fade" id="navClassic1-3" role="tabpanel">*}

{*                            <div class="ratio ratio-16x9">*}
{*                                <iframe class="ratio-item" src="about:blank" data-pended-iframe="https://www.youtube.com/embed/{$aProduct.video}" allowfullscreen=""></iframe>*}
{*                            </div>*}

{*                        </div>*}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
{/foreach}