var MALL_CHART_COOKIE_NAME = "MallMsCookie";
var MALL_CHART_COOKIE_OPTION = {
		path : '/',
		expires : 7
	};

$(document).ready(function() {
	getMallMsCookie();
	$("#loginButton").click(function(){
		var name =  $("#username").val();
		var pass =  $("#password").val();
	  $.ajax({ 
	  	url: '/login',
  		type: 'POST',
  		beforeSend: function(xhr) {
  			xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
  		},
  		data: {
				username : name,
				password : pass
			},
			success: function(data) {
				if(data == "success") {
					$("#loginError").hide();
					if($("#remeberWeek").is(":checked")) {
						if(!getMallMsCookie() ) {
							setMallMsCookie(name, pass);
						}
					} else {
						$.cookie(MALL_CHART_COOKIE_NAME, null,{ path: '/' });
					}
					window.location.href = "/customer_types";
				} else {
					$("#loginError").show();
				}
			}
	  });
	});
});

/**
 * 设置Cookie
 */
function setMallMsCookie(username, password) {
	var cookieData = '{"username":"' + username	+ '","password":"' + password + '"}';
	$.cookie(MALL_CHART_COOKIE_NAME, cookieData, MALL_CHART_COOKIE_OPTION);
}

function getMallMsCookie() {
	var cookieVal = $.cookie(MALL_CHART_COOKIE_NAME);
	if (cookieVal) {
		var cookieObj = $.parseJSON(cookieVal);
		$("#username").val(cookieObj.username);
		$("#password").val(cookieObj.password);
		return true;
	} else {
		return false;
	}
}