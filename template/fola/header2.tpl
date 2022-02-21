<!-- Page header-->
<header class="page-header">
	<!-- RD Navbar-->
	<div class="rd-navbar-wrap">
		<nav class="rd-navbar rd-navbar_inverse" data-layout="rd-navbar-fixed"
			data-sm-layout="rd-navbar-fixed"
			data-sm-device-layout="rd-navbar-fixed"
			data-md-layout="rd-navbar-fixed"
			data-md-device-layout="rd-navbar-fixed"
			data-lg-layout="rd-navbar-static"
			data-lg-device-layout="rd-navbar-fixed"
			data-xl-device-layout="rd-navbar-static"
			data-xl-layout="rd-navbar-static" data-stick-up-clone="false"
			data-sm-stick-up="true" data-md-stick-up="true"
			data-lg-stick-up="true" data-xl-stick-up="true"
			data-xxl-stick-up="true" data-lg-stick-up-offset="120px"
			data-xl-stick-up-offset="35px" data-xxl-stick-up-offset="35px"
			data-body-class="">
			<div class="rd-navbar-inner rd-navbar-search-wrap">
				<!-- RD Navbar Panel-->
				<div class="rd-navbar-panel rd-navbar-search_collapsable">
					<button class="rd-navbar-toggle"
						data-rd-navbar-toggle=".rd-navbar-nav-wrap">
						<span></span>
					</button>
					<!-- RD Navbar Brand-->
					<div class="rd-navbar-brand">
						<a class="brand-name" href="/"><img
							src="/verstka/1/image/fola_logo.png" alt="" width="140"
							height="44" /></a>
					</div>
				</div>
				<!-- RD Navbar Nav-->
				<div class="rd-navbar-nav-wrap rd-navbar-search_not-collapsable">
					<ul class="rd-navbar-items-list rd-navbar-search_collapsable">
						<li>
							<button class="rd-navbar-search__toggle rd-navbar-fixed--hidden"
								data-rd-navbar-toggle=".rd-navbar-search-wrap"></button>
						</li>
						<li class="rd-navbar-nav-wrap__shop"><a
							class="icon icon-md linear-icon-cart link-primary"
							href="/pages/cart/"></a></li>
					</ul>
					<!-- RD Search-->
					<div
						class="rd-navbar-search rd-navbar-search_toggled rd-navbar-search_not-collapsable">
						<form class="rd-search" action="search-results.html" method="GET"
							data-search-live="rd-search-results-live">
							<div class="form-wrap">
								<input class="form-input" id="rd-navbar-search-form-input"
									type="text" name="s" autocomplete="off"> <label
									class="form-label" for="rd-navbar-search-form-input">Enter
									keyword</label>
								<div class="rd-search-results-live" id="rd-search-results-live"></div>
							</div>
							<button class="rd-search__submit" type="submit"></button>
						</form>
						<div class="rd-navbar-fixed--hidden">
							<button class="rd-navbar-search__toggle"
								data-custom-toggle=".rd-navbar-search-wrap"
								data-custom-toggle-disable-on-blur="true"></button>
						</div>
					</div>
					{include file='fola/menu.tpl'}
				</div>
			</div>
		</nav>
	</div>
</header>