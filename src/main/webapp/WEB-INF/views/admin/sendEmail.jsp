<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Email Sending Admin to Member</title>

    <!-- Icons font CSS-->
    <link href="${path}/resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="${path}/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="${path}/resources/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="${path}/resources/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="${path}/resources/css/resetPassword.css" rel="stylesheet" media="all">
    <link href="${path}/resources/css/avatar.css" rel="stylesheet" media="all">
 
</head>

<section id="content">
		 
    <div class="page-wrapper p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                   <h2 class="title">Write Email</h2> 
	              
                <form action="${path}/admin/mailSend.do" method="POST">
                        <div class="row row-space">
                            <div class="col-1">
                                <div class="input-group">
                                    <label class="label">해당 회원 이메일 : </label>
                                    <input class="input--style-4" type="email" name="email" id="email" value="${email }">
                                </div>
                            </div>
                            <input type="hidden" />
                        </div>
                        <div class="row row-space">
                            <div class="col-1">
                                <div class="input-group">
                                    <label class="label">내용 : </label>
                                    <textarea class="input--style-4" name="content" id="content" rows="3" style="width: 551px;">회원님의 Workman 계정이 비활성화 되었습니다. 확인부탁드립니다.</textarea>
                                </div>
                            </div>
                            <input type="hidden" />
                        </div>
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue pull-left" type="button" onclick="sendEmail()">메일 보내기</button>
                            <button class="btn btn--radius-2 btn--blue pull-right" type="button" onclick="location.href='${path}/admin/selectMemberList.do'">취소</button>
                        </div>
                        </form>
                        </div>
                        </div>
                        </div>
                        </div>
                        
    <!-- Jquery JS-->
    <script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="${path}/resources/vendor/select2/select2.min.js"></script>
    <script src="${path}/resources/vendor/datepicker/moment.min.js"></script>
    <script src="${path}/resources/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="${path}/resources/js/global.js"></script>

<script>
function sendEmail() {
	var form = $("form");
	var email=$("#email").val();
	var content=$("#content").text();
	console.log(email);
	console.log(content);
	
	
	if( (email== "null" || email== "undefined" || email== "NaN" || email== '') || 
			(content== "null" || content== "undefined" || content== "NaN" || content== '') ){
		alert("이메일 또는 내용을 입력하세요");
		return;
	}else{
		form.submit();
	}
	
}
</script>

</section>
