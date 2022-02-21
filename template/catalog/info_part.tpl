<!-- CATALOG -->
<div class="container catalog_element product_element">
	<div class="row">
		<div class="col-md-11 header_container header_catalog">
			<h4 class="bold_header">{$aRowPrice.name_translate}</h4>
		</div>
		<div class="col-md-1"></div>
	</div>

	<div class="row">
		<div class="col-sm-12 col-md-8">
			<div id="slider" class="flexslider">
				<ul class="slides">
				    {foreach from=$aGraphic item=aImage}
					<li><a class='fancybox' rel='group' href='{$aImage.image}'><img src='{$aImage.image}' /></a></li>
					{/foreach}
				</ul>
			</div>

			<div id="carousel" class="flexslider hidden-xs">
				<ul class="slides">
				    {foreach from=$aGraphic item=aImage}
					<li><img src='{$aImage.image}' /></li>
					{/foreach}
				</ul>
			</div>

{literal}
<script>
    $(window).load(function() {
      // The slider being synced must be initialized first
      $('#carousel').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        itemWidth: 150,
        itemMargin: 5,
        asNavFor: '#slider'
      });

      $('#slider').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        sync: "#carousel"
      });
    });</script>

    <script type="text/javascript">
        $(document).ready(function() {
            $(".fancybox").fancybox();
        });
    </script>
{/literal}

		</div>
		<div class="col-sm-12 col-md-4 text-left info_col_wrap">
			<div class="row">
				<div class="col-sm-12 col-md-12">
					<p class="information_col first_info">Информация</p>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 col-md-7 information_col">Название</div>
				<div class="col-sm-8 col-md-5">{$aRowPrice.name_translate}</div>
			</div>


			{if $aCriteria}
            {foreach from=$aCriteria item=aCrit}
			<div class='row'>
				<div class='col-sm-4 col-md-7 information_col'>{$aCrit.name}</div>
				<div class='col-sm-8 col-md-5'>{$aCrit.code}</div>
			</div>
			{/foreach}
			{/if}
			
<a href="/?action=catalog_manager_edit_name&data[item_code]={$aRowPrice.item_code}">edit name</a>
<br>
<a href="/?action=catalog_manager_edit_pic&data[item_code]={$aPartInfo.item_code}">edit pic</a>
			
			<div class="row button_bottom">
				<div class="col-sm-12 col-md-12">
					<p>
						<button href="" data-remodal-target="modaltr">УЗНАТЬ ЦЕНУ</button>

					</p>
					<!--<p>
                                        <button href="" data-remodal-target="modaltr">ГДЕ КУПИТЬ</button>
                                        
                                    </p>-->
				</div>
			</div>
		</div>
	</div>

	<div class="row text-left product_description">
		<div class="col-md-12" style="text-align: justify;">{$aRowPrice.description}</div>
	</div>
	<div class="row other_products">
		<div class="col-md-12">
			<h2 class="op_header">Другие изделия в этой линейке</h2>
		</div>

		<div class="row">
		{if $aOtherProducts}
			{foreach from=$aOtherProducts item=aOther}
			<div class='col-xs-12 col-sm-4 col-md-2'>
				<a
					href='/product/{$aOther.price_group_code_name}/{$aOther.id_cat_part}'>
					<img src='{$aOther.images.0.image}' alt='' class='img-responsive'>
				</a>
			</div>
			{/foreach}
		{else}Нет других изделий в этой линейке{/if}
		</div>
		
	</div>
</div>