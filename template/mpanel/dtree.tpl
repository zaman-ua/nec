<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">

<div class="dtree_hd">
<a href="javascript: d.openAll();"><img border="0" src="/libp/mpanel/images/dtree/expandall.png"/></a>
<a href="javascript: d.closeAll();"><img border="0" src="/libp/mpanel/images/dtree/collapseall.png"/></a>
</div>

<script type="text/javascript">
<!--
d = new dTree('d');
d.add(0,-1,'&nbsp;{$oLanguage->GetDMessage('My dSAP menu')}');
d.add(1001,0,'{$oLanguage->GetDMessage('Home')}','#','','','','/libp/mpanel/images/dtree/colorman.png'
,'/libp/mpanel/images/dtree/colorman.png',
' xajax_process_browse_url(\'?action=splash_xajax&click_from_menu=1\');  return false;');

d.add(1,0,'{$oLanguage->GetDMessage('Configuration')}','#','','','/libp/mpanel/images/dtree/log.png'
,'/libp/mpanel/images/dtree/log.png');
d.add(5,1,'{$oLanguage->GetDMessage('General constants')}','#','','','','/libp/mpanel/images/dtree/log.png'
,'/libp/mpanel/images/dtree/log.png',
'xajax_process_browse_url(\'?action=general_constant&click_from_menu=1\'); return false;');
d.add(10,1,'{$oLanguage->GetDMessage('Constants')}','#','','','','/libp/mpanel/images/dtree/log.png'
,'/libp/mpanel/images/dtree/log.png',
'xajax_process_browse_url(\'?action=constant&click_from_menu=1\'); return false;');
d.add(11,1,'{$oLanguage->GetDMessage('Currencies')}','#','','','','/libp/mpanel/images/dtree/log.png'
,'/libp/mpanel/images/dtree/log.png',
'xajax_process_browse_url(\'?action=currency&click_from_menu=1\'); return false;');
//d.add(12,1,'{$oLanguage->GetDMessage('Languages')}','#','','','','/libp/mpanel/images/dtree/log.png'
//,'/libp/mpanel/images/dtree/log.png',
//' xajax_process_browse_url(\'?action=language&click_from_menu=1\');  return false;');
d.add(13,1,'{$oLanguage->GetDMessage('Administrators')}','#','','','','/libp/mpanel/images/dtree/log.png'
,'/libp/mpanel/images/dtree/log.png',
'xajax_process_browse_url(\'?action=admin&click_from_menu=1\'); return false;');

d.add(100,0,'{$oLanguage->GetDMessage('Content')}','#','','','','');
d.add(101,100,'{$oLanguage->GetDMessage('Dropdown Manager')}','#','','','','',''
,'xajax_process_browse_url(\'?action=drop_down&click_from_menu=1\'); return false;');
d.add(102,100,'{$oLanguage->GetDMessage('Content Editor')}','#','','','','',''
,' xajax_process_browse_url(\'?action=content_editor&click_from_menu=1\');  return false;');
d.add(103,100,'{$oLanguage->GetDMessage('Caorusel Editor')}','#','','','','',''
,' xajax_process_browse_url(\'?action=banner&click_from_menu=1\');  return false;');
d.add(104,100,'{$oLanguage->getDMessage('Dropdown Additional')}','#','','','','',''
,'xajax_process_browse_url(\'?action=drop_down_additional&click_from_menu=1\'); return false;');
d.add(106,100,'{$oLanguage->GetDMessage('Message translate')}','#','','','','',''
,' xajax_process_browse_url(\'?action=translate_message&click_from_menu=1\');  return false;');
d.add(107,100,'{$oLanguage->GetDMessage('Text translate')}','#','','','','',''
,' xajax_process_browse_url(\'?action=translate_text&click_from_menu=1\');  return false;');
//d.add(107,100,'{$oLanguage->GetDMessage('Translate')}','#','','','','',''
//,' xajax_process_browse_url(\'?action=translate&click_from_menu=1\');  return false;');
d.add(110,100,'{$oLanguage->GetDMessage('Templates')}','#','','','','',''
,' xajax_process_browse_url(\'?action=template&click_from_menu=1\');  return false;');
{*d.add(111,100,'{$oLanguage->GetDMessage('Attachment')}','#','','','','',''
,' xajax_process_browse_url(\'?action=attachment&click_from_menu=1\');  return false;');*}
d.add(112,100,'{$oLanguage->GetDMessage('News')}','#','','','','',''
,' xajax_process_browse_url(\'?action=news&click_from_menu=1\');  return false;');
d.add(140,100,'{$oLanguage->GetDMessage('Delivery types')}','#','','','','',''
,' xajax_process_browse_url(\'?action=delivery_type&click_from_menu=1\');  return false;');
d.add(150,100,'{$oLanguage->GetDMessage('Payment types')}','#','','','','',''
,' xajax_process_browse_url(\'?action=payment_type&click_from_menu=1\');  return false;');
d.add(157,100,'{$oLanguage->GetDMessage('Export xml')}','#','','','','',''
,' xajax_process_browse_url(\'?action=export_xml&click_from_menu=1\');  return false;');




d.add(200,0,'{$oLanguage->GetDMessage('Users')}','#','','','/libp/mpanel/images/dtree/groupevent.png'
,'/libp/mpanel/images/dtree/groupevent.png');
d.add(202,200,'{$oLanguage->GetDMessage('Customer groups')}','#','','','/libp/mpanel/images/dtree/groupevent.png'
,'/libp/mpanel/images/dtree/groupevent.png',''
,' xajax_process_browse_url(\'?action=customer_group&click_from_menu=1\');  return false;');
d.add(203,200,'{$oLanguage->GetDMessage('Customers')}','#','','','/libp/mpanel/images/dtree/groupevent.png'
,'/libp/mpanel/images/dtree/groupevent.png',''
,' xajax_process_browse_url(\'?action=customer&click_from_menu=1\');  return false;');
d.add(204,200,'{$oLanguage->GetDMessage('Manager')}','#','','','/libp/mpanel/images/dtree/groupevent.png'
,'/libp/mpanel/images/dtree/groupevent.png',''
,' xajax_process_browse_url(\'?action=manager&click_from_menu=1\');  return false;');
d.add(205,200,'{$oLanguage->GetDMessage('Provider groups')}','#','','','/libp/mpanel/images/dtree/groupevent.png'
,'/libp/mpanel/images/dtree/groupevent.png',''
,' xajax_process_browse_url(\'?action=provider_group&click_from_menu=1\');  return false;');
d.add(207,200,'{$oLanguage->GetDMessage('Provider regions')}','#','','','/libp/mpanel/images/dtree/groupevent.png'
,'/libp/mpanel/images/dtree/groupevent.png',''
,' xajax_process_browse_url(\'?action=provider_region&click_from_menu=1\');  return false;');
d.add(210,200,'{$oLanguage->GetDMessage('Providers')}','#','','','/libp/mpanel/images/dtree/groupevent.png'
,'/libp/mpanel/images/dtree/groupevent.png',''
,' xajax_process_browse_url(\'?action=provider&click_from_menu=1\');  return false;');
d.add(231,200,'{$oLanguage->GetDMessage('Dynamic discounts')}','#','','','/libp/mpanel/images/dtree/groupevent.png'
,'/libp/mpanel/images/dtree/groupevent.png',''
,' xajax_process_browse_url(\'?action=discount&click_from_menu=1\');  return false;');
d.add(240,200,'{$oLanguage->GetDMessage('Account')}','#','','','/libp/mpanel/images/dtree/groupevent.png'
,'/libp/mpanel/images/dtree/groupevent.png',''
,' xajax_process_browse_url(\'?action=account&click_from_menu=1\');  return false;');



d.add(300,0,'{$oLanguage->GetDMessage('Customer support')}','#','','','/libp/mpanel/images/dtree/aim.png'
,'/libp/mpanel/images/dtree/aim.png');
d.add(312,300,'{$oLanguage->GetDMessage('Context hints')}','#','','','/libp/mpanel/images/dtree/aim.png'
,'/libp/mpanel/images/dtree/aim.png',''
,' xajax_process_browse_url(\'?action=context_hint&click_from_menu=1\');  return false;');

d.add(400,0,'{$oLanguage->GetDMessage('Logs')}','#','','','/libp/mpanel/images/dtree/notebook.png'
,'/libp/mpanel/images/dtree/notebook.png');
d.add(401,400,'{$oLanguage->GetDMessage('Finance log')}','#','','','/libp/mpanel/images/dtree/notebook.png'
,'/libp/mpanel/images/dtree/notebook.png',''
,' xajax_process_browse_url(\'?action=log_finance&click_from_menu=1\');  return false;');
d.add(413,400,'{$oLanguage->GetDMessage('Mail Queue')}','#','','','/libp/mpanel/images/dtree/notebook.png'
,'/libp/mpanel/images/dtree/notebook.png',''
,' xajax_process_browse_url(\'?action=log_mail&click_from_menu=1\');  return false;');
d.add(420,400,'{$oLanguage->GetDMessage('Visit log')}','#','','','/libp/mpanel/images/dtree/notebook.png'
,'/libp/mpanel/images/dtree/notebook.png',''
,' xajax_process_browse_url(\'?action=log_visit&click_from_menu=1\');  return false;');
d.add(425,400,'{$oLanguage->GetDMessage('Log Admin')}','#','','','/libp/mpanel/images/dtree/notebook.png'
,'/libp/mpanel/images/dtree/notebook.png',''
,' xajax_process_browse_url(\'?action=log_admin&click_from_menu=1\');  return false;');


d.add(800,0,'{$oLanguage->GetDMessage('Auto catalog')}','#','','','/libp/mpanel/images/dtree/contents.png'
,'/libp/mpanel/images/dtree/contents.png');
d.add(801,800,'{$oLanguage->GetDMessage('Catalog list')}','#','','','/libp/mpanel/images/dtree/contents.png'
,'/libp/mpanel/images/dtree/contents.png',''
,' xajax_process_browse_url(\'?action=cat&click_from_menu=1\');  return false;');
d.add(811,800,'{$oLanguage->GetDMessage('Parameter Parts')}','#','','','/libp/mpanel/images/dtree/contents.png'
,'/libp/mpanel/images/dtree/contents.png',''
,' xajax_process_browse_url(\'?action=cat_part&click_from_menu=1\');  return false;');
d.add(822,800,'{$oLanguage->GetDMessage('Price')}','#','','','/libp/mpanel/images/dtree/contents.png'
,'/libp/mpanel/images/dtree/contents.png',''
,' xajax_process_browse_url(\'?action=price&click_from_menu=1\');  return false;');
d.add(830,800,'{$oLanguage->GetDMessage('Price group')}','#','','','/libp/mpanel/images/dtree/contents.png'
,'/libp/mpanel/images/dtree/contents.png',''
,' xajax_process_browse_url(\'?action=price_group&click_from_menu=1\');  return false;');
d.add(842,800,'{$oLanguage->GetDMessage('Handbook')}','#','','','/libp/mpanel/images/dtree/contents.png'
,'/libp/mpanel/images/dtree/contents.png',''
,' xajax_process_browse_url(\'?action=handbook&click_from_menu=1\');  return false;');
d.add(843,800,'{$oLanguage->getDMessage('Handbook params editor')}','#','','','/libp/mpanel/images/dtree/contents.png'
,'/libp/mpanel/images/dtree/contents.png',''
,' xajax_process_browse_url(\'?action=hbparams_editor&click_from_menu=1\');  return false;');
d.add(845,800,'{$oLanguage->GetDMessage('Sitemap')}','#','','','/libp/mpanel/images/dtree/contents.png'
,'/libp/mpanel/images/dtree/contents.png',''
,' xajax_process_browse_url(\'?action=sitemap_links&click_from_menu=1\');  return false;');

d.add(10002,0,'{$oLanguage->GetDMessage('Trash')}','#','','','','/libp/mpanel/images/dtree/trashcan_full.png'
,'/libp/mpanel/images/dtree/trashcan_full.png',
'xajax_process_browse_url(\'?action=trash&click_from_menu=1\'); return false;');

d.add(10003,0,'{$oLanguage->GetDMessage('Logout')}','./?action=quit','','','/libp/mpanel/images/dtree/exit.gif');
document.write(d);
//-->
        </script>
<br/>

</div>