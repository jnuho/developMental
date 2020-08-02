<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="구인글 등록" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp">
  <jsp:param name="pageTitle" value="구인글 등록" />
</jsp:include>

  <main id="main-wrapper" class="p-0 w-100">
    <jsp:include page="/WEB-INF/views/common/loading.jsp"/>

    <div id="main-container">
      <div class="container py-5 submenu-container">

        <!-- For demo purpose -->
        <div class="row mb-4">
          <div class="col-lg-8 mx-auto text-center">
            <h2 class="">구인글 등록</h2>
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
                  <form action="${path}/job/jobEnrollEnd.do" method="post" enctype="multipart/form-data" class="form">
                    <!-- companyLogo -->
                    <div class="form-group my-0">
                      <div class="companyLogo-wrapper my-0 mx-auto">
                        <c:if test="${jobBoardFile.newName != null}">
                          <img class="logo-pic" src="${path}/upload/job/${jobBoardFile.newName}" />
                        </c:if>
                        <c:if test="${jobBoardFile.newName == null}">
                          <img class="logo-pic" src="" />
                        </c:if>
                        <div class="upload-button">
                          <i class="fa fa-camera" aria-hidden="true"></i>
                        </div>
                        <input class="file-upload form-control" type="file" accept="image/*" name="orgNames" />
                      </div>
                    </div>
                    <!-- /companyLogo -->

                    <div class="input-group my-3">
                      <div class="input-group-prepend"> 
                        <span class='input-group-text'>
                          <i class="fa fa-building-o">&nbsp;&nbsp;</i>회사명
                        </span>
                      </div>
                      <c:if test="${loginMember != null}">
                        <input type="text" class="form-control text-primary" name="writer" value="${loginMember.nickname}" readonly required />
                      </c:if>
                    </div>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend"> 
                        <span class='input-group-text'>
                          <i class="fa fa-header">&nbsp;&nbsp;</i>제목
                        </span>
                      </div>
                      <input type="text" name="title" placeholder="title..." class="form-control" required />
                    </div>
                    <!-- content -->
                    <hr>
                    <div class="row">
                      <div class="input-group mb-3 col-sm-6">
                        <div class="input-group-prepend">
                          <label class="input-group-text" for="jobType">Ⅰ. 근무형태</label>
                          <select class="custom-select" id="jobType" name="jobType" required>
                            <option selected disabled>근무형태</option>
                            <option value="정규직">정규직</option>
                            <option value="계약직">계약직</option>
                          </select>
                        </div>
                      </div>
                      <div class="input-group col-sm-6 mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text">Ⅱ. 위치</span>
                        </div>
                        <textarea class="form-control" aria-label="With textarea" name="location" placeholder="address" rows="2" style="resize:none" required></textarea>
                      </div>
                    </div>
                    <div class="input-group col-sm-12 px-0 mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text">Ⅲ. 자격요건</span>
                      </div>
                      <textarea class="form-control" aria-label="With textarea" name="description" placeholder="describe..." rows="3" style="resize:none" required></textarea>
                    </div>
                    <hr>

                    <!-- hashtag -->
                    <div class="input-group mb-3" id='hashtag-enroll'>
                      <div class="input-group-prepend"> 
                        <span class='input-group-text'><i class="fa fa-hashtag">&nbsp;&nbsp;</i>해시태그</span>
                      </div>
                      <input type="text" id="tag" name="tag" placeholder="키워드를 등록해 주세요." class="form-control" />
                      <div class="input-group-append"> 
                        <span class='input-group-text'>
                          <button type="button" id="addTagBtn" class="btn btn-primary my-0 py-0" value="등록">등록</button>
                        </span>
                      </div>
                    </div>
                    <div class="input-group mb-3" id='hashtag-enroll'>
                      <div class="input-group-prepend"> 
                        <span class='input-group-text'>&nbsp;&nbsp;</i>추가됨</span>
                      </div>
                      <input type="text" id="hashtags" name="hashtags" placeholder="해시태그 리스트...." class="form-control" readonly />
                      <div class="input-group-append"> 
                        <span class='input-group-text'>
                          <button type="button" id="clearTagBtn" class="btn btn-outline-danger my-0 py-0">초기화</button>
                        </span>
                      </div>
                    </div>
                    <hr>
                    <div class="input-group col-sm-12 px-0 mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text">Ⅳ. 지원방법</span>
                      </div>
                      <textarea class="form-control" aria-label="With textarea" name="howToApply" placeholder="how to apply..." rows="3" style="resize:none" required></textarea>
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

          $('#addTagBtn').click(function(){
            var hashtag = $('#tag').val().trim();
            if(hashtag == ""){
              alert("해시코드 값을 입력해 주세요!")
            }

            $('#tag').val('');

            $('#hashtags').val($('#hashtags').val() + "#" + hashtag + " ");
          });

          $('#tag').keypress(function(e){ 

            var hashtag;
            if(e.keyCode == 32){ //spacebar
              hashtag = $('#tag').val();

              $('#hashtags').val($('#hashtags').val() + "#" + hashtag + " ");
              $('#tag').val('');
            }
          });

          $('#clearTagBtn').click(function(){
            $('#hashtags').val("");
          });

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
