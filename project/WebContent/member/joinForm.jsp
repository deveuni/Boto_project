<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Boto</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="../css/join.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


</head>
<body>

<div class="sidenav" style="background-color: lightslategray;">
         <div class="join-main-text">
            <h2> Join Page</h2>
            <p>Login or register from here to access.</p>
         </div>
      </div>
      <div class="main">
      <br>
         <div class="col-md-6 col-sm-12">
         
      	 <a href="../main/main.jsp"><img alt="" src="home.png" width="50px" height="50px" style="float:right; margin-bottom: 50px;"></a>
            <div class="join-form" style="clear:both;">
               <form action="joinPro.jsp" method="post" name="fr" onsubmit="return check()">
               <fieldset>
               <legend>Basic Info</legend>
                  <div class="form-group">
                     <label>User ID</label>
                     <input type="text" name="id"class="form-control" placeholder="아이디">
                  </div>
                  <input type="button" value="중복확인" class="btn btn-secondary" onclick="winopen()"><br><br>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" name="pass" class="form-control" placeholder="비밀번호">
                  </div>
                   <div class="form-group">
                     <label>Retype Password</label>
                     <input type="password" name="pass2" class="form-control" placeholder="비밀번호 확인">
                  </div>
                   <div class="form-group">
                     <label>Name</label>
                     <input type="text" name="name" class="form-control" placeholder="이름">
                  </div>
                   <div class="form-group">
                     <label>Email</label>
                     <input type="email" name="email" class="form-control" placeholder="이메일">
                  </div>
                   <div class="form-group">
                     <label>Birth</label>
                     <input type="date" name="birth" class="form-control" placeholder="생년월일">
                  </div>
                   <div class="form-group">
                     <label>Gender</label><br>
                     <input type="radio" name="gender" value="남"> 남
                     <input type="radio" name="gender" value="여"> 여
                  </div>
                  
                   <div class="form-group">
                       <label>Address</label><br>
						<input type="text" id="postcode" name="postcode"class="form-control" placeholder="우편번호" style="width:120px; display:inline-block;">
						<input type="button" onclick="Postcode()" class="btn btn-secondary" value="우편번호 찾기"><br><br>
						<input type="text" id="address" name="address" class="form-control" placeholder="주소"><br>
						<input type="text" id="detailAddress" name="detailAddress" class="form-control" placeholder="상세주소" style="width:230px; display:inline-block; !important">
						<input type="text" id="extraAddress" name="extraAddress" class="form-control" placeholder="참고항목" style="width:230px; display:inline-block;">
                     </div>
                  </fieldset>
                  <br>
                  <fieldset>
                  	<legend>Optional Info</legend>
                     <div class="form-group">
                       <label>Phone Number</label>
                       <input type="text" name="phone" class="form-control" >
                    </div>
                    <div class="form-group">
                     <label>Mobile Phone Number</label>
                     <input type="text" name="mobile" class="form-control" >
                  </div>
                  </fieldset>
                  <br>
                  <input type="submit" class="btn btn-black" value="Register">                
                  <input type="reset" class="btn btn-secondary" value="Cancel">
                  <br><br><br>
               </form>
            </div>
         </div>
      </div>
      
      
      <!-- 우편번호 검색 -->
      <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      <script>
    function Postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
      <!-- 우편번호 검색 -->
      
      <!-- 자바스크립트 -->
      <script type="text/javascript">
      
      // 필수정보(Basic Info)를 입력 체크 - 입력안할시 페이지 이동X
     	function check(){
			if(document.fr.id.value == ""){ 
				alert("아이디를 입력하세요.");
				document.fr.id.focus();
				return false;
			}
			
			if(document.fr.pass.value == ""){
				alert("비밀번호를 입력하세요.");
				document.fr.pass.focus();
				return false;
			}
			
			if(!(4 <= document.fr.pass.value.length && document.fr.pass.value.length <= 15)){ 
					alert("비밀번호는 4~15자까지 사용 가능합니다.");
					document.fr.pass.focus();
					return false;
			}
			
			if(document.fr.pass2.value == ""){
				alert("비밀번호 확인을 입력하세요.");
				document.fr.pass2.focus();
				return false;
			}
			
			if(document.fr.pass.value != document.fr.pass2.value){
				alert("비밀번호가 일치하지 않습니다.");
				document.fr.pass2.focus();
				return false;
			}
			
			
			if(document.fr.name.value == ""){ 
				alert("이름을 입력하세요.");
				document.fr.name.focus();
				return false;
			}
			
			if(document.fr.email.value == ""){ 
				alert("Email을 입력하세요.");
				document.fr.email.focus();
				return false;
			}
			
			if(document.fr.birth.value == ""){ 
				alert("생년월일을 입력하세요.");
				document.fr.birth.focus();
				return false;
			}
			
			if(document.fr.gender[0].checked == false && 
					document.fr.gender[1].checked == false){
				alert("성별을 선택하세요");
				document.fr.gender[0].focus();
				return false;
			}
			
			
			if(document.fr.postcode.value == ""){
				alert("우편번호를 입력하세요.");
				document.fr.postcode.focus();
				return false;
			}
		}// check()
		
		
		// 아이디 중복 체크 
		function winopen(){
			
			/* if(!4 <= document.fr.id.value.length && id.length <=20 ){
				alert("아이디는 4~20자까지 사용 가능합니다.");
				document.fr.id.focus();
				return;
			} */
			
			if(document.fr.id.value != ""){
				if(!(4 <= document.fr.id.value.length && document.fr.id.value.length <=20)){
					alert("아이디는 4~20자까지 사용 가능합니다.");
					document.fr.id.focus();
					return;
				}else{
				// 아이디가 입력되었다면 중복체크 확인 창 열기
				var id = document.fr.id.value;
				window.open("joinIdCheck.jsp?userid="+id," ","width=400, height=200");
				}
			}else{
				// 아이디가 입력 안 되었을 경우
				alert("아이디를 입력하세요.");
				document.fr.id.focus();
				return;
			}
		}
		
		
      
      
      
      </script>
      


</body>
</html>



