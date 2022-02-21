<?php
function SqlCatalogPriceCall($aData)
{
	$sWhere.=$aData['where'];
	
	if ($aData['id']) {
	    $sWhere.=" and cp.id ='".$aData['id']."' ";
	}
	
	if($aData['aItemCode']) {
    	$inItemCode = "'".implode("','",$aData['aItemCode'])."'";
    	$sWhere.=" and cp.item_code in (".$inItemCode.")";
	}
	
	if($aData['id_price_group']){
	    $sWhere.=" and prg.id='".$aData['id_price_group']."' ";
	}
	
	if($aData['order']){
	    $sOrder.=" order by ".$aData['order']." ";
	}
	    
    $sSql="select cp.* ,pgs.id_price_group, cp.id as id_cat_part, prg.code_name as price_group_code_name, prg.name as price_group_name
        from cat_part as cp
        join price_group_assign as pgs on cp.item_code=pgs.item_code
        join price_group as prg on prg.id=pgs.id_price_group
        where 1=1  ".$sWhere.$sOrder;
    
	return $sSql;
}
?>