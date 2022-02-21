<?php
/**
 * @author Mikhail Strovoyt
 */

class CallMe extends Base
{
	public function Send()
	{
     Base::$aGeneralConf['StripXss']=1;
     Base::EscapeAll(Base::$aRequest);
	   $date=date('d.m.Y H:i');
	   $sToEmail=Base::GetConstant('global:to_email');
      $sSubject=Language::GetText('Call me request')." ".SERVER_NAME.$_SERVER['REQUEST_URI'];
      $sBodyHtml="<h5>".$date."</h5><br>";
      $sBodyHtml.=Language::GetText('Client name').": <b>".Base::$aRequest['name']."</b><br>";
      $sBodyHtml.=Language::GetText('Phone').": <b>".Base::$aRequest['phone']."</b><br>";
      $sBodyHtml.=Language::GetText('message').": <b>".Base::$aRequest['message']."</b><br>";
      $sFromEmail=Base::GetConstant('global:email_from');
      Mail::$bAddedNoRply=false;
	   $bSendResult=Mail::SendNow($sToEmail,$sSubject,$sBodyHtml,$sFromEmail);
	   
	   $aCallMe['fio']= Base::$aRequest['name'];
	   $aCallMe['phone']= Base::$aRequest['phone'];
	   $aCallMe['message']= Base::$aRequest['message'];

	   Db::autoExecute('call_me', $aCallMe);
	   
	   if($bSendResult) {
			Base::$sText.=Language::GetText('Your message is successfully sent.');
			return; 		    
		}
	}
}
?>