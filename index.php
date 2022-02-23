<?php

require_once('connect.php');

/*
ini_set('error_reporting', E_ALL & ~E_NOTICE & ~E_WARNING & ~E_STRICT & ~E_DEPRECATED);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
*/

session_start();
try {
    require('init.php');

    if (Base::$aRequest['xajax']) {
        require( SERVER_PATH.'/xajax_request_parser.php');
    }
    else {
        require( SERVER_PATH.'/action_includer.php');
        Base::Process();
    }

} catch (Throwable $t) {
    $sMessage = 'Sorry, there was an error. Try to reload the page or contact the phone number indicated in the contacts';

    echo $sMessage;

    $aError = (array)$t;
    $aError['user_agent'] = $_SERVER['HTTP_USER_AGENT'];
    $aError['refer'] = $_SERVER['HTTP_REFERER'];
    $aError['request_uri'] = $_SERVER['REQUEST_URI'];
    $aError['request_data'] = $_REQUEST;

    $sTime=date('[Y-m-d H:i:s]');
    $LogFile=fopen('log_error.txt','a+');
    fwrite($LogFile,$sTime." ".serialize($aError).PHP_EOL);
    fclose($LogFile);
}