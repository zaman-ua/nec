<!-- Cart view-->
<section class="section section-lg bg-transparent novi-background">
	<div class="container">
		<h2 class="text-center">{$oLanguage->getMessage("Order process")}</h2>
		<div class="row justify-content-center">
			<div class="col-lg-11 col-xl-9 col-xxl-8">
				<div class="table-responsive-lg">
					<table class="table table-cart">
						<tbody>
						{foreach from=$aUserCart item=aRowCart}
						<tr>
							<td style="min-width: 160px; width: 20%">
								<a class="table-cart-figure" href="/">
									<img class="lazy-img" src="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs%3D" data-src="{$aRowCart.image}" alt="" width="180" height="231">
								</a>
							</td>
							<td style="min-width: 250px; width: 30%">
								<h6><a class="table-cart-title" href="/">{$aRowCart.name}</a></h6>
							</td>
							<td style="min-width: 80px; width: 20%">{$oCurrency->PrintPrice($aRowCart.price)}</td>
							<td style="min-width: 120px; width: 10%">
								<label class="d-block small" for="input-quality">{$oLanguage->GetMessage('Qty')}: {$aRowCart.number}</label>
							</td>
							<td class="text-end" style="min-width: 60px; width: 20%">{$oCurrency->PrintPrice($aRowCart.total)}</td>
						</tr>
						{/foreach}
						</tbody>
					</table>
				</div>

				{$sCheckNewAccountForm}
			</div>
		</div>
	</div>
</section>