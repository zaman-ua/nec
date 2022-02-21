<FORM id='main_form' action='javascript:void(null);' onsubmit="submit_form(this)">
<table cellspacing=0 cellpadding=2 class=add_form style="width:100%;">
<tr>
 <th>
 {$oLanguage->getDMessage('Roles permissions')}
 </th>
</tr>
<tr><td>

<table cellspacing=2 cellpadding=1 style="width:100%;">
  <tr>
   <td style="width:100px;">{$oLanguage->getDMessage('action')}:</td>
   <td><b>{$aData.action_name}</b>
   	<input type="hidden" name=data[action_name] value="{$aData.action_name}">
   </td>
  </tr>
  <tr>
   <td>{$oLanguage->getDMessage('Description')}:</td>
   <td><input type=text name=data[action_description] value='{$aData.action_description}' style="width:100%;"></td>
  </tr>
  <tr>
	<td width=50%>{$oLanguage->GetDMessage('Group')}:</td>
	<td>
	{html_options name=data[id_role_group] options=$aGroupList selected=$aData.id_role_group}
	</td>
  </tr>
</table>
</td></tr>
</table>

<input type="hidden" name="data[id]" value="{$aData.id}">
{*<input type="hidden" name="data[id_role_group]" value="{$aData.id_role_group}">*}
<input type="hidden" name="mod" value="save">
<input type="hidden" name="action" value="role_permissions">
<input type="button" value="<< Назад" onclick=" xajax_process_browse_url('?action=role_permissions'); return false; " class="submit_button">
<input type="submit" class="bttn" value="Сохранить">
</FORM>