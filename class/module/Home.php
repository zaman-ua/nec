<?php
/**
 * @author Mikhail Starovoyt
 */

class Home extends Base
{
	//-----------------------------------------------------------------------------------------------
	public function Index()
	{
		Base::$bXajaxPresent=true; 

		Content::LoadBanners();
		PriceGroup::GetMain();
		
		$aAllProducts=Db::GetAll("select 
    	       cp.*, cp.id as id_cat_part, pg.code_name 
    	    from cat_part as cp
		    join price_group_assign as pgs on cp.item_code=pgs.item_code
		    join price_group as pg on pgs.id_price_group=pg.id
		    where cp.product_label <> ''
	    ");
		if($aAllProducts) {
		    PriceGroup::CallParse($aAllProducts);
		}
		Base::$tpl->assign('aAllProducts',$aAllProducts);
		
//        Base::$sText.=Base::$tpl->fetch("home/catalog.tpl");

        Base::$sText='';

        Base::$sText.=Base::$tpl->fetch('nec/banner.tpl');

        //Base::$sText.=Base::$tpl->fetch('nec/content1.tpl');
        Base::$sText.=Base::$tpl->fetch('nec/content2.tpl');
        Base::$sText.=Base::$tpl->fetch('nec/content3.tpl');
        Base::$sText.=Base::$tpl->fetch('nec/youtube.tpl');

        Base::$sText.=Base::$tpl->fetch('nec/content4.tpl');
	}
	//-----------------------------------------------------------------------------------------------
	public function GetPopularProducts() {
		$aPopularProducts=Db::GetAll("select * from popular_products where visible=1 ORDER BY RAND()  ");
		
		if($aPopularProducts) foreach ($aPopularProducts as $sKey => $aData){
		    $sSql=Base::GetSql('Catalog/Price',array(
			    'customer_discount'=>Discount::CustomerDiscount(Auth::$aUser),
			    'sId'=>str_replace("ZZZ_", '', $aData['zzz_code'])
			));
		    $sSql=str_replace("and 0=1", '', $sSql);
			$aPrice=Db::GetRow($sSql);
			
			if($aPrice) {
				if($aPrice['price']>0) {
					$aPopularProducts[$sKey]['price']=$aPrice['price'];
					$aPopularProducts[$sKey]['item_code']=$aPrice['item_code'];
					$aPopularProducts[$sKey]['id_provider']=$aPrice['id_provider'];
					$aPopularProducts[$sKey]['cat_name']=$aPrice['cat_name'];
					$aPopularProducts[$sKey]['code']=$aPrice['code_'];
					Db::Execute("update popular_products set visible=1 where visible=0 and id='".$aData['id']."' ");
				}
				else {
					Db::Execute("update popular_products set visible=0 where id='".$aData['id']."' ");
					unset($aPopularProducts[$sKey]);
				}
			} else {
				Db::Execute("update popular_products set visible=0 where id='".$aData['id']."' ");
				unset($aPopularProducts[$sKey]);
			}
		}
		$aCode=array();
		if($aPopularProducts) foreach ($aPopularProducts as $aValue){
		    $sCode=0;
		    $sPref=0;
		    list($sPref,$sCode)=explode("_", $aValue['item_code']);
		    
		    $aCode[]=$sCode;
		}
		$aCode=array_unique($aCode);
		$sCodes="'".implode("','", $aCode)."'";
		
		if ($aPopularProducts) {
		    foreach ($aPopularProducts as $sKey => $aValue) {
		        if(!$aValue['image']) $aPopularProducts[$sKey]['image']=$aArtIds[$aValue['item_code']]['img_path'];
		        $aPopularProducts[$sKey]['url']="/buy/".$aValue['cat_name']."_".$aValue['code'];
		    }
		}
		Base::$tpl->assign('aPopularProducts',$aPopularProducts);
		
		return Base::$tpl->fetch("index_include/popular_products.tpl");
	}
	//-----------------------------------------------------------------------------------------------
	public function GetLastViewedProducts()
	{
		if (Auth::$aUser['id'])
		{
			$sSql="select distinct psl.pref, psl.code from price_search_log as psl where psl.id_user='".Auth::$aUser['id']."'  order by post_date desc limit 0,".Base::GetConstant('last_viewed_products_limit',10);
		}
		else
		{
			$sSql="select distinct psl.pref, psl.code from price_search_log as psl where psl.id_session='".session_id()."' order by post_date desc limit 0,".Base::GetConstant('last_viewed_products_limit',10);
		}
		$aLastViewedProducts=Db::GetAll($sSql);
		if($aLastViewedProducts) {
			foreach ($aLastViewedProducts as $sKey => $aValue) {
				$aPrice=Db::GetRow(Base::GetSql('Catalog/Price',array(
				'aItemCode'=>array($aValue['pref']."_".$aValue['code'])
				, 'customer_discount'=>Discount::CustomerDiscount(Auth::$aUser)
				)));
				
				if($aPrice) $aLastViewedProducts[$sKey]=$aPrice;
				else unset($aLastViewedProducts[$sKey]);
			}
			
			//select images
			$aCode=array();
			if ($aLastViewedProducts) {
				foreach ($aLastViewedProducts as $sKey => $aValue) {
					if($aValue['code']) $aCode[]=$aValue['code'];
				}
			}
			$aCode=array_unique($aCode);
			$sCodes="'".implode("','", $aCode)."'";
				
			$aArtIds=TecdocDb::GetImages(array('codes'=>$sCodes));
			if ($aLastViewedProducts) {
				foreach ($aLastViewedProducts as $sKey => $aValue) {
					$aLastViewedProducts[$sKey]['image']=$aArtIds[$aValue['item_code']];
				}
			}
			
			Base::$tpl->assign('aProducts',$aLastViewedProducts);
			return Base::$tpl->fetch('home/last_viewed_products.tpl');
		}
		else return false;
	}
	//-----------------------------------------------------------------------------------------------
}
?>