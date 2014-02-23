
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
	window.top['ifrcenter'].location.href=url;
}

function doSwitchAction2(url){
	window.top['ifrcenter'].location.href=url;
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