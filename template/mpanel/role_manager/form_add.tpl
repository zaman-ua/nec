<FORM id='main_form' action='javascript:void(null);' onsubmit="submit_form(this)">
<table cellspacing=0 cellpadding=2 class=add_form>
<tr>
 <th>
 {$oLanguage->getDMessage('Role')}
 </th>
</tr>
<tr><td>

<table cellspacing=2 cellpadding=1>
  <tr>
   <td width=50%>{$oLanguage->getDMessage('Name')}:</td>
   <td><input type=text name=data[name] value='{$aData.name}' ></td>
  </tr>
  <tr>
   <td>{$oLanguage->getDMessage('Description')}:</td>
   <td><input type=text name=data[description] value='{$aData.description}'></td>
  </tr>
</table>
</td></tr>
</table>


{include file='addon/mpanel/base_add_button.tpl' sBaseAction=$sBaseAction}
</FORM>