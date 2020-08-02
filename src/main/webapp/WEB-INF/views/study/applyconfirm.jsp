<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="Content" />
</jsp:include>
<Br>
<Br>

  <div class="modal-content" id="modal-content">
    <div class="modal-header">
      <h4 class="modal-title"><img src="${path }/resources/images/icons8-book-64.png" class="" alt="">&nbsp;<strong>Study List</strong>${title}</h4>
    </div>

    <div class="modal-body container" id="modal-body">
      <form action="${path}/study/studyEdit" id="applyFrm" method="get">
        <div class="row container">
          <table class="pull-left col-md-8 bg-transparent">
            <tbody>
              <tr>
                <td class="h6"><strong>NO.</strong></td>
                <td class="h5"><input type="text" name="no" id="no" class="form-control" value="${board_meetup.no}" readonly /></td>
              </tr>
              <tr>
                <td class="h6"><strong>Writer</strong></td>
                <td class="h5">
                  <input type="text" name="writer" class="form-control" value="${board_meetup.writer}" readonly />
                </td>
              </tr> 
              <tr>
                <td class="h6"><strong>Title</strong></td>
                <td class="h5">
                  <input class="form-control" name="title" value="${board_meetup.title}" readonly />
                </td>
              </tr> 
              <tr>
                <td class="h6"><strong>Reg. Date</strong></td>
                <td class="h5">
                  <input type="date" name="regDate" class="form-control" value="${board_meetup.regDate}" readonly /> 
                </td>
              </tr> 
              <tr>
                <td class="h6"><strong>Count</strong></td>
                <td class="h5">
                  <input type="text" name="count" class="form-control" value="${board_meetup.count}" readonly />
                </td>
              </tr> 
  
            </tbody>
          </table>

        </div>

        <div>
          <h6><strong>Content</strong></h6>
          <textarea class="form-control h-50" rows='5' name="content" readonly>${board_meetup.content}</textarea>
        </div>
        <button type="submit" class="btn btn-primary" id="applyBtn">Edit Now</button>
      </form>
      
    </div>
      <div>
     
      </div>
    <div class="modal-footer">
   		  <div class="modal-footer container" id="modal-footer">
   		  		<h6><strong>Applicants</strong></h6>
   		  
   		  </div>
      
    </div>
  </div>