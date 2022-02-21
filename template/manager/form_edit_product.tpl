<h2>Редактировать продукт</h2>
<div class="row">
    <div class="col-sm-4"></div>
    <div class="col-sm-2">
        <p>Выберите категорию</p>
        <select id="redCat"  onchange="javascript: xajax_process_browse_url(
'/?action=manager_edit_product_change_category&category='+this.options[this.selectedIndex].value
); return false;">
            <option value="sel" selected disabled>Категория</option>
            {foreach from=$aGroups key=sKeyGroup item=sGroupName}
            <option value="{$sKeyGroup}">{$sGroupName}</option>
            {/foreach}
        </select>
    </div>
    <div class="col-sm-2">
        <p>Выберите продукт</p>
        <select id="redProd">
            <option value="sel" selected disabled>Продукт</option>
        </select>
    </div>
    <div class="col-sm-4"></div>
</div>
<br>
<br>
<br>
<div id="enterHere"></div>