<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="AdminFaq" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp">
  <jsp:param name="pageTitle" value="AdminFaq" />
</jsp:include>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!--   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->

  <style>
    .container-1200 {
      width: 100%;
      min-width: 1200px;
      padding-left: 15px; padding-right: 15px;
      margin: 0 auto;
    }
    #main-container {
    	margin-top: 50px;
    	margin-left: 240px;
    }
    .text-gray td {
    	text-align:center;
    }
    
  </style>

  <!-- CSS -->

  <div class="py-4 col-lg-10 container submenu-container" id ="main-container">

    <div class="card card-fluid" id="job-listings" >

      <h6 class="card-header">
        <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-primary rounded shadow-sm">
          <i class="fa fa-check-square-o text-white mr-3 my-2" style="font-size:42px;"></i>
          <div class="lh-100 ml-2">
            <p class="h5 mb-0 text-white lh-100">&nbsp;&nbsp;자주하는 질문</p>
          </div>
        </div>
      </h6>

      <div class="card-body">
        <div class="media mb-2">
          <div class="media-body pl-3 my-0 py-0">
            <h2 class="card-title"><strong>FAQ</strong></h2>
            <p class="card-text">
              <small>이메일문의 : ohgunchul94@naver.com</small>
            </p>
          </div>
          <div class="row d-flex mt-5">
          </div>
        </div>
        <!-- form -->
        <table class="table table-sm" id='qna_table' style="font-size:14px;">
          <thead>
            <tr>
              <th class="text-center">번호</th>
              <th class="text-center">분류</th>
              <th class="text-center">제목</th>
              <th class="text-center" colspan="">btn_sup</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${list }" var="f" varStatus="vs">
            <tr class="text-gray">
              <td class="noticeNo text-center">
              	${f.faqNo }
              </td>
              <td class="noticeNo text-center">
              	${f.faqCategory }
              </td>
              <td class="noticeNo text-center">
              	<button type="button" class="btn btn-outline-secondary btn--radius-1-my" data-toggle="collapse" data-target="#demo${vs.count }">${f.faqTitle}</button>
              	<div id="demo${vs.count }" class="collapse">
				  ${f.faqContent }
				</div>
              </td>
              <td>
              	<button class="btn btn-outline-secondary" name="btn_d">삭제</button>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      
      <nav aria-label="Page navigation example">
      
       <div id="paging">
       	${pageBar }
       </div>
      <div>
      	<button class="btn btn-outline-secondary btn--radius-1-my pull-right" onclick="insertFaq();">신규등록</button>
      </div>
      </nav>
    </div>
  </div>
  </div>

    <script>
    function insertFaq(){
    	location.href="${path}/admin/insertFaq";
    }

      $("button[name=btn_d]").click(function(){
      	var tr = $(this).parent().parent();
      	var td = tr.children();
      	
      	var faqNo=td.eq(0).text().trim();
      	if(confirm("삭제된 정보는 복구되지 않습니다. 정말로 삭제합니까?")){
      		location.href="${path}/admin/faqDelete?faqNo="+faqNo;
      	}
      });

      $("button[name=btn_u]").click(function(){
      	var tr = $(this).parent().parent();
      	var td = tr.children();
      	
      	var faqNo=td.eq(0).text();
      	if(confirm("공지사항을 수정합니다.")){
      		location.href="${path}/admin/faqUpdate?faqNo="+faqNo;
      	}
      });
      $(function(){
  		var user = "${loginMember.id}";
  		if(user == "" || user != 'admin'){
  		   alert("잘못된 접근입니다.");
  		   location.href="${path}/";
  		}
  	});
      
      
    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
