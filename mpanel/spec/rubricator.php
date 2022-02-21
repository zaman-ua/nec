<?php
class ARubricator extends Admin {
	//-----------------------------------------------------------------------------------------------
	function __construct() {
		$this->sTableName = 'rubricator';
		$this->sTablePrefix = 'r';
		$this->sAction = 'rubricator';
		$this->sWinHead = Language::getDMessage ('Rubricator');
		$this->sPath = Language::GetDMessage('>> Auto catalog >');
		$this->aCheckField = array("name","url");
		$this->Admin ();
	}
	//-----------------------------------------------------------------------------------------------
	public function Index() {
		$this->PreIndex ();
		require_once (SERVER_PATH . '/class/core/Table.php');
		
		$oTable = new Table ( );
		$oTable->aColumn = array ();
		$oTable->aColumn ['id'] = array ('sTitle' => 'Id', 'sOrder' => $this->sTablePrefix.'.id' );
		$oTable->aColumn ['name'] = array ('sTitle' => 'Name', 'sOrder' => $this->sTablePrefix.'.name');
		$oTable->aColumn ['id_parent'] = array ('sTitle' => 'Id Parent', 'sOrder' => $this->sTablePrefix.'.id_parent');
		$oTable->aColumn ['level'] = array ('sTitle' => 'Level', 'sOrder' => $this->sTablePrefix.'.level');
		$oTable->aColumn ['url'] = array ('sTitle' => 'Url', 'sOrder' => $this->sTablePrefix.'.url');
		$oTable->aColumn ['image'] = array ('sTitle' => 'Image', 'sOrder' => $this->sTablePrefix.'.image');
		$oTable->aColumn ['sort'] = array ('sTitle' => 'sort', 'sOrder' => $this->sTablePrefix.'.sort');
		$oTable->aColumn ['is_mainpage'] = array ('sTitle' => 'is_mainpage', 'sOrder' => $this->sTablePrefix.'.is_mainpage');
		$oTable->aColumn ['is_menu_visible'] = array ('sTitle' => 'is_menu_visible', 'sOrder' => $this->sTablePrefix.'.is_menu_visible');
		$oTable->aColumn ['id_price_group'] = array ('sTitle' => 'id_price_group', 'sOrder' => $this->sTablePrefix.'.id_price_group');
		$oTable->aColumn ['visible'] = array ('sTitle' => 'Visible', 'sOrder' => $this->sTablePrefix.'.visible');
		$this->initLocaleGlobal ();
		
		$oTable->aColumn ['action'] = array ();
		$this->SetDefaultTable ( $oTable );
		Base::$sText .= $oTable->getTable ();
		$this->AfterIndex ();
	}
	//-----------------------------------------------------------------------------------------------
	public function BeforeApply()
	{
		if(Base::$aRequest['data']['id_tree']) Base::$aRequest['data']['id_tree']=implode(',',Base::$aRequest['data']['id_tree']);
// 		if(isset(Base::$aRequest['data']['id_group'])) 
		    Base::$aRequest['data']['id_group']=implode(',',Base::$aRequest['data']['id_group']);
	}
	//-----------------------------------------------------------------------------------------------
	public function BeforeAddAssign($aData) 
	{
		$aBaseTree=array('0'=>'not selected')+TecdocDb::GetTreeAssoc();
		
		$aBaseLevelGroups=array('0'=>'not selected')+Base::$db->getAssoc("SELECT id, CONCAT(id,' - ',name) AS name_group
 			FROM rubricator WHERE level in ('1','2') ORDER BY name");
		$aBaseLevels=array(1=>1,2=>2,3=>3);
		
		Base::$tpl->assign ( 'aBaseTree', $aBaseTree );
		Base::$tpl->assign ( 'aBaseTreeSelect', (!$aData['id_tree'])?array(0=>0):explode(',',$aData['id_tree']));
 		Base::$tpl->assign ( 'aBaseLevelGroups', $aBaseLevelGroups );
 		Base::$tpl->assign ( 'sBaseLevelGroups', $aData['id_parent'] );
		Base::$tpl->assign ( 'aBaseLevels', $aBaseLevels );
		Base::$tpl->assign ( 'sBaseLevels', $aData['level'] );
		
		$this->sScriptForAdd="$('#select_tree').select2().on('change', function() { 
		    xajax_process_browse_url('/?action=rubricator_change_select_part&id=".$aData['id']."&id_tree='+$(this).val());
	    });";
		
		$aGroup=TecdocDb::GetAssoc(" select
	        grp.id_src as id_group, grp.Name as group_name
	        from ".DB_OCAT."cat_alt_groups as grp
	        join ".DB_OCAT."cat_alt_link_str_grp as lsg on grp.id_grp=lsg.ID_grp
	        where lsg.id_tree in (".$aData['id_tree'].")
        ");
	    $aGroupSelected=explode(",", Db::GetOne("select id_group from rubricator where id='".$aData['id']."' "));
	    
	    Base::$tpl->assign ('aGroup',$aGroup);
	    Base::$tpl->assign ('aGroupSelected',$aGroupSelected);
	    
	    Base::$tpl->assign ( 'aPriceGroups', array("0"=>"не выбрано")+Db::GetAssoc("select id, name from price_group order by name") );
	}
	//-----------------------------------------------------------------------------------------------
	public function ChangeSelectPart() {
	    
	    
	    $aGroup=TecdocDb::GetAssoc(" select
	        grp.id_src as id_group, grp.Name as group_name
	        from ".DB_OCAT."cat_alt_groups as grp 
	        join ".DB_OCAT."cat_alt_link_str_grp as lsg on grp.id_grp=lsg.ID_grp
	        where lsg.id_tree in (".Base::$aRequest['id_tree'].")
        ");
	    $aGroupSelected=explode(",", Db::GetOne("select id_group from rubricator where id='".Base::$aRequest['id']."' "));
	    
	    Base::$tpl->assign ('aGroup',$aGroup);
	    Base::$tpl->assign ('aGroupSelected',$aGroupSelected);
	    
	    Base::$oResponse->AddAssign('id_group_list','innerHTML',Base::$tpl->fetch('mpanel/rubricator/change_group.tpl'));
	}
	//-----------------------------------------------------------------------------------------------
}
?>