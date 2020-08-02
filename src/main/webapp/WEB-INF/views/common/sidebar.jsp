<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

  <style>
    #main-wrapper{
      margin-left: 190px;
      margin-top: 58px;
    }
    @media (min-width: 576px) {
      .card-columns {
        column-count: 2;
      }
    }
    @media (min-width: 768px) {
      .card-columns {
        column-count: 3;
      }
    }
    @media (min-width: 992px) {
      .card-columns {
        column-count: 3;
      }
    }
    @media (min-width: 1200px) {
      .card-columns {
        column-count: 4;
      }
    }
  </style>

  <!-- CSS -->
  <link rel="stylesheet" href="${path}/resources/css/jobEnroll.css">
  <link rel="stylesheet" href="${path}/resources/css/sidebar.css">
  <!-- Scrollbar Custom CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
  <!-- Sidebar  -->
  <div class="d-flex">
    <nav id="sidebar" class="p-0 flex-shrink-1">

      <div class="sidebar-header py-4">
        <!-- c:if test="${param.pageTitle == ''}" -->
        <h4><a href="${path }"><i class="fa fa-home">&nbsp;&nbsp;Workman</i></a></h4>

      </div>

      <ul class="list-unstyled components">
        <p class="p-2"><i class="fa fa-tag" aria-hidden="true">&nbsp;&nbsp;메뉴</i></p>
        <!-- <hr style="border-top: 1px solid white;"> -->
        <hr>
	<c:if test="${loginMember != null}">

      <ul class="list-unstyled components pt-0">

		<li class="active">
          <a href="${path}/collabo/main?userId=${loginMember.id}" class="sidebar-dropdown-toggle">Team Work</a>
        </li>
		

        <li class="active">
          <a href="#myPageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle sidebar-dropdown-toggle">마이페이지</a>
          <ul class="collapse list-unstyled" id="myPageSubmenu">
            <li>
              <a href="javascript: ajaxJobPage('${path }/member/setting.do');" id="jobBoardBtn">개인정보수정</a>
            </li>

            <li>
                <a href="javascript: ajaxJobPage('${path }/member/jobMyBoardList');" id="jobApplyBtn">내 게시판</a> 
				</li>
				
          </ul>
        </li>
	</c:if>


        <li class="active">
          <a href="#jobSidemenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle sidebar-dropdown-toggle">구인구직</a>
          <ul class="collapse list-unstyled" id="jobSidemenu">
            <li>
              <a href="javascript: ajaxJobPage('${path }/job/jobBoardList');" id="jobBoardBtn">채용정보</a>
            </li>
          </ul>
        </li>

        
        
        <li class="active">
          <a href="#studySubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle sidebar-dropdown-toggle">스터디</a>
          <ul class="collapse list-unstyled" id="studySubmenu">
            <li>
				  <a href='${path }/study/studyList'>스터디 모임</a>
<%-- 				 <a href="javascript: ajaxJobPage('${path }/study/studyList');">게시판</a> --%>
            </li>
            </ul>
        </li>

        <li>
          <a href="#freeboardSubmenu1" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle sidebar-dropdown-toggle">자유게시판</a>
           <ul class="collapse list-unstyled" id="freeboardSubmenu1">
            <li>
               <a href='${path }/freeboard/freeboardList.do'>Q & A</a>
            </li>   
           </ul>
         </li>

           
		<li class="active">
		<a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle sidebar-dropdown-toggle">공지사항</a>
			<ul class="collapse list-unstyled" id="pageSubmenu">
				<li>
					<a href="javascript: ajaxJobPage('${path }/admin/memberNoticeList');" id="jobBoardBtn">공지사항</a>
				</li>
				<li>
					<a href="javascript: ajaxJobPage('${path }/member/faqList');" id="jobApplyBtn">자주하는 질문</a>
				</li>
			</ul>
		</li>
           
      </ul>

  
      <!-- <ul class="list-unstyled CTAs">
        <li>
          <a href="#" class="download">Dummy Btn1</a>
        </li>
        <li>
          <a href="#" class="article">Dummy Btn2</a>
        </li>
      </ul> -->
    </nav>


  <script>
  
	  function ajaxMyBoardPage(mapping){
	      $.ajax({
	        type: "POST",
	        url:mapping,
	        data:{ "no":$("#no").val(),"boardName":$("#boardName").val(), "content":$("#content").val(),"title":$("#title").val(),"writer":$("#writer").val()},
	        dataType: "html",
	        success: function(data){
	          html = $('<div>').html(data);
	          $('#main-container').html(html.find('div.submenu-container'));
	        },
	        error: function(status, msg){
	          alert('ajax error!');
	        },
	      });
	    }

      function ajaxMyBoardEndPage(mapping){
	      $.ajax({
	        type: "POST",
	        url:mapping,
	        data:{ "no":$("#no").val(),"boardName":$("#boardName").val(), "content":$("textarea#content").val(),"title":$("#title").val(),"writer":$("#writer").val()},
	        dataType: "html",
	        success: function(data){
	          html = $('<div>').html(data);
	          $('#main-container').html(html.find('div.submenu-container'));
	        },
	        error: function(status, msg){
	          alert('ajax error!');
	        },
	      });
	    }
      
  
    function ajaxJobPage(mapping){

      $.ajax({
        type: "POST",
        url:mapping,
        dataType: "html",
        success: function(data){
          html = $('<div>').html(data);
          $('#main-container').html(html.find('div.submenu-container'));
        },
        error: function(status, msg){
          alert('ajax error!');
        },
      });
    }
    
    function ajaxJobBoardPagination(mapping){
      if(!mapping.includes("path"))
        mapping = '${path}' + mapping;

      $.ajax({
        type: "POST",
        url:mapping,
        dataType: "html",
        success: function(data){
          html = $('<div>').html(data);
          $('#databaseJobBoardList').html(html.find('.jobmodal-tbl1'));
          $('#pageBar').html(html.find('#pageBar'));

          $('.w-0').css({'width': '0%', });
          $('.w-5').css({'width': '5%', });
          $('.w-10').css({'width': '10%', });
          $('.w-25').css({'width': '25%', });
          $('.w-30').css({'width': '30%', });
          $('.w-40').css({'width': '40%', });
          $('.w-45').css({'width': '45%', });
        },
        error: function(status, msg){
          alert('ajax error!');
        },
      });
    }
  </script>