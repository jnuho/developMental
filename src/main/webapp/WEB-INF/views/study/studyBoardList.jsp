<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
  <jsp:param name="pageTitle" value="Study Board" />
</jsp:include>

 <jsp:include page="/WEB-INF/views/common/sidebar.jsp">
  <jsp:param name="pageTitle" value="Home" />
</jsp:include>


<style>
   /*  .container-1200 {
      width: 100%;
      min-width: 1200px;
      padding-left: 15px; padding-right: 15px;
      margin: 0 auto;
    }

 
 /*    .modal {
      text-align: center; */

 
     .modal {
      text-align: center
      }


   /*  @media screen and (min-width: 768px) { 
      .modal:before {
        display: inline-block;
        vertical-align: middle;
        content: " ";
        height: 100%;
      }
    }  */
    
       td {
        max-width: 10;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        padding: 0px;
      } 
      table { width:500px;table-layout:fixed; }
      table tr { height:1em;  } 
      table tr {
        line-height: 25px;
        min-height: 25px;
        height: 25px;
      } 
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


     

 <div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
      <h4 class="modal-title" id="myModalLabel" id="jobmodalTitle"><img src="${path }/resources/images/icons8-book-64.png" class="" alt="">&nbsp;<strong>Study Information </strong>${title}</h4>
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="text-danger fa fa-times"></i></button>
    </div>

    <div class="modal-body container" id="studymodal-body">
      <form action="${path}/study/studyApply" id="applyFrm" method="post">
        <div class="row container">
          <table class="pull-left col-md-8 bg-transparent">
            <tbody>
              <tr>
                <td class="h6"><strong>NO.</strong></td>
                <td class="h5">
                <input type="text"  class="form-control" name='no' id="txtfname" readonly/></td>
              </tr>
              <tr>
                <td class="h6"><strong>Writer</strong></td>
                <td class="h5">
                  <input type="text"  class="form-control" name='writer' id="txtlname" readonly />
                </td>
              </tr> 
              <tr>
                <td class="h6"><strong>Title</strong></td>
                <td class="h5">
                  <input class="form-control"  id="txttname" readonly />
                </td>
              </tr>
              <tr>
                <td class="h6"><strong>Reg. Date</strong></td>
                <td class="h5">
                     <input class="form-control"  id="txtdname" readonly />
                </td>
              </tr> 
               <tr>
                <td class="h6"></td>
                <td class="h5">
                     <input class="form-control"  id="txtdname" readonly />
                </td>
              </tr> 
              	<tr>
              		<td>
              			<input type=hidden name="logininfo" value="${loginMember.id}">
              		</td>
              	</tr>
            </tbody>
          </table>

        </div> 

        <div>
          <h6><strong>Content</strong></h6>
          <textarea class="form-control h-50" rows='10'  id="txtcname"></textarea>
        </div>
        <hr>
        <!-- <input id="applyBtn" type="submit" class="btn btn-primary" value="Apply Now" /> -->
        <button type="submit" class="btn btn-primary" id="applyBtn">Apply Now</button>
      </form>
    </div>
      
    <div class="modal-footer">
      <div class="text-right pull-right ">Max # of Participants<br/> 
        <span class="h3 text-muted"><strong>6</strong></span>
      </div> 
      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    </div>
  </div>
  </div>
  </div> 




  <main id="main-wrapper" class="p-0 w-100">
  
  <div class="py-4 col-lg-10 container submenu-container">


    <div class="card card-fluid" id="job-listings">

      <div class="card-header my-0 py-0">


        <a href="${path}/mainView"><img src="${path}/resources/images/home.png" alt=""></a>


        <div class="d-flex align-items-center p-3 my-0 text-white bg-dark rounded">
          <i class="fa fa-book text-white mr-3 my-2" style="font-size:42px;"></i>
          <div class="lh-100 ml-2">
            <p class="h5 mb-0 text-white lh-100">&nbsp;&nbsp;Study Board</p>
          </div>
        </div>
      </div>

      <div class="card-body">
        <div class="media mb-2">
          <div class="media-body d-flex pl-3 my-0 py-0">
            <div class="">
              <h3 class="card-title">Study Board</h3>
              
              

                <div class="ml-auto">
              <c:if test="${loginMember !=null}">

       			<button id="poststudyBtn" class="ml-auto mr-3 align-self-center btn float-left btn-outline-primary">스터디 모집</button>
              </c:if>
              <c:if test="${loginMember == null}">
                <button id="poststudyBtn1" class="ml-auto mr-3 align-self-center btn float-left btn-outline-primary">스터디 모집</button>

              </c:if>
               
            </div>
   

                <div id="databaseStudyBoardList">

          <table class="table table-sm table-hover studymodal-tbl1" style="font-size:14px;">
            <thead>
              <tr>
                <th class="text-center">NO.</th>
                <th class="text-center">Writer</th>
                <th class="text-center">Title</th>
                <th class="text-center">Content</th>
                <th class="text-center">RegDate</th>
				

              </tr>
            </thead>
            <tbody>
              <c:forEach var="s" items="${list}" varStatus="status">

                <tr class="clickable-row">            
                  <td class="text-center">${s['NO']}</td>
                  <td class="text-center">${s['WRITER']}</td>
                  <td class="text-center study-title">${s['TITLE']}</td>
                  <td class="text-center">${s['CONTENT']}</td>
                  <td class="text-center">${s['REGDATE']}</td>  
                  
                </tr>
              </c:forEach>
            </tbody>
          </table>
				   ${pageBar}
				
        </div>

        

   
   
   <div class="modal fade hide in" id="studyrecruitment" tabindex="-1" role="dialog"
	data-keyboard="false" data-backdrop="static" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
    <div class="modal-dialog modal-80size">
        <div class="modal-content modal-80size">
           <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&#xD7;</button>
           </div>	
             <form action="${path}/study/studyrecruit" method="post">
         				   <div class="modal-body recruit-form">
                        <div class="form-group my-0">

                      <label for="writer">&nbsp;&nbsp;</label>유저 이름

                      <c:if test="${loginMember != null}">
                        <input type="text" class="form-control text-primary" name="writer" value="${loginMember.nickname}" readonly required />
                      </c:if>
                    </div>
                    <div class="form-group">

                      <label for="title">제목</label>
                      <input type="text" name='title' placeholder="제목"required class="form-control">

                    </div>
                    <!-- content -->
                    <hr>
                    <div class="form-group my-0">

                      <label for="description">상세 정보</label>
                      <textarea name="content" placeholder="상세 정보" required class="form-control" rows="5" style="resize:none"></textarea>

                    </div>
                    <hr>
                    <!-- /content end -->
             

                    <input type="submit" class="subscribe btn btn-outline-dark btn-block rounded-lg shadow-sm" value="모집" />

                  </form>
                </div>
              </div>
             
        </div>
        

        
<script>
$('table tbody tr  td').on('click',function(){
    $("#myModal").modal("show");
    $("#txtfname").val($(this).closest('tr').children()[0].textContent);
    $("#txtlname").val($(this).closest('tr').children()[1].textContent);
    $("#txttname").val($(this).closest('tr').children()[2].textContent);
    $("#txtcname").val($(this).closest('tr').children()[3].textContent);
    $("#txtdname").val($(this).closest('tr').children()[4].textContent);
 
});


	$('#poststudyBtn').click(function(){
        $("#studyrecruitment").modal('show');
      });

      $('#poststudyBtn1').click(function(){
        $("#loginModal").modal('show');
      });
      
      $('.clickable-row').click(function(){
          $("#studymodal-content").modal('show');
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
