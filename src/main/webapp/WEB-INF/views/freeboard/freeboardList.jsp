<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="자유게시판" />
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


  <main id="main-wrapper" class="p-0 w-100">
  <jsp:include page="/WEB-INF/views/common/loading.jsp"/>

  
  <div class="py-4 col-lg-10 container" id="main-container">

    <div class="card card-fluid" id="job-listings">
		<div class="card-header my-0 py-0 px-0">
           <!-- <a href="${path}"><img src="${path}/resources/images/home.png" alt=""></a> -->
           <div class="d-flex align-items-center p-3 my-0 text-white w-100 bg-dark rounded">
             <i class="fa fa-clipboard text-white mr-3 my-2" style="font-size:42px;"></i>
             <div class="lh-100 ml-2">
               <p class="h5 mb-0 text-white lh-100">자유게시판</p>
             </div>
             
             <div class="ml-auto">
                  <c:if test="${loginMember !=null}">
                    <a class="ml-auto mr-3 align-self-center btn float-left btn-outline-primary" href="${path}/freeboard/editor/editorWrite">
                      <i class="fa fa-edit">&nbsp;</i>게시글작성
                    </a>
                  </c:if>
                  <c:if test="${loginMember == null}">
                    <button id="postJobBtn" class="ml-auto mr-3 align-self-center btn float-left btn-outline-primary">
                      <i class="fa fa-edit"></i>게시글작성
                    </button>
                  </c:if>
                </div>
                
                <script>
                  $('#postJobBtn').click(function(){
                    $("#loginModal").modal('show');
                  });
                </script>
             
           </div>
         </div>



      <div class="card-body">
        <div class="media mb-2">
          <div class="media-body d-flex pl-3 my-0 py-0">
           
				

			
         <div id="databaseJobBoardList">
		<%-- <input type="button" value="글쓰기" id='btn-add' class='ml-auto mr-3 align-self-center btn float-left btn-outline-primary' onclick='location.href="${path}/freeboard/editor/editorWrite"'/> --%>
          <table class="table table-sm table-hover studymodal-tbl1" style="font-size:14px;">
            <thead>
              <tr>
                <th class="text-center">NO.</th>
                <th class="text-center">Writer</th>
                <th class="text-center">Title</th>
                <th class="text-center">Content</th>
                <th class="text-center">RegDate</th>
				<th class="text-center">Count</th>

              </tr>
            </thead>
            <tbody>
              <c:forEach var="s" items="${list}" varStatus="status">
                <tr class="">            
                  <td class="text-center">${s['NO']}</td>
                  <td class="text-center">${s['WRITER']}</td>
                  <td class="text-center study-title">${s['TITLE']}</td>
                  <td class="text-center">${s['CONTENT']}</td>
                  <td class="text-center">${s['REGDATE']}</td>  
                  <td class="text-center">${s['COUNT']}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
				   ${pageBar}
				
        </div>
<script>
$(function(){
  
        $('td.hide-html-tag *').css({
          'display': 'none',
        })

        $('.studymodal-tbl1 tbody tr').css({ 'cursor': 'pointer', });
        $('.studymodal-tbl2 tbody tr').css({ 'cursor': 'pointer', });

        $('.studymodal-tbl1 > tbody  > tr').on('click', function() {

          addRowEvent($(this));

          $('#studymodal').modal({
            backdrop: false,
            keyboard: false,
            show: true,
          });
          $('.modal-dialog').draggable({
            handle: ".modal-content",
            // containment: "window",
          });
        });

        $('.studymodal-tbl2 > tbody  > tr').on('click', function() {

          addRowEvent($(this));

          $('#studymodal').modal({
            backdrop: false,
            keyboard: false,
            show: true,
          });
          $('.modal-dialog').draggable({
            handle: ".modal-content",
            // containment: "window",
          });
        });

	
	
});

</script>

      </div>
	</div>
</div>
</div>
</div>
</div>








<jsp:include page="/WEB-INF/views/common/footer.jsp" />
  

</main>
