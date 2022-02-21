//-----------------------------------------------------------------------------
function confirm_delete_glg()
{
	return confirm('Are you sure you want to delete Item?');
}
//-----------------------------------------------------------------------------
function confirm_archive_glg()
{
	return confirm('Are you sure you want to hide?');
}
//-----------------------------------------------------------------------------
function confirm_mail_price_glg()
{
	return confirm('Are you sure you want to unmail price for user?');
}
//-----------------------------------------------------------------------------
function confirm_unmail_price_glg()
{
	return confirm('Are you sure you want to archive Item?');
}
//-----------------------------------------------------------------------------
function update_input(form_name,element_name,element_value)
{
	document.forms[form_name].elements[element_name].value=element_value;
}
//-----------------------------------------------------------------------------
function getSelectedValues (oListbox, sId){
  var arrValues = new Array;
  for (var i=0; i < oListbox.options.length; i++){
      if (oListbox.options[i].selected) {
      	arrValues.push("'"+oListbox.options[i].value+"'");
      }
  }
  document.getElementById(sId).value = arrValues;
  return arrValues;
}
//-----------------------------------------------------------------------------
//function CheckIsDirty(editor_name)
//{
//	var oEditor = FCKeditorAPI.GetInstance(editor_name) ;
//	return oEditor.IsDirty ;
//}
//-----------------------------------------------------------------------------
function get_ed_text(editor_name)
{
	var oEditor = FCKeditorAPI.GetInstance(editor_name) ;
	var contents = oEditor.GetXHTML(true);
	if (contents) return contents;

	if (oEditor.EditorDocument.body.innerHTML)
	return oEditor.EditorDocument.body.innerHTML;
	else return '';
}
//-----------------------------------------------------------------------------
function edit_ed_text(editor_name,value)
{
	var oEditor = FCKeditorAPI.GetInstance(editor_name);
	oEditor.SetHTML( value ) ;
	return false;
}
//-----------------------------------------------------------------------------
function submit_form(frm,rt_editors)
{
	if (!frm) frm=document.getElementById('main_form');

	for ( instance in CKEDITOR.instances ) {
		CKEDITOR.instances[instance].updateElement();
	}

	if (arguments.length > 1) {
		for (var i = 0; i < rt_editors.length; i++)
		{
			var val = get_ed_text(rt_editors[i]);
			//               alert(i+" : "+val+" : "+rt_editors[i]);
			frm.elements[rt_editors[i]].value = val;
			//               alert(frm.elements[rt_editors[i]].value);
		}
	}

	xajax_process_form(xajax.getFormValues(frm));
	return false;
}

//-----------------------------------------------------------------------------
function submit_main_form()
{
	//old function call (will be deleted soon)
	submit_form();
	return false;
}
//-----------------------------------------------------------------------------
var marked_row = new Array;
//-----------------------------------------------------------------------------
function setPointer(theRow, theRowNum, theAction, theDefaultColor, thePointerColor, theMarkColor)
{
	var theCells = null;

	if ((thePointerColor == '' && theMarkColor == '')
	|| typeof(theRow.style) == 'undefined') {
		return false;
	}

	if (typeof(document.getElementsByTagName) != 'undefined') {
		theCells = theRow.getElementsByTagName('td');
	}
	else if (typeof(theRow.cells) != 'undefined') {
		theCells = theRow.cells;
	}
	else {
		return false;
	}


	var rowCellsCnt  = theCells.length;
	var domDetect    = null;
	var currentColor = null;
	var newColor     = null;

	if (typeof(window.opera) == 'undefined'
	&& typeof(theCells[0].getAttribute) != 'undefined') {
		if (theCells[0].getAttribute('bgcolor')){
			currentColor = theCells[0].getAttribute('bgcolor');
		}else{
			currentColor = theDefaultColor;
		}
		domDetect    = true;
	}

	else {
		currentColor = theCells[0].style.backgroundColor;
		domDetect    = false;
	} // end 3

	if (currentColor.indexOf("rgb") >= 0)
	{
		var rgbStr = currentColor.slice(currentColor.indexOf('(') + 1,
		currentColor.indexOf(')'));
		var rgbValues = rgbStr.split(",");
		currentColor = "#";
		var hexChars = "0123456789ABCDEF";
		for (var i = 0; i < 3; i++)
		{
			var v = rgbValues[i].valueOf();
			currentColor += hexChars.charAt(v/16) + hexChars.charAt(v%16);
		}
	}

	if (currentColor == ''
	|| currentColor.toLowerCase() == theDefaultColor.toLowerCase()) {
		if (theAction == 'over' && thePointerColor != '') {
			newColor              = thePointerColor;
		}
		else if (theAction == 'click' && theMarkColor != '') {
			newColor              = theMarkColor;
			marked_row[theRowNum] = true;
		}
	}
	// 4.1.2 Current color is the pointer one
	else if (currentColor.toLowerCase() == thePointerColor.toLowerCase()
	&& (typeof(marked_row[theRowNum]) == 'undefined' || !marked_row[theRowNum])) {
		if (theAction == 'out') {
			newColor              = theDefaultColor;
		}
		else if (theAction == 'click' && theMarkColor != '') {
			newColor              = theMarkColor;
			marked_row[theRowNum] = true;
		}
	}
	// 4.1.3 Current color is the marker one
	else if (currentColor.toLowerCase() == theMarkColor.toLowerCase()) {
		if (theAction == 'click') {
			newColor              = (thePointerColor != '')
			? thePointerColor
			: theDefaultColor;
			marked_row[theRowNum] = (typeof(marked_row[theRowNum]) == 'undefined' || !marked_row[theRowNum])
			? true
			: null;
		}
	} // end 4

	if (newColor) {
		var c = null;
		if (domDetect) {
			for (c = 0; c < rowCellsCnt; c++) {
				theCells[c].setAttribute('bgcolor', newColor, 0);
			} // end for
		}
		else {
			for (c = 0; c < rowCellsCnt; c++) {
				theCells[c].style.backgroundColor = newColor;
			}
		}
	} // end 5

	return true;
}
//-----------------------------------------------------------------------------
function setCheckboxes(form_id,do_check)
{
	var i=0;
	for (var num = 0; num < 1000; num++) {
		if (i==0) {
			bg= "#F7F8F9";
			i=1;
		}
		else {
			bg="#FFFFFF";
			i=0;
		}

		if (document.getElementById(form_id).elements["id" + num])
		{
			tr=document.getElementById("tr_id_"+num);
			if (document.getElementById(form_id).elements["id" + num].checked != do_check)
			setPointer(tr, num, 'click',bg, '#CCFFCC', '#FFCC99');

			setPointer (tr, num, 'out',  bg, '#CCFFCC', '#FFCC99');

			document.getElementById(form_id).elements["id" + num].checked = do_check;

		}
		else break;
	} // end for
	return false;

}
//-----------------------------------------------------------------------------
function setCheckboxesThumbs(form_id,do_check)
{
	var bg='#F7F8F9'
	for (var num = 0; num < 1000; num++) {
		if (document.getElementById(form_id).elements["id" + num])
		{
			tr=document.getElementById("tr_id_"+num);
			if (document.getElementById(form_id).elements["id" + num].checked != do_check)
			setPointer(tr, num, 'click',bg, '#CCFFCC', '#FFCC99');
			setPointer (tr, num, 'out',  bg, '#CCFFCC', '#FFCC99');

			document.getElementById(form_id).elements["id" + num].checked = do_check;

		}
		else break;
	} // end for
	return false;

}
//-----------------------------------------------------------------------------
function empty()
{
	return false;
}
//-----------------------------------------------------------------------------
function show_loading()
{
	document.getElementById('loading_id').innerHTML="<img src='/libp/mpanel/images/wait.gif' \
		align=absmiddle hspace=1 vspace=1> Processing Request ...";
}
//-----------------------------------------------------------------------------
function hide_loading()
{
	document.getElementById('loading_id').innerHTML='';
}
//----------list checkbox and color controls-----------------------------------
function onTRclk(obj,num,bg) {
	setPointer(obj, num, 'click', bg, '#CCFFCC', '#FFCC99');
	var objInput=obj.getElementsByTagName('INPUT')[0];
	objInput.checked=!(objInput.checked);
}
function onTRmov(obj,num,bg) {
	setPointer(obj, num, 'over', bg, '#CCFFCC', '#FFCC99');
}
function onTRmou(obj,num,bg) {
	setPointer(obj, num, 'out', bg, '#CCFFCC', '#FFCC99');
}
function onINclk(obj,num,bg) {
	obj.checked=!(obj.checked);
}
function onAllINclk(obj) {
	var rootObj=obj;
	while (rootObj && rootObj.nodeName!='TBODY') rootObj=rootObj.parentNode;
	if (!rootObj) return;
	var arrObjIN=rootObj.getElementsByTagName('INPUT');
	var tr;
	var i=1;
	var j=1;
	var bg;
	while (arrObjIN[i]) {
		if (arrObjIN[i].name.substr(0,3)=='id[') {
			tr=arrObjIN[i];
			while (tr && tr.nodeName!='TR') tr=tr.parentNode;
			if (tr) {
				if (j) bg='#F7F8F9'; else bg='#FFFFFF';
				j=1-j;
				if (arrObjIN[i].checked!=obj.checked) {
					setPointer(tr, i-1, 'click', bg, '#CCFFCC', '#FFCC99');
					arrObjIN[i].checked=obj.checked;
				}
				setPointer (tr, i-1, 'out',  bg, '#CCFFCC', '#FFCC99');
			}
		}
		i++;
	}
}
//-----------------------------------------------------------------------------
function pop_win(url,w,h,name){
 if (!w) w=720;
 if (!h) h=520;
 if (!name) name='';
 var nw=window.open(url, name, 'scrollbars=1,fullscreen=0,toolbar=0,menubar=1,status=1,resizable=1,location=0,directories=0,width='+w+',height='+h);
 nw.focus();
}
//--------------------------------------------------------------
function mark_wrong_filed(fieldname) {
	var arrObj=document.getElementsByTagName('*');
	var i=0;
	var td;
	while (arrObj[i]) {
		if (arrObj[i].name==fieldname) {
			td=arrObj[i];
			while (td && td.nodeName!='TD') td=td.parentNode;
			if (td) {
				td.style.border='red 1px solid';
				break;
			}
		}
		i++;
	}
}
//--------------------------------------------------------------
function clear_marks(fieldnames) {
	var arrObj=document.getElementsByTagName('*');
	var i=0;
	var td;
	while (arrObj[i]) {
		if ( arrObj[i].name && fieldnames.indexOf(arrObj[i].name)>=0 ) {
			td=arrObj[i];
			while (td && td.nodeName!='TD') td=td.parentNode;
			if (td) {
				if (td.style.border=='red 1px solid' || td.style.border=='1px solid red')
				td.style.border='';
			}
		}
		i++;
	}
}
//--------------------------------------------------------------
function setVisibility(id, object){
	var element = document.getElementById(id);
	if (object.checked) {
		element.value ="";
		element.style.visibility='visible';
	} else {
		element.value ="";
		element.style.visibility='hidden';
	}
}