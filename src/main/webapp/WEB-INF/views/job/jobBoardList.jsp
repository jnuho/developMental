<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="구인게시판" />
</jsp:include>

<jsp:include page="/WEB-INF/views/common/sidebar.jsp">
  <jsp:param name="pageTitle" value="구인게시판" />
</jsp:include>


  <main id="main-wrapper" class="p-0 w-100">
    <jsp:include page="/WEB-INF/views/common/loading.jsp"/>

    <div id="main-container">
      <div class="py-4 col-lg-12 container submenu-container px-3">

        <div class="card card-fluid" id="job-listings">

          <div class="card-header my-0 py-0 px-0">
            <!-- <a href="${path}"><img src="${path}/resources/images/home.png" alt=""></a> -->
            <div class="d-flex align-items-center pl-3 py-2 my-0 text-white w-100 bg-dark rounded">
              <i class="fa fa-briefcase text-white mr-3" style="font-size:32px;"></i>
              <div class="lh-100 ml-2">
                <p class="h5 mb-0 text-white lh-100">구인구직 게시판</p>
                <small><i class="fa fa-asia"></i>국내/해외 취업정보를 제공합니다.</small>
              </div>
            </div>
          </div>

          <div class="card-body px-0">
            <div id="row1" class="d-flex px-1 my-0 py-0">
              <!-- search form -->
              <div id="apiCallFrm" class="form form-inline">

                <button data-toggle='collapse' id='saramInBtn' class='apiToggleBtn btn btn-outline-light text-dark px-1'>
                  <span class="text-muted">국내취업 </span>
                  <span class="text-white bg-primary rounded px-1">Saramin</span>
                </button>
                <button type="button" class="apiToggleBtn collapse btn btn-outline-light text-dark mr-1 d-none px-1" id="githubBtn" value="Search github">
                  <span class='text-muted'>해외취업 </span>
                  <span class='text-white bg-dark rounded px-1'>github</span>
                </button>
                <!-- <button class='apiToggleBtn btn btn-outline-light text-dark px-1'
                    id='githubBtn'>
                  <span class='text-muted'>해외취업 </span>
                  <span class='text-white bg-dark rounded px-1'>github</span>
                </button>
                <button type="button" class="apiToggleBtn collapse btn btn-outline-light text-dark mr-1 d-none px-1" 
                    id="saramInBtn">
                  <span class="text-muted">국내취업 </span>
                  <span class="text-white bg-primary rounded px-1">Saramin</span>
                </button> -->
              </div>
              <div class="ml-auto float-left" style="width:150px;">
                <c:if test="${loginMember !=null}">
                  <a class="mx-0 px-1 align-self-center btn float-left btn-outline-dark" href="${path}/job/jobEnroll">
                    <b><i class="fa fa-edit">&nbsp;</i>구인글</b>
                  </a>
                </c:if>
                <c:if test="${loginMember == null}">
                  <button id="postJobBtn" class="mx-0 px-1 align-self-center btn float-left btn-outline-dark">
                    <b><i class="fa fa-edit">&nbsp;</i>구인글</b>
                  </button>
                </c:if>
              </div>
              <script>
                $('#postJobBtn').click(function(){
                  $("#loginModal").modal('show');
                });
              </script>
            </div>

            <hr class="my-0">
            <div id="row2" class="d-flex px-1 my-1 py-0">
              <div class="form form-inline">
                <input type="text" class="form-control form-control-sm ml-0" placeholder="예. 자바" id="keywords" required />
                <input type="text" class="form-control form-control-sm ml-1 d-none" placeholder="예. New York" id="loc" required />
                <div class="input-group-append">
                  <button type="button" class="btn btn-outline-info ml-0" id="jobSearchBtn"><i class="fa fa-search"></i></button>
                </div>
              </div>
            </div>
            <div id="detailSrchArea">
              <div id="row3" class="form-row d-flex px-1 my-1 py-0">
                <div class="my-1 mx-1">
                  <select class="form-control-sm custom-select mr-2" name="job_type" id="job_type" required>
                    <option selected disabled>근무형태</option>
                    <option value="1">정규직</option>
                    <option value="2">계약직</option>
                  </select>
                </div>
                <div class="my-1 mr-1">
                  <select class="form-control-sm custom-select mr-1" name="loc_cd" id="loc_cd" required>
                    <option selected disabled>근무지역</option>
                    <option value="117000">전국</option>
                    <option value="101000">서울</option>
                    <option value="102000">경기</option>
                    <option value="103000">광주</option>
                    <option value="104000">대구</option>
                    <option value="105000">대전</option>
                    <option value="106000">부산</option>
                    <option value="107000">울산</option>
                    <option value="108000">인천</option>
                    <option value="109000">강원</option>
                    <option value="110000">경남</option>
                    <option value="111000">경북</option>
                    <option value="112000">전남</option>
                    <option value="113000">전북</option>
                    <option value="114000">충북</option>
                    <option value="115000">충남</option>
                    <option value="116000">제주</option>
                    <option value="118000">세종</option>
                  </select>
                </div>
                <div class="my-1 mr-1">
                  <select class="form-control-sm custom-select mr-1" name="ind_cd" id="ind_cd" required>
                    <option selected disabled>산업/업종</option>
                    <option value="301">솔루션·SI·ERP·CRM</option>
                    <option value="302">웹에이젼시</option>
                    <option value="304">쇼핑몰·오픈마켓</option>
                    <option value="305">포털·인터넷·컨텐츠</option>
                    <option value="306">네트워크·통신·모바일</option>
                    <option value="307">하드웨어·장비</option>
                    <option value="308">정보보안·백신</option>
                    <option value="313">IT컨설팅</option>
                    <option value="314">게임</option>
                  </select>
                </div>
                <div class="my-1 mr-1">
                  <select class="form-control-sm custom-select mr-1" name="job_category" id="job_category" required>
                    <option selected disabled>직업/직종</option>
                    <option value="401">웹마스터·QA·테스터</option>
                    <option value="402">서버·네트워크·보안</option>
                    <option value="403">웹기획·PM</option>
                    <option value="404">웹개발</option>
                    <option value="405">게임·Game</option>
                    <option value="406">컨텐츠·사이트운영</option>
                    <option value="407">응용프로그램개발 </option>
                    <option value="408">시스템개발</option>
                    <option value="409">ERP·시스템분석·설계</option>
                    <option value="410">통신·모바일</option>
                    <option value="411">하드웨어·소프트웨어</option>
                    <option value="412">웹디자인</option>
                    <option value="413">퍼블리싱·UI개발</option>
                    <option value="414">동영상·편집·코덱</option>
                    <option value="415">IT·디자인·컴퓨터교육</option>
                    <option value="416">데이터베이스·DBA</option>
                    <option value="417">인공지능(AI)·빅데이터</option>
                  </select>
                </div>
              </div>
  
              <style>
                .custom-control-input:checked ~ .custom-control-label::before {
                  color: #fff;
                  border-color: #17A2B8;
                  background-color: #17A2B8;
                }
              </style>
  
              <div id="row3" class="form-row d-flex px-1 my-1 py-0">
                <div class="my-1 mx-1 text-muted">마감일수</div>
                <div class="my-1 mr-1 custom-control custom-radio custom-control-inline">
                  <input type="radio" id="da" name="sort" class="custom-control-input" value="da" checked />
                  <label class="custom-control-label" for="da">오름차순</label>
                </div>
                <div class="my-1 custom-control custom-radio custom-control-inline">
                  <input type="radio" id="dd" name="sort" class="custom-control-input" value="dd" />
                  <label class="custom-control-label" for="dd">내림차순</label>
                </div>
              </div>
            </div>

            <div id="apiJobBoardList" class="rounded py-2 mt-0">
              <table class="table table-sm table-hover jobmodal-tbl2" style="font-size:14px;">
                <c:if test="${newList == null}">
                  <small>
                    <div class="m-0 p-0 w-100 text-center"><i class="text-muted">Saramin / Github 구인 리스트가 없습니다! 검색어를 입력해주세요.</i></div>
                  </small>
                </c:if>
                <c:if test="${newList != null}">
                  <thead>
                    <tr class="table-secondary">
                      <th class="text-center w-10 px-0 pt-0 mt-0">
                        <div class="bg-light px-1">
                          <i class="fa fa-bookmark" aria-hidden="true">&nbsp;API 데이터</i>
                        </div>
                      </th>
                      <th class="text-center w-0" style="display:none">NO.</th>
                      <th class="text-center w-10 px-0">회사명</th>
                      <th class="text-center w-25">제목</th>
                      <th class="text-center w-40">글내용</th>
                      <th class="text-center w-10">작성일</th>
                      <th class="text-center w-5">
                        <img src="${path}/resources/images/icons8-queue-48.png" width="33px" height="33px" class="img-fluid" alt="">
                      </th>
                      <th class="text-center w-0" style="display:none">조회수 count</th>
                      <th class="text-center w-0" style="display:none">글상태 status</th>
                      <th class="text-center w-0" style="display:none">해시태그 hashtag</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="j" items="${newList}" varStatus="status">
                      <tr class="">
                        <td class="text-center px-0">
                          <c:if test="${fn:substring(j['imageURL'],2,6) =='path'}">
                            <img src="${path}${j['imageURL']}" class="img-fluid" alt="">
                          </c:if>
                          <c:if test="${fn:substring(j['imageURL'],2,6) !='path'}" >
                            <img src="${j['imageURL']}" class="imageURL img-fluid" alt="">
                          </c:if>
                        </td>
                        <td class="text-center" style="display:none">0</td>
                        <td class="text-center px-0">${j['WRITER']}</td>
                        <td class="text-center job-title">${j['TITLE']}</td>
                        <td class="hide-html-tag " >${j['CONTENT']}</td>
                        <td class="text-center">${j['REGDATE']}</td>
                        <td class="text-center">${j['APPLICANTS']}</td>
                        <td class="text-center" style="display:none">${j['COUNT']}</td>
                        <td class="text-center" style="display:none">${j['STATUS']}</td>
                        <td class="text-center" style="display:none">${j['hashtags']}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                  <script src="${path }/resources/js/jobListClick.js"></script>
                </c:if>
              </table>
            </div>
            <hr class='mt-0'>
            <div id="databaseJobBoardList" class="my-3 rounded">
              <table class="table table-sm table-hover jobmodal-tbl1" style="font-size:14px;">
                <thead>
                  <tr class="table-secondary">
                    <th class="text-center w-10 px-0 h-50 pt-0 mt-0">
                      <div class="bg-light" >
                        <i class="fa fa-bookmark" aria-hidden="true">&nbsp;워크맨 추천</i>
                      </div>
                    </th>
                    <th class="text-center w-0" style="display:none">번호</th>
                    <th class="text-center w-10 px-0">회사명</th>
                    <th class="text-center w-25">제목</th>
                    <th class="text-center w-40">글내용</th>
                    <th class="text-center w-10">작성일</th>
                    <th class="text-center w-5">
                      <img src="${path}/resources/images/icons8-queue-48.png" width="33px" height="33px" alt="">
                    </th>
                    <th class="text-center" style="display:none">조회수 count</th>
                    <th class="text-center" style="display:none">글상태 status</th>
                    <th class="text-center" style="display:none">해시태그 hashtags</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="j" items="${list}" varStatus="status">
                    <tr class="">
                      <!-- job lists not registered(inserted) in the Workman's database-->
                      <td class="text-center px-0">
                        <c:if test="${j['fileNewName'] != null}">
                          <img src="${path}/resources/upload/job/${j['fileNewName']}" 
                            class="imageURL img-fluid" alt=""/>
                        </c:if>
                        <c:if test="${j['fileNewName'] == null}">
                          <img src="${path}/resources/images/noimage.png" 
                            class="imageURL img-fluid" alt=""/>
                        </c:if>
                      </td>
                      <td class="text-center" style="display:none">${j['no']}</td>
                      <td class="text-center px-0">${j['writer']}</td>
                      <td class="text-center job-title">${j['title']}</td>
                      <td>${j['content']}</td>
                      <td class="text-center">${j['regDate']}</td>
                      <td class="text-center">${j['applicants']}</td>
                      <td class="text-center" style="display:none">${j['count']}</td>
                      <td class="text-center" style="display:none">${j['status']}</td>
                      <td class="text-center" style="display:none">${j['hashtags']}</td>
                    </tr>
                  </c:forEach>
                </tbody>
                <script src="${path }/resources/js/jobListClick.js"></script>
              </table>

            </div>
            <nav aria-label="Page navigation example" id="pageBar">
              ${pageBar}
            </nav>
          </div>
        </div>

        <style>
          td img {
            height: 10px;
            width: 50%;
            object-fit: cover;
          }
          td {
            max-width: 0;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            padding: 0px;
          }
          table { width:500px;table-layout:fixed; }
          table tr { height:1em;  }
          /* table tr {
            line-height: 25px;
            min-height: 25px;
            height: 25px;
          } */
          @media (max-width: 768px) { /* use the max to specify at each container level */
            .job-title {    
              width:100px;  /* adjust to desired wrapping */
              display:table;
              white-space: pre-wrap; /* css-3 */
              white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
              white-space: -pre-wrap; /* Opera 4-6 */
              white-space: -o-pre-wrap; /* Opera 7 */
              word-wrap: break-word; /* Internet Explorer 5.5+ */
            }
          }
          .modal-content{
            -moz-border-radius: 5px 5px 5px 5px;
            -webkit-border-radius: 5px 5px 5px 5px;
            border-radius: 5px 5px 5px 5px;

            -moz-box-shadow: 2px 2px 2px #535353;
            -webkit-box-shadow: 2px 2px 2px #535353;
            box-shadow: 2px 2px 2px #535353;
          }
        </style>

        <span class="text-muted" style="font-size: 12px;">
          Powered by <a href="http://www.saramin.co.kr" target="_blank">취업 사람인</a>
        </span>

        <script>
          $(function(){

            $('.apiToggleBtn').on('click', function () {

              // $('#keywords').val('');
              // $('#loc').val('');

              $('#detailSrchArea').fadeToggle();
              
              var id = $('.apiToggleBtn').attr('id');
              if(id == "saramInBtn"){
                $(this).html("<span class='text-muted'>해외취업 </span><span class='text-white bg-dark rounded px-1'>github</span>");
                $(this).attr({"id": 'githubBtn'});
                $('#keywords').attr({"placeholder": "예. java"});
                $('#loc').removeClass('d-none');
                $('#loc').attr({"placeholder": "예. New York"});
              } else if(id=='githubBtn'){
                $(this).html("<span class='text-muted'>국내취업 </span><span class='text-white bg-primary rounded px-1'>Saramin</span>");
                $(this).attr({"id": 'saramInBtn'});
                $('#keywords').attr({"placeholder": "예. 자바"});
                $('#loc').addClass('d-none');
              }
            });

            $('.w-0').css({'width': '0%', });
            $('.w-5').css({'width': '5%', });
            $('.w-10').css({'width': '10%', });
            $('.w-25').css({'width': '25%', });
            $('.w-30').css({'width': '30%', });
            $('.w-40').css({'width': '40%', });
            $('.w-45').css({'width': '45%', });


            var $apiLoading = $('.apiLoading').hide();
            $(document)
            .ajaxStart(function () {
              $apiLoading.show();
            })
            .ajaxStop(function () {
              $apiLoading.hide();
            });

            $('td.hide-html-tag *').css({
              'display': 'none',
            })

            $('.jobmodal-tbl1 tbody tr').css({ 'cursor': 'pointer', });
            $('.jobmodal-tbl2 tbody tr').css({ 'cursor': 'pointer', });

            $('.jobmodal-tbl1 > tbody  > tr').on('click', function() {

              addRowEvent($(this));

              $('#jobmodal').modal({
                backdrop: false,
                keyboard: false,
                show: true,
              });
              $('.modal-dialog').draggable({
                handle: ".modal-content",
                // containment: "window",
              });
            });

            $('.jobmodal-tbl2 > tbody  > tr').on('click', function() {

              addRowEvent($(this));

              $('#jobmodal').modal({
                backdrop: false,
                keyboard: false,
                show: true,
              });
              $('.modal-dialog').draggable({
                handle: ".modal-content",
                // containment: "window",
              });
            });

            $('#keywords, #loc').bind("enterKey",function(e){
              $('#jobSearchBtn')[0].click();
            });
            $('#keywords, #loc').keyup(function(e){
              if(e.keyCode == 13) {
                $(this).trigger("enterKey");
              }
            });

            $('#jobSearchBtn').click(function(){

              var githubInputFields = {
                "apiType": "github",
                "keywords": $('#keywords').val(),
                "loc": $('#loc').val(),
              };
              var saraminInputFields = {
                "apiType": "saramin",
                "keywords": $('#keywords').val(),
                "job_type": $('#job_type').val(),
                "loc_cd": $('#loc_cd').val(),
                "ind_cd": $('#ind_cd').val(),
                "job_category": $('#job_category').val(),
                "sort": $("input[name='sort']:checked").val(),
              };

              var btn = $('.apiToggleBtn').attr('id');

              if(btn == 'saramInBtn'){
                if( $('#loc').hasClass('d-none')
                    && saraminInputFields["keywords"]=="") {
                  alert(" 사람인에 검색할 키워드를 입력 해주세요.");
                  return;
                }
                $.ajax({
                  type: "POST",
                  url: "${path}/job/jobBoardList",
                  data: JSON.stringify(saraminInputFields),
                  contentType: 'application/json; charset=utf-8',
                  dataType: "html",
                  success: function(data) {
                    html = $('<div>').html(data);
                    // $('#main-container').html(html.find('div.submenu-container'));

                    $('#apiJobBoardList').html(html.find('.jobmodal-tbl2'));
                    // $('#pageBar').html(html.find('#pageBar'));

                    $('.w-0').css({'width': '0%', });
                    $('.w-5').css({'width': '5%', });
                    $('.w-10').css({'width': '10%', });
                    $('.w-25').css({'width': '25%', });
                    $('.w-30').css({'width': '30%', });
                    $('.w-40').css({'width': '40%', });
                    $('.w-45').css({'width': '45%', });
                  },
                  error: function(status, error) {
                    alert("ajax 사람인 api parameter call Error!");
                  }
                });
              }
              else if(btn == 'githubBtn'){
                if( !$('#loc').hasClass('d-none')
                  && (githubInputFields["keywords"]=="" || githubInputFields["loc"] =="")) {
                  alert("Github 검색어를 모두 입력 해주세요.");
                  return;
                }
                $.ajax({
                  type: "POST",
                  url: "${path}/job/jobBoardList",
                  data: JSON.stringify(githubInputFields),
                  contentType: 'application/json; charset=utf-8',
                  dataType: "html",
                  success: function(data) {
                    html = $('<div>').html(data);

                    $('#apiJobBoardList').html(html.find('.jobmodal-tbl2'));
                    // $('#pageBar').html(html.find('#pageBar'));

                    $('.w-0').css({'width': '0%', });
                    $('.w-5').css({'width': '5%', });
                    $('.w-10').css({'width': '10%', });
                    $('.w-25').css({'width': '25%', });
                    $('.w-30').css({'width': '30%', });
                    $('.w-40').css({'width': '40%', });
                    $('.w-45').css({'width': '45%', });
                  },
                  error: function(status, error) {
                    alert("ajax 깃허브 api parameter call Error!");
                  }
                });
              }

            });
          });

          function addRowEvent(tr){
            var githubData = {};
            var no,writer,title,content,regDate,count,status,applicants;

            tr.each(function (i, el) {
              var tds = $(this).find('td');

              githubData = {};

              githubData["imageURL"]= tds.eq(0).find('img.imageURL').attr("src");
              githubData["no"]= (tds.eq(1).text()).trim() ==""? 0:tds.eq(1).text().trim();
              githubData["writer"]= tds.eq(2).text();
              githubData["title"]= tds.eq(3).text();
              githubData["content"]= tds.eq(4).text();
              githubData["regDateRaw"]= tds.eq(5).text(); //new Date(tds.eq(5).text());
              githubData["applicants"]= tds.eq(6).text();
              githubData["count"]= tds.eq(7).text();
              githubData["status"]= tds.eq(8).text();
              githubData["hashtags"]= tds.eq(9).text();
            });

            console.log(githubData);

            $.ajax({
              type: "POST",
              url: "${path }/job/jobContentView.do",
              dataType: "html",
              data: githubData,
              success: function(data){
                var html = $('<div>').html(data);
                $('#job-dialog').html(html.find('#jobmodal-content'));
              },
              error: function (data) { // 데이터 통신에 실패
                alert("JSON 데이터 ajax 통신 실패!");
              }
            });
          }
        </script>
      </div>
    </div>
  </main>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
