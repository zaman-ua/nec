<?php

class Sitemap extends Base
{
	//-----------------------------------------------------------------------------------------------
	public function __construct()
	{
	}
	//-----------------------------------------------------------------------------------------------
	public function UpdateSitemapLinks()
	{
		set_time_limit(0);
		ini_set("memory_limit",Base::GetConstant("export_xml:memory_limit","12G"));
		$aSitemap[]=array('url'=>'/');
		// Каталог авто
		$aCat=DB::GetAll("select c.id, c.name, lower(c.name) as lname from cat c
			inner join cat_model_group cmg on cmg.id_make=c.id
			where c.is_brand=1 and c.visible=1 and cmg.visible=1
			group by c.id");
		if($aCat) {
			foreach ($aCat as $aValue) {
				$aSitemap[]=array('url'=>'/rubricator/c/'.$aValue['lname'].'/');
				$aGroupModels=Db::GetAll("select * from cat_model_group where visible=1 and id_make='".$aValue['id']."' order by name");
				foreach ($aGroupModels as $aGrVal) {
					$aSitemap[]=array('url'=>'/rubricator/c/'.$aValue['lname'].'_'.$aGrVal['code'].'/');
					$aGroupCars[]='c/'.$aValue['lname'].'_'.$aGrVal['code'].'/';
					$aModel=TecdocDb::GetModels(array('id_make'=>$aValue['id'],'id_models'=>$aGrVal['id_models']));
					foreach ($aModel as $aVal) {
						$aModelDetail=TecdocDb::GetModelDetails(array('id_make'=>$aValue['id'],'id_model'=>$aVal['mod_id']));
						foreach ($aModelDetail as $v) {
							$sUrlAssemblage=Content::CreateSeoUrl('catalog_assemblage_view',array(
								'data[id_make]'=>$aValue['id'],
								'data[id_model]'=>$aVal['mod_id'],
								'data[id_model_detail]'=>$v['id_model_detail'],
								'model_translit'=>Content::Translit($aVal['name'])
							));
							$aSitemap[]=array('url'=>str_replace('/cars/'.$aValue['lname'].'/','/rubricator/c/',$sUrlAssemblage.'/'));
							$aCars[]=str_replace('/cars/'.$aValue['lname'].'/','c/',$sUrlAssemblage.'/');
						}
					}
				}
			}
		}
		
		// Рубрикатор
		$aSitemap[]=array('url'=>'/rubricator/');
		$aRubricator=Db::GetAll("select lower(url) as url from rubricator where visible=1 order by `level`");
		if($aRubricator) foreach($aRubricator as $aValue) {
			$aSitemap[]=array('url'=>'/rubricator/'.$aValue['url'].'/');
			$aRubric[]='/rubricator/'.$aValue['url'].'/';
		}
		
		// Рубрикатор + авто
		if(!empty($aRubric)) {
			if(!empty($aGroupCars)) foreach($aGroupCars as $sGroupCarUrl) {
				foreach($aRubric as $sRubric) {
					$aSitemap[]=array('url'=>$sRubric.$sGroupCarUrl);
				}
			}
			if(!empty($aCars)) foreach($aCars as $sCarUrl) {
				foreach($aRubric as $sRubric) {
					$aSitemap[]=array('url'=>$sRubric.$sCarUrl);
				}
			}
		}
		
		// Новости
		$aNews=Db::GetAll("select id, short from news where visible=1");
		$aSitemap[]=array('url'=>'/pages/news/');
		if($aNews) foreach ($aNews as $aValue) {
			$aSitemap[]=array('url'=>'/pages/news/'.$aValue['id'].'/');
		}
		
		// Страницы сайта
		$sIds=DB::GetOne("select GROUP_CONCAT(id) from drop_down where code in('customer_account', 'manager_account')");
		$aPages=DB::GetAll("select concat(upper(left(name,1)),lower(substr(name,2))) as name,  concat('/pages/',code,'/') as url 
			from drop_down where not (id in(".$sIds.") or id_parent in (".$sIds.")) and invisible_map=0 and visible=1 order by num");
		if($aPages) foreach ($aPages as $aValue) {
			$aSitemap[]=array('url'=>$aValue['url']);
		}
		
		if(!empty($aSitemap)) {
			$iCountLinks=Db::GetOne("select count(*) from sitemap_links");
			foreach($aSitemap as $aValue) {
				$sUrl=mb_strtolower(htmlspecialchars($aValue['url']));
				if($iCountLinks) $iId=Db::GetOne("select id from sitemap_links where url='".$sUrl."'");
				if(empty($iId)) Db::Execute("insert into sitemap_links (url) values ('".$sUrl."')");
			}
		}
	}
	//-----------------------------------------------------------------------------------------------
	public function GetDataForSiteMapXml()
	{
		$iCountLinks=Db::GetOne("select count(*) from sitemap_links");
		$iPortion=Base::GetConstant('sitemap:portion',50000);
		$iCount=intval($iCountLinks/$iPortion)+1;
		$aRange=range(1, $iCount);
		if($aRange) foreach($aRange as $i) {
			$aSitemapLinks=Db::GetAll("select url from sitemap_links where visible=1 limit ".($i-1)*$iPortion.",".$iPortion);
			if(!empty($aSitemapLinks)) foreach($aSitemapLinks as $aValue) {
				$aSitemap[]=array('url'=>$aValue['url']);
			}
		}
		function cmp_url($a, $b) {
			return strcmp($a["url"], $b["url"]);
		}
		if(Base::GetConstant('sitemap:sort_url',0))
			usort($aSitemap,"cmp_url");
		return $aSitemap;
	}
	//-----------------------------------------------------------------------------------------------
	public function Generate()
	{
		set_time_limit(0);
		ini_set("memory_limit",Base::GetConstant("export_xml:memory_limit","12G"));
		if(!is_dir(SERVER_PATH.'/imgbank/xml/')) mkdir(SERVER_PATH.'/imgbank/xml/', 0755);
		
		if(Base::GetConstant('sitemap:update_sitemap_links',1))
			self::UpdateSitemapLinks();
		
		$i=1;
		do {
			$sFilename=SERVER_PATH.'/imgbank/xml/sitemap'.$i++.'.xml';
		} while (file_exists($sFilename)?unlink($sFilename):false);
				
		$sContentBegin=Base::$tpl->fetch('sitemap/sitemap_xml_begin.tpl');
		$sContentEnd=Base::$tpl->fetch('sitemap/sitemap_xml_end.tpl');
				
		$aSitemap=self::GetDataForSiteMapXml();
		$iSitemapPortion=Base::GetConstant('sitemap:portion',50000);
		$iSitemapCount=intval(count($aSitemap)/$iSitemapPortion)+1;
		$aRange=range(1, $iSitemapCount);
				
		if($aRange) foreach ($aRange as $i) {
			$sFilename = SERVER_PATH.'/imgbank/xml/sitemap'.$i.'.xml';
			$oFile = fopen($sFilename, 'w');
			fwrite($oFile, $sContentBegin);
					
			if($aSitemap) {
				Base::$tpl->assign('sServer',Base::GetConstant('global:project_url'));
				Base::$tpl->assign('aSitemap',array_slice($aSitemap,($i-1)*$iSitemapPortion,$iSitemapPortion));
				$sContent=Base::$tpl->fetch('sitemap/sitemap_xml_row.tpl');
				fwrite($oFile, $sContent);
			}
					
			fwrite($oFile, $sContentEnd);
			fclose($oFile);
		}
				
		$sSiteIndexFile=SERVER_PATH.'/imgbank/xml/sitemap.xml';
		Base::$tpl->assign('aSiteindex',$aRange);
		Base::$tpl->assign('sSiteindexDate',date('Y-m-d'));
		$sContent=Base::$tpl->fetch('sitemap/sitemap_xml.tpl');
		file_put_contents($sSiteIndexFile,$sContent);
	}
	//-----------------------------------------------------------------------------------------------
}
?>