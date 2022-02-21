<td>
    <div class="order-num">{$oLanguage->GetMessage('popular')}</div>
    {$aRow.popular}
</td>
<td>
    <div class="order-num">{$oLanguage->GetMessage('brand')}</div>
    {$aRow.brand}
</td>
<td>
    <div class="order-num">{$oLanguage->GetMessage('code')}</div>
    {$aRow.code}
</td>
<td nowrap>
    <a href="/pages/manager_popular_products_add/?data[code]={$aRow.code}&data[pref]={$aRow.pref}">{$oLanguage->GetMessage('add')}</a>
</td>