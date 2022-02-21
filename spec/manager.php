<?php


$sPrefix='manager_';
$oObject=new Manager();

switch (Base::$aRequest['action'])
{
	case $sPrefix.'add_product':
		$oObject->AddProduct();
		break;
		
	case $sPrefix.'edit_product':
		$oObject->EditProduct();
		break;
		
	case $sPrefix.'edit_product_submit':
		$oObject->EditProductSubmit();
		break;
		
	case $sPrefix.'edit_product_change_category':
	    $oObject->EditProductChangeCategory();
	    break;
		
	case $sPrefix.'edit_product_change_product':
	    $oObject->EditProductChangeProduct();
	    break;
		
	case $sPrefix.'add_subscribe':
		$oObject->AddSubscribe();
		break;
		
	case $sPrefix.'delete_pic':
		$oObject->DeletePic();
		break;
		
	case $sPrefix.'delete_criteria':
		$oObject->DeleteCriteria();
		break;
		
	case $sPrefix.'delete_product':
		$oObject->DeleteProduct();
		break;
		
	case $sPrefix.'call_me_list':
		$oObject->CallMeList();
		break;
		
	case $sPrefix.'contact_form':
		$oObject->ContactForm();
		break;

	case $sPrefix.'order_print':
		$oObject->PrintOrder();
		break;
		
	default:
		$oObject->Index();
		break;
}


?>