<?php
function SqlGeneralConstantCall($aData) {

	$sWhere.=$aData['where'];

	if ($aData['id']) {
		$sWhere.=" and c.id='{$aData['id']}'";
	}

	$sSql="select c.*
			from constant c
			where 1=1 and is_general=1 ".$sWhere."
			group by c.id";

	return $sSql;
}
?>