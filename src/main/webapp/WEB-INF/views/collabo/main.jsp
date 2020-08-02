<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>
<section class="container" id="content" style="margin-top:100px;">
	<input type="text" id="message" />
	<input type="button" id="sendBtn" value="전송" />
	<div id="data"></div>
</section>
<script type="text/javascript">
	sessionStorage.setItem("userId","testuser1");
	sessionStorage.setItem("collaboNo",1);
	let sock = new SockJS("<c:url value="/collabo/soc"/>");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
    $(document).ready(function() {
           $("#sendBtn").click(function() {
                   sendMessage();
                   $('#message').val('')
           });
           $("#message").keydown(function(key) {
                   if (key.keyCode == 13) {// 엔터
                          sendMessage();
                          $('#message').val('')
                   }
           });
    });
    // 메시지 전송
    function sendMessage() {
    	var sendData = {};
    	sendData.userId = "kungsman";
    	sendData.type = "list"
    	sendData.roomNo = 24;
    	sendData.content = $("#message").val();
    	
    	var jsonData = JSON.stringify(sendData);
        sock.send(jsonData);
    }

    // 서버로부터 메시지를 받았을 때
    function onMessage(msg) {
           var data = msg.data;
           $("#data").append(data + "<br/>");
    }
    // 서버와 연결을 끊었을 때
    function onClose(evt) {
           $("#data").append("연결 끊김");
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
