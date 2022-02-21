<form id="filter_form" name="filter_form" class="form-inline" action="javascript:void(null)" onsubmit="submit_form(this)">

<div class="form-group">
<div class="form-group">
<label >Customer:</label>
<input type="text"  name=search[customer_login] value="{$aSearch.customer_login|escape}" maxlength=20 class="form-control btn-sm" >
 </div>
 
 <div class="form-group">
				<label >Date from:</label>
				<input type="text"  id=date_from name=search[date_from] class="form-control btn-sm" 
					readonly value="{$aSearch.date_from|escape}"
					onclick="popUpCalendar(this, this, 'dd.mm.yyyy');">
 </div>
 <div class="form-group">
 
				<label >Date To:</label>
				<input type="text"  id=date_to name=search[date_to] class="form-control btn-sm" 
					readonly value="{$aSearch.date_to|escape}"
					onclick="popUpCalendar(this, this, 'dd.mm.yyyy');">
 </div>
 <div class="form-group">
 <label class="sr-only" >buttons</label>
<input type=button class="btn btn-danger btn-sm" value="{$oLanguage->getDMessage('Clear')}"
	onclick="xajax_process_browse_url('?{$sSearchReturn|escape}')">
<input type=submit value='Search' class="btn btn-success btn-sm">

<input type=hidden name=action value={$sBaseAction}_search>
<input type=hidden name=return value="{$sSearchReturn|escape}">
</div>
</form>