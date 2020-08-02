<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="Main view" />
</jsp:include>

<%-- <jsp:include page="/WEB-INF/views/common/sidebar.jsp">
  <jsp:param name="pageTitle" value="Main view" />
</jsp:include>
 --%>
  <style>
    #main-container{
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

  <main id="main-container" class="p-0 w-100">
    <div class="py-5">
      <div class="container">
        <div class="card-columns">
          <div class="card">
            <div class="card-header bg-transparent p-0">
              <img src="${path }/resources/images/hire.jpg" class="card-img-top" alt="...">
            </div>
            <div class="card-body">
              <h5 class="card-title">Company</h5>
              <p class="card-text">Recruiting Now!</p>
            </div>
            <div class="card-footer bg-transparent text-center">
              <a class="btn btn-sm btn-outline-dark stretched-link" href="javascript: ajaxJobPage('${path }/job/jobBoardList');">Recruit</a>
            </div>
          </div>
          <div class="card text-center">
            <img src="${path}/resources/images/apply.jpg" class="card-img-top" alt="...">
            <a class="btn btn-sm btn-outline-dark my-2 stretched-link" href="javascript: ajaxJobPage('${path }/job/jobApplyList');">Apply</a>
          </div>
          <div class="card p-3">
            <blockquote class="blockquote mb-0 card-body">
              <p>text here</p>
              <footer class="blockquote-footer">
                <small class="text-muted">
                  Some author <cite title="Source Title">Title</cite>
                </small>
              </footer>
            </blockquote>
          </div>
          <div class="card">
            <img src="${path}/resources/images/wallpaper.jpg" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">Card title</h5>
              <p class="card-text">Card text.</p>
              <p class="card-text"><small class="text-muted">updated 0 min ago</small></p>
            </div>
          </div>
          <div class="card bg-primary text-white text-center p-3">
            <blockquote class="blockquote mb-0">
              <p class="text-white">quote text here</p>
              <footer class="blockquote-footer text-white">
                <small>
                  Some author<cite title="Source Title">Title</cite>
                </small>
              </footer>
            </blockquote>
          </div>
          <div class="card text-center">
            <div class="card-body">
              <h5 class="card-title">Card title</h5>
              <p class="card-text">card text here</p>
              <p class="card-text"><small class="text-muted">updated 0 mins ago</small></p>
            </div>
          </div>
          <div class="card p-3 text-right">
            <blockquote class="blockquote mb-0">
              <p>block quote here</p>
              <footer class="blockquote-footer">
                <small class="text-muted">
                  Some author <cite title="Source Title">Title</cite>
                </small>
              </footer>
            </blockquote>
          </div>
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Card title</h5>
              <p class="card-text">card text</p>
              <p class="card-text"><small class="text-muted">updated 0 mins ago</small></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>

</div> <!-- row -->

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
