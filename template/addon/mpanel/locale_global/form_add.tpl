<FORM id='main_form' action='javascript:void(null);'
	onsubmit="submit_form(this,Array())">

<table cellspacing=0 cellpadding=2 class=add_form>
	<tr>
		<th>{$oLanguage->getDMessage('Translation')} - {$sLanguageTitle}</th>
	</tr>
	<tr>
		<td>

		<table cellspacing=2 cellpadding=1>
			{foreach key=sFieldName item=sFieldType from=$aMap}
{if $sFieldType == 'textarea'}
			<tr>
				<td width="100%">{$oLanguage->getDMessage($sFieldName)}:</td>
				<td><textarea name=data[{$sFieldName}]>{$aData.$sFieldName}</textarea></td>
			</tr>
{elseif $sFieldType == 'editor'}
			<tr>
				<td width="100%">{$oLanguage->getDMessage($sFieldName)}:</td>
				<td>{$oAdmin->getCKEditor("data[$sFieldName]",$aData.$sFieldName)}</td>
			</tr>
			<tr><td>{$oLanguage->getDMessage('Use code html')}:</td>
			    <td><input type="hidden" name=data[use_code_html] value="0">
			    <input type=checkbox name=data[use_code_html] value='1' style="width:22px;"></td>
			</tr>
			<tr><td width="100%">{$oLanguage->getDMessage('Translation html')}:</td>
			    <td><textarea style="width: 700px;height: 300px;" name=data[{$sFieldName}_html]>{$aData.$sFieldName}</textarea></td>
			</tr>
{elseif $sFieldType == 'new_editor'}
			<tr>
				<td width="100%">{$oLanguage->getDMessage($sFieldName)}:</td>
				<td>{$oAdmin->getCKEditor("data[$sFieldName]",$aData.$sFieldName)}</td>
			</tr>
			<tr><td>{$oLanguage->getDMessage('Use code html')}:</td>
			    <td><input type="hidden" name=data[use_code_html] value="0">
			    <input type=checkbox name=data[use_code_html] value='1' style="width:22px;"></td>
			</tr>
			<tr><td width="100%">{$oLanguage->getDMessage('Translation html')}:</td>
			    <td><textarea style="width: 700px;height: 300px;" name=data[{$sFieldName}_html]>{$aData.$sFieldName}</textarea></td>
			</tr>
{elseif $sFieldType == 'checkbox'}
			<tr>
				<td width="100%">{$oLanguage->getDMessage($sFieldName)}:</td>
				<td>
	{include file='addon/mpanel/form_checkbox.tpl' sFieldName=$sFieldName bChecked=$aData.$sFieldName}
				</td>
			</tr>
{elseif $sFieldType == 'image'}
{include file='addon/mpanel/form_image.tpl' aData=$aData}
{else}
			<tr>
				<td width="100%">{$oLanguage->getDMessage($sFieldName)}:</td>
				<td><input name=data[{$sFieldName}] value="{$aData.$sFieldName|escape}"></td>
			</tr>
{/if}
			{/foreach}
		</table>

		</td>
	</tr>
</table>

<input type=hidden name=data[i] value="{$aData.i|escape}">

<input type=hidden name=table_name value="{$sTableName}">

{include file='addon/mpanel/base_add_button.tpl' sBaseAction=$sBaseAction}

</FORM>
