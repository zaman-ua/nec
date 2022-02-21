<FORM id='main_form' action='javascript:void(null);' onsubmit="submit_form(this)">
<table cellspacing=0 cellpadding=2 class=add_form>
<tr>
 <th>
 {$oLanguage->getDMessage('role_action_exeption')}
 </th>
</tr>
<tr><td>

<table cellspacing=2 cellpadding=1>
  <tr>
   <td width=50%>{$oLanguage->getDMessage('Name')}:</td>
   <td><input type=text name=data[action_name] value='{$aData.action_name}' ></td>
  </tr>
  <tr>
   <td width=50%>{$oLanguage->getDMessage('is_exeption')}:</td>
   <td><input type="hidden" name=data[is_exeption] value="0">
	<input type=checkbox name=data[is_exeption] value='1' style="width:22px;" {if $aData.is_exeption}checked{/if}>
    </td>
  </tr>
</table>
</td></tr>
</table>


{include file='addon/mpanel/base_add_button.tpl' sBaseAction=$sBaseAction}
<input type=hidden name=data[id] value="{$aData.id|escape}">
</FORM>