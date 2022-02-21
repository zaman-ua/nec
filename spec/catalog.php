<?php

$oObject=new Catalog();
$sPrefix='catalog_';

switch (Base::$aRequest['action'])
{

	default:
		$oObject->ViewInfoPart();
		break;
}
?>