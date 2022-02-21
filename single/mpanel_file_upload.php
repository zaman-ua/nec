<?php

if ($_GET['BaseUpload']) {
    $sBaseUpload = $_GET['BaseUpload'];
}
else {
    $sBaseUpload = '';
}

$sError = "";
$sFileElementName = 'input_file';
$sUploadDir = '/imgbank/temp_upload/mpanel/';

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
        case '999':
        default:
            $sError = 'No error code avaiable';
    }
}
else
if(empty($_FILES[$sFileElementName]['tmp_name']) || $_FILES[$sFileElementName]['tmp_name'] == 'none')
{
    $sError = 'No file was uploaded';
}
else
{
    $sNewFileName = date('Y-m-d_').uniqid().'.tmp';
    if (file_exists($sUploadDir . $sNewFileName)){
        $sError =$sNewFileName . " already exists. ";
    }
    else{

       $bRes = move_uploaded_file($_FILES[$sFileElementName]['tmp_name'], $_SERVER['DOCUMENT_ROOT'].$sUploadDir.$sNewFileName);
    }
    //for security reason, we force to remove all uploaded file
    @unlink($_FILES[$sFileElementName]['tmp_name']);
}

if ($sError) {
    $sError = 'Error: '.$sError;
}

echo "<script language='javascript' type='text/javascript'>window.top.window.StopUpload('$sBaseUpload','$sNewFileName', '$sError');</script>";

?>
