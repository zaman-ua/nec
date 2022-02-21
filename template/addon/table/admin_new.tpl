<div class="row">
	<div class="col-md-12">
		<div class="card">
	    	<div class="card-header">
		      <h3 class="card-title"></h3>
		    </div>
		    <!-- /.card-header -->
			<div class="card-body p-0">
				{if $bFormAvailable}<form id='main_form' action='javascript:void(null);' onsubmit="submit_form(this)">{/if}
				{if $sTableMessage}<div class="{$sTableMessageClass}">{$sTableMessage}</div>{/if}
				
				<div class="pre-scrollable_new table-responsive">
				<table class="table table-striped table-bordered table-hover table-sm" id='admin_itemslist_table'>
				<tbody>
				{if $bHeaderVisible}
				<tr>
					{if $bCheckVisible}<th width="20">
						<input name="check_all" id="all" value="all" type="checkbox" {if $bDefaultChecked}checked{/if}>
					</th>{/if}
				
				{foreach key=key item=aValue from=$aColumn}
					<th {if $aValue.sWidth} width="{$aValue.sWidth}"{/if} {if $aValue.sOrderImage}class="sel"{/if} nowrap>
					{if $aValue.sOrderLink}
					<a href='./?{$aValue.sOrderLink}' {if $bAjaxStepper}onclick=" xajax_process_browse_url(this.href); return false;"{/if}
						>{/if}
					{$aValue.sTitle}
				
					{if $aValue.sOrderLink}
						{if $aValue.sOrderImage}<img src='{$aValue.sOrderImage}' border=0 hspace=1>{/if}
					</a>{/if}
				
					{if !$aValue.sTitle}&nbsp;{/if}</th>
				{/foreach}
				</tr>
				{/if}
				
				{assign var="num" value=1}
				{section name=d loop=$aItem}
				{assign var=aRow value=$aItem[d]}
				<tr class="{cycle values="even,none"}">
					{if $bCheckVisible}
						<td>{if $sBaseAction!='admin' || ($sBaseAction=='admin' && $aRow.login && $aRow.login!=$CheckLogin && $aAdmin.id != $aRow.id)}<input name="row_check[{$num}]" value="{$aRow.$sCheckField}" type="checkbox">{/if}</td>
					{/if}
				{include file=$sDataTemplate}
				</tr>
				{assign var="num" value=$num+1}
				{/section}
				
				
				{if !$aItem}
				<tr>
					<td class=even colspan=20>
					{if $sNoItem}
						{$oLanguage->getMessage($sNoItem)}
					{else}
						{$oLanguage->getMessage("No items found")}
					{/if}
					</td>
				</tr>
				{/if}
				</tbody>
				</table>
				</div>
				
				{*<!-- mobile begin -->
				<div class="row hidden-lg-up d-lg-none d-xl-none" style="padding: 10px;">
					{$sLeftFilter}
				</div>
				
				<div class="row hidden-lg-up d-lg-none d-xl-none" style="padding: 10px;">
					<input type=checkbox id=search_strong_id name=data[search_strong] value='1' style="width:22px;" {if $oLanguage->getConstant('mpanel_search_strong',0)}checked{/if}
					    onchange="javascript:
						xajax_process_browse_url('?action=admin_search_strong_change&status='+document.getElementById('search_strong_id').checked); return false;">
				    {$oLanguage->getDMessage('Searh strong')}
				</div>
				
				<div class="row hidden-lg-up d-lg-none d-xl-none" style="padding: 10px;">
					<select id=display_select_id name=display_select class="form-control btn-sm"
						onchange="javascript:
					xajax_process_browse_url('?action={$sAction}_display_change&content='+document.getElementById('display_select_id').options[document.getElementById('display_select_id').selectedIndex].value); return false;">
						<option value=5 {if $iRowPerPage==5} selected{/if}>5</option>
					    <option value=10 {if $iRowPerPage==10 || !$iRowPerPage} selected{/if}>10</option>
					    <option value=20 {if $iRowPerPage==20} selected{/if}>20</option>
					    <option value=30 {if $iRowPerPage==30} selected{/if}>30</option>
					    <option value=50 {if $iRowPerPage==50} selected{/if}>50</option>
					    <option value=100 {if $iRowPerPage==100} selected{/if}>100</option>
					    <option value=200 {if $iRowPerPage==200} selected{/if}>200</option>
					    <option value=500 {if $iRowPerPage==500} selected{/if}>500</option>
					    <option value=1000 {if $iRowPerPage==1000} selected{/if}>1000</option>
					</select>
				</div>
				
				<div class="row hidden-lg-up d-lg-none d-xl-none" style="padding: 10px;">
					{$oLanguage->getDMessage('Results')} {$iStartRow} - {$iEndRow} of {$iAllRow}
				</div>
				
				<div class="row hidden-lg-up d-lg-none d-xl-none" style="padding: 10px;">
					{if $sStepper}
					{$sStepper}
					{/if}
				</div>
				<!-- mobile end -->*}

				<!-- pc begin -->
				<div class="row hidden-md-down d-md-none d-lg-flex d-sm-none d-none" style="padding: 10px;">
					<div class="col-5">
						{$sLeftFilter}
					</div>
					
					<div class="col-7 text-right">
						{$oLanguage->getDMessage('Results')} {$iStartRow} - {$iEndRow} of {$iAllRow}
					</div>
				</div>
				
				<div class="row hidden-md-down d-md-none d-lg-flex d-sm-none d-none" style="padding: 10px;">
					<div class="col-2">
						<input type=checkbox id=search_strong_id name=data[search_strong] value='1' style="width:22px;" {if $oLanguage->getConstant('mpanel_search_strong',0)}checked{/if}
					    onchange="javascript:
						xajax_process_browse_url('?action=admin_search_strong_change&status='+document.getElementById('search_strong_id').checked); return false;">
					    {$oLanguage->getDMessage('Searh strong')}
					</div>
				
					<div class="col-9">
						{if $sStepper}
						{$sStepper}
						{/if}
					</div>
					
					<div class="col-1">
						<select id=display_select_id name=display_select class="form-control btn-sm"
							onchange="javascript:
						xajax_process_browse_url('?action={$sAction}_display_change&content='+document.getElementById('display_select_id').options[document.getElementById('display_select_id').selectedIndex].value); return false;">
							<option value=5 {if $iRowPerPage==5} selected{/if}>5</option>
						    <option value=10 {if $iRowPerPage==10 || !$iRowPerPage} selected{/if}>10</option>
						    <option value=20 {if $iRowPerPage==20} selected{/if}>20</option>
						    <option value=30 {if $iRowPerPage==30} selected{/if}>30</option>
						    <option value=50 {if $iRowPerPage==50} selected{/if}>50</option>
						    <option value=100 {if $iRowPerPage==100} selected{/if}>100</option>
						    <option value=200 {if $iRowPerPage==200} selected{/if}>200</option>
						    <option value=500 {if $iRowPerPage==500} selected{/if}>500</option>
						    <option value=1000 {if $iRowPerPage==1000} selected{/if}>1000</option>
						</select>
					</div>
				</div>
				<!-- pc end -->
				
				<div style="padding: 5px;">
				{if $sButtonTemplate} {include file=$sButtonTemplate} {/if}
				
				{if $sAddButton}
				<input type=button value="{$sAddButton}" onclick="location.href='./?action={$sAddAction}'" >
				{/if}
				</div>
				
				{if $bFormAvailable}
				<input type=hidden name=action id='action' value='empty'>
				<input type=hidden name=return id='return' value=''>
				</form>
				{/if}
				
			</div>
		</div>
	</div>
</div>