<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="Admin - Member Manag" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp">
  <jsp:param name="pageTitle" value="sidebar - mainview" />
</jsp:include>

<style>
	.container-1200 {
      width: 100%;
      min-width: 1200px;
      padding-left: 15px; padding-right: 15px;
      margin: 0 auto;
    }
    #table-container {
    	margin-left:240px;
    }
</style>

<div class="py-4 col-lg-10 container submenu-container" id="table-container">
	<br/><br/><br/>
	<div class="form-inline">
		<form name="form1" method="post" action="${path }/admin/memberSearch.do">
			<select id="searchType" name="searchType">
				<option value="all">Search Type</option>
				<option value="id">ID</option>
				<option value="name">Name</option>
				<option value="nickname">NickName</option>
				<option value="status">Status</option>
				<option value="email">Email</option>
			</select>&nbsp;&nbsp;
			<input class="form-control" type="text" id="keyword" name="keyword" value="" placeholder="input search_keyword">&nbsp;&nbsp;
			<input class="btn btn-primary" type="button" id="BtnSearch" value="Search" onclick="keywordConfirm();"/>
		</form>
	</div>
	<br/>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">계정상태</th>
				<th scope="col">회원번호</th>
				<th scope="col">아이디</th>
				<th scope="col">회원명</th>
				<th scope="col">닉네임</th>
				<th scope="col">이메일</th>
				<th scope="col">주소</th>
				<th scope="col">전화번호</th>
				<th scope="col">SNS</th>
				<th scope="col">신고카운트</th>
				<th colspan=3>지원버튼</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="m" varStatus="s">
			<tr>
				<td>${s.count }</td>
				<td>
					<!-- status가 1이면 이용가능(Y), 0이면 이용 불가 -->
					<c:if test="${m.status==1}">
						<input type="radio" name="${m.id }_status" value="Y" checked/>Y
						<input type="radio" name="${m.id }_status" value="N"/>N
					</c:if>
					<c:if test="${m.status==0}">
						<input type="radio" name="${m.id }_status" value="Y"/>Y
						<input type="radio" name="${m.id }_status" value="N" checked/>N
					</c:if>
				</td>
				<td>${m.no }</td>
				<td>${m.id }</td>
				<td>${m.name}</td>
				<td>${m.nickName }</td>
				<td>${m.email }</td>
				<td>${m.addr }</td>
				<td>${m.tel }</td>
				<td>${m.sns }</td>
				<td>${m.reportCount }</td>
				<td>
					<button type="button" name="btn_s" class="btn btn-outline-secondary" >회원 상태변경</button>
				</td>
				<td>
					<button type="button" name="btn_d" class="btn btn-outline-secondary" >삭제</button>
				</td>
				<td>
					<button type="button" name="btn_v" class="btn btn-outline-secondary" >정보 열람</button>
				</td>				
			</tr>
			</c:forEach>
		</tbody>
	</table>
	${pageBar }
</div>
<script>
	$("button[name=btn_s]").click(function() {
		var tr = $(this).parent().parent();
		var td = tr.children();
		
		var no = td.eq(2).text();
		var status=td.eq(1).children().prop("checked")?1:0;
		
			if(status==1){
				if(confirm("계정을 활성화 합니다.")){
				location.href="${pageContext.request.contextPath}/admin/statusUpdate?no="+no+"&status="+status;
				}
			}else if(status==0){
				if(confirm("계정을 비활성화 합니다.")){
					location.href="${pageContext.request.contextPath}/admin/statusUpdate?no="+no+"&status="+status;
				}
			}else{
				alert("오류! 관리자에게 문의하세요");
			}
	}); 
		
	$("button[name=btn_d]").click(function(){
		var tr = $(this).parent().parent();
		var td = tr.children();
		
		var id=td.eq(3).text();
		if(confirm("삭제된 계정정보는 복구되지 않습니다. 정말로 삭제합니까?")){
			location.href="${pageContext.request.contextPath}/admin/memberDelete?id="+id;
		}
	});
	
	$("button[name=btn_v]").click(function(){
		var tr = $(this).parent().parent();
		var td = tr.children();
		
		var id = td.eq(3).text();
		if(confirm("회원정보는 열람만 가능하며 수정할 수 없습니다.")){
			location.href="${pageContext.request.contextPath}/admin/memberView?id="+id;
		}
	});
	
	function keywordConfirm(){
		var inputName = $("#searchType").val();
		var inputkeyword = $("#keyword").val();
		if( inputName =='all' || (inputkeyword == "null" || inputkeyword == "undefined" || inputkeyword == "NaN" || inputkeyword == '')){
			alert("검색 타입을 설정하시거나 검색어를 입력하세요.");		
			console.log("null");
		}else{
			var form = $('form');
			form.submit();
		}
		
	}
	$(function(){
		var user = "${loginMember.id}";
		if(user == "" || user != 'admin'){
		   alert("잘못된 접근입니다.");
		   location.href="${path}/";
		}
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
