<?php
if(strpos($_SERVER['REQUEST_URI'],'//') !== false)
    header("Location: ".str_replace('//','/',$_SERVER['REQUEST_URI']));

// - Smarty -
require_once( SERVER_PATH.'/lib/smarty/Smarty.class.php');
$oSmarty = new Smarty();
$oSmarty->template_dir=SERVER_PATH.'/template/';
$oSmarty->compile_dir=SERVER_PATH.'/template/templates_c/';
$oSmarty->config_dir=SERVER_PATH.'/templates_c/configs/';
$oSmarty->cache_dir=SERVER_PATH.'/templates_c/cache/';
$oSmarty->compile_check = true;
//$smarty->debugging = false;

// - AdoDB -
include_once('lib/adodb/adodb.inc.php');
$oDb = adoNewConnection($DB_CONF['Type'], $DB_CONF['Modules']);
$oDb->Connect($DB_CONF['Host'].':'.$DB_CONF['Port'],$DB_CONF['User'],$DB_CONF['Password'],$DB_CONF['Database']);
$oDb->_Execute("/*!40101 SET NAMES '".$DB_CONF['Charset']."' */");
$oDb->SetFetchMode(ADODB_FETCH_ASSOC);
//$oDb->nameQuote="`";
//$ADODB_QUOTE_FIELDNAMES=true;
//correct time_zone
date_default_timezone_set('Europe/Kiev');
$oDb->_Execute("SET `time_zone`='".date('P')."'");

if (!$GENERAL_CONF['IsLive']) {
	include_once('lib/adodb/adodb-errorhandler.inc.php');
	$oDb->raiseErrorFn = "ADODB_Error_Handler";
}

// for autoload with operator new
if (!function_exists('SystemAutoload')) {
    function SystemAutoload($sClass)
    {
        if (is_file(SERVER_PATH . '/class/system/' . $sClass . '.php')) require_once(SERVER_PATH . '/class/system/' . $sClass . '.php');
        elseif (is_file(SERVER_PATH . '/class/module/' . $sClass . '.php')) require_once(SERVER_PATH . '/class/module/' . $sClass . '.php');
        elseif (is_file(SERVER_PATH . '/class/core/' . $sClass . '.php')) require_once(SERVER_PATH . '/class/core/' . $sClass . '.php');
    }
}
spl_autoload_register('SystemAutoload');

require_once( SERVER_PATH.'/class/core/Base.php');
require_once( SERVER_PATH.'/class/system/Content.php');
require_once( SERVER_PATH.'/class/system/Language.php');

Base::$db = $oDb;
Base::$tpl = $oSmarty;
Base::$aGeneralConf = $GENERAL_CONF;
Base::$aDbConf = $DB_CONF;

Base::PreInit();
setlocale(LC_TIME, Base::$aGeneralConf['BaseLocale']);

if ($bIsMpanalRequest) {
	$sCodeMpanelLanguage = Db::GetOne("select content from admin_option where
			id_admin='".$_SESSION['admin']['id']."' and module='language' and code='id_mpanel_language'");
	if (!$sCodeMpanelLanguage) $sCodeMpanelLanguage='ru';
	else Base::$aRequest ['locale']=$sCodeMpanelLanguage;
	Base::$tpl->assign('sCodeMpanelLanguage',$sCodeMpanelLanguage);
}

$oLanguage=new Language(Base::$aGeneralConf['BaseLocale']);
$oSmarty->AssignByRef("oLanguage", $oLanguage);
Base::$language = $oLanguage;

Base::Init();
