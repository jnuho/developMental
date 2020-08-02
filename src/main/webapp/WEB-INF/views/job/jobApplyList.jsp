<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="Job - Board" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/sidebar.jsp">
  <jsp:param name="pageTitle" value="sidebar - mainview" />
</jsp:include>


  <style>
    .container-1200 {
      width: 100%;
      min-width: 1200px;
      padding-left: 15px; padding-right: 15px;
      margin: 0 auto;
    }
    .modal {
      text-align: center;
    }

    @media screen and (min-width: 768px) { 
      .modal:before {
        display: inline-block;
        vertical-align: middle;
        content: " ";
        height: 100%;
      }
    }
  </style>
  <div class="py-4 col-lg-10 container submenu-container">
     <input type="button" value="글쓰기" id='btn-add' class='btn btn-outline-success' onclick='location.href="${path}/board/boardForm"'/>
   <table id='tbl-board' class='table table-striped table-hover'>
      <tr>
         <th>번호</th>
         <th>제목</th>
         <th>작성자</th>
         <th>작성일</th>
         <th>첨부파</th>
         <th>조회a</th>         
      </tr>
   <c:forEach items="${list }" var="b" varStatus="v">
      <tr>
         <td><c:out value="${v.count }"/></td>
         <td>
            <a href='${path }/board/boardView.do?No=${b["NO"]}'>
               <c:out value='${b["TITLE"] }'/>
            </a>
         </td>
         <td><c:out value='${b["WRITER"] }'/></td>
         <td><c:out value='${b["DATE"] }'/></td>
         <td align='center'>
            <c:if test='${b["ATTACHCOUNT"]>0}'>
               <img src="${path }/resources/images/file.png" width="16px"/>
            </c:if>
         </td>
         <td><c:out value='${b["COUNT"] }'/></td>
      </tr>
   </c:forEach>
   </table>
  ${pageBar }
   

  </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
