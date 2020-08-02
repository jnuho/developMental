<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="Admin Member Detail"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp">
  <jsp:param name="pageTitle" value="admin - sidebar" />
</jsp:include>

<section id="faq-container" class="container">
	<div class="col-sm-9">
		<br/><br/><br/>
		<center><p class="title" style="color: #6a60a9;">회원 상세</p></center>
		<table id="tbl-faq" class="table table-bordered">
			<tr>
				<td>회 원 번 : </td>
				<td><input type="text" class="form-control" name="no" value="${member.NO }" readonly required></td>
			</tr>
			<tr>
				<td>아 이 디 : </td>
				<td><input type="text" class="form-control" name="id" value="${member.ID }" readonly required></td>
			</tr>
			<tr>
				<td>회 원 명 : </td>
				<td><input type="text" class="form-control" name="name" value="${member.NAME }" readonly required></td>
			</tr>
			<tr>
				<td>닉 네 임 : </td>
				<td><input type="text" class="form-control" name="nickname" value="${member.NICKNAME }" readonly required></td>
			</tr>
			<tr>
				<td>이 메 일 : </td>
				<td><input type="text" class="form-control" name="email" value="${member.EMAIL }" readonly required></td>
			</tr>
			<tr>
				<td>주 소 지 : </td>
				<td><input type="text" class="form-control" name="addr" value="${member.ADDR }" readonly required></td>
			</tr>
			<tr>
				<td>연 락 처 : </td>
				<td><input type="text" class="form-control" name="tel" value="${member.TEL }" readonly required></td>
			</tr>
			<tr>
				<td>가 입 일 : </td>
				<td><input type="text" class="form-control" name="regDate" value="${member.REGDATE }" readonly required></td>
			</tr>
			<tr>
				<td>수 정 일 : </td>
				<td><input type="text" class="form-control" name="modDate" value="${member.MODDATE }" readonly required></td>
			</tr>
			<tr>
				<td>회원상태 : </td>
				<td>
					<c:choose>
						<c:when test="${member.STATUS eq 1 }">
							<input type="text" class="form-control name" name="status" value="사용가능 계정" readonly required>
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control name" name="status" value="비활성화 계정" readonly required>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>SNS : </td>
				<td>
					<c:choose>
						<c:when test="${member.SNS eq null || empty member.SNS || member.SNS == 'N/A'}">
							<input type="text" class="form-control name" name="status" value="SNS 미등록" readonly required>
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control name" name="status" value="${member.SNS }" readonly required>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td>신 고 수 : </td>
				<td><input type="text" class="form-control" name="reportCount" value="${member.REPORTCOUNT }회" readonly required></td>
			</tr>
			<tr>
				<td>메세지 읽음 여부 : </td>
				<td>
					<c:choose>
						<c:when test="${member.RMESSAGE eq 1 }">
							<input type="text" class="form-control name" name="status" value="모두 읽음" readonly required>
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control name" name="status" value="읽지않음" readonly required>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button" class="btn btn-outline-secondary" onclick="moveBack();" value="이전화면"/>
					<input type="button" class="btn btn-outline-secondary" onclick="reportCountUp();" value="회원경고"/>
					<input type="button" class="btn btn-outline-secondary" onclick="sendEmail();" value="메일전송"/>
				</td>
			</tr>
		</table>
	</div>
	
</section>

<script>
	function sendEmail(){
		var email = $('input[name=email]').val();
		location.href='${path}/admin/emailToMember?email='+email;
	}
	function moveBack() {
		history.back();
	}
	function reportCountUp(){
		var no = $('input[name=no]').val();
		var reportCount = ($('input[name=reportCount]').val()).substr(0,1);
		console.log(reportCount);
		location.href='${path}/admin/memberReportUp?no='+no+'&reportCount='+reportCount;
	}
	$(function(){
		var user = "${loginMember.id}";
		if(user == "" || user != 'admin'){
		   alert("잘못된 접근입니다.");
		   location.href="${path}/";
		}
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>