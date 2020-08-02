<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<!-- Google material Icons -->

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="This is Very Nice Tools!"/>
</jsp:include>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script>
var user = "${loginMember}";
if(user == ""){
	location.href="${path}/";
}

</script>
<c:if test="${loginMember != null }">
<div class="container" style="margin-top:110px;margin-bottom:130px;">
	<div class="row">
	
	<c:if test="${collaboTools != null }">
		<c:forEach items="${collaboTools }" var="t" varStatus="i">
		
				<div class="col-3" style="margin-bottom:10px">
					<input type="hidden" id="collaboNo" value="${t.no }"/>
						<div class="card" style="width:300px;height:215px;" onclick="connectCollabo(this)">
							<div class="card-body">
								<h4 class="card-title">${t.title }</h4>
								<hr/>
								<div class="card-text" style="margin-top:35px;"> 
									<h5>참여자</h5>
									<div style="margin-top:15px;">
										<!-- 참여자 -->
										<c:forEach items="${collaboMemberList }" var="m">
										 	  <c:if test="${m.NO == t.no}">
												<%-- <img width="40px" height="40px" src="${path }/resources/upload/member/${m.PROFILE}"/> --%>
												<img width="40px" height="40px" src="${path }/resources/images/teamwork.png"/>
											</c:if> 
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				<div class="col-1"></div>
		</c:forEach>
		<div class="col-3" style="margin-bottom:10px" data-toggle="modal" data-target="#cardModal">
					<div class="card" style="width:300px;height:215px;" >
						<img height="213px" class="card-img-top" src="${path }/resources/images/teamwork.png"/>
							<div class="card-img-overlay">
								<h4 class="card-title"><span class="material-icons" style="font-size:20px;">add</span>콜라보 생성</h4>
								<hr/>
							</div>
						</div>
					</div>
		<div class="col-1"></div>
	</c:if>

	
</div>
  <!-- The Modal -->
  <div class="modal fade" id="cardModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content" style="border-radius:20px">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h5 class="modal-title"><span class="material-icons" style="font-size:19px">dvr</span>[프로젝트 생성]</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button><br/>
        </div>
        
        <!-- Modal body -->
       <!--  <div class="modal-body">
        	<hr>
        	
          	<div class="panel-group">
          		<div class="panel panel-default">
          			<div class="panel-heading">
          				<h5 class="panel-title">
          				</h5>
          			</div>
          			<div id="modifyContent" class="panel-collapse collapse">
          				<div class="panel-body">
	          				<textarea id="editContent" rows="3" cols="92"></textarea>
	          				<br>
	          				<button onclick="requestUpdateCard(this);"type="button" class="btn btn-sm btn-primary" style="margin-top:10px;">수정!</button>
          				</div>
          			</div>
          		</div>
          </div>
          <div style="float:right;margin-top:30px;">
	          <button id="btnEdit" class="btn btn-sm btn-primary" type="button" data-toggle="collapse" data-target="#modifyContent">수정</button>
	          <button class="btn btn-sm btn-primary" type="button">move</button>
	          <button id="btnDelete" class="btn btn-sm btn-primary" onclick="requestDeletCard(this);" type="button">삭제</button>
          </div>
        </div> -->
        
        <!-- Modal footer -->
        <div class="modal-body">
          <input type="text" style="width:256px;border-radius:1px" placeholder="프로젝트 명 입력"/>
        </div>
        <div class="modal-footer">
         <button style="border-radius:8px" name="btnModalClose" onclick="createCollabo(this)" type="button" class="btn btn-primary">만들기</button>
         <button style="border-radius:8px" name="btnModalClose" type="button" class="btn btn-secondary" data-dismiss="modal">나가기</button>
        </div>
      </div>
    </div>
  </div>
</div>
</c:if>
<script>

function createCollabo(element){
	var title = $("<input/>");
	title.attr("type","hidden");
	title.val($(element).parent().parent().children('.modal-body').children().val());
	title.attr("name","title");
	
	var userId = $("<input/>");
	userId.attr("type","hidden");
	userId.val("${loginMember.id}");
	userId.attr("name","userId");
	
	var form = $("<form/>");
	form.attr("action","${path}/collabo/createCollabo");
	form.attr("method","post");
	
	form.append(userId);
	form.append(title);
	$(".modal-body").append(form);
	form.submit();
}

function connectCollabo(element){
	var collaboNo = $(element).parent().children($("input[name=collaboNo_]")).val();
	location.href="${path}/collabo/detail.do?collaboNo="+collaboNo;
}

</script>
<style>
	.card:hover{
		background-color:#E0E0E0;
	}
</style>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
