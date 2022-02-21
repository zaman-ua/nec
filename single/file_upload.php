<?php

if ($_GET['id_product']) {
    $iIdProduct = $_GET['id_product'];
}

$sError = "";
$sFileElementName = 'photo';
$sUploadDir = '/imgbank/temp_upload/';


//check for content
if (!stristr($_FILES[$sFileElementName]['type'], "image") ) {
        $_FILES[$sFileElementName]['error']=9;
    }

if($_FILES[$sFileElementName]['error'])
{
    switch($_FILES[$sFileElementName]['error'])
    {

        case '1':
            //$sError = '������ ������������ ����� ��������� ������ ������������� ���������� upload_max_filesize  � php.ini ';
            $sError = 'The size upload file exceeds upload_max_filesize in php.ini';
            break;
        case '2':
            //$sError = '������ ������������ ����� ��������� ������ ������������� ���������� MAX_FILE_SIZE � HTML �����. ';
            $sError = 'The size upload file exceeds MAX_FILE_SIZE in HTML form';
            break;
        case '3':
            //$sError = '��������� ������ ����� ����� ';
            $sError = 'The file part is loaded only';
            break;
        case '4':
            //$sError = '���� �� ��� �������� (������������ � ����� ������ �������� ���� � �����). ';
            $sError = 'The file has not been loaded (the User in form has specified an incorrect path to a file)';
            break;
        case '6':
            //$sError = '�������� ��������� �����������';
            $sError = 'Incorrect time folder';
            break;
        case '7':
            //$sError = '������ ������ ����� �� ����';
            $sError = 'File write error on a disk';
            break;
        case '8':
            //$sError = '�������� ����� ��������';
            $sError = 'File loading is interrupted';
            break;
        case '9':
            $sError = 'Недопустимый формат файла. Файл не будет отправлен!';
            break;
        case '999':
        default:
            $sError = 'No error code avaiable';
    }
    if($_COOKIE['chat_file_upload']){
        $aFile=unserialize($_COOKIE['chat_file_upload']);
        if($aFile){
            $aFile['tmp_name']=$_SERVER['DOCUMENT_ROOT'].'/imgbank/temp_upload/'.$aFile['tmp_name'];
            setcookie("chat_file_upload",null,null,'/');
            @unlink($aFile['tmp_name']);
        }
    }
}
else
if(empty($_FILES[$sFileElementName]['tmp_name']) || $_FILES[$sFileElementName]['tmp_name'] == 'none')
{
    $sError = 'No file was uploaded';
}
else
{
    $aPathinfo=pathinfo($_FILES[$sFileElementName]['name']);
    //$sOldExt='';
    //if($aPathinfo['extension']) $sOldName='_-_'.$aPathinfo['basename'];
    $sNewFileName = date('Y-m-d_').uniqid().'.'.$aPathinfo['extension'];
    if (file_exists($sUploadDir . $sNewFileName)){
        $sError =$sNewFileName . " already exists. ";
    }
    else{
       $bRes = move_uploaded_file($_FILES[$sFileElementName]['tmp_name'], $_SERVER['DOCUMENT_ROOT'].$sUploadDir.$sNewFileName);
    }
    //for security reason, we force to remove all uploaded file
    @unlink($_FILES[$sFileElementName]['tmp_name']);
    $aInputFile=$_FILES['input_file'];
    
    if($_COOKIE['chat_file_upload']){
        $aFile=unserialize($_COOKIE['chat_file_upload']);
        $aFile[]=$sNewFileName;
    } else {
        $aFile[]=$sNewFileName;
    }
    
    setcookie('chat_file_upload', serialize($aFile), 0, "/" );
}

?>
