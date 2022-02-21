<form id="filter_form" name="filter_form" class="form-inline" action="javascript:void(null)" onsubmit="submit_form(this)">

<div class="form-group">
				<label >{$oLanguage->GetdMessage('id')}:</label>
				<input type=text name=search[id]
					value="{$aSearch.id|escape}" maxlength=50 class="form-control btn-sm">
 </div>
 <div class="form-group">					
				<label >{$oLanguage->GetdMessage('id_price_group')}:</label>
				<input type=text name=search[id_price_group]
					value="{$aSearch.id_price_group|escape}" maxlength=50 class="form-control btn-sm">
 </div>
 <div class="form-group">					
					<label >{$oLanguage->GetMessage('id_provider')}:</label>
				<input type=text name=search[id_provider]
					value="{$aSearch.id_provider|escape}" maxlength=50
					class="form-control btn-sm">
 </div>
 <div class="form-group">					
					<label >{$oLanguage->GetMessage('code')}:</label>
				<input type=text name=search[code]
					value="{$aSearch.code|escape}" maxlength=50 class="form-control btn-sm">
 </div>
 <div class="form-group">					
				<label >{$oLanguage->GetMessage('Price')}:</label>
				<input type=text name=search[price]
					value="{$aSearch.price|escape}" maxlength=50 class="form-control btn-sm">
 </div>
 <div class="form-group">					
					<label >{$oLanguage->GetdMessage('part_rus')}:</label>
				<input type=text name=search[part_rus]
					value="{$aSearch.part_rus|escape}" maxlength=50
					class="form-control btn-sm">
 </div>
 <div class="form-group">
				<label >{$oLanguage->GetMessage('pref')}:</label>
				<input type=text name=search[pref]
					value="{$aSearch.pref|escape}" maxlength=50
					class="form-control btn-sm">
 </div>
 <div class="form-group">					
					<label >{$oLanguage->GetMessage('cat')}:</label>
				<input type=text name=search[cat]
					value="{$aSearch.cat|escape}" maxlength=50
					class="form-control btn-sm">
 </div>
 <div class="form-group">					
					<label >{$oLanguage->GetMessage('post_date')}:</label>
				<input type=text name=search[post_date]
					value="{$aSearch.post_date|escape}" maxlength=50
					class="form-control btn-sm">
 </div>
 <div class="form-group">					
					<label >{$oLanguage->GetMessage('Term')}:</label>
				<input type=text name=search[term]
					value="{$aSearch.term|escape}" maxlength=50 class="form-control btn-sm">
 </div>
 <div class="form-group">					
					<label >{$oLanguage->GetMessage('stock')}:</label>
				<input type=text name=search[stock]
					value="{$aSearch.stock|escape}" maxlength=50
					class="form-control btn-sm">
 </div>
 <div class="form-group">					
					<label >{$oLanguage->GetdMessage('number_min')}:</label>
				<input type=text name=search[number_min]
					value="{$aSearch.number_min|escape}" maxlength=50
					class="form-control btn-sm">
 </div>
 <div class="form-group">

<input type=button class='btn btn-primary btn-sm' value="{$oLanguage->getDMessage('Clear')}"
	onclick="xajax_process_browse_url('?{$sSearchReturn|escape}')">
<input type=submit value="{$oLanguage->getMessage('Search')}" class='btn btn-primary btn-sm'>

<input type=hidden name=action value={$sBaseAction}_search>
<input type=hidden name=return value="{$sSearchReturn|escape}">
</div>
</form>