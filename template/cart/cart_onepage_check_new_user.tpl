<div class="form-wrap">
	<input class="form-input" id="contact-name" type="text" name="data[name]" value="{$aUser.name}"
		data-constraints="@Required"> <label class="form-label"
		for="contact-name">Ваше имя</label>
</div>
<div class="form-wrap">
	<input class="form-input" id="contact-email" type="email" name="data[email]" value="{$aUser.email}"
		data-constraints="@Email"> <label class="form-label"
		for="contact-email">Ваш e-mail</label>
</div>
<div class="form-wrap">
	<input class="form-input" id="contact-phone" type="text" name="data[phone]" value="{$aUser.phone}"
		data-constraints="@Numeric @Required"> <label class="form-label"
		for="contact-phone">Ваш телефон</label>
</div>
<div class="form-wrap">
	<input class="form-input" id="contact-address" type="text" name="data[address]" value="{$aUser.address}"
		data-constraints=""> <label class="form-label"
		for="contact-address">Ваш адрес</label>
</div>
<div class="form-wrap">
	<textarea class="form-input" id="contact-message" name="data[remark]"
		data-constraints="">{$aUser.remark}</textarea>
	<label class="form-label" for="contact-message">Ваше сообщение</label>
</div>
<button class="button button-primary" type="submit" onclick="this.form.submit();">Оформить заказ</button>