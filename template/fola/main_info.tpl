<section class="section-md bg-default">
	<div class="container">
		<div class="row row-60 justify-content-md-center">
			<div class="col-md-6 col-lg-4">
				<!-- Blurb circle-->
				<article class="blurb blurb-circle blurb-circle_centered">
					<div class="blurb-circle__icon">
						<span class="icon linear-icon-clock3"></span>
					</div>
					{$oLanguage->GetText("home:center_1")}
				</article>
			</div>
			<div class="col-md-6 col-lg-4">
				<!-- Blurb circle-->
				<article class="blurb blurb-circle blurb-circle_centered">
					<div class="blurb-circle__icon">
						<span class="icon linear-icon-truck"></span>
					</div>
					{$oLanguage->GetText("home:center_2")}
				</article>
			</div>
			<div class="col-md-6 col-lg-4">
				<!-- Blurb circle-->
				<article class="blurb blurb-circle blurb-circle_centered">
					<div class="blurb-circle__icon">
						<span class="icon linear-icon-medal-empty"></span>
					</div>
					{$oLanguage->GetText("home:center_3")}
				</article>
			</div>
		</div>
	</div>
</section>


<section class="section-map">
	<!-- RD Google Map-->
	{*<div class="rd-google-map rd-google-map__model" data-zoom="17"
		data-y="49.418698" data-x="32.107986"
		data-styles="{literal}[{&quot;featureType&quot;:&quot;water&quot;,&quot;elementType&quot;:&quot;geometry&quot;,&quot;stylers&quot;:[{&quot;color&quot;:&quot;#e9e9e9&quot;},{&quot;lightness&quot;:17}]},{&quot;featureType&quot;:&quot;landscape&quot;,&quot;elementType&quot;:&quot;geometry&quot;,&quot;stylers&quot;:[{&quot;color&quot;:&quot;#f5f5f5&quot;},{&quot;lightness&quot;:20}]},{&quot;featureType&quot;:&quot;road.highway&quot;,&quot;elementType&quot;:&quot;geometry.fill&quot;,&quot;stylers&quot;:[{&quot;color&quot;:&quot;#ffffff&quot;},{&quot;lightness&quot;:17}]},{&quot;featureType&quot;:&quot;road.highway&quot;,&quot;elementType&quot;:&quot;geometry.stroke&quot;,&quot;stylers&quot;:[{&quot;color&quot;:&quot;#ffffff&quot;},{&quot;lightness&quot;:29},{&quot;weight&quot;:0.2}]},{&quot;featureType&quot;:&quot;road.arterial&quot;,&quot;elementType&quot;:&quot;geometry&quot;,&quot;stylers&quot;:[{&quot;color&quot;:&quot;#ffffff&quot;},{&quot;lightness&quot;:18}]},{&quot;featureType&quot;:&quot;road.local&quot;,&quot;elementType&quot;:&quot;geometry&quot;,&quot;stylers&quot;:[{&quot;color&quot;:&quot;#ffffff&quot;},{&quot;lightness&quot;:16}]},{&quot;featureType&quot;:&quot;poi&quot;,&quot;elementType&quot;:&quot;geometry&quot;,&quot;stylers&quot;:[{&quot;color&quot;:&quot;#f5f5f5&quot;},{&quot;lightness&quot;:21}]},{&quot;featureType&quot;:&quot;poi.park&quot;,&quot;elementType&quot;:&quot;geometry&quot;,&quot;stylers&quot;:[{&quot;color&quot;:&quot;#dedede&quot;},{&quot;lightness&quot;:21}]},{&quot;elementType&quot;:&quot;labels.text.stroke&quot;,&quot;stylers&quot;:[{&quot;visibility&quot;:&quot;on&quot;},{&quot;color&quot;:&quot;#ffffff&quot;},{&quot;lightness&quot;:16}]},{&quot;elementType&quot;:&quot;labels.text.fill&quot;,&quot;stylers&quot;:[{&quot;saturation&quot;:36},{&quot;color&quot;:&quot;#333333&quot;},{&quot;lightness&quot;:40}]},{&quot;elementType&quot;:&quot;labels.icon&quot;,&quot;stylers&quot;:[{&quot;visibility&quot;:&quot;off&quot;}]},{&quot;featureType&quot;:&quot;transit&quot;,&quot;elementType&quot;:&quot;geometry&quot;,&quot;stylers&quot;:[{&quot;color&quot;:&quot;#f2f2f2&quot;},{&quot;lightness&quot;:19}]},{&quot;featureType&quot;:&quot;administrative&quot;,&quot;elementType&quot;:&quot;geometry.fill&quot;,&quot;stylers&quot;:[{&quot;color&quot;:&quot;#fefefe&quot;},{&quot;lightness&quot;:20}]},{&quot;featureType&quot;:&quot;administrative&quot;,&quot;elementType&quot;:&quot;geometry.stroke&quot;,&quot;stylers&quot;:[{&quot;color&quot;:&quot;#fefefe&quot;},{&quot;lightness&quot;:17},{&quot;weight&quot;:1.2}]}]{/literal}">
		<ul class="map_locations">
			<li data-y="49.418698" data-x="32.107986">
				<dl>
					<dt>{$oLanguage->GetMessage('adress')}:</dt>
					<dd>{$oLanguage->GetConstant('contact_form:adress')}</dd>
				</dl>
				<dl>
					<dt>{$oLanguage->GetMessage('phone')}:</dt>
					<dd>
						<a href="tel:{$oLanguage->GetConstant('contact_form:phone_1')}">{$oLanguage->GetConstant('contact_form:phone_1')}</a>; 
						<a href="tel:{$oLanguage->GetConstant('contact_form:phone_2')}">{$oLanguage->GetConstant('contact_form:phone_2')}</a>; 
						<a href="tel:{$oLanguage->GetConstant('contact_form:phone_3')}">{$oLanguage->GetConstant('contact_form:phone_3')}</a>; 
						<a href="tel:{$oLanguage->GetConstant('contact_form:phone_4')}">{$oLanguage->GetConstant('contact_form:phone_4')}</a>; 
						<a href="tel:{$oLanguage->GetConstant('contact_form:phone_5')}">{$oLanguage->GetConstant('contact_form:phone_5')}</a>; 
					</dd>
				</dl>
				<dl>
					<dt>{$oLanguage->GetMessage('open_days')}:</dt>
					<dd>{$oLanguage->GetConstant('contact_form:open_days')}</dd>
				</dl>
			</li>
		</ul>
	</div>*}
	
	
	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2595.282604279471!2d32.104640491726656!3d49.42247098208175!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40d14baa832b9df5%3A0xc83ee856d2d04f44!2z0YPQuy4g0JTQvtCx0YDQvtCy0L7Qu9GM0YHQutC-0LPQviwgMSwg0KfQtdGA0LrQsNGB0YHRiywg0KfQtdGA0LrQsNGB0YHQutCw0Y8g0L7QsdC70LDRgdGC0YwsIDE4MDAw!5e0!3m2!1sru!2sua!4v1535556571407" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
</section>