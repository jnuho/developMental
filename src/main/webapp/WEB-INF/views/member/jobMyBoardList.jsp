<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="구인게시판" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/sidebar.jsp">
  <jsp:param name="pageTitle" value="구인게시판" />
</jsp:include>

  <link rel="stylesheet" href="${path}/resources/css/mainpage.css">
  <link rel="stylesheet" href="${path}/resources/css/button.css">
  <link rel="stylesheet" href="${path}/resources/css/translate.css">

  <style>
/* CSS used here will be applied after bootstrap.css */

body{ margin-top:50px;}
.nav-tabs .glyphicon:not(.no-margin) { margin-right:10px; }
.tab-pane .list-group-item:first-child {border-top-right-radius: 0px;border-top-left-radius: 0px;}
.tab-pane .list-group-item:last-child {border-bottom-right-radius: 0px;border-bottom-left-radius: 0px;}
.tab-pane .list-group .checkbox { display: inline-block;margin: 0px; }
.tab-pane .list-group input[type="checkbox"]{ margin-top: 2px; }
.tab-pane .list-group .glyphicon { margin-right:5px; }
.tab-pane .list-group .glyphicon:hover { color:#FFBC00; }
a.list-group-item.read { color: #222;background-color: #F3F3F3; }
hr { margin-top: 5px;margin-bottom: 10px; }
.nav-pills>li>a {padding: 5px 10px;}

.ad { padding: 5px;background: #F5F5F5;color: #222;font-size: 80%;border: 1px solid #E5E5E5; }
.ad a.title {color: #15C;text-decoration: none;font-weight: bold;font-size: 110%;}
.ad a.url {color: #093;text-decoration: none;}

    .w-0{ width: 0%;}
    .w-5{ width: 5%;}
    .w-10{ width: 10%;}
    .w-25{ width: 25%;}
    .w-30{ width: 30%;}
    .w-40{ width: 40%;}
    .w-45{ width: 45%;}
    
    
    			*{
		font-family: "Nanum Gothic";
	}
	
	#pName{
		font-size: 18px;
		font-weight: bold;
	}
  #Pcur{
    font-size: 13px;
    
  }
    .goog-te-gadget-simple {
      border: 1px solid rgba(255, 255, 255, .0);
    }

    .nav-item {
      color: #B8C8D6 !important;
    }

    .align-left {
      text-align: left;
    }

    .float-left {
      float: left;
    }

    .float-right {
      float: right;
    }

    .my-1 {
      margin-top: 1em;
      margin-bottom: 1em;
    }

    .mt-3 {
      margin-top: 3em;
    }

    ul li {
      list-style-type: none;
    }

    .pr-1 {
      padding-right: -em;
    }

    /*가로 카드박스 중간 1em*/
    .pl-1 {
      padding-left: 1em;
    }

    /*가로 카드박스 중간 1em*/
    .pb-1 {
      padding-bottom: 1em;
    }

    .pt-1 {
      padding-top: 1em;
    }

    .overflow-hidden {
      overflow: hidden;
    }

    .width {
      width: 80px;
    }

    #listScroll {
      overflow: scroll;
    }

    .style_width {
      width: 100%;
    }
		
	
    #mapbtn{
      z-index: 2;
      position: absolute;
      left: 15px;
      border-radius: 3px;
      box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 2px 0px;
			background-color: #3396ff;
			opacity: 1;
    }
    #loadviewbtn{
      z-index: 2;
      position: absolute;
      left: 15px;
			opacity: 1;
      border-radius: 3px;
      box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 2px 0px;
			background-color: #3396ff;
    }
    #realLocBtn{
      z-index: 2;
      position: absolute;
      left: 90px;
			opacity: 1;
      border-radius: 3px;
      box-shadow: rgba(0, 0, 0, 0.15) 0px 2px 2px 0px;
			background-color: #3396ff;
    }
		#mapbtn:hover{
			opacity: .8;			
		}
		#realLocBtn:hover{
			opacity: .8;		
		}
		#loadviewbtn:hover{
			opacity: .8;		
		}
}
#maincon
{
  height: 100vh !important;
  display: flex !important;
}
    
  </style>

  <main id="main-wrapper" class="p-0 w-100">
    <jsp:include page="/WEB-INF/views/common/loading.jsp"/>


    
    
    <div id="main-container">
      <div class="py-4 col-lg-10 container submenu-container">

        <div class="card card-fluid" id="job-listings">

          <div class="card-header my-0 py-0 px-0">
            <!-- <a href="${path}"><img src="${path}/resources/images/home.png" alt=""></a> -->
            <div class="d-flex align-items-center p-3 my-0 text-white w-100 bg-dark rounded">
              <i class="fa fa-address-card text-white mr-3 my-2" style="font-size:42px;"></i>
               <div class="lh-100 ml-2">
                <p class="h3 mb-0 text-white lh-100">나의 게시판</p><br>
                <!-- <button class="btn btn-light" style="border-radius: 10px;">
                  <p class="h5 mb-0 text-dark lh-100">내가 쓴 구인구직 게시판</p>
                  <small><i class="fa fa-globe"></i> 국내/해외취업을 선택할 수 있습니다.</small>
                </button>
                <button class="btn btn-light" style="border-radius: 10px;">
                    <p class="h5 mb-0 text-dark lh-100">내가 쓴 스터디 게시판</p>
                    <small><i class="fa fa-book"></i> 스터디그룹을 구하세요! </small>
                </button>
                <button class="btn btn-light" style="border-radius: 10px;">
                    <p class="h5 mb-0 text-dark lh-100">자유 게시판</p>
                    <small><i class="fa fa-code"></i> 자유롭게 게시글을 작성해보세요 </small>
                </button> -->
              </div>
            </div>
          </div>

          <div class="card-body">
            
          <div class="container-fluid" id="maincon">

    <!-- row h-100 mt-1 pt-2 -->
    <div class="card-deck text-center container-fluid" style="margin-top: 10px;" id="cardmap">

      <!--상단div_1-->
      <div class="shadow-sm col-sm-4">

        <!--card / shadow-sm -->
        <!-- <div class="card-body align-left"> -->
          <!-- <label for="firstName">From</label> -->
          <!--From-->
          <!-- <input type="text" class="form-control" id="datepicker_start">
          <select name="" class="custom-select d-block w-100">
            <option class="">Start Time</option>
          </select> <label for="firstName" class="mt-3">To</label> -->
          <!--To-->
          <!-- <input type="text" class="form-control" id="datepicker_end" size="20"> 
          <select name="" class="custom-select d-block w-100">
            <option>End Time</option>
          </select>  -->
          <!-- <label class="mt-3">Sort By</label> <select name="sort by" class="custom-select d-block w-100">
            <option value="Distace">Distance</option>
            <option>Price(low to high)</option>
            <option>Price(high to low)</option>
            <option>Recommended</option>
          </select> 
          <label class="mt-3">Filter By</label> <select name="Filter By" class="custom-select d-block w-100">
            <option value="Amenities">Amenities</option>
            <option>Covered Parking</option>
            <option>Electric Vehicle Charging</option>
            <option>Free Shuttle Service</option>
            <option>In and Out Previleges</option>
            <option>On-Site Staff</option>
            <option>Open 24/7</option>
            <option>Overnight Parking</option>
            <option>Illigal Scan</option>
            <option>Valet</option>
            <option>Wheelchair Accessible</option>
          </select>  -->
          <!-- 
        </div> -->
        <!--하단 list-->
        <!-- <span class="mt-3 pb-5" id="totalboard"><i class="fa fa-address-card" aria-hidden="true"></i>전체 게시글</span> -->
		<div class="card shadow-sm border-dark text-left" id="listScroll" style="height:500px">
          <c:if test="${list != null}">
          	<c:forEach var="j" items="${list}" varStatus="status">
	          <a class="list-group-item border-primary list-group-item-action" name="jobBoard" id="${j['no']}"> 
	            <span>
	              <span>${j['boardName']} - ${j['title']}</span>
	               <span></span>
	               <!--  <span>
	                    <input type="button" class="btn btn-info more-info" onclick="parkingInfoPopup()" value="More Info">    
	                    <input type="button" class="btn btn-info more-info" onclick="" value="Pay">           
	              </span> -->
	            </span>
	          </a>    	
          	</c:forEach>
          </c:if>
          <c:if test="${studylist != null}">
          	<c:forEach var="s" items="${studylist}" varStatus="status">
	          <a class="list-group-item border-info list-group-item-action" name="studyBoard" id="${s['no']}"> 
	              <span>
						<span>${s['boardName']} - ${s['title']}</span>
	                 <span></span>
	                 <!--  <span>
	                      <input type="button" class="btn btn-info more-info" onclick="parkingInfoPopup()" value="More Info">    
	                      <input type="button" class="btn btn-info more-info" onclick="" value="Pay">           
	                </span> -->
	              </span>
	            </a>           	
          	</c:forEach>
          </c:if>
          
          <!--
          <a class="list-group-item list-group-item-action"><span>
              <span>Hyatt Place - Uncovered Self Park</span> <span>110.9
                miles away</span> <span><button>$14.70</button>
                <button>Reserve</button></span>
            </span> </a>
            -->
		</div>
      </div>

      <!--지도 API-->
	  <div class="shadow-sm col-sm-8" id="TotalBoardContent">
      
      
      	
       <!-- <div class="card border-primary mb-3" style="height: 100%;">
        <div class="card-header bg-primary h3">Job</div>
        <div class="card-body text-primary">
          <h5 class="card-title text-center">FrontEnd</h5><h6 class="text-right">Yoon</h6>
          <p class="card-text">
            Some quick example text to build on the card title and make up the bulk of the card's content.
            sdfdsfddddddddddddddddddddddddddddddddddddddddddddddddddddddd
          </p>
        </div> -->
        <!-- <div class="card-footer bg-info h5">신청한 인원</div>
        <div class="card-body text-primary">
          <div class="card-text">
              <div class="my-3 p-3 bg-white rounded box-shadow">
                 
                   <div class="media text-muted pt-3">
                    <img data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1" alt="32x32" class="mr-2 rounded" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16e4874d895%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16e4874d895%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.03125%22%20y%3D%2216.9%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="width: 32px; height: 32px;">
                    <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                      <div class="d-flex justify-content-between align-items-center w-100">
                        <strong class="text-gray-dark">Full Name</strong>
                        <a href="#" style="color: black;">Follow</a>
                      </div>
                      <span class="d-block" style="float: left;">@fasdfsdfsdfsdfsdfsdaf</span>
                    </div>
						</div> 
						
                   <div class="media text-muted pt-3">
                    <img data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1" alt="32x32" class="mr-2 rounded" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16e4874d896%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16e4874d896%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.03125%22%20y%3D%2216.9%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="width: 32px; height: 32px;">
                    <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                      <div class="d-flex justify-content-between align-items-center w-100">
                        <strong class="text-gray-dark">Full Name</strong>
                        <a href="#" style="color: black;">Follow</a>
                      </div>
                      <span class="d-block" style="float: left;">@username</span>
                    </div>
                  </div> 
                  <div class="media text-muted pt-3">
                    <img data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1" alt="32x32" class="mr-2 rounded" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16e4874d898%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16e4874d898%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.03125%22%20y%3D%2216.9%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="width: 32px; height: 32px;">
                    <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
                      <div class="d-flex justify-content-between align-items-center w-100">
                        <strong class="text-gray-dark">Full Name</strong>
                        <a href="#" style="color: black;">Follow</a>
                      </div>
                      <span class="d-block" style="float: left;">@username</span>
                    </div>
						</div>
						
                </div>
              </div>
				</div> -->
				
          <!-- <h6 class="d-block text-right mt-3 mr-3">
            <a href="#">2019-10-19</a>
			  </h6>
			 <div class="p-t">
         <button class="btn btn--radius-2 btn-primary pull-right" type="button" onclick="deletePage()" style="width: 60px; height: 50px; ">삭제</button>
				<button class="btn btn--radius-2 btn-primary pull-right" type="button" onclick="updateMyBoard()" style="width: 60px; height: 50px; margin-right: 2px;">변경</button>
		  </div>
      </div>  -->
      	
      	
      
      <!-- <div class="card border-info mb-3" style="height: 90%;">
          <div class="card-header">Header</div>
          <div class="card-body text-primary">
            <h5 class="card-title">Primary card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          </div>
        </div> -->
       
    </div>
    <div class="shadow-sm col-sm-8" id="hiddenInput">
			<form action="${path}/member/deleteMyBoard.do" method="POST" id="hiddenFrm">			 
				<input type="hidden" name="no" id="no">
				<input type="hidden" name="boardName" id="boardName">
				<input type="hidden" name="content" id="content">
        <input type="hidden" name="title" id="title">
        <input type="hidden" name="writer" id="writer">
			</form>
      </div>

      <!-- style="width:950px;height:500px;" -->


    </div>
  </div>
              
            
            <!-- <div class="media mb-2">
              <div class="media-body d-flex pl-3 my-0 py-0">
                <div class="">
                 
                  <div id="apiCallFrm" class="form form form-inline" >
                    <input type="text" class="form-control form-control-sm" placeholder="예. Java" id="skillTxt" required />
                    <input type="text" class="form-control form-control-sm mx-2" placeholder="예. Germany" id="locTxt" required />
                    <button type="button" class="btn btn-outline-light text-dark border-dark" id="apiCallBtn" value="Search github">
                      <i class="fa fa-github" aria-hidden="true"></i>&nbsp;해외취업 검색
                    </button>
                  </div>
                </div>
                <div class="ml-auto">
                  <c:if test="${loginMember !=null}">
                    <a class="ml-auto mr-3 align-self-center btn float-left btn-outline-primary" href="${path}/job/jobEnroll">
                      <i class="fa fa-edit">&nbsp;</i>구인 글
                    </a>
                  </c:if>
                  <c:if test="${loginMember == null}">
                    <button id="postJobBtn" class="ml-auto mr-3 align-self-center btn float-left btn-outline-primary">
                      <i class="fa fa-edit"></i>구인 글
                    </button>
                  </c:if>
                </div>
                <script>
                  $('#postJobBtn').click(function(){
                    $("#loginModal").modal('show');
                  });
                </script>

              </div>
            </div>  -->

            

          <!-- <div id="githubJobBoardList" class="rounded">
              <img src="${path}/resources/images/icons8-api-32.png" width="30px" height="30px" class="img-fluid" alt=""/>
              <table class="table table-sm table-hover jobmodal-tbl2" style="font-size:14px;">
                <c:if test="${newList == null}">
                    <div class="m-0 p-0 w-100 text-center"><i class="text-muted">해외취업 리스트가 없습니다! 검색어를 입력해주세요.</i></div>
                </c:if>
                <c:if test="${newList != null}">
                  <thead>
                    <tr>
                      <th class="text-center w-0" style="display:none">NO.</th>
                      <th class="text-center w-10">로고</th>
                      <th class="text-center w-10">회사명</th>
                      <th class="text-center w-25">제목</th>
                      <th class="text-center w-40">글내용</th>
                      <th class="text-center w-10">작성일</th>
                     
                      <th class="text-center w-5">
                        <img src="${path}/resources/images/icons8-queue-48.png" width="33px" height="33px" class="img-fluid" alt="">
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="j" items="${newList}" varStatus="status">
                      <tr class="table-secondary">
                        <td class="text-center" style="display:none">0</td>
                        <td class="text-center">
                          <c:if test="${fn:substring(j['imageURL'],2,6) =='path'}">
                            <img src="${path}${j['imageURL']}" class="img-fluid" alt="">
                          </c:if>
                          <c:if test="${fn:substring(j['imageURL'],2,6) !='path'}" >
                            <img src="${j['imageURL']}" class="imageURL img-fluid" alt="">
                          </c:if>
                        </td>
                        <td class="text-center">${j['WRITER']}</td>
                        <td class="text-center job-title">${j['TITLE']}</td>
                        <td class="hide-html-tag " >${j['CONTENT']}</td>
                        <td class="text-center"><fmt:formatDate value="${j['REGDATE']}" pattern="yy-MM-dd" /></td>
                        <td class="text-center">${j['REGDATE']}</td>
                        <td class="text-center">${j['STATUS']}</td>
                        <td class="text-center">${j['APPLICANTS']}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                  <script src="${path }/resources/js/jobListClick.js"></script>
                </c:if>
              </table>
            </div>  -->
                <!-- <table class="table table-sm table-hover jobmodal-tbl1" style="font-size:14px;">
                    <thead>
                        <tr>
                            <th class="text-center w-10">전체 게시글 : 10</th>
                            <th class="text-center w-25"></th>
                          </tr>
                    </thead>
                </table>
            <div id="databaseJobBoardList" class="my-3 rounded">
             
              
              <table class="table table-sm table-hover jobmodal-tbl1" style="font-size:14px;">
                <thead>
                  <tr>
                    <th class="text-center w-0" style="display:none">번호</th>
                    <th class="text-center w-10">작성 게시판</th>
                    <th class="text-center w-10">제목</th>
                    <th class="text-center w-30">글내용</th>
                    <th class="text-center w-15">작성자</th>
                    <th class="text-center w-20">작성날짜</th>
                    <th class="text-center"><i></i></th>

                   
                   
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="j" items="${list}" varStatus="status">
                    <tr class="">
                     
                      <td class="text-center" style="display:none">
                        ${j['no']}
                      </td>
                      <td class="text-center">
                       
                          Job
                      </td>
                      <td class="text-center">${j['writer']}</td>
                      <td class="text-center job-title">${j['title']}</td>
                      <td>${j['content']}</td>
                      <%-- <td class="text-center"><fmt:formatDate value="${j['regDate']}" pattern="yy-MM-dd" /></td> --%>
                      <td class="text-center">${j['regDate']}</td>
      
                      <%-- <td class="text-center">${j['status']}</td> --%>
                      <td class="text-center">${j['applicants']}</td>
                      <td class="text-center"><button class="btn btn-primary float-right">삭제</button></td>
                    </tr>
                  </c:forEach>
                </tbody>
                <script src="${path }/resources/js/jobListClick.js"></script>
              </table>

            </div>
            <nav aria-label="Page navigation example" id="pageBar">
             
            </nav> -->
          </div>
         
          
        </div> 

       <!-- apply confirm -->
   <div class="modal fade" id="applycollabo">
	<div class="modal-dialog" style="width:450px;">
		<div class="modal-content">
			<div class="modal-header">
			  <h3 class="modal-title">초대<span id="modal-title"></span></h3>
       	 	  <button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
			<hr/>
			<!-- <c:forEach var="s" items="${list2}" varStatus="status"> -->
        <form id='requestInviteFrm' action="${path}/member/requestInvite.do">
          <input type="text" id="userId" name="userId">
        </form>
				<!-- <div class="ui-widget"> -->
					<!-- <label for="userId">ID :sdf </label>
					<label type="text" id="userId"></label> -->
					<!-- <img id="userProfile"/> -->
				<!-- </div>			 -->
			<!-- </c:forEach>	 -->
			</div>

			<div class="modal-footer">
			   <button name="btnModalClose" type="button" class="btn btn-primary" onclick="requestInvite()">초대</button>
			   <button name="btnModalClose" type="button" class="btn btn-secondary" data-dismiss="modal">나가기</button>
			</div>		
		</div>
	</div>
</div>

<script>
  function modalF()
  {
    var u = $("#userId");
    var a = $("#followNum");

    var data5 = '${jsonStudylist2}';
    var data = JSON.parse(data5);
    console.log("dsfsdfsadf");
    for(var d in data)
    {
      if(data[d]['NICKNAME'] == a.attr("class"))
      {
        u.val(data[d]['NICKNAME']);
      }
    }    
  }

  function requestInvite()
  {
    var frm= $("#requestInviteFrm");
    frm.submit();
  }


</script>





















        <style>
          td img {
            height: 10px;
            width: 50%;
            object-fit: cover;
          }
          td {
            max-width: 0;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            padding: 0px;
          }
          table { width:500px;table-layout:fixed; }
          table tr { height:1em;  }
          /* table tr {
            line-height: 25px;
            min-height: 25px;
            height: 25px;
          } */
          @media (max-width: 768px) { /* use the max to specify at each container level */
            .job-title {    
              width:100px;  /* adjust to desired wrapping */
              display:table;
              white-space: pre-wrap; /* css-3 */
              white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
              white-space: -pre-wrap; /* Opera 4-6 */
              white-space: -o-pre-wrap; /* Opera 7 */
              word-wrap: break-word; /* Internet Explorer 5.5+ */
            }
          }
          .modal-content{
            -moz-border-radius: 5px 5px 5px 5px;
            -webkit-border-radius: 5px 5px 5px 5px;
            border-radius: 5px 5px 5px 5px;

            -moz-box-shadow: 2px 2px 2px #535353;
            -webkit-box-shadow: 2px 2px 2px #535353;
            box-shadow: 2px 2px 2px #535353;
          }
        </style>
        <!-- bootstrap Modal : Job content -->
        <!-- Modal -->
        <div class="modal fade" id="jobmodal" tabindex="-1" role="dialog" aria-labelledby="jobmodalTitle" aria-hidden="true">
          <div class="modal-dialog modal-lg modal-dialog-centered" role="document"></div>
        </div>

        <!-- jQuery -->
        <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"
          integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E="
          crossorigin="anonymous"></script>
        
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
          integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <script>
			  
			  function deletePage()
			  {
				  var result = confirm("정말로 삭제하시겠습니까?");
				  if(result)
				  {
					  var form = $("#hiddenFrm");
						//location.href='${path}/member/deleteMyBoard.do';
						form.submit();
				  }else{
					  
				  }
			  }

        function updateMyBoard()
        {
          var result = confirm("정말로 변경하시겠습니까?");
          if(result)
          {
        	  location.href="javascript: ajaxMyBoardPage('${path}/member/myBoardForm.do')";
            //var form = $("#hiddenFrm");
           //form.attr("action","${path}/member/myBoardForm.do");
            //form.submit();
          }
        }

 

        
        
        
        
        
        
        /* Board */
        
          $("a[name='jobBoard'],a[name='studyBoard']").hover(function(){
          
            if($(this).attr('name') == 'jobBoard')
            {
              $(this).css("background-color","#007BFF");
            }
            if($(this).attr('name') == 'studyBoard')
            {
              $(this).css("background-color","#17A2B8");
            }
          }, function(e){
              $(this).css("background-color","white");
          });
          


        $(document).ready(function () {
          $("a[name='jobBoard'],a[name='studyBoard']").mousedown(function(){
              if($(this).attr('name') == 'jobBoard')
                {
                  $(this).css("opacity",".8");
                }
                if($(this).attr('name') == 'studyBoard')
                {
                  $(this).css("opacity",".8");
                }
            }).mouseup(function(){
              $(this).css("opacity","1");
            });
      });
		
		$('#listScroll').click(function(e){
			
				console.log($(e.target).attr('id'));
				var number = $(e.target).attr('id');
				
				var data ='${jsonlist}';
				var data2 = JSON.parse(data);
				
				var data3 = '${jsonStudylist}';
				var data4 = JSON.parse(data3);
				
				var data5 = '${jsonStudylist2}';
				var data6 = JSON.parse(data5);
	
				//var jsonList = JSON.parse(data);
				console.log(data2);
				console.log(data4);
				console.log("hello" +data6);
				var startDiv = $("#TotalBoardContent");
				
				for(var dd in data6)
				{console.log(data6[dd]['NICKNAME'])}
				

				
				if(startDiv != null)
					startDiv.empty();
					
				for(var d in data2)
				{
					if(data2[d]['no'] == number)
					{
						console.log(data2[d]);
						var borderDiv = $("<div class='card border-primary mb-3' style='height:100%;'>");
						var headerDiv = $("<div class='card-header bg-primary h3'>"+data2[d]['boardName']+"</div>");
						var bodyDiv = $("<div class='card-body text-primary'>");
						var h5Tag = $("<h5 class='card-title text-center'>"+data2[d]['title']+"</h5><h6 class='text-right'>"+data2[d]['writer']+"</h6>")
						var pTag = $("<p class='card-text'>"+data2[d]['content']+"</p>");
						var h6Tage = $("<h6 class='d-block text-right mt-3 mr-3'> <a href='#''>"+data2[d]['regDate']+"</a></h6>")

            var btnDivTag = $("<div class='p-t-15'>")
            var btnTag1 = $("<button class='btn btn--radius-2 btn-primary pull-right' type='button' onclick='deletePage()' style='width: 60px; height: 50px;'>삭제</button>");
            var btnTag2 = $("<button class='btn btn--radius-2 btn-primary pull-right' type='button' onclick='updateMyBoard()' style='width: 60px; height: 50px; margin-right: 2px;'>변경</button>");
            btnDivTag.append(btnTag1).append(btnTag2); 

						bodyDiv.append(h5Tag).append(pTag);
						borderDiv.append(headerDiv).append(bodyDiv).append(h6Tage).append(btnDivTag);
						startDiv.append(borderDiv);
						
						$("#no").val(data2[d]['no']);
						$("#boardName").val(data2[d]['boardName']);
						$("#content").val(data2[d]['content']);
						$("#title").val(data2[d]['title']);
            $("#writer").val(data2[d]['writer']);
					}
				}
				
				for(var d2 in data4)
				{
					if(data4[d2]['no'] == number && data4[d2]['boardName'] == 'STUDY')
					{
						
						
						var borderDiv = $("<div class='card border-primary mb-3' style='height:100%;'>");
						var headerDiv = $("<div class='card-header bg-primary h3'>"+data4[d2]['boardName']+"</div>");
						var bodyDiv = $("<div class='card-body text-primary'>");
						var h5Tag = $("<h5 class='card-title text-center'>"+data4[d2]['title']+"</h5><h6 class='text-right'>"+data4[d2]['writer']+"</h6>")
						var pTag = $("<p class='card-text'>"+data4[d2]['content']+"</p>");
						var h6Tage = $("<h6 class='d-block text-right mt-3 mr-3'> <a href='#''>"+data4[d2]['regDate']+"</a></h6>");

            var btnDivTag = $("<div class='p-t-15'>")
            var btnTag1 = $("<button class='btn btn--radius-2 btn-primary pull-right' type='button' onclick='deletePage()' style='width: 60px; height: 50px;'>삭제</button>");
            var btnTag2 = $("<button class='btn btn--radius-2 btn-primary pull-right' type='button' onclick='updateMyBoard()' style='width: 60px; height: 50px; margin-right: 2px;'>변경</button>");
            btnDivTag.append(btnTag1).append(btnTag2);

						bodyDiv.append(h5Tag).append(pTag);
						borderDiv.append(headerDiv).append(bodyDiv).append(h6Tage).append(btnDivTag);
						startDiv.append(borderDiv);
						
						var applyDiv = $("<div class='card-footer bg-info h5'>신청한 인원</div>");
						borderDiv.append(applyDiv);
						
						// 신청한 사람이 몇명인지 체크 하고 for문을 여기서 돌리면됨\
				for (var dd in data6)
				{
					if(data4[d2]['no'] == data6[dd]['BOARDNO']) {
						var result = data6[dd]['NICKNAME'];
					/* 	console.log("result" +result) */
						var applybodyDiv = $("<div class='card-body text-primary'>");
						var applytext = $("<div class='card-text'>");
						var applyRounded = $("<div class='my-3 p-3 bg-white rounded box-shadow'>");
					
						var mediaDiv =$("<div class='media text-muted pt-3'>");
						var imgData = $("<img data-src='holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1' alt='32x32' class='mr-2 rounded' src='data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16e4874d898%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16e4874d898%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.03125%22%20y%3D%2216.9%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E' data-holder-rendered='true' style='width: 32px; height: 32px;'>");
						var imgNextDiv = $("<div class='media-body pb-3 mb-0 small lh-125 border-bottom border-gray'>");
						var itemDiv = $("<div class='d-flex justify-content-between align-items-center w-100'>");
						var strongData = $("<strong class='text-gray-dark'>"+'ID'+"</strong>");
						var strongNextA = $("<button data-target='#applycollabo' data-toggle='modal' href='#applycollabo' class='"+data6[dd]['NICKNAME']+"' id='followNum' onclick='modalF()' style='color: black;'>Follow</button>");  
					 	//var strongNextA = $("<a href='' id='useridd' data-value='1' onclick='requestinvite1()'  style='color: black;''>Follow</a>"); 
						var userNameSpan = $("<span class='d-block' style='float: left;'>"+result+"</span>");
					
				 
						itemDiv.append(strongData);
						itemDiv.append(strongNextA);
						imgNextDiv.append(itemDiv);
						imgNextDiv.append(userNameSpan);
						
						mediaDiv.append(imgData).append(imgNextDiv);
						applyRounded.append(mediaDiv);
						applytext.append(applyRounded);
						applybodyDiv.append(applytext);
						
						borderDiv.append(applybodyDiv);	
						
						$("#no").val(data4[d2]['no']);
						$("#boardName").val(data4[d2]['boardName']);
						$("#content").val(data4[d2]['content']);
						$("#title").val(data4[d2]['title']);
            $("#writer").val(data4[d2]['writer']);

           
					}
				}
			}
		}
				

      //   <div class="p-t">
			// 	<button class="btn btn--radius-2 btn-primary pull-left" type="button" onclick="updateMyBoard()" style="width: 100px; height: 50px;">변경</button>
			// 	<button class="btn btn--radius-2 btn-primary pull-right" type="button" onclick="deletePage()" style="width: 100px; height: 50px;">삭제</button>
		  // </div>


			//<div class="card-footer bg-info h5">신청한 인원</div>
			//<div class="card-body text-primary">
			//	<div class="card-text">
         //     <div class="my-3 p-3 bg-white rounded box-shadow">
				// <div class="media text-muted pt-3">
            //         <img data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1" alt="32x32" class="mr-2 rounded" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_16e4874d898%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_16e4874d898%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.03125%22%20y%3D%2216.9%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="width: 32px; height: 32px;">
            //         <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
				
            //           <div class="d-flex justify-content-between align-items-center w-100">
            //             <strong class="text-gray-dark">Full Name</strong>
            //             <a href="#" style="color: black;">Follow</a>
            //           </div>
				
            //           <span class="d-block" style="float: left;">@username</span>
				
            //         </div>
				// 		</div>

         // <div class="card border-primary mb-3" style="height: 100%;">
         // <div class="card-header bg-primary h3">Job</div>
         // <div class="card-body text-primary">
         //   <h5 class="card-title text-center">FrontEnd</h5><h6 class="text-right">Yoon</h6>
         //   <p class="card-text">
         //     Some quick example text to build on the card title and make up the bulk of the card's content.
         //     sdfdsfddddddddddddddddddddddddddddddddddddddddddddddddddddddd
       	//   </p>
       	//   </div>
       	//   </div> 
			//  <h6 class="d-block text-right mt-3 mr-3">
         //    <a href="#">${j['regDate']}</a>
         //  </h6>
			
			
			
			
				
			});
	
	
		
        
   /*    $('#listScroll').click(function(e){
    	var jobList = new Array();
        var data = e.target;
        console.log(e.target);
        //console.log($(e.target).attr('id').substr(0,1));
        //var dataNum = $(e.target).attr('id').substr(0,1);
		
		//   var boardArr = new Array();
		//   boardArr = ${list};
		  
		//   for(d in boardArr)
		//   {
		// 	  console.log(d);
		//   }
       //   <c:forEach var="j" items="${list}" varStatus="status">
      //   	<c:if test="${status.index == dataNum}">
        		
       //   	</c:if>
       //   </c:forEach>
        
        var startDiv = $("#TotalBoardContent");
        var mainDiv = $("<div class='card border-primary mb-3' style='height:100%;'>");
        //var headerDiv = $("<div class='card-header bg-primary h3'>"++"</div>");





         <div class="card border-primary mb-3" style="height: 100%;">
         <div class="card-header bg-primary h3">Job</div>
         <div class="card-body text-primary">
           <h5 class="card-title text-center">FrontEnd</h5><h6 class="text-right">Yoon</h6>
           <p class="card-text">
             Some quick example text to build on the card title and make up the bulk of the card's content.
             sdfdsfddddddddddddddddddddddddddddddddddddddddddddddddddddddd
       	  </p>
       	  </div>
       	  </div> 
			
			
		}); */
        
         

		/* END BOARD */

          $(function(){
            $('.w-0').css({'width': '0%', });
            $('.w-5').css({'width': '5%', });
            $('.w-10').css({'width': '10%', });
            $('.w-25').css({'width': '25%', });
            $('.w-30').css({'width': '30%', });
            $('.w-40').css({'width': '40%', });
            $('.w-45').css({'width': '45%', });

            var $apiLoading = $('.apiLoading').hide();
            $(document)
            .ajaxStart(function () {
              $apiLoading.show();
            })
            .ajaxStop(function () {
              $apiLoading.hide();
            });

            $('td.hide-html-tag *').css({
              'display': 'none',
            })

            $('.jobmodal-tbl1 tbody tr').css({ 'cursor': 'pointer', });
            $('.jobmodal-tbl2 tbody tr').css({ 'cursor': 'pointer', });

            $('.jobmodal-tbl1 > tbody  > tr').on('click', function() {

              addRowEvent($(this));

              $('#jobmodal').modal({
                backdrop: false,
                keyboard: false,
                show: true,
              });
              $('.modal-dialog').draggable({
                handle: ".modal-content",
                // containment: "window",
              });
            });

            $('.jobmodal-tbl2 > tbody  > tr').on('click', function() {

              addRowEvent($(this));

              $('#jobmodal').modal({
                backdrop: false,
                keyboard: false,
                show: true,
              });
              $('.modal-dialog').draggable({
                handle: ".modal-content",
                // containment: "window",
              });
            });

            $('#skillTxt, #locTxt').bind("enterKey",function(e){
              $('#apiCallBtn')[0].click();
            });
            $('#skillTxt, #locTxt').keyup(function(e){
              if(e.keyCode == 13) {
                $(this).trigger("enterKey");
              }
            });

            

            $("#followNum").click(function(){
             
              var u = $("#userId");
              var a = $("#followNum");

              var data5 = '${jsonStudylist2}';
			  var data6 = JSON.parse(data5);
              console.log("dsfsdfsadf");
              for(var d in data)
              {
                if(data[d]['NICKNAME'] == a.attr("class"))
                {
                  u.val(data[d]['NICKNAME']);
                }
              }    
            })

            $('#apiCallBtn').click(function(){

              var apiParams = {
                "skill": $('#skillTxt').val(),
                "loc": $('#locTxt').val(),
              };

              if($('#skillTxt').val() =="" || $('#locTxt').val() =="") {
                alert("Fill out search fields!");
                return;
              }

              $.ajax({
                type: "POST",
                url: "${path}/job/jobBoardList",
                data: apiParams,
                dataType: "html",
                success: function(data) {
                  html = $('<div>').html(data);
                  // $('#main-container').html(html.find('div.submenu-container'));

                  $('#githubJobBoardList').html(html.find('.jobmodal-tbl2'));
                  // $('#pageBar').html(html.find('#pageBar'));

                  $('.w-0').css({'width': '0%', });
                  $('.w-5').css({'width': '5%', });
                  $('.w-10').css({'width': '10%', });
                  $('.w-25').css({'width': '25%', });
                  $('.w-30').css({'width': '30%', });
                  $('.w-40').css({'width': '40%', });
                  $('.w-45').css({'width': '45%', });
                },
                error: function(status, error) {
                  alert("ajax api parameter call Error!");
                }
              });
            });

          });

          function addRowEvent(tr){
            var githubData = {};
            var no,writer,title,content,regDate,count,status,applicants;
            tr.each(function (i, el) {
              var tds = $(this).find('td');

              githubData = {};

              console.log(tds.eq(0).text()); //no
              console.log(tds.eq(0).text().trim()); //no
              githubData["no"]= (tds.eq(0).text()).trim() ==""? 0:tds.eq(0).text().trim();
              githubData["imageURL"]= tds.eq(1).find('img.imageURL').attr("src");
              githubData["writer"]= tds.eq(2).text();
              githubData["title"]= tds.eq(3).text();
              githubData["content"]= tds.eq(4).text();
              // githubData["regDate"]= new Date(tds.eq(5).text());
              githubData["regDateRaw"]= tds.eq(5).text();
              // githubData["count"]= tds.eq().text();
              // githubData["status"]= tds.eq().text();
              githubData["applicants"]= tds.eq(6).text();
                    // <th class="text-center w-0" style="display:none">번호</th>
                    // <th class="text-center w-10">로고</th>
                    // <th class="text-center w-10">회사명</th>
                    // <th class="text-center w-25">제목</th>
                    // <th class="text-center w-40">글내용</th>
                    // <th class="text-center w-10">작성일</th>
                    // <!-- <th class="text-center">Status</th> -->
                    // <th class="text-center w-5">
                    //   <img src="${path}/resources/images/icons8-queue-48.png" width="33px" height="33px" alt="">
                    // </th>
            });

            console.log(githubData);

            $.ajax({
              type: "POST",
              url: "${path }/job/jobContentView.do",
              dataType: "html",
              data: githubData,
              success: function(data){
                var html = $('<div>').html(data);
                $('#job-dialog').html(html.find('#jobmodal-content'));
              },
              error: function (data) { // 데이터 통신에 실패
                alert("JSON data failed to retrieve!");
              }
            });
          }
          
          
 /*      	$('#apply').click(function(){
            $("#applycollabo").modal('show');
          }); */
      	
      	
        </script>
      </div>
    </div>
  </main>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
