<?php
function SqlConstantCall($aData) {

	$sWhere.=$aData['where'];

	if ($aData['id']) {
		$sWhere.=" and c.id='{$aData['id']}'";
	}

	$sSql="select c.*
			from constant c
			where 1=1 and is_general=0 ".$sWhere."
			group by c.id";

	return $sSql;
}
?>