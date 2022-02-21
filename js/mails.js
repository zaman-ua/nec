$(document).ready(function () {
	$("#mails").submit(function (e) {
		if (($("#submButt").html() != "Вы уже оформили подиску") && ($("#submButt").html() != "Подписка оформлена")) {
			$("#mailText").css("border", "1px solid white");
			var mail =  $("#mailText").val();
			if (mail != "") {
				$.ajax({
					type: "POST",
					url: "backend/php/mails.php",
					data: {mail: mail},
					success: function (data) {
						$("#submButt").html(data);
						setTimeout(function () {
							$("#submButt").html("Подписаться");
						}, 2000);
					}
				});
			}
			else {
				$("#mailText").css("border", "1px solid red");
			}
		}
		e.preventDefault();
	});
});