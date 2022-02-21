<div class="form-wrap">
	<input class="form-input" id="contact-name" type="text" name="data[name]" placeholder="Ваше имя"
		data-constraints="@Required">
</div>
<div class="form-wrap">
	<input class="form-input" id="contact-email" type="email" name="data[email]" placeholder="Ваш e-mail"
		data-constraints="@Email @Required">
</div>
<div class="form-wrap">
	<input class="form-input" id="contact-phone" type="text" name="data[phone]" placeholder="Ваш телефон"
		data-constraints="@Numeric"> 
</div>
<div class="form-wrap">
	<textarea class="form-input" id="contact-message" name="data[message]" placeholder="Ваше сообщение"
		data-constraints="@Required"></textarea>
</div>
<button class="button button-primary" type="submit" onclick="this.form.submit();">Отправить</button>