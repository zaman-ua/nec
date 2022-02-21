<?php
require_once(SERVER_PATH.'/class/core/Admin.php');
class ACatPart extends Admin {

	//-----------------------------------------------------------------------------------------------
	function __construct()
	{
		$this->sTableName='cat_part';
		$this->sTablePrefix='cp';
		$this->sTableId='id';
		$this->sAction='cat_part';
		$this->sWinHead=Language::getDMessage('Parts parameters');
		$this->sPath=Language::GetDMessage('>>Auto catalog >');
		$this->aCheckField=array('code');

		$this->sBeforeAddMethod='BeforeAdd';
		$this->Admin();
	}
	//-----------------------------------------------------------------------------------------------
	public function Index() {
		$this->PreIndex();
		//--------------------
		
		Base::$sText .= $this->SearchForm ();
		if ($this->aSearch) {
			if (Language::getConstant('mpanel_search_strong',0)) {
				if ($this->aSearch['id'])$this->sSearchSQL .= " and cp.id = '".$this->aSearch['id']."'";
				if ($this->aSearch['pref'])	$this->sSearchSQL .= " and cp.pref = '".$this->aSearch['pref']."'";
				if ($this->aSearch['brand']) $this->sSearchSQL .= " and c.title1 = '".$this->aSearch['brand']."'";
				if ($this->aSearch['code'])$this->sSearchSQL .= " and cp.code = '".$this->aSearch['code']."'";
				if ($this->aSearch['name_rus'])	$this->sSearchSQL .= " and cp.name_rus = '".$this->aSearch['name_rus']."'";
				if ($this->aSearch['name_price_group'])$this->sSearchSQL .= " and pg.name = '".$this->aSearch['name_price_group']."'";
				if ($this->aSearch['code_price_group'])$this->sSearchSQL .= " and pg.code = '".$this->aSearch['code_price_group']."'";
				if ($this->aSearch['with_brand'])$this->sSearchSQL .= " and c.title1 <> ''";
				if ($this->aSearch['with_id_price_group'])$this->sSearchSQL .= " and pg.id <> ''";	
			}
			else {
			    if ($this->aSearch['id'])$this->sSearchSQL .= " and cp.id like '%".$this->aSearch['id']."%'";
				if ($this->aSearch['pref'])	$this->sSearchSQL .= " and cp.pref like '%".$this->aSearch['pref']."%'";
				if ($this->aSearch['brand'])	$this->sSearchSQL .= " and c.title1 like '%".$this->aSearch['brand']."%'";
				if ($this->aSearch['code'])$this->sSearchSQL .= " and cp.code like '%".$this->aSearch['code']."%'";
				if ($this->aSearch['name_rus'])	$this->sSearchSQL .= " and cp.name_rus like '%".$this->aSearch['name_rus']."%'";
				if ($this->aSearch['name_price_group'])$this->sSearchSQL .= " and pg.name like '%".$this->aSearch['name_price_group']."%'";
				if ($this->aSearch['code_price_group'])$this->sSearchSQL .= " and pg.code like '%".$this->aSearch['code_price_group']."%'";
				if ($this->aSearch['with_brand'])$this->sSearchSQL .= " and c.title1 <> ''";
				if ($this->aSearch['with_id_price_group'])$this->sSearchSQL .= " and pg.id <> ''";
			}
			$_SESSION['cat_part']['current_search'] = $this->sSearchSQL;
		}
		else unset($_SESSION['cat_part']['current_search']);
		//--------------------
		require_once(SERVER_PATH.'/class/core/Table.php');
		$oTable=new Table();
		$oTable->aColumn=array(
		'id'=>array('sTitle'=>Language::getDMessage('Id'), 'sOrder'=>'cp.id', 'sMethod'=>'exact'),
		'pref'=>array('sTitle'=>Language::getDMessage('Pref'), 'sOrder'=>'cp.pref'),
		'brand'=>array('sTitle'=>'Brand',Language::getDMessage('Brand'), 'sOrder'=>'c.title'),
		'code'=>array('sTitle'=>Language::getDMessage('Code'), 'sOrder'=>'cp.code'),
		//'name'=>array('sTitle'=>'Name',Language::getDMessage('Name'), 'sOrder'=>'cp.name', 'sWidth'=>'40%'),
		'name_rus'=>array('sTitle'=>Language::getDMessage('Name Rus'), 'sOrder'=>'cp.name_rus'),
		// 'weight'=>array('sTitle'=>Language::getDMessage('Weight'), 'sOrder'=>'cp.weight', 'sWidth'=>10),
		'price_group'=>array('sTitle'=>Language::getDMessage('price group'), 'sOrder'=>'pg.name'),
		//'size_name'=>array('sTitle'=>Language::getDMessage('Size Name'), 'sOrder'=>'cp.size_name', 'sWidth'=>10),
		'action' => array ()
		);

		$this->SetDefaultTable ( $oTable);

		// $oTable->bCheckVisible=false;
		$oTable->bCacheStepper=true;

		//$oTable->sSql=Base::GetSql('CatPart',array('where'=>$sWhere ));

		Base::$sText.=$oTable->getTable();

		$this->AfterIndex();
	}
	//-----------------------------------------------------------------------------------------------
	public function BeforeAddAssign($aData)
	{
		$aPriceGroup=Db::GetAssoc("select id,concat(name,' (',code,')') as name_ from price_group where visible=1 order by name");
		Base::$tpl->assign('aPriceGroup',array("0"=>Language::GetMessage("not selected"))+$aPriceGroup);
		Base::$tpl->assign ( 'iPriceGroup', $aData['id_price_group']);
	}
	//-----------------------------------------------------------------------------------------------
	public function BeforeAdd() {
		Base::$tpl->assign('aPref',Base::$db->getAssoc("select pref, concat(pref,' ',title) as name from cat order by name"));
	}
	//-----------------------------------------------------------------------------------------------
	public function BeforeApply() {

		Base::$aRequest['data']['item_code']=Base::$aRequest['data']['pref']."_".Base::$aRequest['data']['code'];
		if (!Base::$aRequest['data']['name_rus']){
			Base::$aRequest['data']['name_rus']=DB::GetOne("select part_rus from price where item_code='".Base::$aRequest['data']['item_code']."'");
		}
		
		if((Base::$aRequest['data']['id_price_group'] || Base::$aRequest['data']['id_price_group']==0) && Base::$aRequest['data']['item_code']){
			$sSql="insert into price_group_assign (item_code,id_price_group) 
					values ('".Base::$aRequest['data']['item_code']."','".Base::$aRequest['data']['id_price_group']."')
					on duplicate key update id_price_group = '".Base::$aRequest['data']['id_price_group']."' ";
			
			Db::Execute($sSql);
		}
	}
	//-----------------------------------------------------------------------------------------------
	public function Settings(){
		$this->sAction = "cat_part/settings";
		Base::$tpl->assign('sReturn', stripslashes(Base::$aRequest['return']));
		$aFieldSelected=explode(",", Base::GetConstant("cat_part:export_fields"));
		$aFieldSelected = array_fill_keys($aFieldSelected, 1);
		Base::$tpl->assign('aFieldSelected', $aFieldSelected);
		$this->ProcessTemplateForm("Settings");
	}
	public function SettingsApply(){

		Base::UpdateConstant("cat_part:export_fields",implode(",", array_keys(Base::$aRequest['data'])));
		$this->AdminRedirect ( $this->sAction );
	}
	//-----------------------------------------------------------------------------------------------
	public function Export()
	{
		Base::$tpl->assign('sReturn', stripslashes(Base::$aRequest['return']));
		$aFieldSelected=explode(",", Base::GetConstant("cat_part:export_fields"));
		$aFieldSelected = array_fill_keys($aFieldSelected, 1);
		// Debug::PrintPre($aFieldSelected);
		if($aFieldSelected['id']) $aHeader[]= Language::GetMessage('XLS_'.'id');
		if($aFieldSelected['brand']) $aHeader[]= Language::GetMessage('XLS_'.'Brand');
		if($aFieldSelected['code']) $aHeader[]= Language::GetMessage('XLS_'.'Code');
		if($aFieldSelected['name']) $aHeader[]= Language::GetMessage('XLS_'.'Name');
		if($aFieldSelected['code_price_group']) $aHeader[]= Language::GetMessage('XLS_'.'IdPriceGroup');

		$sFileName='/imgbank/temp_upload/'.DateFormat::GetFileDateTime(time(),'',false).'_cat_part.csv';
		$fTempCSV = fopen(SERVER_PATH.$sFileName, 'w');
		fwrite($fTempCSV,chr(0xEF).chr(0xBB).chr(0xBF));
		fputcsv($fTempCSV, $aHeader, ';');
		fclose($fTempCSV);

		$fp = fopen(SERVER_PATH.$sFileName, 'a');
		if(Base::$aRequest['not_null'])
			$sSql = Base::GetSql('CatPart',array('price_not_null'=>1,'where' => $_SESSION['cat_part']['current_search'] ));
		else
			$sSql = Base::GetSql('CatPart',array('where' => $_SESSION['cat_part']['current_search'] ));
		// Debug::PrintPre($sSql);
		$aResult = mysql_query($sSql);
		if($aResult) {
		    while ($aValue = mysql_fetch_assoc($aResult)) {
		    	
		    	// if(!$aValue['brand']) $aValue['brand'] = Db::GetOne("select title1 from cat where pref='".$aValue['pref']."' ");
		    	// Debug::PrintPre($aValue);
		        $aDataInsert=array();
		        if($aFieldSelected['id']) $aDataInsert[]=$aValue['id'];
		        if($aFieldSelected['brand']) $aDataInsert[]=$aValue['brand'];
		        if($aFieldSelected['code']) $aDataInsert[]=$aValue['code'];
		        if($aFieldSelected['name']) $aDataInsert[]=$aValue['name_rus'];
		        if($aFieldSelected['code_price_group']) $aDataInsert[]=$aValue['code_price_group'];
		        // fputcsv($fp, $aDataInsert, ';', "'");
		        $this->my_fputcsv($fp, $aDataInsert, ';', "'");
		        $i++;
		    }
		}

		fclose($fp);

		Base::$tpl->assign('sFileName',$sFileName);
		Base::$tpl->assign('sFilePath',$this->sPathToFile.$sFileName);
	
		Base::$sText .=Base::$tpl->fetch('mpanel/user/export_file.tpl');
		$this->AdminRedirect ( $this->sAction );
	}
	//-----------------------------------------------------------------------------------------------
	public function  Import(){
		$this->sAction = "cat_part/import";
		Base::$tpl->assign('sReturn', stripslashes(Base::$aRequest['return']));
		$this->ProcessTemplateForm("Import");
	}
	//-----------------------------------------------------------------------------------------------
	public function ImportApply(){
		$sUploadDir = '/imgbank/temp_upload/mpanel/';
		$sFileName = $_SERVER['DOCUMENT_ROOT'].$sUploadDir.Base::$aRequest['data']['upload_txt'];
		if (Base::$aRequest['data']['upload_txt'] && file_exists($sFileName)) {
			set_time_limit(0);

			$oExcel= new Excel();
			$oExcel->ReadExcel7($sFileName,true);
			for ($iList=0;$iList<1;$iList++){
				$oExcel->SetActiveSheetIndex($iList);
				$aData=$oExcel->GetSpreadsheetData();
				$iCount=count($aData)-1;
				foreach ($aData as $sKey => $aValue) {
					if (2>$sKey) continue;
					
					$aValue[2]=Catalog::StripCode($aValue[2]);
					// Debug::PrintPre($aValue);
					$sPref=Db::GetOne("select pref from cat_pref where name='".$aValue[1]."' union select pref from cat where name='".$aValue[1]."'");
					$sSql="insert DELAYED into cat_part (item_code,code,pref,name_rus) 
						values ('".$sPref."_".$aValue[2]."','".$aValue[2]."','".$sPref."','".trim($aValue[3])."') 
						on duplicate key update name_rus='".trim($aValue[3])."';";
					Db::Execute($sSql);
					
					$iIdPriceGroup=Db::GetOne("select id from price_group where code='".$aValue[4]."'");
					
					$sSql="insert into price_group_assign (item_code,id_price_group) 
							values ('".$sPref."_".$aValue[2]."','".$iIdPriceGroup."')
							on duplicate key update id_price_group = '".$iIdPriceGroup."' ";
					
					$bGroup=Db::Execute($sSql);
				}
			}
			unlink($sFileName);
			
			$this->AdminRedirect ( $this->sAction );
		}
	}
	//-----------------------------------------------------------------------------------------------
	function my_fputcsv($handle, $fields, $delimiter = ',', $enclosure = '"', $escape = '\\')
	{
		$first = 1;
		foreach ($fields as $field) {
			if ($first == 0) fwrite($handle, $delimiter);
			$f = str_replace($enclosure, $enclosure.$enclosure, $field);
			if ($enclosure != $escape) {
				$f = str_replace($escape.$enclosure, $escape, $f);
			}
			// if (strpbrk($f, " \t\n\r".$delimiter.$enclosure.$escape) || strchr($f, "\000")) {
				fwrite($handle, $enclosure.$f.$enclosure);
			// } else {
			// 	fwrite($handle, $f);
			// }
			$first = 0;
		}
		fwrite($handle, "\n");
	}
}
?>
