<?php
/**
 * @author Oleksandr Starovoit
 * @author Mikhail Starovoyt
 * @author Yuriy Korzun
 * @version 4.5.2
 */

class PriceGroup extends Catalog
{
	var $sPrefix="price_group";

	//-----------------------------------------------------------------------------------------------
	public function __construct()
	{

	}
	//-----------------------------------------------------------------------------------------------
	public function Index()
	{
		Base::$bXajaxPresent=true;
		Base::$tpl->assign('sBaseAction',$this->sPrefix);

		if (!Base::$aRequest["category"]) {
			Base::Redirect("/");
		}elseif (Base::$aRequest["category"]){
			$aRowPriceGroup=Db::GetRow(Base::GetSql("Price/Group",array(
			'code_name'=>Base::$aRequest["category"]?Base::$aRequest["category"]:-1,
			'visible'=>1,
			)));
			
			if (!$aRowPriceGroup) {
				Form::Error404(true);
			}
			Base::$tpl->assign('aPriceGroup', $aRowPriceGroup);
// 			Base::$tpl->assign('bNoIndexNofollow',$bNoIndexNofollow);
			
			if ($aRowPriceGroup['description']) {
				Base::$tpl->assign('sSmartyTemplate', $aRowPriceGroup['description']);
				Base::$tpl->assign('sDescription',Base::$tpl->fetch('addon/smarty_template.tpl'));
			}
			
			Base::$aData['template']['sPageH1'] = $aRowPriceGroup['name'];

			if ($aRowPriceGroup['title']) {
				Base::$tpl->assign('sSmartyTemplate', $aRowPriceGroup['title']);
				Base::$aData['template']['sPageTitle'] = Base::$tpl->fetch('addon/smarty_template.tpl');
			}
			if ($aRowPriceGroup['page_description']) {
				Base::$tpl->assign('sSmartyTemplate', $aRowPriceGroup['page_description']);
				Base::$aData['template']['sPageDescription'] = Base::$tpl->fetch('addon/smarty_template.tpl');
			}
			if ($aRowPriceGroup['page_keyword']) {
				Base::$tpl->assign('sSmartyTemplate', $aRowPriceGroup['page_keyword']);
				Base::$aData['template']['sPageKeyword'] = Base::$tpl->fetch('addon/smarty_template.tpl');
			}
			
			if ($aRowPriceGroup['is_product_list_visible']){
// 				$oTable=new Table();

			    Base::$oContent->AddCrumb($aRowPriceGroup['name'],'');
				
				$aDataForTable=Db::GetAll($sSql=Base::GetSql("Catalog/Price",array(
				"customer_discount"=>Discount::CustomerDiscount(Auth::$aUser),
				"id_price_group"=>$aRowPriceGroup['id'],
				"where"=>" and is_show='1' ",
				"order"=>" if(cp.product_label<>'',1,0) desc, cp.post_date desc "
				))." limit 1000");
				$this->CallParse($aDataForTable);
				
// 				$oTable->sType='array';
// 				$oTable->aDataFoTable=$aDataForTable;

// 				$oTable->iRowPerPage=Language::getConstant('price_group:limit_page_items',25);
// 				$oTable->iStartStep=1;
// 				$oTable->bStepperVisible=false;
				
// 			    $oTable->sTemplateName = 'price_group/table.tpl';
// 			    $oTable->sDataTemplate='price_group/row_price_group.tpl';
// 			    $oTable->iRowPerPage=1000;

// 				Base::$sText.=$oTable->GetTable();

				Base::$tpl->assign('aDataForTable',$aDataForTable);
				Base::$sText=Base::$tpl->fetch('fola/catalog_list.tpl');
			}
			if ($aRowPriceGroup['bottom_text'] && !Base::$aRequest["brand"] && !Base::$aRequest["step"]) {
				Base::$tpl->assign('sSmartyTemplate', $aRowPriceGroup['bottom_text']);
				Base::$sText.=Base::$tpl->fetch('addon/smarty_template.tpl');
			}
		}
				
	}

	//-----------------------------------------------------------------------------------------------
	public function CallParse(&$aItem)
	{
		if($aItem) {
		    foreach ($aItem as $sKey => $aValue) {
		        $aItem[$sKey]['images']=Db::GetAll("select * from cat_pic where id_cat_part='".$aValue['id_cat_part']."' ");
		        $aItem[$sKey]['criteria']=Db::GetAll("select * from cat_info where id_cat_part='".$aValue['id_cat_part']."' ");
		    }
		}
	}
	//-----------------------------------------------------------------------------------------------
	public function GetTabs(){
		$aData=array(
				'table'=>'price_group',
				'where'=>" and t.level=0 and t.visible=1 and t.is_menu=1 order by t.sort",
		);
		$aGroups=Base::$language->GetLocalizedAll($aData);
	    if($aGroups) {
    		foreach ($aGroups as $sBaseKey => $aBaseValue){
    			$aData=array(
    					'table'=>'price_group',
    					'where'=>" and t.level=1 and t.id_parent='".$aBaseValue['id']."' and t.visible=1 order by t.sort",
    			);
    			$aGroups[$sBaseKey]['childs']=Base::$language->GetLocalizedAll($aData);
    			if ($aGroups[$sBaseKey]['childs'])
    			foreach ($aGroups[$sBaseKey]['childs'] as $sKey => $aValue){
    				$aData=array(
    						'table'=>'price_group',
    						'where'=>" and t.level=2 and t.id_parent='".$aValue['id']."' and t.visible=1 order by t.sort",
    				);
    				$aGroups[$sBaseKey]['childs'][$sKey]['childs']=Base::$language->GetLocalizedAll($aData);
    			}
    		}
	    }
		
		Base::$tpl->assign('aGroups', $aGroups);
	}
	//-----------------------------------------------------------------------------------------------
	public function GetMain(){
	    $aData=array(
	        'table'=>'price_group',
	        'where'=>" and t.level=1 and t.visible=1  order by t.sort",
	    );
	    $aGroups=Base::$language->GetLocalizedAll($aData);
	    if($aGroups) {
	        foreach ($aGroups as $sBaseKey => $aBaseValue){
	            $aChilds=Db::GetAll("
	                select cp.* ,cp.id as id_cat_part, pg.code_name as price_group_code_name
    			    from cat_part as cp
    			    join price_group_assign as pgs on cp.item_code=pgs.item_code and pgs.id_price_group='".$aBaseValue['id']."'
    			    join price_group as pg on pgs.id_price_group=pg.id
    			    where 1=1
                ");
	            PriceGroup::CallParse($aChilds);
	            
	            $aGroups[$sBaseKey]['childs']=$aChilds;
	        }
	    }
	
	    Base::$tpl->assign('aMainGroups', $aGroups);
	}
	//-----------------------------------------------------------------------------------------------
}
?>