<!-- Modal login window-->
<div class="modal fade" id="modalLogin" role="dialog">
	<div class="modal-dialog modal-dialog_custom">
		<!-- Modal content-->
		<div class="modal-dialog__inner">
			<button class="close" type="button" data-dismiss="modal"></button>
			<div class="modal-dialog__content">
				<h5>{$oLanguage->GetMessage('Login Form')}</h5>
				<!-- RD Mailform-->
				<form class="rd-mailform rd-mailform_responsive" action="/" method="post">
					<input type="hidden" name="action" value="user_do_login">
					<div class="form-wrap form-wrap_icon linear-icon-envelope">
						<input class="form-input" id="modal-login-email" type="text"
							name="login" data-constraints="@Required"> 
							{*<label class="form-label" for="modal-login-email">Your e-mail</label>*}
					</div>
					<div class="form-wrap form-wrap_icon linear-icon-lock">
						<input class="form-input" id="modal-login-password"
							type="password" name="password" data-constraints="@Required">
						{*<label class="form-label" for="modal-login-password">Your password</label>*}
					</div>
					<button class="button button-primary" type="submit">Login</button>
				</form>
				{*<ul class="list-small">
					<li><a href="#">Forgot your username?</a></li>
					<li><a href="#">Forgot your password?</a></li>
				</ul>*} 
			</div>
		</div>
	</div>
</div>

<!-- Modal register window-->
<div class="modal fade" id="modalRegister" role="dialog">
	<div class="modal-dialog modal-dialog_custom">
		<!-- Modal content-->
		<div class="modal-dialog__inner">
			<button class="close" type="button" data-dismiss="modal"></button>
			<div class="modal-dialog__content">
				<h5>{$oLanguage->GetMessage('call me Form')}</h5>
				<!-- RD Mailform-->
				<form class="rd-mailform rd-mailform_responsive"
					data-form-output="form-output-global" data-form-type="contact" onsubmit="dataLayer.push({ldelim}'event': 'form-sent', 'eventCategory' : 'callback', 'eventAction' : 'sent' {rdelim});"
					method="post" action="/">
					<input type="hidden" name="action" value="call_me">
					
					<div class="form-wrap">
						<input class="form-input" id="contact-name" type="text" name="name" placeholder="Ваше имя"
							data-constraints="@Required"> 
					</div>
					<div class="form-wrap">
						<input class="form-input" id="contact-phone" type="text" name="phone" placeholder="Ваш телефон"
							data-constraints="@Numeric"> 
					</div>
					<div class="form-wrap">
						<textarea class="form-input" id="contact-message" name="message" placeholder="Ваше сообщение"
							data-constraints="@Required"></textarea>
					</div>
					
					<button class="button button-primary" type="submit">{$oLanguage->GetMessage('send')}</button>
				</form>
			</div>
		</div>
	</div>
</div>


<!-- Modal register window-->
<div class="modal fade" id="modalRegister2" role="dialog">
	<div class="modal-dialog modal-dialog_custom">
		<!-- Modal content-->
		<div class="modal-dialog__inner">
			<button class="close" type="button" data-dismiss="modal"></button>
			<div class="modal-dialog__content">
				<h5>{$oLanguage->GetMessage('asking price Form')}</h5>
				<!-- RD Mailform-->
				<form class="rd-mailform rd-mailform_responsive" onsubmit="dataLayer.push({ldelim}'event': 'form-sent', 'eventCategory' : 'price-request', 'eventAction' : 'sent' {rdelim});"
					data-form-output="form-output-global" data-form-type="contact"
					method="post" action="/">
					<input type="hidden" name="action" value="call_me">
					
					<div class="form-wrap">
						<input class="form-input" id="contact-name2" type="text" name="name" placeholder="Ваше имя"
							data-constraints="@Required"> 
					</div>
					<div class="form-wrap">
						<input class="form-input" id="contact-phone2" type="text" name="phone" placeholder="Ваш телефон"
							data-constraints="@Numeric"> 
					</div>
					<div class="form-wrap">
						<textarea class="form-input" id="contact-message2" name="message" placeholder="Ваше сообщение"
							data-constraints="@Required"></textarea>
					</div>
					
					<button class="button button-primary" type="submit">{$oLanguage->GetMessage('send')}</button>
				</form>
			</div>
		</div>
	</div>
</div>