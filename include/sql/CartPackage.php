<?php
function SqlCartPackageCall($aData)
{
	$dTax=Base::GetConstant("price:tax", 19.6)/100;
	$sWhere.=$aData['where'];
	$sJoin.=$aData['join'];

	if ($aData['id'] && is_array($aData['id'])) {
		$sWhere.=" and cp.id in (".implode(",",$aData['id']).")";
	} elseif ($aData['id']) {
		$sWhere.=" and cp.id='".$aData['id']."'";
	}

	if ($aData['order_status'])
	{
		$sWhere.=" and cp.order_status='".$aData['order_status']."'";
	}

	if ($aData['id_user'])
	{
		$sWhere.=" and cp.id_user='".$aData['id_user']."'";
	}

	$sSql="select u.type_, u.login, u.email
			, uc.*
			, cp.*, round((cp.price_total-cp.price_delivery)/(1+".$dTax."),2) as price_total_without_ttc
			, round(cp.price_total-cp.price_delivery-(cp.price_total-cp.price_delivery)/(1+".$dTax."),2) as price_ttc
			, round(cp.price_total-cp.price_delivery,2) as price_cart_ttc
			, round(".$dTax."*100,2) as tax
			, ".DateFormat::GetSqlDate("cp.post_date")." as date_bill
			, uc.zip, uc.address, uc.city, uc.phone, uc.phone2, uc.name
			from cart_package cp
			inner join user as u on cp.id_user=u.id
			inner join user_customer as uc on u.id=uc.id_user
				".$sJoin."
			where 1=1
				".$sWhere."
			group by cp.id";

	return $sSql;
}
?>