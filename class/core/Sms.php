<?php
/**
 * @author Dima Valegov
 * @author Mikhail Starovoyt
 */

class Sms extends Base
{
	//-----------------------------------------------------------------------------------------------
	public function __construct()
	{
		Repository::InitDatabase('sms_delayed');
	}
	//-----------------------------------------------------------------------------------------------
	public static function FormatNumber($sPhoneNumber)
	{
		$sPhoneNumber = mb_ereg_replace ( '[^0-9]*', '', $sPhoneNumber );
		if ($sPhoneNumber != '') {
			if (strpos ( ' ' . $sPhoneNumber, '00' ) == 1) {
				$sPhoneNumber = "+" . substr ( $sPhoneNumber, 2 );
			}
			if (strpos ( ' ' . $sPhoneNumber, '0' ) == 1) {
				$sPhoneNumber = "+38$sPhoneNumber";
			}
			if (strpos ( ' ' . $sPhoneNumber, '80' ) == 1) {
				$sPhoneNumber = "+3$sPhoneNumber";
			}
			if (strpos ( ' ' . $sPhoneNumber, '380' ) == 1) {
				$sPhoneNumber = "+$sPhoneNumber";
			}
			if (strpos ( ' ' . $sPhoneNumber, '49') == 1) {
				$sPhoneNumber = "+$sPhoneNumber";
			}
			if (strpos ( ' ' . $sPhoneNumber, '89' ) == 1) { // numbers in the task TUL-30
				$sPhoneNumber {0} = "7";
			}
			if (strpos ( ' ' . $sPhoneNumber, '79' ) == 1) { // numbers in the task TUL-30
				$sPhoneNumber = "+$sPhoneNumber";
			}
			if (strpos ( ' ' . $sPhoneNumber, '77' ) == 1) {
				$sPhoneNumber = "+$sPhoneNumber";
			}
			$sPhoneNumber = mb_substr ( $sPhoneNumber, 0, Base::GetConstant('sms:phone_length',13));
			if (strlen ( $sPhoneNumber ) != Base::GetConstant('sms:phone_length',13) || $sPhoneNumber {0} != '+') {
				$sPhoneNumber = '';
			}
		}
		return $sPhoneNumber;
	}
	//-----------------------------------------------------------------------------------------------
	private static function SendGT($sPhoneNumber, $sMessage, $iTimeout = 10, $is_send_now = 1)
	{
	    $sStatus = '';
	    
		$postdata = "";
		$postdata .= "CS=u";
		$postdata .= "&MN=" . urlencode ( $sPhoneNumber );
		$postdata .= "&SM=" . urlencode ( $sMessage );

		$url = "http://sms.gt.com.ua/SendSM.htm";
		$referer = "http://sms.gt.com.ua/";
		$curl = curl_init ( "$url" );
		if ($postdata != '') {
			curl_setopt ( $curl, CURLOPT_POST, 1 );
			curl_setopt ( $curl, CURLOPT_POSTFIELDS, $postdata );
		}
		curl_setopt ( $curl, CURLOPT_USERAGENT, 'User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)' );
		curl_setopt ( $curl, CURLOPT_REFERER, $referer );
		curl_setopt ( $curl, CURLOPT_HEADER, 0 );
		curl_setopt ( $curl, CURLOPT_SSL_VERIFYPEER, 0 );
		curl_setopt ( $curl, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt ( $curl, CURLOPT_SSL_VERIFYHOST, 1 );
		curl_setopt ( $curl, CURLOPT_COOKIE, 'UID=4D7A93357E26F792' ); //Your Web ID: 46661062
		curl_setopt ( $curl, CURLOPT_TIMEOUT, $iTimeout );

		$response = curl_exec ( $curl );

		if (curl_errno ( $curl )) {
			curl_close ( $curl );
			$sStatus = 'Ошибка отправки SMS (SendGT): '.curl_errno ( $curl );
			goto ret;
			//return false;
		}
		curl_close ( $curl );

		if ($response != '' && strpos ( $response, 'Message sent' ) !== false) {
		    $sStatus = $response;
			goto ret;
			//return false;
		}
		
		ret:
		// отправка не по крону
		if ($is_send_now && Language::getConstant('sms_send_now_fixed_log',0)) {
		    // проверка наличия полей
		    $iExist_is_send_now = Db::getRow("show columns FROM `sms_delayed` where `Field` = 'is_send_now'");
		    $iExist_status_send_now = Db::getRow("show columns FROM `sms_delayed` where `Field` = 'status_send_now'");
            if ($iExist_is_send_now && $iExist_status_send_now) {		        
    		    $sSql = "insert into sms_delayed (number,message,post,sent_time,is_send_now,status_send_now)
    			values (
    			'" . Db::EscapeString ( $sPhoneNumber ) . "',
    			'" . Db::EscapeString ( $sMessage ) . "',
    			UNIX_TIMESTAMP(),UNIX_TIMESTAMP(),1,'".Db::EscapeString($sStatus)."')";
    		    Db::Execute($sSql);
            }
		}
		if ($sStatus)
		    return false;
		
		return true;
	}
	//-----------------------------------------------------------------------------------------------
	private static function SendTurbo($sPhoneNumber, $sMessage, $sSender = 'Partmaster', $is_send_now = 1)
	{
	    $sStatus = '';
	    
		$client = new SoapClient ( Base::GetConstant('sms:turbo_soap','http://62.149.25.11/service/WebService.wsdl') );
		$auth = Array ('login' => 'mstar', 'password' => 'kjH87T&*w' );

		$result = $client->Auth ( $auth );
		if ($result->AuthResult != 'User succesfully authorized') {
			error_log ( $sStatus = 'Turbo SMS error: ' . $result->AuthResult );
			goto ret;
			//return false;
		}

		$result = $client->GetCreditBalance ();
		if ($result->GetCreditBalanceResult <= 0) {
			error_log ( $sStatus = 'Turbo SMS error: credit balance is ' . $result->GetCreditBalanceResult );
			goto ret;
			//return false;
		}

		$sms = Array ('sender' => $sSender, 'destination' => $sPhoneNumber, 'text' => iconv ( 'windows-1251', 'utf-8', $sMessage));
		$result = $client->SendSMS ( $sms );

		if (@$result->SendSMSResult->ResultArray [2] != '') {
		    goto ret;
			//return true;
		} else {
			error_log($sStatus = "Turbo SMS error: SendSMS('$sSender','$sPhoneNumber','$sMessage') - ".$result->SendSMSResult->ResultArray [0] );
			goto ret;
			//return false;
		}
		
		ret:
		// отправка не по крону
		if ($is_send_now && Language::getConstant('sms_send_now_fixed_log',0)) {
		    // проверка наличия полей
		    $iExist_is_send_now = Db::getRow("show columns FROM `sms_delayed` where `Field` = 'is_send_now'");
   		    $iExist_status_send_now = Db::getRow("show columns FROM `sms_delayed` where `Field` = 'status_send_now'");
		    if ($iExist_is_send_now && $iExist_status_send_now) {
		        $sSql = "insert into sms_delayed (number,message,post,sent_time,is_send_now,status_send_now)
    			values (
    			'" . Db::EscapeString ( $sPhoneNumber ) . "',
    			'" . Db::EscapeString ( $sMessage ) . "',
    			UNIX_TIMESTAMP(),UNIX_TIMESTAMP(),1,'".Db::EscapeString($sStatus)."')";
		        Db::Execute($sSql);
		    }
		}
		if ($sStatus)
		    return false;
		
		return true;
	}
	//-----------------------------------------------------------------------------------------------
	private static function SendTurboV2($sPhoneNumber, $sMessage, $sSender = 'Partmaster', $is_send_now = 1)
	{
	    $sStatus = '';

	    $client = new SoapClient ( 'http://turbosms.in.ua/api/wsdl.html' );
		$auth = Array (
		'login' => Base::GetConstant('sms:turbo_login','mstar'),
		'password' =>  Base::GetConstant('sms:turbo_password','kjH87T&*w'),
		);

		$result = $client->Auth ( $auth );

		$_SESSION['sms_error'] = '';
		
		if ($result->AuthResult != 'Вы успешно авторизировались') {
			error_log ( $sStatus = 'Turbo SMS error: '.$auth['login'].' '.$auth['password'].' (auth) '.$result->AuthResult);
			goto ret;
			//return false;
		}

		$result = $client->GetCreditBalance ();
		if ($result->GetCreditBalanceResult <= 0) {
		    $_SESSION['sms_error'] = '-3';
			error_log ( $sStatus = 'Turbo SMS error: credit balance is ' . $result->GetCreditBalanceResult );
			goto ret;
			//return false;
		}

		if (strtolower(Base::GetConstant('global:default_encoding'))=='utf-8') $sEncodedMessage=$sMessage;
		else $sEncodedMessage=iconv('windows-1251', 'utf-8',$sMessage);
		
		$sms = Array ('sender' => $sSender, 'destination' => $sPhoneNumber, 'text' => $sEncodedMessage );
		$result = $client->SendSMS ( $sms );

		if (@$result->SendSMSResult->ResultArray [0] == 'Сообщения успешно отправлены' ) {
		    goto ret;
			//return true;
		} else {
			error_log( $sStatus = "Turbo SMS error: SendSMS('$sSender','$sPhoneNumber','$sMessage') - " .
			print_r( $result->SendSMSResult->ResultArray ,true) );
			goto ret;
			//return false;
		}
		
		ret:
		// отправка не по крону
		if ($is_send_now && !Language::getConstant('sms_send_now_fixed_log',0)) {
		    // проверка наличия полей
		    $iExist_is_send_now = Db::getRow("show columns FROM `sms_delayed` where `Field` = 'is_send_now'");
   		    $iExist_status_send_now = Db::getRow("show columns FROM `sms_delayed` where `Field` = 'status_send_now'");
            if ($iExist_is_send_now && $iExist_status_send_now) {		        
    		    $sSql = "insert into sms_delayed (number,message,post,sent_time,is_send_now,status_send_now)
    			values (
    			'" . Db::EscapeString ( $sPhoneNumber ) . "',
    			'" . Db::EscapeString ( $sMessage ) . "',
    			UNIX_TIMESTAMP(),UNIX_TIMESTAMP(),1,'".Db::EscapeString($sStatus)."')";
    		    Db::Execute($sSql);
            }
		}
		if ($sStatus)
		    return false;
		
		return true;
	}
	//-----------------------------------------------------------------------------------------------
	private static function SendTurboV3($sPhoneNumber, $sMessage, $sSender = 'Partmaster', $sSenderViber = 'Mobibon', $is_send_now = 1)
	{
	    $sStatus = '';
	    
		$sMethodBalance = "user/balance.json";
		$sMethodSend = "message/send.json";
		$sType = Base::GetConstant("sms:turbosms_type","viber-sms"); // sms, viber, viber-sms - гибридная
		$aParams = array();

		if (!Base::GetConstant("sms:turbo_api_key","084a8b8af40ac74eb2a21703e0f765a31324dafc")) {
			error_log ( $sStatus = 'Turbo SMS error: API is empty');
			goto ret;
			//return false;
		}

		$result = self::SendRequestTurbo($aParams, $sMethodBalance);

        if ($result->response_result->balance <= 0) {
		    $_SESSION['sms_error'] = '-3';
			error_log ( $sStatus = 'Turbo SMS error: credit balance is ' . $result->response_result->balance );
			goto ret;
			//return false;
		}

		switch($sType) {
			case 'sms' : 
				$aParams = array(
					"recipients"=>array($sPhoneNumber),
					"sms"=>array(
						"sender"=>$sSender,
						"text"=>$sMessage
					)
				);
				break;
			case 'viber' : 
				$aParams = array(
					"recipients"=>array($sPhoneNumber),
					"viber"=>array(
						"sender"=>$sSenderViber,
						"text"=>$sMessage
					)
				);
				break;
			case 'viber-sms' : 
				$aParams = array(
					"recipients"=>array($sPhoneNumber),
					"viber"=>array(
						"sender"=>$sSenderViber,
						"text"=>$sMessage
					),
					"sms"=>array(
						"sender"=>$sSender,
						"text"=>$sMessage
					)
				);
				break;
			default: 
				$aParams = array(
					"recipients"=>array($sPhoneNumber),
					"sms"=>array(
						"sender"=>$sSender,
						"text"=>$sMessage
					)
				);
				break;
		}
		
		$result = self::SendRequestTurbo($aParams, $sMethodSend);
		
		if ($result->response_code >= 800 && $result->response_code < 900) {
		    goto ret;
			//return true;
		} else {
			error_log( $sStatus = "Turbo SMS error: SendSMS('$sSender','$sPhoneNumber','$sMessage') - " .
			print_r( $result->SendSMSResult->ResultArray ,true) );
			goto ret;
			//return false;
		}
		
		ret:
		// отправка не по крону
		if ($is_send_now && Language::getConstant('sms_send_now_fixed_log',0)) {
		    // проверка наличия полей
		    $iExist_is_send_now = Db::getRow("show columns FROM `sms_delayed` where `Field` = 'is_send_now'");
   		    $iExist_status_send_now = Db::getRow("show columns FROM `sms_delayed` where `Field` = 'status_send_now'");
		    if ($iExist_is_send_now && $iExist_status_send_now) {
		        $sSql = "insert into sms_delayed (number,message,post,sent_time,is_send_now,status_send_now)
    			values (
    			'" . Db::EscapeString ( $sPhoneNumber ) . "',
    			'" . Db::EscapeString ( $sMessage ) . "',
    			UNIX_TIMESTAMP(),UNIX_TIMESTAMP(),1,'".Db::EscapeString($sStatus)."')";
		        Db::Execute($sSql);
		    }
		}
		if ($sStatus)
		    return false;
		
		return true;
	}
	//-----------------------------------------------------------------------------------------------
	private static function SendMobizon($sPhoneNumber, $sMessage, $sSender = '', $is_send_now = 1)
	{
	    $sStatus = '';
	    
	    require_once SERVER_PATH.'/single/MobizonApi.php';

	    $_SESSION['sms_error'] = '';
	    $api = new Mobizon\MobizonApi(Base::GetConstant("sms:mobizon_key",'kzaa1defcec0977c86fc91ac39c12539cee7b14ccb4e15cfe93068442389d4a895d88c'), Base::GetConstant("sms:mobizon_host",'api.mobizon.kz'));
	    $alphaname = $sSender;
	    if ($api->call(
	        'message',
	        'sendSMSMessage',
	        array(
	            'recipient' => trim($sPhoneNumber, '+'),
	            'text' => $sMessage,
	            'from' => $alphaname,
	            //Optional, if you don't have registered alphaname, just skip this param and your message will be sent with our free common alphaname.
	        ))
	    ) {
	        $messageId = $api->getData('messageId');
	         
	        if ($messageId) {
	            goto ret;
	            //return true;
	        }
	    } else {
	        $sStatus = 'Ошибка отправки SMS (SendMobizon)'; 
            $_SESSION['sms_error'] = '-1';
            goto ret;
	        //return false;
	    }
	    
	    ret:
	    // отправка не по крону
	    if ($is_send_now && Language::getConstant('sms_send_now_fixed_log',0)) {
	        // проверка наличия полей
	        $iExist_is_send_now = Db::getRow("show columns FROM `sms_delayed` where `Field` = 'is_send_now'");
	        $iExist_status_send_now = Db::getRow("show columns FROM `sms_delayed` where `Field` = 'status_send_now'");
	        if ($iExist_is_send_now && $iExist_status_send_now) {
	            $sSql = "insert into sms_delayed (number,message,post,sent_time,is_send_now,status_send_now)
    			values (
    			'" . Db::EscapeString ( $sPhoneNumber ) . "',
    			'" . Db::EscapeString ( $sMessage ) . "',
    			UNIX_TIMESTAMP(),UNIX_TIMESTAMP(),1,'".Db::EscapeString($sStatus)."')";
	            Db::Execute($sSql);
	        }
	    }
	    
		if ($sStatus)
		    return false;
		
		return true;
	}
	//-----------------------------------------------------------------------------------------------
	private static function SendRequestTurbo($aParams=array(), $sMethod='')
	{
		if(!$sMethod) return;
		$sUrl = "https://api.turbosms.ua/";
		$ch = curl_init();
        $postData = json_encode($aParams);
        curl_setopt($ch, CURLOPT_URL, $sUrl.$sMethod);
        curl_setopt($ch, CURLOPT_POST, true);

        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Length: ' . mb_strlen($postData),
            'Content-Type: application/json',
            'Authorization: Basic '.Base::GetConstant("sms:turbo_api_key","084a8b8af40ac74eb2a21703e0f765a31324dafc")
        ));
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        $result = json_decode(curl_exec($ch));
        curl_close($ch);
        return $result;
	}
	//-----------------------------------------------------------------------------------------------
	public static function SendNow($sPhoneNumber, $sMessage, $is_send_now=1)
	{
		if (Base::GetConstant('sms:stop_send_now',0)) return;

		$sPhoneNumber = Sms::FormatNumber ( $sPhoneNumber );
		$sMessage = trim ( $sMessage );
		if ($sPhoneNumber != '' && $sMessage != '') {
			switch (Base::GetConstant('sms_delivery_type', 'shluz' )) {
				case 'turbosms' :
					return self::SendTurboV2 ( $sPhoneNumber, $sMessage,Base::GetConstant('sms:from','partmaster'), $is_send_now);

				case 'turbosmsviber' :
					return self::SendTurboV3 ( $sPhoneNumber, $sMessage, Base::GetConstant('sms:from','partmaster'), Base::GetConstant('sms:viber_from','Mobibon'), $is_send_now);
					
				case 'clickatell' :
					return self::SendClickatell($sPhoneNumber, $sMessage,Base::GetConstant('sms:from','oem24.com'), $is_send_now);
					
				case 'mobizon' :
					return self::SendMobizon($sPhoneNumber, $sMessage,Base::GetConstant('sms:from','oem24.com'), $is_send_now);

				case 'smscentre' :
			        return self::SendCentre ( $sPhoneNumber, $sMessage,Base::GetConstant('sms:from','AvtoApteka'), $is_send_now );

				default: return self::SendTurboV2 ( $sPhoneNumber, $sMessage,Base::GetConstant('sms:from','partmaster'), $is_send_now);
			}
		}
		//------------------------------------------------------------------
		return false;
	}
	//-----------------------------------------------------------------------------------------------
	/*
	* require_once SERVER_PATH.'/class/core/Sms.php';
	* Sms::AddDelayed('+380688160516','Privet!!!');
	* Sms::SendDelayed();
	*
	* $sPhoneNumber - phone number can be set in any format:
	* +380688160516
	* 00380688160516
	* 380688160516
	* 80688160516
	* 0688160516
	* 068-816-05-16
	* 8-(068)-816-05-16
	* ...
	*
	* $sMessage -Message russian text cp1251, max. 70 symbols.
	*/
	public static function AddDelayed($sPhoneNumber, $sMessage)
	{
		$sPhoneNumberFormated = Sms::FormatNumber ( $sPhoneNumber );
		Base::$db->Execute ( "insert into sms_delayed (number,message,post,sent_time)
			values (
			'" . Db::EscapeString ( $sPhoneNumberFormated ? $sPhoneNumberFormated : $sPhoneNumber ) . "',
			'" . Db::EscapeString ( $sMessage ) . "',
			UNIX_TIMESTAMP(),
			'" . ($sPhoneNumberFormated ? '0' : '-2') . "'
			) " );
	}
	//-----------------------------------------------------------------------------------------------
	public static function SendDelayed($iMessage = 1)
	{
		Repository::InitDatabase('sms_delayed');

		if (Base::GetConstant('stop_sms', 0)) return false;

		if (Base::GetConstant('sms:check_send_time', '0')) {
			$iHourNow=date('H');
			if (!($iHourNow> Base::GetConstant('sms:send_time_from', '0') &&
			$iHourNow<Base::GetConstant('sms:send_time_to', '24'))) return false;
		}

		$aSmsList = Base::$db->getAll ( "select * from sms_delayed where sent_time in (0,NULL) order by post
			limit 0,{$iMessage}" );
		if ($aSmsList)
		foreach ( $aSmsList as $aSms ) {
			$bIsSent = Sms::SendNow($aSms['number'],$aSms ['message'],0);
			if ($_SESSION['sms_error']) {
			    Base::$db->Execute ( "update sms_delayed set sent_time=".$_SESSION["sms_error"]." where id='{$aSms['id']}'" );
			} else {
			    Base::$db->Execute ( "update sms_delayed set sent_time=" .
			        ($bIsSent ? "UNIX_TIMESTAMP()" : "-1") . " where id='{$aSms['id']}'" );
			}
		}
	}
	//-----------------------------------------------------------------------------------------------
	public static function SendClickatell($sPhoneNumber, $sMessage, $sSender ='', $is_send_now = 1)
	{
	    $sStatus = '';
		require_once(SERVER_PATH."/lib/clickatel_sms_api/sms_api.php");
		$oSmsApi=new sms_api();
		$oSmsApi->api_id=Base::GetConstant('sms:clickatell_api_id','3212834');
		$oSmsApi->user=Base::GetConstant('sms:clickatell_user','mstar');;
		$oSmsApi->password=Base::GetConstant('sms:clickatell_password','BJSafv04');

		$oSmsApi->_auth();

		$sPhoneNumber=str_replace("+","",$sPhoneNumber);
		$bStatus = $oSmsApi->send($sPhoneNumber, $sSender, $sMessage);
		
		// отправка не по крону
		if ($is_send_now && Language::getConstant('sms_send_now_fixed_log',0)) {
		    // проверка наличия полей
		    $iExist_is_send_now = Db::getRow("show columns FROM `sms_delayed` where `Field` = 'is_send_now'");
		    $iExist_status_send_now = Db::getRow("show columns FROM `sms_delayed` where and `Field` = 'status_send_now'");
		    if ($iExist_is_send_now && $iExist_status_send_now) {
		        $sSql = "insert into sms_delayed (number,message,post,sent_time,is_send_now,status_send_now)
    			values (
    			'" . Db::EscapeString ( $sPhoneNumber ) . "',
    			'" . Db::EscapeString ( $sMessage ) . "',
    			UNIX_TIMESTAMP(),UNIX_TIMESTAMP(),1,'".Db::EscapeString($bStatus ? '' : 'Ошибка отправки SMS (SendClickatell)')."')";
		        Db::Execute($sSql);
		    }
		}
		return $bStatus;
	}
	//-----------------------------------------------------------------------------------------------
	private static function SendCentre($sPhoneNumber, $sMessage, $sFrom = '', $iTimeout = 10, $is_send_now = 1)
	{
	    $sStatus = '';
	    
	    $sPhoneNumber = Sms::FormatNumber ( $sPhoneNumber );
	    //  http://api.smscentre.com.ua/http/submit_sm.php?login=demo&passwd=demo
	    //  &alphaname=SMS-Ukraine&destaddr=%2B380667412691&msgtext=GO%20TEST%202&msgchrset=lat
	    $postdata = "";
	    $postdata .= "login=" . Language::getConstant('smscentre:login','sta-auto');
	    $postdata .= "&passwd=" . Language::getConstant('smscentre:password','olga');
	    $postdata .= "&alphaname=" . ($sFrom ? $sFrom : Language::getConstant('smscentre:from','AvtoApteka'));
	    $postdata .= "&destaddr=" . urlencode ( $sPhoneNumber );
	    $postdata .= "&msgtext=" . urlencode ( $sMessage );
	    $postdata .= "&msgchrset=cyr";
	
	    $url = "http://api.smscentre.com.ua/http/submit_sm.php?".$postdata;
	    $referer = "http://api.smscentre.com.ua/";
	    $curl = curl_init ( "$url" );
	    curl_setopt ( $curl, CURLOPT_USERAGENT, 'User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)' );
	    curl_setopt ( $curl, CURLOPT_REFERER, $referer );
	    curl_setopt ( $curl, CURLOPT_HEADER, 0 );
	    curl_setopt ( $curl, CURLOPT_SSL_VERIFYPEER, 0 );
	    curl_setopt ( $curl, CURLOPT_RETURNTRANSFER, 1 );
	    curl_setopt ( $curl, CURLOPT_SSL_VERIFYHOST, 1 );
	    curl_setopt ( $curl, CURLOPT_TIMEOUT, $iTimeout );
	
	    $response = curl_exec ( $curl );
	
	    if (curl_errno ( $curl )) {
	        Language::UpdateConstant('smscentre:error_date',date("Y-m-d H:i:s"));
	        Language::UpdateConstant('smscentre:error',$sStatus = 'error_send_sms: '.curl_error($curl).' ('.curl_errno($curl).')');
	        curl_close ( $curl );
	        //return false;
	        goto ret;
	    }
	    curl_close ( $curl );
	
        if ($response != '' && strpos ( $response, 'RETURNCODE=00' ) !== false) {
	        Language::UpdateConstant('smscentre:error_date','-');
	        Language::UpdateConstant('smscentre:error','-');	    
	        Sms::SmsCentreLimit();
	        //return true;
	        goto ret;
	    }
	    else {
    	    Language::UpdateConstant('smscentre:error_date',date("Y-m-d H:i:s"));
    	    Language::UpdateConstant('smscentre:error',$sStatus = 'error_send_sms: '.$response);
	        //return false;
    	    goto ret;
	    }
	    
	    ret:
	    // отправка не по крону
	    if ($is_send_now && !Language::getConstant('sms_send_now_fixed_log',0)) {
	        // проверка наличия полей
	        $iExist_is_send_now = Db::getRow("show columns FROM `sms_delayed` where `Field` = 'is_send_now'");
	        $iExist_status_send_now = Db::getRow("show columns FROM `sms_delayed` where `Field` = 'status_send_now'");
	        if ($iExist_is_send_now && $iExist_status_send_now) {
	            $sSql = "insert into sms_delayed (number,message,post,sent_time,is_send_now,status_send_now)
    			values (
    			'" . Db::EscapeString ( $sPhoneNumber ) . "',
    			'" . Db::EscapeString ( $sMessage ) . "',
    			UNIX_TIMESTAMP(),UNIX_TIMESTAMP(),1,'".Db::EscapeString($sStatus)."')";
	            Db::Execute($sSql);
	        }
	    }
	    if ($sStatus)
	        return false;
	    
	    return true;
	}
	//-----------------------------------------------------------------------------------------------
	public function SmsCentreLimit()
	{
	    // http://api.smscentre.com.ua/http/get_smslimit.php?login=demo&passwd=demo
	    $postdata = "";
	    $postdata .= "login=" . Language::getConstant('smscentre:login','sta-auto');
	    $postdata .= "&passwd=" . Language::getConstant('smscentre:password','olga');
	    
	    $url = "http://api.smscentre.com.ua/http/get_smslimit.php?".$postdata;
	    $referer = "http://api.smscentre.com.ua/";
	    $curl = curl_init ( "$url" );
	    curl_setopt ( $curl, CURLOPT_USERAGENT, 'User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)' );
	    curl_setopt ( $curl, CURLOPT_REFERER, $referer );
	    curl_setopt ( $curl, CURLOPT_HEADER, 0 );
	    curl_setopt ( $curl, CURLOPT_SSL_VERIFYPEER, 0 );
	    curl_setopt ( $curl, CURLOPT_RETURNTRANSFER, 1 );
	    curl_setopt ( $curl, CURLOPT_SSL_VERIFYHOST, 1 );
	    curl_setopt ( $curl, CURLOPT_TIMEOUT, 5 );
	    
	    $response = curl_exec ( $curl );
	    
	    if (curl_errno ( $curl )) {
	        curl_close ( $curl );
	        return false;
	    }
	    curl_close ( $curl );
	    
	    if ($response != '' && strpos ( $response, 'RETURNCODE=00' ) !== false) {
	        Language::UpdateConstant('smscentre:error_date','-');
	        Language::UpdateConstant('smscentre:error','-');
	        $aText = explode("\n",$response);
	        $iFound=0;
	        if ($aText)
	            foreach ($aText as $sText) {
	                list($sKey,$sVal) = explode("=",$sText);
	                if ($sKey=='SMSLIMIT') {
	                    $iFound=1;
	                    $iCntLimit = $sVal;
	                    break;
	                }
	            }
	        if (!$iFound) {
	            Language::UpdateConstant('smscentre:error_date',date("Y-m-d H:i:s"));
	            Language::UpdateConstant('smscentre:error','error_get_limit: not found key SMSLIMIT : '.$response);
	            return false;
	        }
	        Language::UpdateConstant('smscentre:limit',$iCntLimit);
	        Language::UpdateConstant('smscentre:limit_date',date("Y-m-d H:i:s"));
	        // если лимит исчерпан, письмо и отключение отправки
	        if ($iCntLimit == 0) {
	            Language::UpdateConstant('stop_sms', '1');
	            $sBody = $sSubject = 'SMS отправка остановлена. Лимит доступных SMS=0';
	            Mail::AddDelayed(Base::GetConstant('manager:email_recievers','info@mstarproject.com')
	            ,$sSubject,$sBody,'',"info",false);
	            return true;
	        }
	        elseif ($iCntLimit <= Language::getConstant('smscentre:alert_limit',10) && Language::getConstant('smscentre:alert_limit_sended',0)) {
	            Language::UpdateConstant('smscentre:alert_limit_sended',1);
	            $sBody = $sSubject = 'SMS отправка скоро будет остановлена. Лимит доступных SMS='.$iCntLimit;
	            Mail::AddDelayed(Base::GetConstant('manager:email_recievers','info@mstarproject.com')
	            ,$sSubject,$sBody,'',"info",false);
	            return true;
	        } 
	        Language::UpdateConstant('smscentre:alert_limit_sended',0);
	        return true;
	    }
	    Language::UpdateConstant('smscentre:error_date',date("Y-m-d H:i:s"));
	    Language::UpdateConstant('smscentre:error','error_get_limit: '.$response);
	    return false;
	}
}
