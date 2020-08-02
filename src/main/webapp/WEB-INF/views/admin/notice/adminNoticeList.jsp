<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="관리자" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp">
  <jsp:param name="pageTitle" value="관리자" />
</jsp:include>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.js"></script> 

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

    <div class="card card-fluid" id="job-listings">

      <h6 class="card-header">
        <div class="d-flex align-items-center p-3 my-3 text-white-50 bg-primary rounded shadow-sm">
          <i class="fa fa-check-square-o text-white mr-3 my-2" style="font-size:42px;"></i>
          <div class="lh-100 ml-2">
            <p class="h5 mb-0 text-white lh-100">&nbsp;&nbsp;공지사항</p>
          </div>
        </div>
      </h6>

      <div class="card-body">
        <div class="media mb-2">
          <div class="media-body pl-3 my-0 py-0">
            <h2 class="card-title"><strong>Notice List</strong></h2>
            <p class="card-text">
              <small>사이트 운영방침 준수를 부탁드립니다.</small>
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
              <th class="text-center">제목</th>
              <th class="text-center">작성자</th>
              <th class="text-center">작성일</th>
              <th class="text-center" colspan="3">sup_btn</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${list }" var="n" varStatus="s">
            <tr class="text-gray">
              <td class="noticeNo text-center">
              ${n.noticeNo }
              <input name="content" type="hidden" value="${n.noticeContent }"/>
              <c:forEach items="${attList }" var="a" varStatus="as">
              	<c:if test="${n.noticeNo == a.noticeNo }">
              		<input  name="renamedFileName_${n.noticeNo }" type="hidden" id="${a.renamedFileName }" value="${a.originalFileName }"/>
              	</c:if>
              </c:forEach>
              </td>
              <td class="noticeTitle text-center">
<%--               	<a href='${path }/admin/adminNoticeView.do?noticeNo=${n.noticeNo }'> --%>
					<c:out value='${n.noticeTitle }'/>
<!-- 				</a> -->
              </td>
              <td class="noticeWriter text-center">${n.noticeWriter }</td>
              <td class="noticeDate text-center">${n.noticeDate }</td>
			  <td align="center">
				  <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#myModal">상세</button>
			  </td>
			  <td align="center">
				  <button class="btn btn-outline-secondary" name="btn_u">수정</button>
<%--  <button class="btn btn--radius-2 btn--blue pull-right" type="button" onclick="location.href='${path}/member/mainPage.do'">취소</button> --%>
			  </td>
			  <td align="center">
				  <button type="button" class="btn btn-outline-secondary" name="btn_d">삭제</button>
			  </td>
            <tr>
          </c:forEach>
        </tbody>
      </table>
      
      <nav aria-label="Page navigation example">
       <div id="paging">
       	${pageBar }
       </div>
      </nav>
    </div>
    
    <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content" id="notice-modal">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Notice</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div class="row" style="height:400px;">
        	<table class="pull-left col-md-8">
         	 <tbody>
          	<tr>
             	<td class="h6"><strong>No : </strong></td> <td></td>
               <td class="h5">
               <input type="text" name="no" id="no" class="form-control" readonly />
               </td>
            </tr>
            <tr>
              <td class="h6"><strong>Title : </strong></td> <td></td>
              <td class="h5">
              <input type="text" name="title" id="title" class="form-control"  readonly /> 
              </td>
            </tr> 
            <tr>
              <td class="h6"><strong>Writer : </strong></td> <td></td>
              <td class="h5">
              <input class="form-control" name="writer" id="writer" name="title"  readonly /> 
              </td>
            </tr>
            <tr>
              <td class="h6"><strong>Date : </strong></td> <td></td>
              <td class="h5">
                 <input type="text" name="date" id="date" class="form-control"  readonly /> 
              </td>
            </tr> 
            <tr>
              <td class="h6"><strong>Content : </strong></td> <td></td>
              <td class="h5">
<!--                  <input type="textarea" name="content" id="content" class="form-control" rows="10" readonly />  -->
			  <textarea name="content" id="content" class="form-control" rows="5"></textarea>
              </td>
            </tr>
            <tr>
              <td class="h6"><strong>File : </strong></td> <td></td>
              <td id='filecontainer' class="h5">
              </td>
            </tr>
          </tbody>
        </table>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  </div>
  </div>
  </div>

<script>
      function fileDownload(oName, rName) {
          oName=encodeURIComponent(oName);
          location.href="${path}/notice/filedownLoad.do?oName="+oName+"&rName="+rName;
       }

      $("#myModal").on('show.bs.modal',function(e){
      	var data=$(e.relatedTarget).parents("tr").children();
       	var noticeNo = parseInt($(e.relatedTarget).parents("tr").children('.noticeNo').text());
       	var title =  $(e.relatedTarget).parents("tr").children('.noticeTitle').text().trim();
       	var writer =  $(e.relatedTarget).parents("tr").children('.noticeWriter').text().trim();
       	var date =  $(e.relatedTarget).parents("tr").children('.noticeDate').text().trim();
       	var readCount =  $(e.relatedTarget).parents("tr").children('.noticeReadcount').text().trim();
       	
       	var content = $(e.relatedTarget).parents("tr").children('.noticeNo').children('input[name=content]').val();
       	var renamedFileName = $(e.relatedTarget).parents("tr").children('.noticeNo').children('input[name=renamedFileName]');
       	
       	e.stopPropagation();
       	if($("#filecontainer").children().legnth != 0){
			 $("#filecontainer").empty(); 
		 }else{
			
		 }
       
       $.each($("input[name=renamedFileName_"+noticeNo+"]"),function(f){
       	var btnDown = $("<button/>");
       	var originFileName = $("input[name=renamedFileName_"+noticeNo+"]").val();
       	var renameFileName = $("input[name=renamedFileName_"+noticeNo+"]").attr('id');
       	btnDown.text(originFileName);
       	btnDown.attr("type","button");
       	btnDown.attr("onclick","fileDownload('"+originFileName+"','"+renameFileName+"')");
       	btnDown.attr("class","btn btn-outline-info");
       	$("#filecontainer").append(btnDown);
       });
       	
//        	$.each(renamedFileName,function(i,item){
//        		$(item).attr({"type":"button","onclick":"fileDownload('"+$(item).attr("id")+"','"+$(item).val()+"')"});
//        		$(item).addClass("btn btn-outline-info");
//        		$("#filecontainer").append(item);
//        	});
       	
      	$("#no").val(noticeNo);
      	$("#content2").val(content);
      	$("#content").val(content);
      	$("#title").val(title);
      	$("#writer").val(writer);
      	$("#date").val(date);
      	$("#readCount").val(readCount);
      	$("#renamedFileName").val(renamedFileName);
      	
      });
      
      $("button[name=btn_d]").click(function(){
      	var tr = $(this).parent().parent();
      	var td = tr.children();
      	
      	var noticeNo=td.eq(0).text();
      	if(confirm("삭제된 정보는 복구되지 않습니다. 정말로 삭제합니까?")){
      		location.href="${path}/admin/noticeDelete?noticeNo="+noticeNo;
      	}
      });

      $("button[name=btn_u]").click(function(){
      	var tr = $(this).parent().parent();
      	var td = tr.children();
      	
      	var noticeNo=td.eq(0).text();
      	if(confirm("공지사항을 수정합니다.")){
      		location.href="${path}/admin/noticeUpdate?noticeNo="+noticeNo;
      	}
      });
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />