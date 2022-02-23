<div class="row">
	<form enctype="multipart/form-data" id="redProductForm" action="javascript:void(null);" onsubmit="xajax_process_form(xajax.getFormValues(this));return false;">
	<input type="hidden" name="action" value="manager_edit_product_submit">
	<input type="hidden" name="product[id]" value="{$aProduct.id}" id="id_product">
	<input type="hidden" name="product[item_code]" value="{$aProduct.item_code}">
		<div class="col-sm-6">
			<div class="row">
				<div class="col-sm-5 text-right">
					<p>Артикул *</p>
				</div>
				<div class="col-sm-7">
					<p>
						<input type="text" id="codeRed" name="product[code]" value="{$aProduct.code}">
					</p>
				</div>
				<div class="clearfix"></div>
				<div class="col-sm-5 text-right">
					<p>Цена *</p>
				</div>
				<div class="col-sm-7">
					<p>
						<input type="text" id="priceRed" name="product[price]" value="{$aProduct.price}">
					</p>
				</div>
				<div class="clearfix"></div>
				<div class="col-sm-5 text-right">
					<p>Наименование продукта *</p>
				</div>
				<div class="col-sm-7">
					<p>
						<input type="text" id="nameRed" name="product[name]" value="{$aProduct.name}">
					</p>
				</div>
				<div class="clearfix"></div>
				<div class="col-sm-5 text-right">
					<p>Краткое описание продукта *</p>
				</div>
				<div class="col-sm-7">
					<p>
						<input type="text" id="descrRed" name="product[information]"
							value="{$aProduct.information}">
					</p>
				</div>
				<div class="clearfix"></div>
				<div class="col-sm-5 text-right">
					<p>Полное описание продукта *</p>
				</div>
				<div class="col-sm-7">
					<p>
						<textarea name="product[description]" id="fullDescrRed">{$aProduct.description}</textarea>
					</p>
				</div>
				<div class="clearfix"></div>
				<div class="col-sm-5 text-right">
					<p>Категория товара *</p>
				</div>
				<div class="col-sm-7">
					<p>
						<select name="product[category]">
						{foreach from=$aGroups key=sKeyGroup item=sGroupName}
			            <option value="{$sKeyGroup}" {if $aProduct.id_price_group==$sKeyGroup}selected=""{/if}>{$sGroupName}</option>
			            {/foreach}
						</select>
					</p>
				</div>
				<div class="clearfix"></div>
				<div class="col-sm-5 text-right">
					<p>Родительский товар</p>
				</div>
				<div class="col-sm-7">
					<p>
						<select name="product[id_parent]">
			            <option value="0" {if $aProduct.id_parent==0}selected=""{/if}>-- не выбрано --</option>
						{foreach from=$aParentProducts key=sKeyParentProducts item=sParentProductsName}
			            <option value="{$sKeyParentProducts}" {if $aProduct.id_parent==$sKeyParentProducts}selected=""{/if}>{$sParentProductsName}</option>
			            {/foreach}
						</select>
					</p>
				</div>
				<div class="clearfix"></div>
				<div class="col-sm-5 text-right">
					<p>Отображение продукта в каталоге</p>
				</div>
				<div class="col-sm-7">
					<p>
					    <input type="hidden" name="product[is_show]" value="0">
					    <input type="checkbox" name="product[is_show]" value="1" {if $aProduct.is_show}checked="checked"{/if}>
					</p>
				</div>
				<div class="clearfix"></div>
                <div class="col-sm-5 text-right">
					<p>Пометка товара *</p>
				</div>
				<div class="col-sm-7">
					<p>
						<select name="product[product_label]">
			                 <option value="" {if !$aProduct.product_label}selected=""{/if}>Без пометки</option>
			                 <option value="featured" {if $aProduct.product_label=='featured'}selected=""{/if}>{$oLanguage->GetMessage('product_label:Featured')}</option>
			                 <option value="new" {if $aProduct.product_label=='new'}selected=""{/if}>{$oLanguage->GetMessage('product_label:New')}</option>
			                 <option value="sale" {if $aProduct.product_label=='sale'}selected=""{/if}>{$oLanguage->GetMessage('product_label:Sale')}</option>
						</select>
					</p>
				</div>
				<div class="clearfix"></div>
				<div class="col-sm-5 text-right">
					<p>Код видео YouTube *</p>
				</div>
				<div class="col-sm-7">
					<p>
						<input type="text" id="fullVideo" name="product[video]"
							   value="{$aProduct.video}">
					</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="row">
				<div class="col-sm-12">
					<p class="important_p" style="text-align: center;">
						Фото 1 - главное.<br>Для
						смены фотографии просто выберите другую фотографию
					</p>
				</div>
				<div class="clearfix"></div>
				<div id="inputsPhotoRed">
				{foreach from=$aGraphic item=aRowImage key=iKeyPhoto}
					<div class="col-sm-3 text-right">
						<p>Фото {$iKeyPhoto} *</p>
					</div>
					<div class="col-sm-9">
					<form id="formUploadImage{$iKeyPhoto}" action="/single/file_upload.php?id_product=document.getElementById('id_product').value()" method="post" enctype="multipart/form-data" target="iframe_photo_upload" >
						<div>
							<img src="{$aRowImage.image}" style="width: 100%;" id="photo{$iKeyPhoto}RedPr"> 
							<input class="photoRed" id="photo{$iKeyPhoto}Red" name="photo" type="file" accept="image/*" 
								onchange="document.getElementById('formUploadImage{$iKeyPhoto}').submit()">
							
							<input class="deletePhotoRed delete_button" type="button" name="deletePhoto{$iKeyPhoto}" value="Удалить изображение"
							onclick="xajax_process_browse_url('?action=manager_delete_pic&id={$aRowImage.id}'); return false;">
						</div>
					</form>
					</div>
					<div class="clearfix"></div>
				{/foreach}
				<iframe name="iframe_photo_upload" style="display: none;"></iframe>
				</div>
				<div style='text-align: center;'>
					<p class='btn btn-primary' id='addNewPhotoRed'>Добавить еще фотографию</p>
					<div class='clearfix'></div>
				</div>
				<div class="col-sm-12">
					<p>
						<b>Характеристики продукта</b>
					</p>
				</div>
				<div class="col-sm-4">Свойство</div>
				<div class="col-sm-6">Значение</div>
				<div class="col-sm-2"></div>
				<div class="col-sm-12" id="charactrRed">
				{foreach from=$aCriteria item=aRowCriteria key=iKeyCriteria}
					<div class="row line_settings charrrrRed">
						<div class="col-sm-4">
							<input type="text" class="chareRed" id="chareRed{$iKeyCriteria}" name="criteria[{$iKeyCriteria}][name]"
								placeholder="Размер" value="{$aRowCriteria.name}">
						</div>
						<div class="col-sm-6">
							<input type="text" class="valueRed" id="valueRed{$iKeyCriteria}" name="criteria[{$iKeyCriteria}][code]"
								placeholder="100x100" value="{$aRowCriteria.code}">
						</div>
						<div class="col-sm-2" id="delCharactrRed" onclick="xajax_process_browse_url('?action=manager_delete_criteria&id={$aRowCriteria.id}'); return false;">
							<i class="fa fa-minus-circle" aria-hidden="true"></i>
						</div>
					</div>
				{/foreach}
				</div>
				<div class="col-sm-12 addCharRed">
					Добавить свойство <i class="fa fa-plus-square" aria-hidden="true"></i>
				</div>
				<div class="col-sm-12 bottom_zero">
					<p class="important_p text-right">Поля отмечены звездочкой
						обязательны для заполнения</p>
				</div>
				<div class="col-sm-12">
					<button type="submit" class="my_button redBtnUp">РЕДАКТИРОВАТЬ</button>
				</div>
				{if $aProduct.id}
				<div class="col-sm-12 bottom_zero">
					<p class="important_p text-right">Продукт удаляется без
						возможности восстановления</p>
				</div>
				<div class="col-sm-12">
					<a class="my_button delete_button" href="#modal">УДАЛИТЬ</a>
					<input type="hidden" name="id_delete_product" id="id_delete_product" value="{$aProduct.id}">
				</div>
				{/if}
			</div>
		</div>
	</form>
</div>