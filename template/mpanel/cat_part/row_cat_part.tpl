<td>{$aRow.id}</td>
<td>{$aRow.pref}</td>
<td>{$aRow.brand}</td>
<td>{$aRow.code}</td>
<td>{$aRow.name_rus}</td>
<td>{if $aRow.code_price_group}{$aRow.price_group_name} ({$aRow.code_price_group}){/if}</td>
<!--td>{$aRow.size_name}</td-->
<td nowrap>
{include file='addon/mpanel/base_row_action.tpl' sBaseAction=$sBaseAction}
</td>
