<?php

/**
 * @author Mikhail Starovoyt
 * @author Oleksandr Starovoit
 */

class Manager extends Base
{
	var $sPrefix="manager";
	var $sPrefixAction="";

	//-----------------------------------------------------------------------------------------------
	function __construct()
	{
		Auth::NeedAuth('manager');
		Base::$bXajaxPresent=true;
		
		if(strpos(Base::$aRequest['action'], 'manager')!==false) {
    		Resource::Get()->Add('/css/bootstrap.vertical-tabs.min.css',1);
    		Resource::Get()->Add('/css/style-admin.css',1);
		}
	}
	//-----------------------------------------------------------------------------------------------
	public function Index()
	{
	    if(Base::$aRequest['action']=='manager_package_payed' && Base::$aRequest['id']) {
	        Db::Execute("update cart_package set is_payed='1' where id='".Base::$aRequest['id']."' ");
	        Base::Redirect("/?".Base::$aRequest['return']);
	    }
	    
	    if(Base::$aRequest['action']=='manager_package_confirm' && Base::$aRequest['id']) {
	        Db::Execute("update cart_package set order_status='work' where id='".Base::$aRequest['id']."' ");
	        Base::Redirect("/?".Base::$aRequest['return']);
	    }
	    
	    if(Base::$aRequest['action']=='manager_package_refused' && Base::$aRequest['id']) {
	        Db::Execute("update cart_package set order_status='refused' where id='".Base::$aRequest['id']."' ");
	        Base::Redirect("/?".Base::$aRequest['return']);
	    }
	    
	    if(Base::$aRequest['action']=='manager_package_end' && Base::$aRequest['id']) {
	        Db::Execute("update cart_package set order_status='end' where id='".Base::$aRequest['id']."' ");
	        Base::Redirect("/?".Base::$aRequest['return']);
	    }
	    
	    $oTable=new Table();
	    
	    $oTable->sSql=Base::GetSql('CartPackage',array(
	        'where'=>" and cp.is_archive='0' ".$sWhere.$sWhereManager,
	        'join'=>$sJoin,
	    ));
	    
	    $oTable->aOrdered="order by cp.post_date desc";
	    $oTable->aColumn=array(
	        'id'=>array('sTitle'=>'cartpackage #'),
	        'post'=>array('sTitle'=>'Date/Customer',"sWidth"=>"10%"),
	        'part'=>array('sTitle'=>'Part / Brand [qty] Name',"sWidth"=>"40%"),
	        'order_status'=>array('sTitle'=>'Order Status/<br>Address of delivery', "sWidth"=>"10%"),
	        'price'=>array('sTitle'=>'Price'),
	        'price_total'=>array('sTitle'=>'Total'),
	        'action'=>array(),
	    );
	    $oTable->sDataTemplate='manager/row_package.tpl';
	    $oTable->bCheckVisible=false;
	    $oTable->bHeaderVisible=false;
	    $oTable->bDefaultChecked=false;
	    $oTable->bFormAvailable=false;
	    $oTable->sClass='at-tab-table';
	    $oTable->iRowPerPage=50;
	    $oTable->aCallback=array($this,'CallParsePackage');
	    
	    Base::$sText.= $oTable->getTable();
    }
    //-----------------------------------------------------------------------------------------------
    public function CallParsePackage(&$aItem) {
        if ($aItem) {
            $oCurrency = new Currency();
            foreach($aItem as $sKey => $aValue) {
                $aCart=Db::GetAll(Base::GetSql("Part/Search",array("id_cart_package"=>$aValue["id"])));
    
                if ($aCart) foreach ($aCart as $sKeyItem=> $aCartItem) {
                    if ($aCartItem['order_status']=='reclamation') $aItem[$sKey]['is_reclamation']=1;
                    $aHistory=Base::$db->getAll("select * from cart_log
					where id_cart = ".$aCartItem["id"]);
                    if ($aHistory) foreach($aHistory as $key => $value) {
                        if ($value['is_customer_visible']==0 && !Auth::$aUser['is_super_manager'])
                            continue;
                        $aCart[$sKeyItem]['history'][$value['id']]=$value;
                    }
                    //$aCart[$sKeyItem]['history']=Db::GetAssoc("select cl.* from cart_log as cl	where id_cart = ".$aCartItem["id"]);
                }
                PriceGroup::CallParse($aCart);
                $aItem[$sKey]['aCart']=$aCart;
    
            }
        }
        Base::$tpl->assign('sClass',"at-tab-table");
    }
	//-----------------------------------------------------------------------------------------------
	public function AddProduct()
	{
	    $aGroups=Db::GetAssoc("select id,name from price_group where visible='1' and level='1' ");
	    Base::$tpl->assign('aGroups',$aGroups);
	    
	    $aParentProducts=Db::GetAssoc("select id,name from cat_part where id_parent='0' ");
	    Base::$tpl->assign('aParentProducts',$aParentProducts);
	    
	    Base::$sText.=Base::$tpl->fetch('manager/edit_product.tpl');
	}
	//-----------------------------------------------------------------------------------------------
	public function EditProductSubmit()
	{
	    $aProduct=StringUtils::FilterRequestData(Base::$aRequest['product']);
	    $aCriteria=StringUtils::FilterRequestData(Base::$aRequest['criteria']);
// 	    $aPhoto=StringUtils::FilterRequestData(Base::$aRequest['photo']);
	    

	    if(!$aProduct['id']) {
	        $aProduct['item_code']="AAA_".$aProduct['code'];
	        Db::Execute("insert into cat_part (item_code,code,pref,id_parent) values ('".$aProduct['item_code']."','".$aProduct['code']."','AAA','".$aProduct['id_parent']."') ");
	        $aProduct['id']=Db::InsertId();
	    }
	    
	    if($aProduct['id']) {
	        Db::Execute("insert into price_group_assign (item_code, id_price_group) values ('".$aProduct['item_code']."','".$aProduct['category']."')
	            on duplicate key update id_price_group=values(id_price_group) ");
	        Db::AutoExecute('cat_part', $aProduct, "UPDATE", " id='".$aProduct['id']."' ");
	    }
	    
	    if($aCriteria) {
	        Db::Execute("delete from cat_info where id_cat_part='".$aProduct['id']."' ");
	        foreach ($aCriteria as $iKeyCriteria => $aValueCriteria) {
	            if((string)$iKeyCriteria=='') {
	                continue;
	            }
	            if($aValueCriteria['name'] && $aValueCriteria['code']) {
	                Db::Execute("insert into cat_info (id_cat_part, name, code) values ('".$aProduct['id']."','".$aValueCriteria['name']."','".$aValueCriteria['code']."') ");
	            }
	        }
	    }
	    
	    $aPhoto=unserialize($_COOKIE['chat_file_upload']);
	    if($aPhoto) {
	        foreach ($aPhoto as $sPhotoPath) {
	            if($sPhotoPath) {
	                $uploaddir = '/imgbank/Image/pic/';
	                if (!is_dir(SERVER_PATH.$uploaddir)) {
	                    mkdir(SERVER_PATH.$uploaddir, 0777);
	                }
	                 
	                Db::AutoExecute("cat_pic",array('width'=>150));
	                $id_file=Db::InsertId();
	                 
	                $aFilePart = pathinfo($sPhotoPath);
	                $sFullPath = $uploaddir . $id_file . "_" . $aFilePart['basename'];
	                $file = SERVER_PATH.$sFullPath;
	                 
	                if (rename(SERVER_PATH."/imgbank/temp_upload/".$sPhotoPath, $file)) {
	                    $aData['image']=$sFullPath;
	                    $aData['pic']=$aFilePart['filename'];
	                    $aData['extension']=$aFilePart['extension'];
	                    $aData['id_cat_part']=$aProduct['id'];
	                    Db::AutoExecute("cat_pic",Db::Escape($aData), "UPDATE", "id=".$id_file);
	                } 
	            }
	        }
	        
	        setcookie('chat_file_upload', 0, 0, "/" );
	    }
	    
	    Base::$oResponse->addScript("$('.redBtnUp').html('УСПЕШНО ОТРЕДАКТИРОВАНО');");
	}
	//-----------------------------------------------------------------------------------------------
	public function EditProduct()
	{
	    $aGroups=Db::GetAssoc("select id,name from price_group where visible='1' and level='1' ");
	    Base::$tpl->assign('aGroups',$aGroups);
	    
	    $aParentProducts=Db::GetAssoc("select id,name from cat_part where id_parent='0' ");
	    Base::$tpl->assign('aParentProducts',$aParentProducts);
	    
	    Base::$sText.=Base::$tpl->fetch('manager/form_edit_product.tpl');
	}
	//-----------------------------------------------------------------------------------------------
	public function EditProductChangeCategory() {
	    $aProducts=Db::GetAssoc("select cp.id, cp.code
		    from cat_part as cp
		    join price_group_assign as pgs on cp.item_code=pgs.item_code and pgs.id_price_group='".Base::$aRequest['category']."'
		    join price_group as pg on pgs.id_price_group=pg.id
		    where 1=1
		    ");
	    
	    Base::$tpl->assign('aProducts',$aProducts);
	    Base::$oResponse->addAssign('redProd','outerHTML',Base::$tpl->fetch('manager/select_product.tpl'));
	    Base::$oResponse->addAssign('enterHere','innerHTML',"");
	}
	//-----------------------------------------------------------------------------------------------
	public function EditProductChangeProduct() {
	    $aProduct=Db::GetRow("select cp.* ,pgs.id_price_group
	        from cat_part as cp
	        join price_group_assign as pgs on cp.item_code=pgs.item_code
	        where cp.id='".(int)Base::$aRequest['id_product']."' ");
	    $aGraphic=Db::GetAll("select * from cat_pic where id_cat_part='".$aProduct['id']."' ");
	    $aCriteria=Db::GetAll("select * from cat_info where id_cat_part='".$aProduct['id']."' ");
	    $aGroups=Db::GetAssoc("select id,name from price_group where visible='1' and level='1' ");
	    $aParentProducts=Db::GetAssoc("select id,name from cat_part where id_parent='0' ");
	    
	    Base::$tpl->assign('aProduct',$aProduct);
	    Base::$tpl->assign('aGraphic',$aGraphic);
	    Base::$tpl->assign('aCriteria',$aCriteria);
	    Base::$tpl->assign('aGroups',$aGroups);
	    Base::$tpl->assign('aParentProducts',$aParentProducts);
	    
	    Base::$oResponse->addAssign('enterHere','innerHTML',Base::$tpl->fetch('manager/edit_product.tpl'));
	}
	//-----------------------------------------------------------------------------------------------
	public function AddSubscribe()
	{
	    Base::$sText.=Base::$tpl->fetch('manager/form_add_subscribe.tpl');
	}
	//-----------------------------------------------------------------------------------------------
	public function DeletePic() {
	    if(Base::$aRequest['id']) {
	        Db::Execute("delete from cat_pic where id='".Base::$aRequest['id']."' ");
	    }
	}
	//-----------------------------------------------------------------------------------------------
	public function DeleteCriteria() {
	    if(Base::$aRequest['id']) {
	        Db::Execute("delete from cat_info where id='".Base::$aRequest['id']."' ");
	    }
	}
	//-----------------------------------------------------------------------------------------------
	public function DeleteProduct() {
	    if(Base::$aRequest['id']) {
	        Db::Execute("delete from cat_info where id_cat_part='".Base::$aRequest['id']."' ");
	        Db::Execute("delete from cat_pic where id_cat_part='".Base::$aRequest['id']."' ");
	        Db::Execute("delete from cat_part where id='".Base::$aRequest['id']."' ");
	    }
	    Base::$oResponse->addRedirect('/pages/manager_edit_product');
	}
	//-----------------------------------------------------------------------------------------------
	public function CallMeList()
	{
	    if(Base::$aRequest['id']){
	        Db::Execute("UPDATE call_me SET resolved = 1 WHERE id =".Base::$aRequest['id']);
	    }
	    
	    $oTable = new Table();
	    $oTable->iRowPerPage=50;
	    $oTable->bStepperVisible = true;
	    $oTable->bCountStepper = 1;
	    $oTable->sSql = "SELECT * FROM call_me";
	    $oTable->aColumn['id']=array('sTitle'=>'#', 'sOrder'=>'id','sDefaultOrderWay' => 'desc');
	    $oTable->aColumn['fio']=array('sTitle'=>'fio', 'sOrder'=>'fio');
	    $oTable->aColumn['phone']=array('sTitle'=>'phone', 'sOrder'=>'phone');
	    $oTable->aColumn['message']=array('sTitle'=>'message', 'sOrder'=>'message');
	    $oTable->aColumn['post_date']=array('sTitle'=>'post date', 'sOrder'=>'post_date');
	    $oTable->aColumn['action']=array();
	    $oTable->sDefaultOrder="order by id desc";
	    $oTable->bCheckVisible=false;
	    $oTable->bHeaderVisible=false;
	    $oTable->bDefaultChecked=false;
	    $oTable->bFormAvailable=false;
	    $oTable->sClass='at-tab-table';
	    $oTable->iRowPerPage=50;
	    $oTable->sDataTemplate = "manager/row_call.tpl";
	
	    Base::$sText.=$oTable->getTable();
	}
	//-----------------------------------------------------------------------------------------------
	public function ContactForm()
	{
	    Auth::NeedAuth('manager');
	    if(Base::$aRequest['id']){
	        Db::Execute("UPDATE contact_form SET resolved = 1 WHERE id =".Base::$aRequest['id']);
	    }
	    $oTable = new Table();
	    $oTable->iRowPerPage=50;
	    $oTable->bStepperVisible = true;
	    $oTable->bCountStepper = 1;
	    $oTable->sSql = "SELECT * FROM contact_form";
	    $oTable->aColumn['id']=array('sTitle'=>'#', 'sOrder'=>'id','sDefaultOrderWay' => 'desc');
	    $oTable->aColumn['fio']=array('sTitle'=>'fio', 'sOrder'=>'fio');
	    $oTable->aColumn['phone']=array('sTitle'=>'phone', 'sOrder'=>'phone');
	    $oTable->aColumn['message']=array('sTitle'=>'message', 'sOrder'=>'message');
	    $oTable->aColumn['email']=array('sTitle'=>'message', 'sOrder'=>'email');
	    $oTable->aColumn['post_date']=array('sTitle'=>'post date', 'sOrder'=>'post_date');
	    $oTable->aColumn['action']=array();
	    $oTable->sDefaultOrder="order by id desc";
	    $oTable->bCheckVisible=false;
	    $oTable->bHeaderVisible=false;
	    $oTable->bDefaultChecked=false;
	    $oTable->bFormAvailable=false;
	    $oTable->sClass='at-tab-table';
	    $oTable->iRowPerPage=50;
	    $oTable->sDataTemplate = "manager/row_contact_form.tpl";
	
	    Base::$sText.=$oTable->getTable();
	
	}
	//-----------------------------------------------------------------------------------------------
	public function PrintOrder()
	{
	    $aCartPackage=Db::GetRow(Base::GetSql('CartPackage',array(
	        'where'=>"and cp.id='".Base::$aRequest['id']."'"))); //and cp.id_user='".Auth::$aUser['id']."'
	    $aUserCart=Db::GetAll(Base::GetSql("Part/Search",array(
	        "where"=>" and c.id_cart_package='".Base::$aRequest['id']."' and c.type_='order' ".
	        "and c.order_status != 'refused' " //and c.id_user='".Auth::$aUser['id']."'
	    )));
	
	    $aCustomer=Db::GetRow(Base::GetSql('Customer',array(
	        'id'=>(Base::$aRequest['id_user'] ? Base::$aRequest['id_user'] : -1),
	    )));
	
	    if (!$aUserCart || !$aCartPackage) Base::Redirect('?action=cart_package&table_error=cart_package_not_found');
	
	    $aActiveAccount=Db::GetRow(Base::GetSql('Account',array('is_active'=>1)));
	
	    $sPriceTotalString=Currency::CurrecyConvert(Currency::BillRound($aCartPackage['price_total']),
	        Base::GetConstant('global:base_currency'));
	    $sPriceTotalString=StringUtils::GetUcfirst(trim($sPriceTotalString));
	
	    $aCartPackage['price_total_string']=$sPriceTotalString;
	
	    Base::$tpl->assign('aActiveAccount',$aActiveAccount);
	    Base::$tpl->assign('aUserCart',$aUserCart);
	    Base::$tpl->assign('aCartPackage',$aCartPackage);
	    Base::$tpl->assign('aCustomer',$aCustomer);
	    //Base::$tpl->assign('sMirautoInfo',Language::GetText('mirauto_info'));
	
	    PrintContent::Append(Base::$tpl->fetch('cart/package_print.tpl'));
	    Base::Redirect('?action=print_content&return=manager_package_list');
	}
	//-----------------------------------------------------------------------------------------------
}
?>