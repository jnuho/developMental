<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/sidebar.jsp">
  <jsp:param name="pageTitle" value="" />
</jsp:include>

<div class="submenu-container">
	<section id="content">
			
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
			<div class="page-wrapper-my p-t-130-my p-b-100-my font-poppins-my">
				<div class="wrapper-my wrapper--w680-my">
					<div class="card-my card-4-my">
						<div class="card-body-my">
							<h2 class="title-my">게시판 수정</h2>
							 <form name="myboardFrm" id="myboardFrm" action="${path}/member/myBoardFormEnd.do" method="post"> 
							
								<div class="row-my row-space-my">
									<div class="col-2-my">
										<div class="input-group-my">
											<label class="label-my">제목</label>
											<input type="hidden" class="input--style-4-my" placeholder="NO" name="no" id="no" value="${no}" readonly>
											<input type="text" class="input--style-4-my" placeholder="제목" name="title" id="title" value="${title}" required>
											<input type="hidden"/>
										</div>
									</div>
									<div class="col-2-my">
										<div class="input-group-my">
											<label class="label-my">작성자</label>
											<input type="text" class="form-control" name="writer" id="writer" value="${writer}" readonly required>
											<input type="hidden" id="boardName" name="boardName" value="${boardName}"/>
										</div>
									</div>
								</div>
								
								<div class="row-my row-space-my">
									<div class="col-1-my">
										<div class="input-group-my">
											<label class="label-my">내용</label>
											<textarea class="form-control" id="content" name="content"rows="10" placeholder="내용" required >${content}</textarea>
											
											<input type="hidden"/>
										</div>
									   </div>
								</div>
								<div class="p-t-15-my">
	<!-- 	                            <input type="submit" class="btn btn-link" value="저장" > -->
									<!-- <button class="btn-my btn--radius-2-my btn--blue-my pull-left" type="button" onclick="javascript:ajaxMyBoardPage('${path}/member/myBoardFormEnd.do')">수정</button> -->
									<button class="btn-my btn--radius-2-my btn--blue-my pull-left" type="button" onclick="myBoardBtn()">수정</button>
									<button class="btn-my btn--radius-2-my btn--blue-my pull-right" type="button" onclick="javascript:ajaxJobPage('${path}/member/jobMyBoardList');">취소</button>
							
											<script>
												function myBoardBtn()
												{
													var myboardFrm = $("#myboardFrm");
													var result = confirm("정말로 변경하시겠습니까?");
													if(result)
													{
														myboardFrm.submit();
														//location.href="javascript:ajaxMyBoardEndPage('${path}/member/myBoardFormEnd.do')";
													}
												}

											</script>
								</div>               					
								 </form>
							</div>
						</div>
					</div>
				</div>
			</section>
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
	


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>