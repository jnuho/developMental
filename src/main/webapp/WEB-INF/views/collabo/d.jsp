<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

 <!-- <jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value=""/>
</jsp:include>  -->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>			 


<div class="submenu-container">
    <section id="content">
        <head>
                  <!-- Required meta tags-->
                  <meta charset="UTF-8">
                  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
                  <meta name="description" content="Colorlib Templates">
                  <meta name="author" content="Colorlib">
                  <meta name="keywords" content="Colorlib Templates">
             
                  <!-- Title Page-->
                  <title>Au Register Forms by Colorlib</title>
                    <!-- jQuery CDN -->
                    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
                    integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
                    crossorigin="anonymous"></script>
                  <!-- Icons font CSS-->
                  <link href="${path}/resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
                  <link href="${path}/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
                  <!-- Font special for pages-->
                  <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
             
                  <!-- Vendor CSS-->
                  <link href="${path}/resources/vendor/select2/select2.min.css" rel="stylesheet" media="all">
                  <link href="${path}/resources/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
             
                  <!-- Main CSS-->
                  <link href="${path}/resources/css/mypage.css" rel="stylesheet" media="all">          
                  <link href="${path}/resources/css/avatar.css" rel="stylesheet" media="all">
                  
             </head>
		
    <div class="page-wrapper-my p-t-130-my p-b-100-my font-poppins-my">
        <div class="wrapper-my wrapper--w680-my">
            <div class="card-my card-4-my">
                <div class="card-body-my">
                    <h2 class="title-my">콜라보 생성</h2>
                    
            	
            	
            	
            	<!-- avatar -->
	            <!-- <div class="avatar-wrapper my-0-my mx-3-my">
	            <c:if test="${loginMember.profile != null}">             
	              <img class="profile-pic" src="${loginMember.profile}" />
	             </c:if>
	             <c:if test="${loginMember.profile} == null">
	              <img class="profile-pic" src="" />
	             </c:if>
	             
			          <div class="upload-button-my">
		                <i class="fa fa-camera" aria-hidden="true"></i>
		              </div> 
		              <input class="file-upload form-control stretched-link" type="file" accept="image/*" name="profile" />
		              <input class="" type="hidden" name="profile" value="${loginMember.profile}" />
	             
	              </div> -->
	              
               <form action="${path}/member/updateInfoMember.do" method="POST" enctype="multipart/form-data">
                
                <div class="form-group my-0">
                        <div class="companyLogo-wrapper my-0 mx-auto">
                        </div>
                  </div> 
                    
                        <div class="row-my row-space-my">
                            <div class="col-2-my">
                                <div class="input-group-my">
                                    <label class="label-my">프로젝트 명</label>
                                    <input class="input--style-4-my" type="text" name="name" id="name" placeholder="이름 2자리 이상 영문도 2자리 이상" value="${loginMember.name}" readonly="readonly" >
                                    <input type="hidden" id="nameValue" value="T" class="이름"/>
                                </div>
                            </div>
                            <div class="col-2-my">
                                <div class="input-group-my">
                                    <label class="label-my">닉네임</label>
                                    <input class="input--style-4-my" type="text" name="nickname" id="nickname" placeholder="닉네임 2자리 이상 영문도 2자리 이상" value="${loginMember.nickname}" required="required" >
                                </div>
                            </div>
                        </div>
                        
                        <div class="row-my row-space-my">
                            <div class="col-2-my">
                            	<div class="input-group-my">
                                    <label class="label-my">아이디</label>
                                    <input class="input--style-4-my" type="text" name="id" id="id" placeholder="아이디 영문숫자만" value="${loginMember.id}" readonly="readonly">
                                    <input type="hidden" id="idValue" value="T" class="아이디"/>
                                </div>
                            </div>
                            
                            <div class="col-2-my">
                            <div class="input-group-my">
                                    <label class="label-my" id="pwlabel">비밀번호</label>										
                                    <input class="input--style-4-my" type="password" name="pw" placeholder="비밀번호 6자리 이상" id="pw" required="required">
                                    <input type="hidden" id="pwValue" value="F" class="비밀번호"/>
                                </div>
                            
                            </div>
                        </div>
                        <div class="row-my row-space-my">
                            <div class="col-2-my">
                                <div class="input-group-my">
                                    <label class="label-my">이메일</label>
                                    <input class="input--style-4-my" type="email" name="email" id="email" placeholder="ex) abc@abc.com" value="${loginMember.email}" readonly="readonly">
                                    <input type="hidden" id="emailValue" value="T" class="이메일"/>
                                </div>
                            </div>
                            <div class="col-2-my">
                                <div class="input-group-my">
                                    <label class="label-my">핸드폰</label>
                                    <input class="input--style-4-my" type="text" name="tel" id="tel" value="${loginMember.tel}" placeholder="ex) 010-1234-5678">
                                    <input type="hidden" id="telValue" value="T" class="핸드폰"/>
                                </div>
                            </div>
                        </div>
                        <div class="row-my row-space-my">
                            <div class="col-0-my">
                                <div class="input-group-my">
                                    <label class="label-my">주소</label>        	
                                    <input class="input--style-4-my" type="text" name="addr" id="addr" value="${loginMember.addr}" placeholder="주소를 입력하세요" required="required" >
                                    <input type="hidden" id="addrValue" value="T" class="주소"/>   
                                    <!-- <input type="hidden" class="form-control" placeholder="extraAddress" id="extraAddress" name="extraAddress">
                                    <input type="hidden" class="mr-3 col-md-3 form-control" placeholder="Postcode" id="postCode" name="postCode">
                                    <input type="hidden" class="form-control" placeholder="jibunAddress" id="jibunAddress" name="jibunAddress"> -->
                                </div>
                            </div>
                            <div class="col-4-my">
	                            <div class="input-group-my">
	                              <button class="btn-my btn--radius-2-my btn--blue-my pull-right" style="height:50px; margin-top: 30px; margin-left: 5px; " onclick="postCode()"><i class="fa fa-search"></i></button>                    
                                  <input type="hidden" value=""/>
                                </div>
                            </div>
                        </div>   
                        
                        <div class="row-my row-space-my">
                           
                        </div>                 
                         <div class="row-my row-space-my">
                            <div class="col-0-my">
                                <div class="input-group-my">
                                    <label class="label-my"><input type="text" id="msg" style="color: red" value="" readonly/></label>
                                </div>
                            </div>
                         </div>  
                        <div class="p-t-15-my">
                            <button class="btn-my btn--radius-2-my btn--blue-my pull-left" type="button" onclick="changeData()">생성</button>
                            <button class="btn-my btn--radius-2-my btn--blue-my pull-right" type="button" onclick="location.href='${path}/mainView'">취소</button>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
	 </div>

    <!-- Jquery JS-->
    <script src="${path}/resources/vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="${path}/resources/vendor/select2/select2.min.js"></script>
    <script src="${path}/resources/vendor/datepicker/moment.min.js"></script>
    <script src="${path}/resources/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="${path}/resources/js/global.js"></script>
   

<!-- This templates was made by Colorlib (https://colorlib.com) -->


<script>

</script>

</section>
</div>

<!-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> -->