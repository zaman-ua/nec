<div class="table-responsive" style="overflow-x: hidden;">
<table class="table-cart">
  <thead>
    <tr>
      <th colspan="3">{$oLanguage->GetMessage('Product')}</th>
      <th>{$oLanguage->GetMessage('Price')}</th>
    </tr>
  </thead>
  <tbody>
{foreach from=$aDataCart item=aRow name=cart}
    <tr>
      <td class="table-cart-remove-item"><span class="icon icon-sm linear-icon-cross2 icon-gray-4" onclick="document.location='/?action=cart_cart_delete&id={$aRow.id}'"></span></td>
      <td style="min-width: 150px">
        <div class="unit flex-row unit-spacing-md align-items-center">
          <div class="unit__left"><img src="{$aRow.images.0.image}" alt="" width="141" height="188"/>
          </div>
          <div class="unit__body">
            <h6><a class="thumbnail-classic-title" href="#">{$aRow.name}</a></h6>
          </div>
        </div>
      </td>
      {if $smarty.foreach.cart.first}
      <td rowspan="{$aDataCart|@count}">
      		{$oLanguage->GetText('cart_text')}
      </td>
      {/if}
      <td>
        <div class="product-price">{$oCurrency->PrintPrice($aRow.price)}</div>
      </td>
    </tr>
{/foreach}
  </tbody>
</table>
</div>
<div class="row row-50 text-center">
{*<div class="col-md-8 text-md-left">
  <div class="group-xs">
    <div class="form-wrap form-wrap_icon linear-icon-tag">
      <input class="form-input" type="text" name="name" placeholder="Enter Code">
    </div>
    <button class="button button-black" type="submit">Apply coupon</button>
  </div>
</div>
<div class="col-md-4 text-md-right">
  <button class="button button-gray-light-outline" type="submit">Update card</button>
</div>*}
<div class="col-sm-12">
  <hr>
</div>
<div class="col-sm-12">
  <div class="text-md-right">
    {*<dl class="list-terms-minimal">
      <dt>Subtotal</dt>
      <dd>$90</dd>
    </dl>*}
    <dl class="heading-5 list-terms-minimal">
      <dt>{$oLanguage->GetMessage('Total')}</dt>
      <dd>{$oCurrency->PrintPrice($aSubtotalCart.dSubtotal)}</dd>
    </dl><a class="button button-primary" href="/pages/cart_onepage_order">{$oLanguage->GetMessage('Proceed to Checkout')}</a>
  </div>
</div>
</div>