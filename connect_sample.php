<?php
if (1) error_reporting(E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED);
else  error_reporting(0);

//-----------------------------------------------------------------------------------------------------
if ($_SERVER["DOCUMENT_ROOT"]) $_SERVER_NAME=explode($_SERVER["DOCUMENT_ROOT"], str_replace("\\","/",dirname(__FILE__)));
$_SERVER_NAME=$_SERVER['SERVER_NAME'].$_SERVER_NAME[1];
$tmp_server_path=explode(":",dirname(__FILE__));
count($tmp_server_path)==1 ? $_SERVER_PATH=$tmp_server_path[0] : $_SERVER_PATH=str_replace("\\","/",$tmp_server_path[1]);
define(SERVER_NAME,$_SERVER_NAME);
define(SERVER_PATH,$_SERVER_PATH);

if(strpos(get_include_path(),";")=== false){
    set_include_path(SERVER_PATH."/lib/".":".SERVER_PATH."/lib/PHPExcel/".":".get_include_path());
} else {
    set_include_path(SERVER_PATH."/lib/".";".SERVER_PATH."/lib/PHPExcel/".";".get_include_path());
}
//-----------------------------------------------------------------------------------------------------
$DB_CONF = array(
    'User' => 'root',
    'Password' => '123456',
    'Database' => 'nec',
    'Port' => '3306',
//-----------------------------------------------------------------------------------------------------
    'Host' => '127.0.0.1',
    'Type' => 'mysqli',
    'Charset'=>'utf8',
    'Modules'=> 'transaction : pear'
);

//-----------------------------------------------------------------------------------------------------
$GENERAL_CONF = array(
    'MpanelVersion' => '4.5',
    'ProjectName' => 'Auto.Mstarproject',
    'Charset' => 'utf-8',
    'IsLive' => true,
    'BaseLocale' => 'ru',
    'LogAdmin' => true,
    'CookieDomain' => 'auto.lc',
);
//-----------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------
//--for backup.sh-return user or passwd
if ($argv[1]=='_for_cron_username') {
    echo $DB_CONF['User'];
} elseif ($argv[1]=='_for_cron_password') {
    echo $DB_CONF['Password'];
} elseif ($argv[1]=='_for_cron_database') {
    echo $DB_CONF['Database'];
}

//-----------------------------------------------------------------------------------------------------