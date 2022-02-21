<?php
/**
 * @author Aleksandr Starovoyt
 */
class Catalog extends Base
{
	var $sPrefix="catalog";
	var $sPref;
	var $aCode=array();
	var $aCodeCross=array();
	var $aItemCodeCross=array();
	var $aExt=array(1=>"bmp", 2=>'pdf', 3=>'jpg', 4=>'jpg', 5=>'png');
	var $sPathToFile="/imgbank/";
	var $bShowSeparator=true;
	
	var $aCat=array();
	var $aCats=array();
	var $aModel=array();
	var $aModelDetail=array();
	//-----------------------------------------------------------------------------------------------
	public function __construct()
	{
	}
	//-----------------------------------------------------------------------------------------------
	public function Index()
	{
	}
	//-----------------------------------------------------------------------------------------------
	public function PrintPartName($aRow) {
	    return $aRow['name'];
	}
	//-----------------------------------------------------------------------------------------------
	public function GetNavigator($aData,$sCrumb = '')
	{
		$aNavigator['id_make']=array();
		$aNavigator['id_model']=array();
		$aNavigator['id_model_detail']=array();
		if(!$aData['id_make'] && $aData['id_model']){		
			if (Base::$aRequest['cat']){
				$aData['id_make']=Db::GetOne("select id from cat where name='".Base::$aRequest['cat']."' ");
				Base::$aRequest['data']['id_make']=$aData['id_make'];
			}
		}
		foreach ($aNavigator as $sKey => $aValue) {
			if ($aData[$sKey])
			{
				if (Language::getConstant('global:url_is_lower',0) == 1) {
					$sUrl = mb_strtolower($sUrl,'utf-8');
					$sAction = mb_strtolower($sAction,'utf-8');
				}
				if (Language::getConstant('global:url_is_not_last_slash',0) == 1) {
					if (mb_substr($sUrl, -1, 1, 'utf-8') == "/")
						$sUrl = substr($sUrl, 0, -1);					
					if (mb_substr($sAction, -1, 1, 'utf-8') == "/")
						$sUrl = substr($sAction, 0, -1);
				}
					
				$aNavigator[$sKey]['name']=$aRow['name'];
				$aNavigator[$sKey]['action']=$sAction;
				$aNavigator[$sKey]['url']=$sUrl;
				$sAction = $sUrl = '';
			}
		}
		if($sCrumb) {
		    $aNavigator[]=array(
		        'name'=>$sCrumb
		    );
		}
		Base::$tpl->assign('aNavigator',$aNavigator);

// 		Base::$aData['template']['sPageTitle']=Language::getMessage('navigator title').
// 		strip_tags(Base::$tpl->fetch("catalog/navigator.tpl"));
// 		Base::$tpl->assign("sCatalogNavigator", Base::$tpl->fetch ("catalog/navigator.tpl"));
	}
	//-----------------------------------------------------------------------------------------------
	/**
	 * Remove ' ','-','#','.','/',',','_',':','[',']','(',')','*','&','+' from code and UPER
	 *
	 * @param string $sCode
	 * @return string
	 */
	public static function StripCode($sCode)
	{
		return strtoupper(str_replace(array('=',' ','-','#','.','/',',','_',':','[',']','(',')','*','&','+','`','\'','"','\\',' ', '%'),"",trim($sCode)));
	}
	//-----------------------------------------------------------------------------------------------
	public static function StripLogin($sCode)
	{
		return str_replace(array(' ','#','.','/',',','_',':','[',']','(',')','*','&','+','`','\'','"','\\'),"",trim($sCode));
	}
	//-----------------------------------------------------------------------------------------------
	/* not del space and not upper symbols*/
	public static function StripCodeSearch($sCode)
	{
		return str_replace(array('%','-','#','.','/',',','_',':','[',']','(',')','*','&','+','`','\'','"','\\'),"",trim($sCode));
	}
	
	/**
	 * Add sql replace
	 *
	 * @param string $sField
	 * @return string Sql
	 */
	public static function StripCodeSql($sField)
	{
		return "replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(UPPER(".$sField."),' ',''),'-',''),'#',''),'.',''),'/',''),',',''),'_',''),':',''),'[',''),']',''),'(',''),')',''),'*',''),'&',''),'+',''),'`',''),'\"',''),'\'','') ";
	}
	//-----------------------------------------------------------------------------------------------
	/**
	 * Format code for rule
	 *
	 * @param string $sCode
	 * @param string $sPref
	 * @return string
	 */
	public function GetFormattedCode($sCode,$sPref)
	{
		switch ($sPref) {
			case "TY":
			case "DH":
			case "LS":
				return trim(substr($sCode,0,5)."-".substr($sCode,5,5)."-".substr($sCode,10,5),"-");
				break;
			default:
				return " ".$sCode;
				break;
		}
	}
	//-----------------------------------------------------------------------------------------------
	function ViewInfoPart() {
	    Resource::Get()->Add('/css/owl.carousel.min.css',1);
	    Resource::Get()->Add('/js/owl.carousel.min.js',1);
	    
	    Resource::Get()->Add('/js/jquery.mousewheel-3.0.6.pack.js',1);
	    Resource::Get()->Add('/css/jquery.fancybox.css',1);
	    Resource::Get()->Add('/js/jquery.fancybox.pack.js',1);
	    Resource::Get()->Add('/css/jquery.fancybox-buttons.css',1);
	    Resource::Get()->Add('/js/jquery.fancybox-buttons.js',1);
	    Resource::Get()->Add('/js/jquery.fancybox-media.js',1);
	    Resource::Get()->Add('/css/jquery.fancybox-thumbs.css',1);
	    Resource::Get()->Add('/js/jquery.fancybox-thumbs.js',1);
	    Resource::Get()->Add('/css/flexslider.css',1);
	    Resource::Get()->Add('/js/jquery.flexslider-min.js',1);
	    
		Base::$bXajaxPresent=true;

		if (Base::$aRequest['id_product']) {
		    $aProduct=Db::GetRow("select * from cat_part where id='".(int)Base::$aRequest['id_product']."' ");
		    if(!$aProduct) {
		        Form::Error404(true);
		    }
		
			$aRow=Db::GetAll(Base::GetSql('Catalog/Price',array(
			'aItemCode'=>array($aProduct['item_code'])
			, 'customer_discount'=>Discount::CustomerDiscount(Auth::$aUser)
			)));

			$this->sPref = $aRow[0]['pref'];
			Base::$tpl->assign('aRowPrice',$aRow[0]);
			// build crumbs
// 			Base::$oContent->AddCrumb(Language::GetMessage('catalog'),'/catalog/');
			if ($aRow[0]['id_price_group'] != 0 && $aRow[0]['price_group_name']!='') {
				Base::$oContent->AddCrumb($aRow[0]['price_group_name'],'/catalog/'.$aRow[0]['price_group_code_name']);
			}
			
			if (!$aPartInfo['item_code'] && $aRow[0]['item_code']) {
				$aPartInfo['item_code']=$aRow[0]['item_code'];
				$aPartInfo['code']=$aRow[0]['code'];
				$aPartInfo['code_name']=$aRow[0]['code'];
				$aPartInfo['pref']=$aRow[0]['pref'];
				$aPartInfo['brand']=$aRow[0]['brand'];
				$aPartInfo['name']=$aRow[0]['name'];
			} elseif($aPartInfo['item_code'] && $aPartInfo['art_id']) {
				$aPartInfo['code_name']=$aPartInfo['code'];
				$aPartInfo['code']=Catalog::StripCode($aPartInfo['code']);
			}
			
			if(!$aPartInfo['cat_name'] && $aPartInfo['pref']) {
			    $aPartInfo['cat_name']=Db::GetOne("select name from cat where pref='".$aPartInfo['pref']."' ");
			}
			
			$oPriceSearchLog=new PriceSearchLog();
			$oPriceSearchLog->AddSearch($aRow[0]['pref'],$aRow[0]['code']);
			
			Base::$tpl->assign('aPartInfo',$aPartInfo);

			Base::$oContent->ShowTimer('BeforeGraphic');

			$aGraphic=Db::GetAll("select * from cat_pic where id_cat_part='".$aProduct['id']."' ");
			Base::$tpl->assign('aGraphic',$aGraphic);

			Base::$oContent->AddCrumb($aPartInfo['name'],'');

			$aCriteria=Db::GetAll("select * from cat_info where id_cat_part='".$aProduct['id']."' ");
			Base::$tpl->assign('aCriteria',$aCriteria);
			
			Content::SetMetaTagsPage('buy:',array(
			    'code' => $aPartInfo['code'],
			    'name' => $aPartInfo['name'],
			    'brand' => $aPartInfo['brand'],
			));
			
			//other products
			$aOtherProducts=Db::GetAll("select cp.* ,cp.id as id_cat_part, pg.code_name as price_group_code_name
			    from cat_part as cp
			    join price_group_assign as pgs on cp.item_code=pgs.item_code and pgs.id_price_group='".$aRow[0]['id_price_group']."'
			    join price_group as pg on pgs.id_price_group=pg.id
			    where cp.id <> '".$aProduct['id']."'
		    ");
			if($aOtherProducts) {
			    PriceGroup::CallParse($aOtherProducts);
			    Base::$tpl->assign('aOtherProducts',$aOtherProducts);
			}
			
			if($aProduct['id_parent']) {
    			$aSubParentProducts=Db::GetAll($sSql=Base::GetSql("Catalog/Price",array(
    			    "customer_discount"=>Discount::CustomerDiscount(Auth::$aUser),
    			    "where"=>" and (cp.id_parent='".$aProduct['id_parent']."' or cp.id='".$aProduct['id_parent']."' ) and cp.id <> '".$aProduct['id']."' ",
    			))." limit 1000");
			} else {
			    $aSubParentProducts=Db::GetAll($sSql=Base::GetSql("Catalog/Price",array(
			        "customer_discount"=>Discount::CustomerDiscount(Auth::$aUser),
			        "where"=>" and (cp.id_parent='".$aProduct['id']."' ) ",
			    ))." limit 1000");
			}
			if($aSubParentProducts) {
			    PriceGroup::CallParse($aSubParentProducts);
			    Base::$tpl->assign('aSubParentProducts',$aSubParentProducts);
			}
			
			Base::$sText.=Base::$tpl->fetch('fola/product.tpl');
		} else {
		    Form::Error404(true);
		}
	}
	//-----------------------------------------------------------------------------------------------
}
?>