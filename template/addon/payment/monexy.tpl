<table width=100% border=0>
	<tr>
		<td><b>{$oLanguage->GetMessage("Monexy amount")}:</b></td>
		<td>
<input type="text" name="amount"
	value="{if $smarty.request.amount}{$smarty.request.amount}{else}{$oLanguage->GetConstant('payment:default_amount','0.6')}{/if}">
{html_options name='currency' options=$aMonexyCurrency style='width:130px'}
		</td>
	</tr>

</table>