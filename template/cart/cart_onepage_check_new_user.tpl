
<div class="offset-sm group-20 d-flex align-items-center flex-wrap justify-content-end">
{*	<form class="rd-mailform" data-form-type="contact" method="post" action="components/rd-mailform/rd-mailform.php">*}
		<div class="row row-20 novi-disabled">
			<div class="col-md-4">
				<div class="form-group">
					<label for="input-name">{$oLanguage->GetMessage('Your name')}:</label>
					<div class="position-relative">
						<input class="form-control" id="input-name" type="text" name="data[name]" value="{$aUser.name}" placeholder="{$oLanguage->GetMessage('Your name')}" data-constraints="@Required">
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label for="input-email">{$oLanguage->GetMessage('Your e-mail address')}:</label>
					<div class="position-relative">
						<input class="form-control" id="input-email" type="email" name="data[email]" value="{$aUser.email}" placeholder="{$oLanguage->GetMessage('Your e-mail address')}" data-constraints="@Email @Required">
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label for="input-tel">{$oLanguage->GetMessage('Your phone')}:</label>
					<div class="position-relative">
						<input class="form-control" id="input-tel" type="tel" name="data[phone]" value="{$aUser.phone}" placeholder="X-XXX-XXX-XXXX" data-constraints="@PhoneNumber @Required">
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label for="input-address">{$oLanguage->GetMessage('Your address')}:</label>
					<div class="position-relative">
						<input class="form-control" id="input-address" type="text" name="data[address]" value="{$aUser.address}" placeholder="{$oLanguage->GetMessage('Your address')}" data-constraints="@Required">
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="form-group">
					<label for="simple-select">{$oLanguage->getMessage("Delivery methods")}:</label>
					<div class="select-wrap">
						<select class="select2-original" id="simple-select"
								name="id_delivery_type"
								data-select2-options='{ldelim}"placeholder":"Select country"{rdelim}'
								onchange="{strip}xajax_process_browse_url('?action=delivery_set&xajax_request=1&id_delivery_type='+this.options[this.selectedIndex].value);{/strip}">
							{foreach from=$aDeliveryType item=aItem}
							<option value="{$aItem.id}">{$aItem.name}</option>
							{/foreach}
						</select>
					</div>
				</div>
			</div>
			<div class="col-12">
				<div class="form-group">
					<label for="input-question">{$oLanguage->GetMessage('Your remark')}:</label>
					<div class="position-relative">
						<textarea class="form-control" id="input-question" name="data[remark]" placeholder="Your question" data-constraints="@Required">{$aUser.remark}</textarea>
					</div>
				</div>
			</div>
		</div>
{*	</form>*}
</div>
<table class="table table-cart-total">
	<tbody>
	<tr>
		<th style="min-width: 100px; width: 50%">{$oLanguage->getMessage('Subtotal')}:</th>
		<td style="min-width: 100px; width: 50%">{$oCurrency->PrintSymbol($dSubtotal)}</td>
	</tr>
	<tr>
		<th>{$oLanguage->getMessage('Shipment')}:</th>
		<td id='price_delivery'>{$oCurrency->PrintPrice($smarty.session.current_cart.price_delivery)}</td>
	</tr>
	</tbody>
	<tfoot>
	<tr>
		<th>{$oLanguage->getMessage('Total')}:</th>
		<td>
			<h3 style="line-height: 1" id='price_total'>{$oCurrency->PrintSymbol($dTotal)}</h3>
		</td>
	</tr>
	</tfoot>
</table>
<div class="divider divider-sm"></div>
<div class="text-end">
	<button class="btn btn-lg btn-primary" type="submit" onclick="this.form.submit();">
		<span class="btn-icon int-check novi-icon"></span>&nbsp;
		{$oLanguage->GetMessage('Proceed to Checkout')}
	</button>
</div>