{assign var="sBaseUpload" value="upload_excel"}
{include file='addon/mpanel/form_upload.tpl' sBaseUpload=$sBaseUpload sFormAction="/single/mpanel_file_upload.php?BaseUpload=$sBaseUpload"}

<script language="javascript" type="text/javascript" src="js/custom.js"></script>
<FORM id='main_form' action='javascript:void(null);'
	onsubmit="submit_form(this)">
	
<table cellspacing=0 cellpadding=2 class=add_form>
	<tr>
		<th>{$oLanguage->getDMessage('import')}</th>
	</tr>
	<tr>
		<td>
		<table cellspacing=2 cellpadding=1>
			{include file='addon/mpanel/base_upload_button.tpl' sFieldName='Excel to upload' sBaseUpload=$sBaseUpload}
		</table>

		</td>
	</tr>
</table>

<input type=hidden name=data[id] value="{$aData.id|escape}">
{include file='addon/mpanel/base_add_button.tpl' sBaseAction=hbparams_editor_import}</FORM>