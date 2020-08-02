<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp">
  <jsp:param name="pageTitle" value="" />
</jsp:include>

<head>
       <!-- jQuery CDN -->
       <script src="https://code.jquery.com/jquery-3.4.1.min.js"
       integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
       crossorigin="anonymous"></script>
     <!-- Icons font CSS-->
     <link href="${path}/resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
     <link href="${path}/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
     <!-- Font special for pages-->
     <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

     <!-- Vendor CSS-->
     <link href="${path}/resources/vendor/select2/select2.min.css" rel="stylesheet" media="all">
     <link href="${path}/resources/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

     <!-- Main CSS-->
     <link href="${path}/resources/css/mypage.css" rel="stylesheet" media="all">          
     <link href="${path}/resources/css/avatar.css" rel="stylesheet" media="all">
     
</head>

<div class="submenu-container">
	<section id="content">
		<div class="page-wrapper-my p-t-130-my p-b-100-my font-poppins-my">
			<div class="wrapper-my wrapper--w680-my">
            	<div class="card-my card-4-my">
                	<div class="card-body-my">
                		<h2 class="title-my">FAQ 등록</h2>
                		<form name="faqFrm" action="${path}/admin/faqFormEnd.do" method="post">
                		
                			<div class="row-my row-space-my">
                				<div class="col-2-my">
                					<div class="input-group-my">
                						<label class="label-my">제목</label>
                						<input type="text" class="input--style-4-my" placeholder="제목" name="faqTitle" id="faqTitle" required>
                						<input type="hidden"/>
                					</div>
                				</div>
                			</div>                			
                			<div class="row-my row-space-my">
                				<div class="col-1-my">
                					<div class="input-group-my">
                						<label class="label-my">내용</label>
                						<textarea class="form-control" id="faqContent" name="faqContent" rows="10" placeholder="내용" required></textarea>
                						<input type="hidden"/>
                					</div>
               					</div>
            				</div>
            				<div class="p-t-15-my">
<!-- 	                            <input type="submit" class="btn btn-link" value="저장" > -->
	                            <button class="btn-my btn--radius-2-my btn--blue-my pull-left" type="button" onclick="faqSubmit();">저장</button>
	                            <button class="btn-my btn--radius-2-my btn--blue-my pull-right" type="button" onclick="faqCancel();">취소</button>
                        	</div>
                					
                		</form>
                	</div>
                </div>
        	</div>
		</div>
	</section>
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
	function faqSubmit(){
		
		var faqTitle=$("#faqTitle").val();
		var faqContent=$("#faqContent").val();
		
		if( (faqTitle== "null" || faqTitle== "undefined" || faqTitle== "NaN" || faqTitle== '') || 
				(faqContent== "null" || faqContent== "undefined" || faqContent== "NaN" || faqContent== '') ){
			alert("제목 또는 내용을 입력하세요");
			return;
		}else{
			var form=$("form");
			form.submit();
		}
		
	};
	function faqCancel(){
		history.back();
	};
	$(function(){
		var user = "${loginMember.id}";
		if(user == "" || user != 'admin'){
		   alert("잘못된 접근입니다.");
		   location.href="${path}/";
		}
	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>