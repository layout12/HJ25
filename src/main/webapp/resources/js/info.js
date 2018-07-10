$(function() {
	$("#infojoinForm").hide();
	
	$("#info_i_id").focusin(function() {
		$("#info_i_id").css("background-color", "white");
	})
	$("#info_i_id").focusout(function() {
		var inputed = $("#info_i_id").val();

		$.ajax({
			data : "i_id=" + inputed,
			url : "I_IDUdundantInspection.do",
			success : function(data) {

				if (data == "i_id없음") {
					$("#signupbtn").prop("disabled", false);
					$("#info_i_id").css("background-color", "#B0F6AC");
				} else  {
					$("#signupbtn").prop("disabled", true);
					$("#info_i_id").css("background-color", "#FFCECE");
				}

			}, 
			error : function() {
				alert("i_id 중복검사 실패");
			}
		});
	})
});

function infoForm() {
	$("#userjoinForm").hide();
	$("#infojoinForm").show();
}
function usertFrom() {
	$("#infojoinForm").hide();
	$("#userjoinForm").show();

}

function infojoin(e) {
	var a = $("#infojoinForm").children().children();
	var i_id = a.children("#info_i_id").val();
	var i_name = a.children("#i_name").val();
	var i_addr = a.children("#i_addr").val();
	var i_detailaddr = a.children("#i_detailaddr").val();
	var i_postno = a.children("#i_postno").val();


	if (i_id == "" || i_id == null) {
		alert("가게아이디를 입력해주세요")
		return false;
	}
	if (i_name == "" || i_name == null) {
		alert("가게이름을 입력해주세요")
		return false;
	}
	if (i_addr == "" || i_addr == null) {
		alert("가게주소를 입력해주세요")
		return false;
	}
	if (i_detailaddr == "" || i_detailaddr == null) {
		return false;
	}

	if (i_postno == "" || i_postno == null) {
		return false;
	}

	$.ajax({
		url : "InfoInsert.do",
		data : "i_id=" + i_id + "&i_name=" + i_name + "&i_addr=" + i_addr + "&i_detailaddr=" + i_detailaddr + "&i_postno=" + i_postno,
		success : function(date) {
			if (date == 1) {
				alert("가게 정보입력에 성공하셧습니다");
				var a = $("#userjoinForm").children().children().children("#i_id").val(i_id);
				$("#i_id").css("background-color", "#B0F6AC");
				$(".signupbtn").prop("disabled", false);
				$(".signupbtn").css("background-color", "#4CAF50");
				signupCheck();
				usertFrom();

			} else {
				alert("가게 정보 입력에 실패햐셧습니다");
			}

		},
		error : function() {
			alert("서버통신 실패하셧습니다");
		}
	})
}





