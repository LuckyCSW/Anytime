<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기 - 애니타임</title>
<link data-vue-meta="ssr" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member/login/0a14fb2000808afce700.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/member/login/forgot1.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        $('form').on('submit', function(event) {
            event.preventDefault();
            
            var email = $('#email').val();
            
            if(email.trim()===""){
            	alert("가입된 이메일을 입력해주세요.");
            }else{
            sendEmail();
            }
        });
    });

    function sendEmail() {
        var email = $('#email').val();

        $.ajax({
            type: "POST",
            url: "forgotidEmail.com",
            data: { email: email },
            success: function (response) {
                $('body').html(response);
            },
            error: function () {
                alert('오류가 발생했습니다.');
            }
        });
    }
</script>
</head>
<body>
	<div >
		<div  class="container">
			<section >
				<div  class="menu">
					<a  class="active">
					 <span >아이디 찾기</span></a> 
					 <a  href="forgotpwd">
					  <span >비밀번호 찾기</span></a>
				</div>
				<form  action ="forgotidEmail.com" >
					<input  type="email" name="email" id ="email" placeholder="가입된 이메일"
					 autocomplete="off"  >
				<span id="email_message" style="font-size: 12px"></span>
					<input  type="submit" 
					name ="submit"  id ="submit" value="아이디 찾기" >
					
					<div  class="description">
						<p >※ 가입된 아이디가 있을 경우, 입력하신 이메일로 아이디를 안내해
							드립니다.</p>
						<p >※ 만약 이메일이 오지 않는다면, 스팸 편지함으로 이동하지 않았는지
							확인해주세요.</p>
						<p >※ 이메일 서비스 제공자 사정에 의해 즉시 도착하지 않을 수 있으니,
							최대 30분 정도 기다리신 후 다시 시도해주세요.</p>
					</div>
				</form>
			</section>
		</div>
	</div>
	
</body>
</html>