$(document).ready(function () {
	$(document).on("click", ".addChar", function() {
		var last = $(".chare").last().attr("id");
		var lastNumber = parseInt(last.substr(5, last.length));
		lastNumber++;
		$("#charactr").append("<div class='row line_settings charrrr'><div class='col-sm-4'><input type='text' placeholder='Размер' class='chare' id='chare" + lastNumber + "' name='criteria[" + lastNumber + "][name]'></div>" +
				"<div class='col-sm-6'><input type='text' placeholder='100x100' class='value' id='value" + lastNumber + "' name='criteria[" + lastNumber + "][code]'></div>" +
						"<div class='col-sm-2' id='delCharactr'><i class='fa fa-minus-circle' aria-hidden='true'></i></div></div>");
	});
	
	$(document).on("click", ".addCharRed", function() {
		var last = $(".chareRed").last().attr("id");
		if(!last) {
			var lastNumber = 0;
		} else {
			var lastNumber = parseInt(last.substr(8, last.length));
		}
		
		lastNumber++;
		$("<div class='row line_settings charrrrRed'><div class='col-sm-4'><input type='text' placeholder='Размер' class='chareRed' id='chareRed" + lastNumber + "' name='criteria[" + lastNumber + "][name]'>" +
				"</div><div class='col-sm-6'><input type='text' placeholder='100x100' class='valueRed' id='valueRed" + lastNumber + "' name='criteria[" + lastNumber + "][code]'></div>" +
						"<div class='col-sm-2' id='delCharactrRed'>" + "<i class='fa fa-minus-circle' aria-hidden='true'></i></div></div>").appendTo($("#charactrRed"));
	});
	
	$(document).on("click", "#delCharactr", function() {
		var l = $(".charrrr").length;
		if (l > 1) {
			$(this).parent().remove();
		}
	});
	
	$(document).on("click", "#delCharactrRed", function() {
		var l = $(".charrrrRed").length;
		if (l > 1) {
			$(this).parent().remove();
		}
	});
	
	$("#addProductForm").submit(function (e) {
		$("#addProductForm").find(".error").removeClass("error");
		var send = true;
		var arr = new Array("name", "descr", "fullDescr", "photo1", "photo2", "photo3");
		var last = $(".chare").last().attr("id");
		var lastNumber = parseInt(last.substr(5, last.length));
		for (var i = 1; i <= lastNumber; i++) {
			if ($("#chare"+i.toString()).length > 0) {
				if (($("#chare"+i.toString()).val() != "") || ($("#value"+i.toString()).val() != "")) {
					arr.push("chare"+i.toString());
					arr.push("value"+i.toString());
				}
				else {
					var l = $(".charrrr").length;
					if (l > 1) {
						$("#chare"+i.toString()).parent().parent().remove();
					}
				}
			}
		}
		for (var x in arr) {
			var obj = $("#" + arr[x].toString());
			if (obj.val() == "") {
				send = false;
				obj.addClass("error");
			}
		}
		
		if (send) {
			var data = new FormData(this);
			data.append("last", lastNumber);
			var lastPhoto = $(".photo").last().attr("id");
			var lastNumberPhoto = parseInt(lastPhoto.substr(5, lastPhoto.length));
			data.append("lastNumberPhoto", lastNumberPhoto);
			$.ajax({
				type: "POST",
				url: "php/addProduct.php",
				data: data,
				mimeType: "multipart/form-data",
                contentType: false,
                cache: false,
                processData:false,
				success: function (data) {
					if (data == "") {
						$('.btn_public').html("УСПЕШНО ДОБАВЛЕНО");
						setTimeout(function () {
							location.reload();
						}, 1500);
					}
					else {
						alert(data);
					}
				}
			});
		}
		e.preventDefault();
	});
	
	/*
	$(document).on("submit", "#redProductForm", function(e) {
		$("#redProductForm").find(".error").removeClass("error");
		var send = true;
		var arr = new Array("nameRed", "descrRed", "fullDescrRed");
		if ($("#photo1RedPr").length == 0) {
			arr.push("photo1Red");
		}
		if ($("#photo2RedPr").length == 0) {
			arr.push("photo2Red");
		}
		if ($("#photo3RedPr").length == 0) {
			arr.push("photo3Red");
		}
		var last = $(".chareRed").last().attr("id");
		var lastNumber = parseInt(last.substr(8, last.length));
		for (var i = 1; i <= lastNumber; i++) {
			if ($("#chareRed"+i.toString()).length > 0) {
				if (($("#chareRed"+i.toString()).val() != "") || ($("#valueRed"+i.toString()).val() != "")) {
					arr.push("chareRed"+i.toString());
					arr.push("valueRed"+i.toString());
				}
				else {
					var l = $(".charrrrRed").length;
					if (l > 1) {
						$("#chareRed"+i.toString()).parent().parent().remove();
					}
				}
			}
		}
		for (var x in arr) {
			var obj = $("#" + arr[x].toString());
			if (obj.val() == "") {
				send = false;
				obj.addClass("error");
			}
		}
		
		if (send) {
			var table = $("#redCat").val();
			var id = $("#redProd").val();
			var data = new FormData(this);
			data.append("last", lastNumber);
			data.append("oldTable", table);
			data.append("oldId", id);
			var lastPhotoRed = $(".photoRed").last().attr("id");
			var lastNumberPhotoRed = parseInt(lastPhotoRed.substr(5, lastPhotoRed.length));
			data.append("lastNumberPhotoRed", lastNumberPhotoRed);
			$.ajax({
				type: "POST",
				url: "php/redProduct.php",
				data: data,
				mimeType: "multipart/form-data",
                contentType: false,
                cache: false,
                processData:false,
				success: function (data) {
					if (data == "") {
						$('.redBtnUp').html("УСПЕШНО ОТРЕДАКТИРОВАНО");
						setTimeout(function () {
							location.reload();
						}, 1500);
					}
					else {
						alert(data);
					}
				}
			});
			
		}
		e.preventDefault();
	});	
	*/
	/////////////////////
	/*$("#redCat").change(function () {
		var val = $(this).val();
		$.ajax({
			type: "POST",
			url: "php/redChangeCat.php",
			data: {val: val},
			success: function (data) {
				$("#redProd").html(data);
			}
		});
		$("#enterHere").html("");
	});*/
	
	$("#redProd").change(function () {
		var table = $("#redCat").val();
		var id = $("#redProd").val();
		if (id != "none") {
			$.ajax({
				type: "POST",
				url: "php/upd.php",
				data: {id: id, table: table},
				success: function (data) {
					$(".hideThis").css("display", "block");
					$("#enterHere").html(data);
				}
			});
		}
	});
	
	
	$(document).on("change", "#photo1Red", function() {
		$("#photo1RedPr").remove();
	});
	$(document).on("change", "#photo2Red", function() {
		$("#photo2RedPr").remove();
	});
	$(document).on("change", "#photo3Red", function() {
		$("#photo3RedPr").remove();
	});
	$(document).on("change", ".photoRedDel", function() {
		$(this).prev().remove();
	});
	//////////////////////delete
	$(document).on("click", ".yesDelete", function() {
		var table = $("#redCat").val();
		var id = $("#redProd").val();
		if (id != "none") {
			$.ajax({
				type: "POST",
				url: "php/delete.php",
				data: {id: id, table: table},
				success: function (data) {
					if (data == "") {
						location.reload();
					}
					else {
						alert(data);
					}
				}
			});
		}
	});
	////////////////////////////////////
	$(".sendMessage").click(function () {
		$("#messageForMembers").removeClass("error");
		var val = $("#messageForMembers").val();
		if (val != "") {
			$.ajax({
				type: "POST",
				url: "php/sendMembers.php",
				data: {val: val},
				success: function (data) {
					if (data == "") {
						$('.sendMessage').html("УСПЕШНО ОТПРАВЛЕНО");
						setTimeout(function () {
							location.reload();
						}, 1500);
					}
					else {
						alert(data);
					}
				}
			});
		}
		else {
			$("#messageForMembers").addClass("error");
		}
	});
	///////////////////
	$(document).on("click", ".yesExit", function() {
		$.ajax({
			url: "php/exit.php",
			success: function (data) {
				if (data == "") {
					location.reload();
				}
				else {
					alert("Перезагрузите страницу");
				}
			}
		});
	});
	///add photo
	$(document).on("click", "#addNewPhoto", function() {
		var last = $(".photo").last().attr("id");
		var lastNumber = parseInt(last.substr(5, last.length));
		lastNumber++;
		$("#inputsPhoto").append("<div class='col-sm-3 text-right'><p>Фото " + lastNumber + "</p></div><div class='col-sm-9'><p><input class='photo' id='photo" + lastNumber + "' name='photo" + lastNumber + "' type='file' accept='image/*'></div><div class='clearfix'></div>");
	});
	
	$(document).on("click", "#addNewPhotoRed", function() {
		var lastRed = $(".photoRed").last().attr("id");
		if(!lastRed) {
			var lastNumberRed = 0;
		} else {
			var lastNumberRed = parseInt(lastRed.substr(5, lastRed.length));
		}
		
		lastNumberRed++;
		$("#inputsPhotoRed").append("<div class='col-sm-3 text-right'><p>Фото " + lastNumberRed + "</p></div>" +
				"<div class='col-sm-9'><p>" +
				"<form id='formUploadImage" + lastNumberRed + "' action='/single/file_upload.php?id_product=document.getElementById('id_product').value()' method='post' enctype='multipart/form-data' target='iframe_photo_upload' >" + 
				"<input class='photoRed' id='photo" + lastNumberRed + "Red' name='photo' type='file' accept='image/*' onchange='document.getElementById(\"formUploadImage" + lastNumberRed + "\").submit()'></form></div>" +
						"<div class='clearfix'></div>");
	});
	
	$(document).on("click", ".deletePhotoRed", function() {
		$(this).parent().prev().prev().parent().remove();
		$(this).parent().remove();
	});
});