<h2>Добавить продукт</h2>
<div class="row">
    <form action="php/addProduct.php" enctype="multipart/form-data" id="addProductForm">
        <div class="col-sm-6">
            <div class="row">
                <div class="col-sm-5 text-right">
                    <p>Наименование продукта *</p>
                </div>
                <div class="col-sm-7">
                    <p>
                        <input type="text" id="name" name="name">
                    </p>
                </div>
                <div class="clearfix"></div>
                <div class="col-sm-5 text-right">
                    <p>Краткое описание продукта *</p>
                </div>
                <div class="col-sm-7">
                    <p>
                        <input type="text" id="descr" name="descr">
                    </p>
                </div>
                <div class="clearfix"></div>
                <div class="col-sm-5 text-right">
                    <p>Полное описание продукта *</p>
                </div>
                <div class="col-sm-7">
                    <p>
                        <textarea name="fullDescr" id="fullDescr"></textarea>
                    </p>
                </div>
                <div class="clearfix"></div>
                <div class="col-sm-5 text-right">
                    <p>Категория товара *</p>
                </div>
                <div class="col-sm-7">
                    <p>
                        <select name="category">
                            <option value="thrsofa">Трехместные диваны</option>
                            <option value="angsofa">Угловые диваны</option>
                            <option value="bad">Кровати</option>
                            <option value="angles">Кухонный уголок</option>
                            <option value="chairs">Кресла и пуфы</option>
                        </select>
                    </p>
                </div>
                <div class="clearfix"></div>

            </div>
        </div>
        <div class="col-sm-6">
            <div class="row">
                <div class="col-sm-12">
                    <p class='important_p' style='text-align: center;'>Рекомендуемый размер фото 370x125 px. Фото 1 - главное.
                           </div>
                           <div class="clearfix"></div>

<div id="inputsPhoto">
	<div class="col-sm-3 text-right">
		<p>Фото 1 *</p>
	</div>
	<div class="col-sm-9">
		<p>
			<input class="photo" id="photo1" name="photo1" type="file" accept="image/*">
	</div>
	<div class="clearfix"></div>
	<div class="col-sm-3 text-right">
		<p>Фото 2 *</p>
	</div>
	<div class="col-sm-9">
		<p>
			<input class="photo" id="photo2" name="photo2" type="file" accept="image/*">
	</div>
	<div class="clearfix"></div>
	<div class="col-sm-3 text-right">
		<p>Фото 3 *</p>
	</div>
	<div class="col-sm-9">
		<p>
			<input class="photo" id="photo3" name="photo3" type="file" accept="image/*">
	</div>
	<div class="clearfix"></div>
</div>

<div style="text-align: center;">
	<p class="btn btn-primary" id="addNewPhoto">Добавить еще фотографию</p>
	<div class="clearfix"></div>
</div>
                           <div class="col-sm-12">
                               <p><b>Характеристики продукта</b></p>
                           </div>
                           <div class="col-sm-4">Свойство</div>
                           <div class="col-sm-6">Значение</div>
                           <div class="col-sm-2"></div>
                           <div class="col-sm-12" id="charactr">
                               <div class="row line_settings charrrr">
                                   <div class="col-sm-4">
                                       <input type="text" placeholder="Размер" class="chare" id="chare1" name="chare1">
                                   </div>
                                   <div class="col-sm-6">
                                       <input type="text" placeholder="100x100" class="value" id="value1" name="value1">
                                   </div>
                                   <div class="col-sm-2" id="delCharactr"><i class="fa fa-minus-circle" aria-hidden="true"></i></div>
                               </div>
                           </div>
                           <div class="col-sm-12 addChar">Добавить свойство <i class="fa fa-plus-square" aria-hidden="true"></i></div>
                           <div class="col-sm-12 bottom_zero">
                               <p class="important_p text-right">Поля отмечены звездочкой обязательны для заполнения</p>
                           </div>
                           <div class="col-sm-12">
                               <button type="submit" class="my_button btn_public">ОПУБЛИКОВАТЬ</button>
                           </div>
                       </div>
                   </div>
               </form>
           </div>