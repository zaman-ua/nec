<!DOCTYPE html>
<html lang="en">
<head>
<!-- Site Title-->
<title>{strip}{if $template.sPageTitle}{$template.sPageTitle}
		{else}{$oLanguage->GetConstant('global:title','global:titleconstant')}{/if}{/strip}</title>
<meta name="description" content="{strip}{if $template.sPageDescription}{$template.sPageDescription}
{else}{$oLanguage->GetConstant('global:meta_description','global:meta_descriptionconstant')}{/if}{/strip}" />
<meta name="keywords" content="{strip}{if $template.sPageKeyword}{$template.sPageKeyword}
{else}{$oLanguage->GetConstant('global:meta_keyword','global:meta_keywordconstant')}{/if}{/strip}" />
<meta name="format-detection" content="telephone=no">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
{if
$smarty.request.action!='user_login' && 
$smarty.request.action!='user' && 
$smarty.request.action!='user_login_error' && 
$smarty.request.action!='user_logout' && 
$smarty.request.action!='manager' &&
$smarty.request.action!='manager_add_product' &&
$smarty.request.action!='manager_edit_product' && 
$smarty.request.action!='manager_add_subscribe' &&
$aAuthUser.type_!='manager'
}
	<meta property="og:title" content="Intense">
	<meta property="og:description" content="The smartest and the most flexible Bootstrap template">
	<meta property="og:image" content="/images/banners/banner-01-620x360.png">
	<meta property="og:url" content="https://www.templatemonster.com/intense-multipurpose-html-template.html">
	<link rel="preload" href="data:image/gif;base64,R0lGODlhAQABAAD/ACwAAAAAAQABAAACADs%3D" as="image">
	<link rel="preload" href="/components/base/base.css" as="style">
	<link rel="preload" href="/components/base/core.js" as="script">
	<link rel="preload" href="/components/base/script.js" as="script">
	<link rel="icon" href="/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="/components/base/base.css">
	<script src="/components/base/core.js"></script>
	<script src="/components/base/script.js"></script>
{else}
<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700&subset=latin,cyrillic-ext' rel='stylesheet' type='text/css'>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/css/remodal.css" rel="stylesheet" type="text/css">
<link href="/css/remodal-default-theme.css" rel="stylesheet" type="text/css">
<script src="/js/remodal.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/css/bootstrap.vertical-tabs.min.css" rel="stylesheet" type="text/css">
<link href="/css/style-admin.css" rel="stylesheet" type="text/css">
<link href="/css/style-admin-media.css" rel="stylesheet" type="text/css">
<script src="/js/modernizr.js"></script>
<!--[if lt IE 9]>
  <script src="/js/html5shiv.min.js"></script>
  <script src="/js/respond.js"></script>
<![endif]-->
{/if}
		
	{*$template.sHeaderResource}
    {if $bHeaderPrint} {include file=header_print.tpl} {/if*}
    
{literal}
<!-- Google Tag Manager -->

<!-- End Google Tag Manager -->
{/literal}
</head>