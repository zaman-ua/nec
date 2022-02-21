<?php

/**
 * @author Mikhail Starovoyt
 */

class ContactForm extends Base
{
	//-----------------------------------------------------------------------------------------------
	function __construct()
	{
// 		$oCpacha= new Capcha();
// 		Base::$tpl->assign('sCapcha',$oCpacha->GetMathematic('user/capcha.tpl'));
	}
	//-----------------------------------------------------------------------------------------------
	public function Index()
	{
		if (Base::$aRequest['is_post']) {
// 			if (!Capcha::CheckMathematic('user/capcha.tpl')) 
// 				$sError = "Check capcha value";
// 			else {
				if (Base::$aRequest['data']['name'] && Base::$aRequest['data']['email']) {

					foreach (Base::$aRequest['data'] as $sKey => $aValue) {
						$sMessage.=Language::GetMessage($sKey).' : '.$aValue.'<br />';
					}

					$bSendResult=Mail::SendNow(Base::GetConstant('global:to_email','mstarrr@gmail.com'),Language::GetMessage('contact_form'),$sMessage,Base::GetConstant('global:email_from'));
					
					Db::AutoExecute("contact_form", Base::$aRequest['data']);

					Base::$sText.=Language::GetText('Message is successfully sent.');
					
					Base::Redirect("/pages/contact_form");
					return;
				}
				else $sError = "Please, fill the required fields";
// 			}
		}
		
		$aData=array(
		'sHeader'=>"method='post' class='rd-mailform rd-mailform_style-1' data-form-output='form-output-global' data-form-type='contact' onsubmit=\"dataLayer.push({'event': 'form-sent', 'eventCategory' : 'contact', 'eventAction' : 'sent' });\" ",
		//'sTitle'=>"Static Contact Form",
		'sContent'=>Base::$tpl->fetch('fola/form_contact.tpl'),
// 		'sSubmitButton'=>'Send',
		'sSubmitAction'=>'contact_form',
		'sError'=>$sError,
		'sTemplatePath' =>'form/main_reg.tpl',
		);
		$oForm=new Form($aData);

		Base::$tpl->assign('sContactForm',$oForm->getForm());
		Base::$sText=Base::$tpl->fetch('nec/contact_form.tpl');
//
//		Base::$tpl->assign('sGoogleMap',Base::$tpl->fetch('fola/google_map.tpl'));
	}
	//-----------------------------------------------------------------------------------------------
	public function Call()
	{
		if (Base::$aRequest['is_post']) {
			if (!Capcha::CheckMathematic()) Form::ShowError("Check capcha value");
			else {
				if (Base::$aRequest['data']['name'] && Base::$aRequest['data']['phone']) {
					foreach (Base::$aRequest['data'] as $sKey => $aValue) {
						$sMessage.=$sKey.' : '.$aValue.'<br />';
					}

					Mail::AddDelayed(Base::GetConstant('global:to_email','mstarrr@gmail.com'),Language::GetMessage('contact_call'),
					$sMessage);

					Base::$sText.=Language::GetText('Message is successfully sent.');
					return;
				}
				else Form::ShowError("Please, fill the required fields");
			}
		}

		$aField['name']=array('title'=>'Ваше имя','type'=>'input','value'=>Base::$aRequest['data']['name'],'name'=>'data[name]','szir'=>1);
		$aField['email']=array('title'=>'Ваш e-mail','type'=>'input','value'=>Base::$aRequest['data']['email'],'name'=>'data[email]');
		$aField['phone']=array('title'=>'Номер вашего телефона','type'=>'input','value'=>Base::$aRequest['data']['phone'],'name'=>'data[phone]','id'=>'user_phone','placeholder'=>'(___)___ __ __','szir'=>1);
		$aField['time_call']=array('title'=>'Время звонка','type'=>'text','value'=>Language::GetMessage('c').':','add_to_td'=>array(
		    'time_from'=>array('type'=>'input','value'=>Base::$aRequest['data']['time_from'],'name'=>'data[time_from]'),
		    'time_to_text'=>array('type'=>'text','value'=>Language::GetMessage('до').':'),
		    'time_to'=>array('title'=>'Время звонка до','type'=>'input','value'=>Base::$aRequest['data']['time_to'],'name'=>'data[time_to]')
		));
		$aField['subject']=array('title'=>'Тема','type'=>'input','value'=>Base::$aRequest['data']['subject'],'name'=>'data[subject]');
		$oCpacha= new Capcha();
		$aField['capcha']=array('title'=>'Capcha field','type'=>'text','value'=>$oCpacha->GetMathematic('contact_form/mathematic.tpl'),'szir'=>1);
		$aField['description']=array('type'=>'textarea','name'=>'data[description]','value'=>Base::$aRequest['data']['description'],'colspan'=>2);
		$aField['call_text']=array('type'=>'text','value'=>Language::GetText('call_text'),'colspan'=>2);
		
		$aData=array(
		'sHeader'=>"method=post",
		'sTitle'=>"Contact Form Call",
		//'sContent'=>Base::$tpl->fetch('contact_form/form_call.tpl'),
		'aField'=>$aField,
		'bType'=>'generate',
		'sSubmitButton'=>'Send',
		'sSubmitAction'=>'contact_form_call',
		'sError'=>$sError,
		);
		$oForm=new Form($aData);
		
		Base::$sText.=$oForm->getForm();
	}
	//-----------------------------------------------------------------------------------------------

}
?>