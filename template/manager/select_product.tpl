<select id="redProd" onchange="javascript: xajax_process_browse_url(
'?action=manager_edit_product_change_product&id_product='+this.options[this.selectedIndex].value
); return false;">
    <option value="sel" selected disabled>Продукт</option>
{foreach from=$aProducts key=sKeyProduct item=sProductName}
    <option value="{$sKeyProduct}">{$sProductName}</option>
{/foreach}
</select>