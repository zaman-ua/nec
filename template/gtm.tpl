{if $aGTMtransaction}
<script type="text/javascript">
<!--
dataLayer.push({ldelim}
	"ecommerce": {ldelim}
	"purchase": {ldelim}
		"actionField": {ldelim}
        	"id": "{$aGTMOrder.id}",
     	    "currency": "UAH",
        	"revenue": {$aGTMOrder.total},
    	{rdelim},
	"products": 
	[
        {foreach from=$aGTMtransaction item=aItem name=gtmbase}
        {ldelim}
        {foreach from=$aItem key=sKey item=sValue name=gtmitem}
        "{$sKey}": "{$sValue}"{if !$smarty.foreach.gtmitem.last},{/if}
        {/foreach}
    	{rdelim}{if !$smarty.foreach.gtmbase.last},{/if}
        {/foreach}
	]
{rdelim},
{rdelim}
{rdelim});
//-->
</script>
{/if}