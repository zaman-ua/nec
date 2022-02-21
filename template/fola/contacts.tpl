<div class="col-md-5 col-lg-4">
	<h3>{$oLanguage->GetMessage('contact')}</h3>
	<ul class="list-xs contact-info">
		<li>
			<dl class="list-terms-minimal">
				<dt>{$oLanguage->GetMessage('adress')}</dt>
				<dd>{$oLanguage->GetConstant('contact_form:adress')}</dd>
			</dl>
		</li>
		<li>
			<dl class="list-terms-minimal">
				<dt>{$oLanguage->GetMessage('phone')}</dt>
				<dd>
					<ul class="list-semicolon">
						<li><a href="tel:{$oLanguage->GetConstant('contact_form:phone_1')}">{$oLanguage->GetConstant('contact_form:phone_1')}</a></li>
						<li><a href="tel:{$oLanguage->GetConstant('contact_form:phone_2')}">{$oLanguage->GetConstant('contact_form:phone_2')}</a></li>
						<li><a href="tel:{$oLanguage->GetConstant('contact_form:phone_3')}">{$oLanguage->GetConstant('contact_form:phone_3')}</a></li>
						<li><a href="tel:{$oLanguage->GetConstant('contact_form:phone_4')}">{$oLanguage->GetConstant('contact_form:phone_4')}</a></li>
						<li><a href="tel:{$oLanguage->GetConstant('contact_form:phone_5')}">{$oLanguage->GetConstant('contact_form:phone_5')}</a></li>
					</ul>
				</dd>
			</dl>
		</li>
		<li>
			<dl class="list-terms-minimal">
				<dt>{$oLanguage->GetMessage('email')}</dt>
				<dd>
					<a href="mailto:{$oLanguage->GetConstant('contact_form:email')}">{$oLanguage->GetConstant('contact_form:email')}</a>
				</dd>
			</dl>
		</li>
		<li>
			<dl class="list-terms-minimal">
				<dt>{$oLanguage->GetMessage('open_days')}</dt>
				<dd>{$oLanguage->GetConstant('contact_form:open_days')}</dd>
			</dl>
		</li>
		<li>
			<ul class="list-inline-sm">
				<li><a class="icon-sm fa-facebook icon" href="https://www.facebook.com/FolaSofas/"></a></li>
			</ul>
		</li>
	</ul>
</div>
<div class="col-md-7 col-lg-8">
	<h3>{$oLanguage->GetMessage('contact_form')}</h3>
	{$sContactForm}
</div>