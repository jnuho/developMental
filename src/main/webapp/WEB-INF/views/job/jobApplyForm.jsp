<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="Apply" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp">
  <jsp:param name="pageTitle" value="Apply job" />
</jsp:include>

  <main id="main-wrapper" class="p-0 w-100">
    <jsp:include page="/WEB-INF/views/common/loading.jsp"/>

    <div class="" id="main-container">
    <div class="submenu-container">
      <div class="container py-5">

        <!-- For demo purpose -->
        <div class="row mb-4">
          <div class="col-lg-8 mx-auto text-center">
            <h5 class="display-4">지원서 작성</h5>
            <p class="lead mb-0">
            </p>
          </div>
        </div>
        <!-- End -->

        <div class="row">
          <div class="col-lg-7 mx-auto">
            <div class="bg-white rounded-lg shadow-sm px-5 py-3">

              <!-- form content -->
              <div class="tab-content">

                <!-- applicants info-->
                <div id="nav-tab-card" class="tab-pane fade show active">
                  <!-- <p class="alert alert-success">Some text success or error</p> -->
                  <form action="${path}/job/jobApplyEnd.do" method="post" enctype="multipart/form-data">

                      <input type="hidden" name="no" value="${jobBoard.no}" />
                      <input type="hidden" name="writer" value="${jobBoard.writer}" />
                      <input type="hidden" name="title" value="${jobBoard.title}" />
                      <input type="hidden" name="content" value="${jobBoard.content}" />
                      <input type="hidden" name="regDate" value="${jobBoard.regDate}" />
                      <input type="hidden" name="count" value="${jobBoard.count}" />
                      <input type="hidden" name="status" value="${jobBoard.status}" />
                      <input type="hidden" name="applicants" value="${jobBoard.applicants}" />
                      <input type="hidden" name="imageURL" value="${imageURL}" />

                    <!-- companyLogo -->
                    <!-- <div class="form-group my-0">
                      <div class="companyLogo-wrapper my-0 mx-auto">
                        <c:if test="${jobBoardFile.newName == null}">
                          <img class="logo-pic" src="" />
                        </c:if>
                        <div class="upload-button">
                          <i class="fa fa-camera" aria-hidden="true"></i>
                        </div>
                        <input class="file-upload form-control" type="file" accept="image/*" name="orgNames" />
                      </div>
                    </div> -->
                    <!-- /companyLogo -->

                    <div class="form-group my-0">
                      <!-- <label for="no" class="fa fa-list-ol">&nbsp;&nbsp;</label>게시판번호 -->
                      <c:if test="${jobBoard != null}">
                        <input type="hidden" class="form-control text-primary" name="no" value="${jobBoard.no}" readonly required />
                      </c:if>
                    </div>

                    <div class="form-group my-0">
                      <label for="nickname" class="fa fa-user-o">&nbsp;&nbsp;</label>지원자
                      <c:if test="${loginMember != null}">
                        <input type="text" class="form-control text-primary" name="nickname" value="${loginMember.nickname}" readonly required />
                        <input type="hidden" class="form-control text-primary" name="memberNo" value="${loginMember.no}" readonly required />
                      </c:if>
                    </div>
                    <div class="form-group">
                      <label for="resume"><i class="fa fa-file-text-o" aria-hidden="true"></i> 이력서</label>
                      <input type="file" class="file-upload form-control" accept="application/msword, text/plain, application/pdf, image/*, .docx" name="resume" />
                    </div>
                    <div class="form-group">
                      <label for="intro"><i class="fa fa-sticky-note-o"></i> 자기소개서</label>
                      <input type="file" class="file-upload form-control" accept="application/msword, text/plain, application/pdf, image/*, .docx" name="coverLetter" />
                    </div>
                    <hr>
                    <!-- /content end -->
                    <input type="submit" class="subscribe btn btn-outline-dark btn-block rounded-lg shadow-sm" value="제출하기" />
                  </form>
                </div>
                <!-- End -->

              </div>
              <!-- End -->

            </div>
          </div>
        </div>
      </div>

      <script>
        $(function(){
          var $apiLoading = $('.apiLoading').hide();
          $(document)
          .ajaxStart(function () {
            $apiLoading.show();
          })
          .ajaxStop(function () {
            $apiLoading.hide();
          });

          // logo image
          var readURL = function(input) {
            if (input.files && input.files[0]) {
              var reader = new FileReader();
              reader.onload = function (e) {
                $('.logo-pic').attr('src', e.target.result);
              }
              reader.readAsDataURL(input.files[0]);
            }
          }

          $(".file-upload").on('change', function(){
            readURL(this);
          });
          $(".upload-button").on('click', function() {
            $(".file-upload").click();
          });
          
          // $("[name='upFile']").on('change', function(){
          //   var fileName = this.files[0].name;
          //   $(this).next('.custom-file-label').html(fileName);
          // });
          $('[data-toggle="tooltip"]').tooltip()
        });
      </script>

    </div>
  </main>

</div>
 

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
