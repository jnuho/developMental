<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${ param.pageTitle }</title>
  
  <!-- favicon -->
  <link rel="icon" href="${path}/resources/images/logo.png">

  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  
  <!-- Popper -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <!-- CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
      integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
  <link rel="stylesheet" href="${path }/resources/css/header.css">
  
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
      integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
      crossorigin="anonymous"></script>

  <link rel="stylesheet" href="${path }/resources/css/header.css">

  <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
  
  <!-- Javascript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	


<style type="text/css">
  .form-control {
    min-height: 41px;
    background: #f2f2f2;
    box-shadow: none !important;
    border: transparent;
  }
  .form-control:focus {
    background: #e2e2e2;
  }
  .form-control, .btn {        
        border-radius: 2px;
    }
  .login-form {
    width: 450px;
    margin: 30px auto;
    text-align: center;
  }
  .login-form h2 {
        margin: 10px 0 25px;
    }
    .login-form form {
    color: #7a7a7a;
    border-radius: 3px;
      margin-bottom: 15px;
        background: #fff;
        /* box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3); */
        padding: 30px;
    }
    .login-form .btn {        
        font-size: 16px;
        font-weight: bold;
    background: #3598dc;
    border: none;
        outline: none !important;
    }
  .login-form .btn:hover, .login-form .btn:focus {
    background: #2389cd;
  }
  .login-form a {
    color: #fff;
    text-decoration: underline;
  }
  .login-form a:hover {
    text-decoration: none;
  }
  .login-form form a {
    color: #7a7a7a;
    text-decoration: none;
  }
  .login-form form a:hover {
    text-decoration: underline;
  }
  
  .modal-header {
      border-bottom: 0 none;
  }

  .modal-content.modal-80size {
  height: auto;
  min-height: 30%;
}

</style>
</head>
<body>
  <header>
    <!-- icon8 images links -->
    <!-- <a target="_blank" href="https://icons8.com/icons/set/sphere">Sphere</a> icon by <a target="_blank" href="https://icons8.com">Icons8</a> -->

    <!-- Navigation bar -->
    <nav class="site-header navbar navbar-expand-md navbar-dark fixed-top py-0 justify-content-center">
      <!-- d-flex container -->
      <div class="container d-flex justify-content-center row">
        <!-- Logo -->
        <div class='py-0 mr-auto inline px-0' id="navbar-logo">
          <a class="navbar-brand" href="${path }/" >
            <img src="${path }/resources/images/logo.png">
          </a>
        </div>
        <!-- Nav search bar -->
        <div id="nav-searchbar" class="col-lg-6 py-0 inline-block px-0 ml-0 mr-1">
          <form action="${path}/job/jobBoardList" method="POST" class='w-100'>
            <div class="input-group">
              <!-- type="search" -->
              <input type="hidden" placeholder="  검색" aria-describedby="button-addon5" class="form-control" name="hashtags" id="nav-search">
              <div class="input-group-append">
                <!-- type="submit" -->
                <button id="button-addon5" type="hidden" class="btn btn-light" id="nav-searchbar-btn" style="display:none"><i class="fa fa-search"></i></button>
              </div>
            </div>
          </form>
        </div>
        <!-- toggle button -->
        <button class="navbar-toggler ml-auto inline my-1" type="button" data-toggle="collapse" data-target="#navbarCollapsible" aria-controls="navbarCollapsible" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <!-- collapsible elements -->
        <div class="collapse navbar-collapse" id="navbarCollapsible">
          <ul class="navbar-nav ml-auto" id='collapseItems'>

            <!-- <li class="nav-item dropdown">
              <a class="nav-link dropdown menu-item mt-1 mr-0 text-white" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-bell"></i></a>

              <div class="dropdown-menu mt-1" aria-labelledby="dropdown01">
                <div id="notification" class="dropdown-item fa fa-list"></div>
              </div>
            </li> -->
            <li class="nav-item dropdown">
              <a class="nav-link dropdown menu-item mt-1 mr-2 text-white" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fa fa-cog">&nbsp;<span class="text-secondary"><c:if test="${loginMember != null}">#${loginMember.no}</c:if></span></span>&nbsp;</a>

              <div class="dropdown-menu mt-1" aria-labelledby="dropdown01">
                <a class="dropdown-item" href="${path }/collabo/main?userId=${loginMember.id }"><i class="fa fa-align-justify">&nbsp;&nbsp;</i>Collabo Tool</a>
                <a class="dropdown-item" href="javascript: ajaxJobPage('${path }/job/jobBoardList');"><i class="fa fa-briefcase">&nbsp;&nbsp;</i>구인 구직</a>
                <!-- 관리자메뉴 버튼 by ogc -->
                <c:if test="${loginMember != null && loginMember.id eq 'admin'}">
                  <a class="dropdown-item" href="${path }/admin/adminMain"><i class="fa fa-user">&nbsp;&nbsp;&nbsp;</i>관리 메뉴</a>
          <!-- <button type="button" class="btn btn-sm btn-light mt-2 mr-1" onclick="adminMenu();" style="width: 80px;">관리</button> -->
                </c:if>
              </div>
            </li>
      
      <c:if test="${loginMember != null}">
              <li class="nav-item">
                <form action="${path}/member/logout.do" method="post">
                  <button type="button" class="btn btn-sm btn-light mt-2 mr-1" onclick="return logoutSnsAccount();" style="width: 200px;" disabled="disabled"><c:out value="${loginMember.nickname}님 환영합니다."/></button>
                  <button type="submit" class="btn btn-sm btn-light mt-2 mr-1" onclick="return logoutSnsAccount();" style="width: 80px;">로그아웃</button>
                </form>
              </li>    
      </c:if>
      

      <c:if test="${loginMember == null}">
              <li class="nav-item">    
                  <button type="button" class="btn btn-sm btn-light mt-2 mr-1" id="login" style="width:67px;" >로그인</button>
              </li>  
            <li class="nav-item">
              <button class="btn-sm btn-primary mt-2 mr-1" onclick='location.href="${path}/member/signUp.do"' style="width:80px;">회원가입</button>
              <%-- <form action="${path}/member/signUp.do" method="post">
              </form> --%>
            </li>
            </c:if>
            
          </ul>
        </div>
      </div>
    </nav>
    
   
    <script>
      /**
      * sends a request to the specified url from a form. this will change the window location.
      * @param {string} urlMapping the path to send the post request to
      * @param {object} params the paramiters to add to the url
      * @param {string} [method=post] the method to use on the form
      */
      function mypageLoad(urlMapping, params){ var form = $("<form>");
        form.attr({"method": "POST",
                    "action" : urlMapping,
        });
        $.each(params, function(key, value){
          var input = $("<input>");
          input.attr({"type": "hidden",
          "name": key,
          "value": value,
        });
        form.append(input);
      });
      
      form.submit();
    }
      function logoutSnsAccount(){
        googleLogout();
        return true;
      }
      
      $(function(){
        $("#login").click(function(){
          $("#loginModal").modal('show');
        })

        $('.modal-dialog').draggable({
          handle: ".modal-content",
          // containment: "window",
        });

      })
      
  
    </script>
    

  <!-- </header> -->
  </header>

  <!-- bootstrap Modal : Job content -->
  <!-- Modal -->
  <div class="modal fade" id="jobmodal" tabindex="-1" role="dialog" aria-labelledby="jobmodalTitle" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" id="job-dialog" role="document"></div>
  </div>

  
  <div class="modal fade hide in" id="loginModal" tabindex="-1" role="dialog"
data-keyboard="false" data-backdrop="static" aria-labelledby="exampleModalCenterTitle"
aria-hidden="true" data-target="#LoginModalTitle">
    <div class="modal-dialog modal-80size">
        <div class="modal-content modal-80size">
           <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&#xD7;</button>
           </div>
            <div class="modal-body login-form">
				    <form action="${path}/member/login.do" method="post">
				        <h2 class="text-center">Login</h2>   
				        <div class="form-group has-error">
                  <input type="text" class="form-control" name="id" placeholder="id" required="required">
                  <input type="hidden"/>
				        </div>
						<div class="form-group">
                    <input type="password" class="form-control" name="pw" placeholder="Password" required="required">
                    <input type="hidden"/>
				        </div>
				        <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>
                    <input type="hidden"/>
				        </div>
				        <p><a href="${path}/member/sendingEmail.do">Lost your Password?</a></p>
					    <p class="text-center small">Don't have an account? <a href="${path}/member/signUp.do">Sign up here!</a></p>
				    </form>
           	 </div>
        </div>
    </div>
</div>


