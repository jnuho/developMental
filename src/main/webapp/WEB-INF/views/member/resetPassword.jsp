<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>



<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Au Register Forms by Colorlib</title>

    <!-- Icons font CSS-->
    <link href="${path}/resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="${path}/resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="${path}/resources/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="${path}/resources/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="${path}/resources/css/resetPassword.css" rel="stylesheet" media="all">
    <link href="${path}/resources/css/avatar.css" rel="stylesheet" media="all">
    
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>

<section id="content">

		 
    <div class="page-wrapper p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                   <h2 class="title">비밀번호 변경</h2> 
	              
                <form action="${path}/member/resetPasswordEnd.do" method="POST">
                        <!-- <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">이름</label>
                                    <input class="input--style-4" type="text" name="name" placeholder="이름 2자리 이상 영문도 2자리 이상" required="required" >
                                    <input type="hidden" id="nameValue" value="F" class="이름"/>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">닉네임</label>
                                    <input class="input--style-4" type="text" name="nickname" placeholder="닉네임 2자리 이상 영문도 2자리 이상" required="required" >
                                    <input type="hidden" id="nicknameValue" class="닉네임"" value="F"/>
                                </div>
                            </div>
                        </div> -->
                        
                        <!-- <div class="row row-space">
                            <div class="col-2">
                            	<div class="input-group">
                                    <label class="label">아이디</label>
                                    <input class="input--style-4" type="text" name="id" placeholder="아이디 영문숫자만" required="required">
                                    <input type="hidden" id="idValue" value="F" class="아이디"/>
                                </div> -->
                                <!--달력  -->
                                <!-- <div class="input-group">
                                    <label class="label">Birthday</label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4 js-datepicker" type="text" name="birthday">
                                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                    </div>
                                </div> -->
                           <!--  </div>
                            
                            <div class="col-2">
                            <div class="input-group">
                                    <label class="label">비밀번호</label>
                                    <input class="input--style-4" type="text" name="pw" placeholder="비밀번호 6자리 이상"" required="required">
                                    <input type="hidden" id="pwValue" value="F" class="비밀번호"/>
                                </div> -->
                            
                            <!-- 성별 -->
                                <!-- <div class="input-group">
                                    <label class="label">Gender</label>
                                    <div class="p-t-10">
                                        <label class="radio-container m-r-45">Male
                                            <input type="radio" checked="checked" name="gender">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">Female
                                            <input type="radio" name="gender">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div> -->
                            <!-- </div> -->
                       <!--  </div> -->
                        <div class="row row-space">
                            <div class="col-1">
                                <div class="input-group">
                                    <label class="label">비밀번호</label>
                                    <input class="input--style-4" type="password" name="pw" id="pw" placeholder="비밀번호 6자리 이상">
                                    <input type="hidden" id="pwValue" value="F" class="비밀번호"/>
                                </div>
                            </div>
                            <div class="col-1">
                                <div class="input-group">
                                    <label class="label">비밀번호 확인</label>
                                    <input class="input--style-4" type="password" name="pw2" id="pw2" placeholder="비밀번호 6자리 이상">
                                    <input type="hidden" id="pw2Value" value="F" class="비밀번호"/>
                                    <input class="input--style-4" type="hidden" name="email" id="email" value="${param.toemail}" />
                                </div>
                            </div>
                        </div>
                         <!-- <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <input class="input--style-4" type="email" name="email">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Phone Number</label>
                                    <input class="input--style-4" type="text" name="phone">
                                </div>
                            </div>
                        </div> -->
                       <!--  <div class="row row-space">
                            <div class="col-0">
                                <div class="input-group">
                                    <label class="label">주소</label>            	
                                    <input class="input--style-4" type="text" name="addr" id="roadAddress" placeholder="주소를 입력하세요" required="required" >
                                    <input type="hidden" id="addrValue" value="F" class="주소"/>   
                                    <input type="hidden" class="form-control" placeholder="extraAddress" id="extraAddress" name="extraAddress">
                                    <input type="hidden" class="mr-3 col-md-3 form-control" placeholder="Postcode" id="postCode" name="postCode">
                                    <input type="hidden" class="form-control" placeholder="jibunAddress" id="jibunAddress" name="jibunAddress">
                                </div>
                            </div>
                            <div class="col-4">
	                            <div class="input-group">
	                              <button class="btn btn--radius-2 btn--blue pull-right" style="height:50px; margin-top: 30px; margin-left: 5px; " onclick="postCode()"><i class="fa fa-search"></i></button>                    
	                            </div>
                            </div>
                        </div> -->                   
                        <!-- selector -->
                       <!--  <div class="input-group">
                            <label class="label">Subject</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="subject">
                                    <option disabled="disabled" selected="selected">Choose option</option>
                                    <option>Subject 1</option>
                                    <option>Subject 2</option>
                                    <option>Subject 3</option>
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div> -->
                         <div class="row row-space">
                            <div class="col-0">
                                <div class="input-group">
                                    <label class="label"><input type="text" id="msg" style="color: red" value="" readonly/></label>
                                </div>
                            </div>
                         </div>  
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue pull-left" type="button" onclick="resetPassword()">변경</button>
                            <button class="btn btn--radius-2 btn--blue pull-right" type="button" onclick="location.href='${path}/member/mainPage.do'">취소</button>
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
/* $("#roadAddress").focus(function(){
	var roadAddress = $("#roadAddress");
	if(roadAddress.val() == Nan)
	{	
		execdaumPostcode();
	}
}) */



// 가입 버튼 이벤트
function resetPassword()
{
	var form = $("form");
	var msg = $("#msg");
    var text = "";
    var inputValue = new Array();
    inputValue.push("pw","pw2");

    // for(var i = 0; i < inputValue.length; i++)
    //     console.log(inputValue[i]);
    

    if( ($("#pwValue").val() == 'T') && 
        ($("#pw2Value").val() == 'T') )
    {
        form.submit();
    }
    else
    {
       for(var i = 0; i < inputValue.length; i++)
       {
           var data = $('#'+inputValue[i]+'Value');
           if(data.val() == 'F')
           {            
                text += data.attr("class")+ " ";
           }
       }
       msg.val(text+"를 잘못 입력 하셨습니다. 다시 입력해주세요!");
       console.log($("#email").val());
    }
	
}


// 정규식 이름 체크
function regExpCheck(data, inputName)
{
    if(inputName == 'pw' || inputName == 'pw2')
    {
        var regExp =  /^[A-Za-z0-9]{6,12}$/;
        return ( data !='' && data != 'undefined' && regExp.test(data) );
    }
    
}

// 정규식 이메일 체크
// function emailCheck(email)
// {
//     var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;   
//     return ( email !='' && email != 'undefined' && regExp.test(email) );
// }



// 이름 이메일 등 정규식 표현이 맞거나 틀리면 이벤트 발생
$(document).ready(function()
{
    //var msg = $("#msg").val();

    $("input").focus(function(){
        var inputName = $(this);
        inputName.attr("placeholder","");
    });

    $("#pw2").keyup(function(){

        var inputPassword = $("#pw").val();
        var inputPassword2 = $("#pw2").val();

        if(inputPassword == inputPassword2)
        {
            $("#msg").val("두 비밀번호가 같습니다.")
        }
        else{
            $("#msg").val("두 비밀번호가 같지 않습니다.")
        }
    })


    // 이름
   $("input#pw, input#pw2").blur(function(){
        
        var inputName = $(this); // input name명
       
        var inputValue = $('#'+inputName.attr("name")+'Value'); // inputValue Class 명

        
        console.log(inputName);
        console.log(inputValue.attr("class") + " 여기오긴해?");
        console.log(inputName.val());
        // 비었을 경우 return
        if(inputName.val() == "null" || inputName.val() == "undefined" || inputName.val() == "NaN" || inputName.val() == '')
        {

            switch (inputName.attr("name")) {
                case 'password': inputName.attr("placeholder","비밀번호 6자리 이상");    
                    break;
                case 'password2':  inputName.attr("placeholder","비밀번호 6자리 이상");    
                    break;  
            }
            //console.log("비어있따");
            return;
        }

        if(!regExpCheck(inputName.val(), inputName.attr("name")))
        {
            //msg.val("이메일을 잘못 입력하셨습니다. 다시 입력해주세요!");
            var text = " " + inputValue.attr("class") +" 잘못 입력 하셨습니다. 다시 입력해주세요! ";
            $("#msg").val(text);
           
            //$(this).focus();
            inputValue.val("F");
            return false;
        }else{
            inputValue.val("T");
        }
    });

});

</script>

</section>

<!-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> -->