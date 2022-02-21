<!-- Page Footer -->
<section class="pre-footer-corporate">
	<div class="container">
		<div
			class="row justify-content-sm-center justify-content-lg-start row-30 row-md-60">
			<div class="col-sm-10 col-md-6 col-lg-10 col-xl-3">
				<h6>{$oLanguage->GetMessage('about')}</h6>
				<p>{$oLanguage->GetText('footer:about')}</p>
			</div>
			<div class="col-sm-10 col-md-6 col-lg-3 col-xl-3">
				<h6>{$oLanguage->GetMessage('navigation')}</h6>
				<ul class="list-xxs">
				{foreach from=$aGroups item=aLv1}
    				{if $aLv1.childs}
    				{foreach from=$aLv1.childs item=aLv2}
					<li><a href="/catalog/{$aLv2.code}">{$aLv2.name}</a></li>
					{/foreach}
					{/if}
				{/foreach}
				</ul>
				
				<button class="button button-primary button-icon button-icon-left" type="submit" data-toggle="modal" data-target="#modalRegister">
			    	<span class="icon icon-md linear-icon-telephone"></span><span>{$oLanguage->GetMessage('call me')}</span>
			    </button>
			</div>
			<div class="col-sm-10 col-md-6 col-lg-4 col-xl-3">
				<h6>{$oLanguage->GetMessage('contact')}</h6>
				<ul class="list-xs">
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
				</ul>
			</div>
		</div>
	</div>
</section>

<footer class="footer-corporate">
	<div class="container">
		<div class="footer-corporate__inner">
			<p class="rights">
				<span>Quali ©</span><span>&nbsp;</span><span class="copyright-year"></span>.
				<a href="/">Privacy Policy</a>
			</p>
			<ul class="list-inline-xxs">
				<li><a class="icon icon-xxs icon-gray-4 fa fa-facebook" href="https://www.facebook.com/FolaSofas/"></a></li>
			</ul>
		</div>
	</div>
</footer>