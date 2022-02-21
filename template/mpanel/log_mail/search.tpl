<form id="filter_form" name="filter_form" class="form-inline" action="javascript:void(null)" onsubmit="submit_form(this)">

<div class="form-group">
				<label >{$oLanguage->GetMessage('Address')}:</label>
				<input type=text name=search[address]
					value="{$aSearch.address|escape}" maxlength=50 class="form-control btn-sm">
 </div>
 <div class="form-group">
				<label >{$oLanguage->GetMessage('Subject')}:</label>
				<input type=text name=search[subject]
					value="{$aSearch.subject|escape}" maxlength=50
					class="form-control btn-sm">
 </div>
 <div class="form-group">
				<label >{$oLanguage->GetMessage('Date from')}:</label>
				<input id=date_from name=search[date_from] class="form-control btn-sm"
					readonly="readonly" value="{$aSearch.date_from|escape}"
					onclick="popUpCalendar(this, this, 'dd.mm.yyyy');">
 </div>
 <div class="form-group">					
				<label >{$oLanguage->GetMessage('Date To')}:</label>
				<input id=date_to name=search[date_to] class="form-control btn-sm"
					readonly="readonly" value="{$aSearch.date_to|escape}"
					onclick="popUpCalendar(this, this, 'dd.mm.yyyy');">
 </div>
 <div class="form-group">
<input type=button class="btn btn-danger btn-sm" value="{$oLanguage->getDMessage('Clear')}"
	onclick="xajax_process_browse_url('?{$sSearchReturn|escape}')">
<input type=submit value='Search' class="btn btn-success btn-sm">

<input type=hidden name=action value={$sBaseAction}_search>
<input type=hidden name=return value="{$sSearchReturn|escape}">
</div>
</form>