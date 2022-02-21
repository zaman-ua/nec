<form id="main_form" action="javascript:void(null);" onsubmit="submit_form(this)">
	<table>
		<tr>
			<td width="100%">{$oLanguage->GetDMessage('Select table')}:</td>
			<td>{html_options name=data[table_] options=$aTables selected=$sSelectedTable}</td>
			<td><input type="submit" class="bttn" value="Выбрать"></td>
		</tr>
	</table>
	<input type="hidden" name="action" value="hbparams_editor">
	<input type="hidden" name="is_post" value="1">
</form>