<?php
function SqlCatPartCall($aData)
{
	$sWhere.=$aData['where'];
	$sGroup = "";
	if ($aData['id']) {
		$sWhere.=" and cp.id='{$aData['id']}'";
	}

	if ($aData['pref']) {
		$sWhere.=" and cp.pref='{$aData['pref']}'";
	}

	if ($aData['code']) {
		$sWhere.=" and cp.code='{$aData['code']}'";
	}
	
	if ($aData['item_code']) {
		$sWhere.=" and cp.item_code='".$aData['item_code']."'";
	}

	if ($aData['weight_log']) {
		$sField=" , cpw.weight as cpw_weight , cpw.post_date as cpw_post_date, cpw.name_rus as cpw_name_rus
					, cpw.comment as cpw_comment
					, u.login as u_login ";
		$sJoin=" inner join cat_part_weight as cpw on cp.id=cpw.id_cat_part
				 inner join user as u on cpw.id_user=u.id
		";

		if ($aData['comment']) {
			$sWhere.=" and cpw.comment like '%".$aData['comment']."%'";
		}
	}

	if($aData['price_not_null']){
		$sJoin = "
			inner join price as p on cp.item_code=p.item_code and p.price>0
		";
		$sGroup = " group by p.item_code ";
	}

	$sSql="select cp.*, cp.id as id_cat_part, pga.id_price_group as id_price_group, pg.name as price_group_name, c.title as brand, pg.code as code_price_group
		".$sField."
	from cat_part as cp
	left join cat as c on cp.pref=c.pref
	left join price_group_assign as pga on cp.item_code=pga.item_code
	left join price_group as pg on pga.id_price_group=pg.id
		".$sJoin."
	where 1=1
		".$sWhere.$sGroup;
	;

	return $sSql;
}
?>