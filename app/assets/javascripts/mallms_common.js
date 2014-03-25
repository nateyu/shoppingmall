
function switchMenuLabel(rootName,parentName,menuName){
	if(rootName == ''){
		$("#rootName").hide();
	}else{
		$("#rootName").text(rootName + " > ");
		$("#rootName").show();
	}
	if(parentName == ''){
		$("#parentMenu").hide();
	}else{
		$("#parentMenu").text(parentName + " > ");
		$("#parentMenu").show();
	}
	if(menuName == ''){
		$("#currWin").hide();
	}else{
		$("#currWin").html(menuName);
		$("#currWin").show();
	}
}

function doSwitchAction(url,rootName,parentName,menuName){
	switchMenuLabel(rootName,parentName,menuName);
	window.location.href=url;
}

function doSwitchAction2(url){
	window.location.href=url;
}

function homepagePicShow(){
	$("#pic").show();
  	$("#pic2").show();
}

function homePagePicHide(){
	$("#pic").hide();
  	$("#pic2").hide();
}

function showDialog(msgContent) {
	if (msgContent) {
		$("#dialog").html(msgContent);
		$("#dialog").dialog( {
			width : 80
		});
		setTimeout(function() {
			$("#dialog").dialog('close');
		}, 2000);
	}
}

function showListTableStyle(){
	$("#listTable tr").hover(function() {
		$(this).children("td").addClass("hover")
	}, function() {
		$(this).children("td").removeClass("hover")
	});
}

function homePageLocationSelect(type) {
	$.ajax({ 
	  	url: '/home_page_locations/search_locations',
  		type: 'GET',
  		data: {
				loctype : type
			},
			success: function(data) {
				var location_options = document.getElementById('homepageloc_location');
				var item_options = document.getElementById('homepageloc_itemid');
				// clean the select options
				location_options.length = 0
				item_options.length = 0; 

				location_options.disabled = (data.locs.length == 0);
				item_options.disabled = (data.items.length == 0);
			  for (var i = 0; i < data.locs.length; i++) {
			  	location_options.add(new Option(type + data.locs[i], data.locs[i]));
			  };
			  for (var i = 0; i < data.items.length; i++) {
			  	item_options.add(new Option(data.items[i][1], data.items[0]));
			  };
			}
	  });
}