<td>{$aRow.id}</td>
<td>{$aRow.code}</td>
<td>{$aRow.content|strip_tags|truncate:80:""}</td>
<td nowrap>{include file='addon/mpanel/base_lang_select.tpl'}</td>
<td nowrap>{include file='addon/mpanel/base_row_action.tpl' sBaseAction=$sBaseAction}</td>
