<?
//error_reporting(E_ALL);
//require_once("../../../const.php");
//
//require_once "../../check_session.php";
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>FCKeditor - Resources Browser</title>
		<link href="browser.css" type="text/css" rel="stylesheet">
		<script type="text/javascript" src="js/fckxml.js"></script>
		<script language="javascript">

		function GetUrlParam( paramName )
		{
			var oRegex = new RegExp( '[\?&]' + paramName + '=([^&]+)', 'i' ) ;
			var oMatch = oRegex.exec( window.top.location.search ) ;

			if ( oMatch && oMatch.length > 1 )
			return oMatch[1] ;
			else
			return '' ;
		}

		var oConnector = new Object() ;
		oConnector.CurrentFolder	= '/' ;

		var sConnUrl = GetUrlParam( 'Connector' ) ;

		// Gecko has some problems when using relative URLs (not starting with slash).
		if ( sConnUrl.substr(0,1) != '/' && sConnUrl.indexOf( '://' ) < 0 )
		sConnUrl = window.location.href.replace( /browser.php.*$/, '' ) + sConnUrl ;

		oConnector.ConnectorUrl = sConnUrl + ( sConnUrl.indexOf('?') != -1 ? '&' : '?' ) ;

		var sServerPath = GetUrlParam( 'ServerPath' ) ;
		if ( sServerPath.length > 0 )
		oConnector.ConnectorUrl += 'ServerPath=' + escape( sServerPath ) + '&' ;

		oConnector.ResourceType		= GetUrlParam( 'Type' ) ;
		oConnector.ShowAllTypes		= ( oConnector.ResourceType.length == 0 ) ;

		if ( oConnector.ShowAllTypes )
		oConnector.ResourceType = 'File' ;

		oConnector.SendCommand = function( command, params, callBackFunction )
		{
			var sUrl = this.ConnectorUrl + 'Command=' + command ;
			sUrl += '&Type=' + this.ResourceType ;
			sUrl += '&CurrentFolder=' + escape( this.CurrentFolder ) ;

			if ( params ) sUrl += '&' + params ;

			var oXML = new FCKXml() ;

			if ( callBackFunction )
			oXML.LoadUrl( sUrl, callBackFunction ) ;	// Asynchronous load.
			else
			return oXML.LoadUrl( sUrl ) ;
		}

		oConnector.CheckError = function( responseXml )
		{
			var iErrorNumber = 0
			var oErrorNode = responseXml.SelectSingleNode( 'Connector/Error' ) ;

			if ( oErrorNode )
			{
				iErrorNumber = parseInt( oErrorNode.attributes.getNamedItem('number').value ) ;

				sErrorText = oErrorNode.attributes.getNamedItem('originalDescription').value ;

				switch ( iErrorNumber )
				{
					case 0 :
					break ;
					case 1 :	// Custom error. Message placed in the "text" attribute.
					alert( oErrorNode.attributes.getNamedItem('text').value ) ;
					break ;
					case 101 :
					alert( 'Folder already exists' ) ;
					break ;
					case 102 :
					alert( 'Invalid folder name' ) ;
					break ;
					case 103 :
					alert( 'You have no permissions to create the folder' ) ;
					break ;
					case 110 :
					alert( 'Unknown error creating folder' ) ;
					break ;
					case 190 :
					if (sErrorText.length) alert( sErrorText ) ;
					else
					alert( 'Folder is not empty' ) ;
					break ;
					default :
					alert( 'Error on your request. Error number: ' + iErrorNumber ) ;
					break ;
				}
			}
			return iErrorNumber ;
		}

		var oIcons = new Object() ;

		oIcons.AvailableIconsArray = [
		'ai','avi','bmp','cs','dll','doc','exe','fla','gif','htm','html','jpg','js',
		'mdb','mp3','pdf','ppt','rdp','swf','swt','txt','vsd','xls','xml','zip','ico' ] ;

		oIcons.AvailableIcons = new Object() ;

		for ( var i = 0 ; i < oIcons.AvailableIconsArray.length ; i++ )
		oIcons.AvailableIcons[ oIcons.AvailableIconsArray[i] ] = true ;

		oIcons.GetIcon = function( fileName )
		{
			var sExtension = fileName.substr( fileName.lastIndexOf('.') + 1 ).toLowerCase() ;

			if ( this.AvailableIcons[ sExtension ] == true )
			return sExtension ;
			else
			return 'default.icon' ;
		}
		</script>
	</head>
	<frameset cols="150,*" class="Frame" framespacing="3" bordercolor="#f1f1e3" frameborder="yes">
		<frameset rows="50,*" framespacing="0">
			<frame src="frmresourcetype.html" scrolling="no" frameborder="no">
			<frame name="frmFolders" src="frmfolders.html" scrolling="auto" frameborder="yes">
		</frameset>
		<frameset rows="50,*,50" framespacing="0">
			<frame name="frmActualFolder" src="frmactualfolder.html" scrolling="no" frameborder="no">
			<frame name="frmResourcesList" src="frmresourceslist.html?return_id="<?echo $_REQUEST[return_id]?>
				 scrolling="auto" frameborder="yes">
			<frameset cols="150,*,0" framespacing="0" frameborder="no">
				<frame name="frmCreateFolder" src="frmcreatefolder.html" scrolling="no" frameborder="no">
				<frame name="frmUpload" src="frmupload.html" scrolling="no" frameborder="no">
				<frame name="frmUploadWorker" src="../../fckblank.html" scrolling="no" frameborder="no">
			</frameset>
		</frameset>
	</frameset>
</html>