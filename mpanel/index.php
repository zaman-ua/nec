<?php
include "../connect.php";

if ($_GET['action']=='quit') {
	session_start();
	$_SESSION["mpanel_auth".$GENERAL_CONF['ProjectName']]='';
	$_SESSION[mpanel_auth_browser]='';
}

if(file_exists(SERVER_PATH."/template/mpanel/dtree_new.tpl")) {
    include './new.html';
} else {
    include './old.html';
}
?>