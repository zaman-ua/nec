<div class="rd-navbar-search_collapsable">
	<ul class="rd-navbar-nav">
		{*<li class="active"><a href="/">Home</a></li>*}
		
		{foreach from=$aGroups item=aLv1}
		<li{if $smarty.request.action=='price_group' || $smarty.request.action=='catalog'} class="active"{/if}><a href="#">{$aLv1.name}</a>
			{if $aLv1.childs}
			<ul class="rd-navbar-dropdown">
				{foreach from=$aLv1.childs item=aLv2}
                <li><a href="/catalog/{$aLv2.code}">{$aLv2.name}</a></li>
                {/foreach}
			</ul>
			{/if}
		</li>
		{/foreach}
		
		{foreach from=$aDropdownMenu item=aItem name=menu key=sKey}
	   	<li{if $smarty.request.action==$aItem.code} class="active"{/if}><a href="/pages/{$aItem.code}">{$aItem.name}</a></li>
	    {/foreach}
	</ul>
</div>