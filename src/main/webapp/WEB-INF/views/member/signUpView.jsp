<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%-- jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value=""/>
</jsp:include> --%>


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
    <link href="${path}/resources/css/signUp.css" rel="stylesheet" media="all">
    
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>

<section id="content">

		 
    <div class="page-wrapper p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">회원 등록</h2>
                    <form action="${path}/member/register.do" method="POST">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">이름</label>
                                    <input class="input--style-4" type="text" name="name" id="name" placeholder="이름 2자리 이상 영문도 2자리 이상" required="required" >
                                    <input type="hidden" id="nameValue" value="F" class="이름"/>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">닉네임</label>
                                    <input class="input--style-4" type="text" name="nickname" id="nickname" placeholder="닉네임 2자리 이상 영문도 2자리 이상" required="required" >
                                    <input type="hidden" id="nicknameValue" class="닉네임"" value="F"/>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row row-space">
                            <div class="col-2">
                            	<div class="input-group">
                                    <label class="label">아이디</label>
                                    <input class="input--style-4" type="text" name="id" id="id" placeholder="아이디 영문숫자만" required="required">
                                    <input type="hidden" id="idValue" value="F" class="아이디"/>
                                </div>
                                <!--달력  -->
                                <!-- <div class="input-group">
                                    <label class="label">Birthday</label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4 js-datepicker" type="text" name="birthday">
                                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                    </div>
                                </div> -->
                            </div>
                            
                            <div class="col-2">
                            <div class="input-group">
                                    <label class="label">비밀번호</label>
                                    <input class="input--style-4" type="password" name="pw" id="pw" placeholder="비밀번호 6자리 이상"" required="required">
                                    <input type="hidden" id="pwValue" value="F" class="비밀번호"/>
                                </div>
                            
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
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">이메일</label>
                                    <input class="input--style-4" type="email" name="email" id="email" placeholder="ex) abc@abc.com">
                                    <input type="hidden" id="emailValue" value="F" class="이메일"/>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">핸드폰</label>
                                    <input class="input--style-4" type="text" name="tel" id="tel" placeholder="ex) 010-1234-5678">
                                    <input type="hidden" id="telValue" value="F" class="핸드폰"/>
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
                        <div class="row row-space">
                            <div class="col-0">
                                <div class="input-group">
                                    <label class="label">주소</label>            	
                                    <input class="input--style-4" type="text" name="addr" id="addr" placeholder="주소를 입력하세요" required="required" >
                                    <input type="hidden" id="addrValue" value="F" class="주소"/>   
                                    <!-- <input type="hidden" class="form-control" placeholder="extraAddress" id="extraAddress" name="extraAddress">
                                    <input type="hidden" class="mr-3 col-md-3 form-control" placeholder="Postcode" id="postCode" name="postCode">
                                    <input type="hidden" class="form-control" placeholder="jibunAddress" id="jibunAddress" name="jibunAddress"> -->
                                </div>
                            </div>
                            <div class="col-4">
	                            <div class="input-group">
	                              <button class="btn btn--radius-2 btn--blue pull-right" style="height:50px; margin-top: 30px; margin-left: 5px; " onclick="postCode()"><i class="fa fa-search"></i></button>                    
	                            </div>
                            </div>
                        </div>                   
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
                            <button class="btn btn--radius-2 btn--blue pull-left" type="button" onclick="register()">가입</button>
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

// 주소 검색
function postCode()
{
	daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                var addr = data.roadAddress;
                document.getElementById("addr").value = addr;
            }
        }).open();
    });		
}


$("#tel").keyup(function(e){
    var inputTel = $(this);
    // 010-1234-1234
    console.log(inputTel);
    console.log(inputTel.val().length);
    var text = "-";

    // backSpace
    if(e.keyCode == 8)
        return;

    if(inputTel.val().length < 11)
    {
        if(inputTel.val().length == 3)
        {
            inputTel.val(inputTel.val()+text);
        }else if(inputTel.val().length == 8)
        {
            inputTel.val(inputTel.val()+text);
        }
    }
});



// 가입 버튼 이벤트
function register()
{
	var form = $("form");
	var msg = $("#msg");
    var text = "";
    var inputValue = new Array();
    inputValue.push("name", "nickname","id","pw","email","tel","addr");

    // for(var i = 0; i < inputValue.length; i++)
    //     console.log(inputValue[i]);
    

    if( ($("#nameValue").val() == 'T') && 
        ($("#nicknameValue").val() == 'T') && 
        ($("#idValue").val() == 'T') && 
        ($("#pwValue").val() == 'T') && 
        ($("#emailValue").val() == 'T') &&
        ($("#telValue").val() == 'T') &&
        ($("#addrValue").val() == 'T') )
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
    }
}


// 정규식 이름 체크
function regExpCheck(data, inputName)
{

    if(inputName == 'name' || inputName == 'nickname')
    {
        var regExp = /^[가-힣a-zA-Z]{3,20}$/;
        return ( (data !='' && data != 'undefined' && data != 'null' && data != 'NaN') && regExp.test(data) );
    }
    else if(inputName == 'email')
    {
        var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;   
        return ( (data !='' && data != 'undefined' && data != 'null' && data != 'NaN') && regExp.test(data) );
    }
    else if(inputName == 'tel')
    {
        var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
        return ( (data !='' && data != 'undefined' && data != 'null' && data != 'NaN') && regExp.test(data) );
    }
    else if(inputName == 'id')
    {
        var regExp = /^[0-9a-z]{3,15}$/;
        return ( (data !='' && data != 'undefined' && data != 'null' && data != 'NaN') && regExp.test(data) );
    }
    else if(inputName == 'pw')
    {
        var regExp =  /^[A-Za-z0-9]{6,12}$/;
        return ( (data !='' && data != 'undefined' && data != 'null' && data != 'NaN') && regExp.test(data) );
    }
    else if(inputName == 'addr')
    {
        var regExp = /^[가-힣]{4,30}||[a-zA-Z]{4,30}\s[a-zA-Z]{4,30}$/;
        return ( (data !='' && data != 'undefined' && data != 'null' && data != 'NaN') && regExp.test(data) );
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


    // 이름
   $("#name,#nickname,#id,#pw,#email,#tel,#addr").blur(function(){
        
        var inputName = $(this); // input name명
        var inputValue = $('#'+inputName.attr("name")+'Value'); // inputValue Class 명

        console.log(inputValue.attr("class") + " 여기오긴해?");
        console.log(inputName.val());
        // 비었을 경우 return
        if(inputName.val() == "null" || inputName.val() == "undefined" || inputName.val() == "NaN" || inputName.val() == '')
        {

            switch (inputName.attr("name")) {
                case 'name': 
                    inputName.attr("placeholder","이름 2자리 이상 영문도 2자리 이상");
                    inputValue.val("F");  
                    break;
                case 'nickname': 
                    inputName.attr("placeholder","닉네임 2자리 이상 영문도 2자리 이상");    
                     inputValue.val("F");
                    break;
                case 'id':
                    inputName.attr("placeholder","아이디 영문 숫자만");  
                    inputValue.val("F");
                    break;
                case 'pw': 
                    inputName.attr("placeholder","비밀번호 6자리 이상");    
                    inputValue.val("F");
                    break;
                case 'email': 
                    inputName.attr("placeholder","ex) abc@abc.com");  
                    inputValue.val("F");
                    break;
                case 'tel': 
                    inputName.attr("placeholder","ex) 010-1234-5678");
                    inputValue.val("F");
                    break;
                case 'addr': 
                    inputName.attr("placeholder","주소를 입력하세요");    
                    inputValue.val("F");
                    break;          
            }
            //console.log("비어있따");
            $("#msg").val("");

            return;
        }
        console.log(!regExpCheck(inputName.val(), inputName.attr("name")));
        console.log(inputName.val());
        console.log(inputName.attr("name"));

        if(!regExpCheck(inputName.val(), inputName.attr("name")))
        {
            //msg.val("이메일을 잘못 입력하셨습니다. 다시 입력해주세요!");
            var text = " " + inputValue.attr("class") +" 잘못 입력 하셨습니다. 다시 입력해주세요! ";
            $("#msg").val(text);
           
            //$(this).focus();
            inputValue.val("F");
            return false;
        }else{
            console.log("dfdff");
            $("#msg").val("");
            inputValue.val("T");
        }
    });

});

</script>

</section>

<!-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> -->