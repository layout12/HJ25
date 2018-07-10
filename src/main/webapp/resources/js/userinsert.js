var idCheck = 0;
var pwdCheck = 0;
var emailCheck = 0;
var phoneCheck = 0;
var i_idCheck = 0;
var div ="";
// 아이디 체크하여 가입버튼 비활성화, 중복확인.
$(function() {

	//아이디 중복 체크
	$("#u_id").focusin(function() {
		$("#u_id").css("background-color", "white");
	})
	$("#u_id").focusout(function() {

		var inputed = $("#u_id").val();
		$.ajax({
			data : "column=U_ID&val=" + inputed,
			url : "UdundantInspection.do",
			success : function(data) {

				if (inputed == "" && data == 'null') {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#u_id").css("background-color", "#FFCECE");
					idCheck = 0;
				} else if (data == 'null') {
					$("#u_id").css("background-color", "#B0F6AC");
					idCheck = 1;
					if (idCheck == 1 && pwdCheck == 1) {
						$(".signupbtn").prop("disabled", false);
						$(".signupbtn").css("background-color", "#4CAF50");
						signupCheck();
					}
				} else if (data != 'null') {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#u_id").css("background-color", "#FFCECE");
					idCheck = 0;
				}
			},
			error : function() {
				alert("id 중복검사 실패")
			}
		});
	})
	//번호 중복체크
	$("#u_phone").focusin(function() {
		$("#u_phone").css("background-color", "white");
	})
	$("#u_phone").focusout(function() {
		var phoneNum = /^[0-9]{10,11}$/g;
		if (phoneNum.test($("#u_phone").val())) {
			$("#u_phone").css("background-color", "#B0F6AC");
		} else {
			$("#u_phone").css("background-color", "#FFCECE");
			return false;
		}
		var inputed = $("#u_phone").val();

		$.ajax({
			data : "column=U_PHONE&val=" + inputed,
			url : "UdundantInspection.do",
			success : function(data) {

				if (inputed == "" && data == 'null') {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#u_phone").css("background-color", "#FFCECE");
					phoneCheck = 0;
				} else if (data == 'null') {
					$("#u_phone").css("background-color", "#B0F6AC");
					phoneCheck = 1;
					if (phoneCheck == 1 && pwdCheck == 1) {
						$(".signupbtn").prop("disabled", false);
						$(".signupbtn").css("background-color", "#4CAF50");
						signupCheck();
					}
				} else if (data != 'null') {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#u_phone").css("background-color", "#FFCECE");
					phoneCheck = 0;
				}
			},
			error : function() {
				alert("phone 중복검사 실패")
			}
		});
	})

	//메일 중복체크
	$("#u_email").focusin(function() {
		$("#u_email").css("background-color", "white");
	})
	$("#u_email")
		.focusout(
			function() {
				var emailCo = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/i;
				if (emailCo.test($("#u_email").val())) {

					$("#u_eamil").css("background-color", "#B0F6AC");
				} else {

					$("#u_email").css("background-color", "#FFCECE");
					return false;
				}

				var inputed = $("#u_email").val();
				$.ajax({
					data : "column=U_EMAIL&val=" + inputed,
					url : "UdundantInspection.do",
					success : function(data) {

						if (inputed == "" && data == 'null') {
							$(".signupbtn").prop("disabled",
								true);
							$(".signupbtn").css("background-color",
								"#aaaaaa");
							$("#u_email").css(
								"background-color",
								"#FFCECE");
							emailCheck = 0;
						} else if (data == 'null') {
							$("#u_email").css(
								"background-color",
								"#B0F6AC");
							emailCheck = 1;
							if (emailCheck == 1
								&& pwdCheck == 1) {
								$(".signupbtn").prop(
									"disabled", false);
								$(".signupbtn").css(
									"background-color",
									"#4CAF50");
								signupCheck();
							}
						} else if (data != 'null') {
							$(".signupbtn").prop("disabled",
								true);
							$(".signupbtn").css(
								"background-color",
								"#aaaaaa");
							$("#u_email").css(
								"background-color",
								"#FFCECE");
							emailCheck = 0;
						}
					},
					error : function() {
						alert("email 중복검사 실패")
					}
				});
			})

	//가게아이디 중복체크
	$("#i_id").focusin(function() {
		$("#i_id").css("background-color", "white");
	})
	$("#i_id").focusout(function() {
		var inputed = $("#i_id").val();

		$.ajax({
			data : "i_id=" + inputed,
			url : "I_IDUdundantInspection.do",
			success : function(data) {

				if (inputed == "" && data == "true") {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#i_id").css("background-color", "#FFCECE");

				} else if (data == "true") {
					$("#i_id").css("background-color", "#B0F6AC");
					$(".signupbtn").prop("disabled", false);
					$(".signupbtn").css("background-color", "#4CAF50");
					signupCheck();
				} else if (data != "true") {

					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#i_id").css("background-color", "#FFCECE");

				}

			},
			error : function() {
				alert("i_id 중복검사 실패");
			}
		});
	})
})

function wordChk(str) {
	var idReg = /^.*(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z]).*$/;
	if (idReg.test($("#u_pw").val())) {

		$(".signupbtn").prop("disabled", true);
		$(".signupbtn").css("background-color", "#aaaaaa");
		$("#u_pw").css("background-color", "#B0F6AC");
	} else if (!idReg.test($("#u_id").val())) {
		$(".signupbtn").prop("disabled", true);
		$(".signupbtn").css("background-color", "#aaaaaa");
		$("#u_pw").css("background-color", "#FFCECE");
	}

}

function checkPwd() {
	$("#u_pw").focusin(function() {
		$("#u_pwch").css("background-color", "white").val("");
		$(".signupbtn").prop("disabled", true);
		$(".signupbtn").css("background-color", "#aaaaaa");
	})
	var inputed = $('#u_pw').val();
	var reinputed = $('#u_pwch').val();
	if (reinputed == "") {
		$(".signupbtn").prop("disabled", true);
		$(".signupbtn").css("background-color", "#aaaaaa");
		$("#u_pwch").css("background-color", "#FFCECE");
	} else if (inputed == reinputed) {
		$("#u_pwch").css("background-color", "#B0F6AC");
		pwdCheck = 1;
		if (idCheck == 1 && pwdCheck == 1) {
			$(".signupbtn").prop("disabled", false);
			$(".signupbtn").css("background-color", "#4CAF50");
			signupCheck();
		}
	} else if (inputed != reinputed) {
		pwdCheck = 0;
		$(".signupbtn").prop("disabled", true);
		$(".signupbtn").css("background-color", "#aaaaaa");
		$("#u_pwch").css("background-color", "#FFCECE");
	}
}



function signupCheck() {
	var phone = $("#u_phone").val();
	var email = $("#u_email").val();
	var i_id = $("#i_id").val();
	var addr = $("#u_addr").val();
	if (email == "" || phone == "" || i_id == "" || addr == "") {
		$(".signupbtn").prop("disabled", true);
		$(".signupbtn").css("background-color", "#aaaaaa");
	} 
}

$(".cancelbtn").click(function() {
	$(".id").val(null);
	$(".pass").val('');
	$(".signupbtn").prop("disabled", true);
	$(".signupbtn").css("background-color", "#aaaaaa");
});

function goPopup(e) {
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제
	// 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	 div  = $(e).parent().parent().parent().attr('id');
	var pop = window.open("jusoPopup.jsp", "pop",
		"width=570,height=420, scrollbars=yes, resizable=yes");

// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제
// 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
// var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes,
// resizable=yes");
}

function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, zipNo) {
	if (div == "userjoinForm") {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		$("#u_addr").val(roadFullAddr); // 도로명주소 전체

		$(".signupbtn").prop("disabled", false);
		$(".signupbtn").css("background-color", "#4CAF50");
		signupCheck();
	} else if (div == "infojoinForm") {
	
		$("#i_addr").val(roadAddrPart1);
		$("#i_detailaddr").val(addrDetail);
		$("#i_postno").val(zipNo);
	}else{
		$("#u_addr").val(roadFullAddr); // 도로명주소 전체
	}
	

}


