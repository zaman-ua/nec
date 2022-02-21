<!-- Swiper-->
<section>
	<div class="swiper-container swiper-slider" data-simulate-touch="false" data-loop="false" data-autoplay="false">
		<div class="swiper-wrapper">
			{foreach from=$aBanner item=aCurrentBanner name=bannerForeach}
			<div class="swiper-slide bg-gray-lighter"
				data-slide-bg="{$aCurrentBanner.image}">
				<div class="swiper-slide-caption text-center">
					<div class="container">
						<div class="row justify-content-md-center">
							<div class="col-md-12">
								<div class="swiper-decor">
									<h1 data-caption-animate="fadeInUpSmall">
										<span>{$aCurrentBanner.description}</span>
									</h1>
								</div>
								<!--h4(data-caption-animate='fadeInUpSmall') Best lighting for Your Kids’ Room is Now on Sale!-->
								<!--h2(data-caption-animate='fadeInUpSmall', data-caption-delay='200')-->
								<!--  | Up to 50% off!-->
								<!--a.button.button-primary(data-caption-animate='fadeInUpSmall', data-caption-delay='350', href='catalog-grid.html') SHOP NOW!-->
							</div>
						</div>
					</div>
				</div>
			</div>
			{/foreach}
		</div>
		<!-- Swiper Pagination-->
		<div class="swiper-pagination"></div>
		<!-- Swiper Navigation-->
		<div class="swiper-button-prev linear-icon-chevron-left"></div>
		<div class="swiper-button-next linear-icon-chevron-right"></div>
	</div>
</section>