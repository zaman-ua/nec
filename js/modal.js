$(document).ready(function () {
	
	$("#callbackForm").submit(function (e) {
		var send = true;
		$("#callbackForm").children(".error").removeClass("error");
		var arr = new Array("name", "tel", "mail");
		for (var x in arr) {
			var obj = $("#" + arr[x].toString());
			if (obj.val() == "") {
				send = false;
				obj.addClass("error");
			}
		}
		
		if (send) {
			var data = $("#callbackForm").serialize();
			$.ajax({
				type: "POST",
				url: "backend/php/callback.php",
				data: data,
				success: function (data) {
					document.scrollTop += 10;
					$("#sbmButton").html(data);
					$("#callbackForm").append('<p>Спасибо. Ваша заявка принята. Наш менеджер свяжется с вами в ближайшее время</p>')
					$('#callbackForm')[0].reset();
					setTimeout(function () {
						$("#sbmButton").html("Отправить");
						$("#callbackForm").find('p').remove();
						$(".remodal-is-opened").find('.remodal-close').trigger('click');
					}, 5000);
					//location.reload();
				}
			});
		}
		e.preventDefault();
	});
});