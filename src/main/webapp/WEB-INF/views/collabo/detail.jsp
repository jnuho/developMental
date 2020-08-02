<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="${path }/resources/js/detail.js" type="text/javascript"></script>

<!-- Google material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- collabo/detail.css -->
<link href="${path }/resources/css/collabo/detail.css?ver=1.5" rel="stylesheet"/>
<!-- Noto Sans -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans&display=swap" rel="stylesheet">
<!-- Socket -->
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<!-- bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.js"></script>

<section class="container-fluid" id="content">
	<div class="row collabo-header" >
		<div style="width:200px">
			<span style="font-size:18px;color:white;font-weight:bold;">${collaboTool.title }</span>
		</div>
		<div>
			<c:if test="${collaboTool.owner eq loginMember.no }">
				<button style="margin-right:5px;border-radius:8px" class="btn btn-sm btn-primary" type="button" data-toggle="modal" data-target="#inviteModal">초대</button>
				<button style="border-radius:8px;margin-right:5px"class="btn btn-sm btn-primary" type="button" data-toggle="modal" data-target="#expulsionModal">추방</button>
				<button style="border-radius:8px;margin-right:5px"class="btn btn-sm btn-secondary" type="button" data-toggle="modal" data-target="#teamworkDeleteModal">팀워크 삭제</button>
			</c:if>
			<button type="button" class="btn btn-sm btn-primary" style="margin-right:5px;border-radius:8px" onclick="exitCollabo('${loginMember.no}')">탈퇴</button>
		</div>
		
	</div>
	<div class="board" >
		<c:if test="${loginMember != null}">
			<c:if test="${collaboLists != null}">
				<c:forEach items="${collaboLists }" var="list">
					<div class="list-wrapper" ondrop="requestMoveList(this,event)" ondragover="return false;">
						<div class="list-content" draggable="true" ondrop="return false" ondragstart="listDrag(this,event)" ondragend="endListDrag()">
							<div class="list-header">
								<span class="list-title">
									${list.title }
								</span>
									<button type="button" class="fa fa-align-justify btn-menu" data-toggle="dropdown"></button>
									<div class="dropdown-menu">
										<div class="dropdown-item">
											<span style="text-align:center;margin-left:17px">리스트 메뉴</span>
											<hr>
											<div style="text-align:center;">
												<button type="button" onclick="requestUpdateList(this)" class="btn btn-sm btn-primary">수정</button>
												<button type="button" onclick="requestDeleteList(this)" class="btn btn-sm btn-primary">삭제</button>
											</div>
										</div>
								    </div>
							</div>
						<div id="listNo_${list.listNo }" name="listNo_${list.listNo }" class="list-cards"  ondrop="requestMoveCard(this,event)" ondragover="return false;">
							<c:if test="${collaboCards != null }">
								<c:forEach items="${collaboCards }" var="card">
									<c:if test="${list.listNo == card.listNo }">
										<div id="cardNo_${card.cardNo }" name="cardNo_${card.cardNo }" class="list-card" ondrop="return false;" draggable="true" ondragstart="cardDrag(this,event)" ondragend="endCardDrag()">
											<span class="card-content">
												${card.content }
											</span>
											<input type="hidden" name="cardWriter" value="${card.writer }"/>
											<span data-toggle="modal" data-test="cardNo_${card.cardNo }" data-target="#cardModal" class="material-icons btn-edit">edit</span>
										</div>
									</c:if>
								</c:forEach>
							</c:if>
						</div>
						<div class="open-card" >
							<span onclick="requestCreateCard(this);" class="fa fa-plus btn-createCard" >카드 생성</span>
						</div>
					</div>
				</div> 
				</c:forEach>
			</c:if>
		
				
		
		<!-- Add another list -->
		<div class="list-wrapper" >
			<div class="list-content" >
			
				<div class="dropdown div-drop" >
					<button class="dropdown btn-addList" type="button" onclick='$("#listTitle").val(" ");' name="btn_addList"  data-toggle="dropdown" >
						<span class="fa fa-plus" >리스트 생성</span>
					</button>
					<div class="dropdown-menu">
						<div class="dropdown-item">
							<input type="text" id="listTitle" placeholder="Input List Name"/>
							<Button class="btn-createList btn-sm btn btn-primary" type="button" name="btn_cList" onclick="requestCreateList();" >생성</Button>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		</c:if>
		<!-- END  -->
		 <!-- The Modal -->
 
</div>
<!-- Invite Modal -->
<div class="modal fade" id="inviteModal">
	<div class="modal-dialog" style="width:450px;">
		<div class="modal-content">
			<div class="modal-header">
			  <h3 class="modal-title"><span class="material-icons">input</span>[팀워크 초대]<span id="modal-title"></span></h3>
       	 	  <button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
			<hr/>
				<div class="ui-widget">
					<label for="userId">ID : </label>
					<input type="text" id="userId" autocomplete="off" />
					<img id="userProfile"/>
				</div>
			</div>
			<div class="modal-footer">
			   <button name="btnModalClose" type="button" class="btn btn-primary" onclick="requestInvite()">초대</button>
			   <button name="btnModalClose" type="button" class="btn btn-secondary" data-dismiss="modal">나가기</button>
			</div>		
		</div>
	</div>
</div>

<!-- Teamwork Delete Modal -->
<div class="modal fade" id="teamworkDeleteModal">
	<div class="modal-dialog" style="width:450px;">
		<div class="modal-content">
			<div class="modal-header">
			  <h3 class="modal-title"><span class="material-icons">cancel</span>[팀워크 삭제]<span id="modal-title"></span></h3>
       	 	  <button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
			<hr/>
				<div class="ui-widget">
					<label for="validate">확인 : </label>
					<input type="text" id="validate" autocomplete="off" placeholder='삭제하겠습니다' />
				</div>
			</div>
			<div class="modal-footer">
			   <button type="button" class="btn btn-primary" onclick="requestDeleteTeamwork()">삭제</button>
			   <button name="btnModalClose" type="button" class="btn btn-secondary" data-dismiss="modal">나가기</button>
			</div>		
		</div>
	</div>
</div>


<!-- 추방 Modal -->
<div class="modal fade" id="expulsionModal">
	<div class="modal-dialog" style="width:450px;">
		<div class="modal-content">
			<div class="modal-header">
			  <h3 class="modal-title"><span class="material-icons">input</span>[팀워크 추방]<span id="modal-title"></span></h3>
       	 	  <button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
			<hr/>
				<div class="ui-widget">
					<label for="ExpulsionUserId">ID : </label>
					<input type="text" id="expulsionUserId" autocomplete="off" />
					<img id="userProfile"/>
				</div>
			</div>
			<div class="modal-footer">
			   <button name="btnModalClose" type="button" class="btn btn-primary" onclick="requestExpulsion()">추방</button>
			   <button name="btnModalClose" type="button" class="btn btn-secondary" data-dismiss="modal">나가기</button>
			</div>		
		</div>
	</div>
</div>



  <!-- CardModal -->
  <div class="modal fade" id="cardModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h3 class="modal-title"><span class="material-icons">dvr</span>[List]<span id="mtitle"></span></h3>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
      <h4>[Writer]<span id="modal-writer"></span></h4>
      <input type="hidden" id="modalCardNo" value=""/>
        <hr>
          <div class="panel-group">
          	<div class="panel panel-default">
          		<div class="panel-heading">
          			<h5 class="panel-title">
          				<span id="modalContent"></span>
          			</h5>
          		</div>
          		<div id="modifyContent" class="panel-collapse collapse">
          			<div class="panel-body">
          				<textarea id="editContent" rows="3" style="width:-webkit-fill-available"></textarea>
          				<br>
          				<button onclick="requestUpdateCard(this);"type="button" class="btn btn-sm btn-primary" style="margin-top:10px;">수정!</button>
          			</div>
          		</div>
          	</div>
          </div>
          <div style="float:right;margin-top:30px;">
	          <button id="btnEdit" class="btn btn-sm btn-primary" type="button" data-toggle="collapse" data-target="#modifyContent">수정</button>
	          <!-- <button class="btn btn-sm btn-primary" type="button">move</button> -->
	          <button id="btnDelete" class="btn btn-sm btn-primary" onclick="requestDeletCard(this);" type="button">삭제</button>
          </div>
          <div style="margin-top:70px;padding:10px 2px;">
          	<h5>댓글</h5>
          	<hr>
          	<div id="commentArea">
          		
          	</div>
          		<textarea id="editArea" rows="3" cols="86" style="margin-top:10px"></textarea>
          		<button type="button" class="btn btn-sm btn-primary" onclick="requestCommentWrite(this);" id="btnComment">덧글작성</button>
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button name="btnModalClose" type="button" class="btn btn-secondary" data-dismiss="modal">나가기</button>
        </div>
        
      </div>
    </div>
  </div>

<div class="wrap-loading display-none">
    <div><img src="${path }/resources/images/loder.gif" /></div>
</div>

</section>
<style>
.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
    position: fixed;
    left:0;
    right:0;
    top:0;
    bottom:0;
    background: rgba(0,0,0,0.2); /*not in ie */
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
}

    .wrap-loading div{ /*로딩 이미지*/
        position: fixed;
        top:50%;
        left:50%;
        margin-left: -21px;
        margin-top: -21px;
    }
    .display-none{ /*감추기*/
        display:none;
    }
    
    .ui-autocomplete{
    	max-height:400px;
    	overflow-y:auto;
    	overflow-x:hidden;
    }

</style>
<script>
isCardModalOpen = false;

function requestExpulsion(){
	var userId = $("#expulsionUserId").val();
		if(userId!=''){
			$.ajax({
				type : "post",
				url : "${path}/collabo/expulsionMember",
				dataType : "json",
				data : {
					userId : userId,
					collaboNo : collaboNo
				},
				success : function(data){
					if(data){
						alert('추방하였습니다.');
					}
					else{
						alert('추방 실패!');
					}
				},
				beforeSend:function(){
					$('.wrap-loading').removeClass('display-none');
				},
				complete:function(){
					$('.wrap-loading').addClass('display-none');
				}
			});
		}
}

$("#expulsionModal").on("show.bs.modal",function(){
	$("#expulsionUserId").autocomplete("option","appendTo","#expulsionModal");
})


$("#inviteModal").on("show.bs.modal",function(){
	$("#userId").autocomplete("option", "appendTo", "#inviteModal");
});


var userId =  "${loginMember.id}";
var collaboNo = ${collaboNo};
let sock = new SockJS("<c:url value="/collabo/soc"/>");
sock.onmessage = onMessage;
sock.onclose = onClose;

if(userId == ""){
	history.back();
}

sock.onopen = function(){
	var sendData ={
		type : "connect",
		userId : userId,
		collaboNo : collaboNo
	};
	sendMessage(sendData);
}


// 메시지 전송
function sendMessage(sendData) {
/* 	var sendData = {
		type : type,
		userId : userId,
		method : method,
		collaboNo : collaboNo,
		content : content,
		listNo : listNo,
		cardNo : cardNo
	}; */
	var jsonData = JSON.stringify(sendData);
    sock.send(jsonData);
}

// 서버로부터 메시지를 받았을 때
function onMessage(msg) {
      var receive = JSON.parse(msg.data);
      if(receive.type == 'reply'){
    	  if(receive.method == 'write'){
    		  responseReplyWrite(receive);
    	  }
    	  if(receive.method == 'delete'){
    		  responseReplyDelete(receive);
    	  }
    	  if(receive.method == 'update'){
    		  responseReplyUpdate(receive);
    	  }
      }
      if(receive.type == 'comment'){
    	  if(receive.method == 'write'){
    		  responseCommentWrite(receive);
    	  }
    	  if(receive.method == 'delete'){
    		  responseDeleteComment(receive);
    	  }
    	  if(receive.method == 'update'){
    		  responseUpdateComment(receive);
    	  }
      }
      if(receive.type == 'list'){
    	  if(receive.method == 'create'){
    		  responseCreateList(receive);
    	  }
    	  if(receive.method == 'delete'){
    		  responseDeleteList(receive);
    	  }
    	  if(receive.method == 'update'){
    		  responseUpdateList(receive);
    	  }
        if(receive.method == 'move'){
          responseMoveList(receive);
        }
      }
      if(receive.type== 'card'){
    	  if(receive.method == 'create'){
    		  responseCreateCard(receive);
    	  }
    	  if(receive.method == 'move'){
    		  responseMoveCard(receive);
    	  }
    	  if(receive.method == 'update'){
    		  responseUpdateCard(receive);
    	  }
    	  if(receive.method == 'delete'){
			  responseDeleteCard(receive);
    	  }
      }
      if(receive.type == 'collabo'){
    	  if(receive.method == 'delete'){
    		  responseDeleteTeamwork();
    	  }
      }
}
// 서버와 연결을 끊었을 때
function onClose(evt) {
	
}

$("#expulsionModal").on('hide.bs.modal',function(e){
	$("#expulsionUserId").val('');
});

$("#inviteModal").on('hide.bs.modal',function(e){
	$("#userId").val('');
});

$("#modifyContent").on('show.bs.collapse',function(){
	var editContent = $("#editContent");
	editContent.val('');
});
 $("#cardModal").on('hide.bs.modal',function(e){
	$("#modifyContent").collapse('hide');
	isCardModalOpen = false;
});

$("#cardModal").on('show.bs.modal',function(e){
	isCardModalOpen = true;
	var data=$(e.relatedTarget).data('test');
	var cardNo = $(e.relatedTarget).data('test').substring(7);
	var card = $("#"+data);
	var title = $("#mtitle");
	var content = $("#modalContent");
	var writer = $("#modal-writer");
	$("#editArea").val('');
	
	$("#modalCardNo").val(cardNo);
	title.text(card.children('.card-content').parent().parent().parent().children('.list-header').children('.list-title').text().trim()); 
	content.text(card.children('.card-content').text());
	
	var writerNo = card.children('input[name=cardWriter]').val();
	collaboMembers.some(function(m){
		if(writerNo == m.no){
			writer.text(m.nickname);
			return true;
		}
	});
	$.ajax({
		type : "post",
		url : "${path}/collabo/requestCommentData",
		dataType : "json",
		data : {
			cardNo : cardNo
		},
		success : function(data){
			$("#commentArea").empty();
			$.each(data.comments, function(i){
				collaboMembers.some(function(v){
					if(v.no == data.comments[i].writer){
						var div = createCommentContent(v,data.comments[i],false);
						$("#commentArea").append(div);
						return true;
					}
				}) 
			});
			$.each(data.commentReply,function(r){
				collaboMembers.some(function(m){
					if(m.no == data.commentReply[r].writer){
						var target = $("#commentNo_"+data.commentReply[r].targetNo);
						var div = createReplyContent(m,data.commentReply[r],false);
						target.append(div);
						target.css("border-bottom","solid lightgrey 0.5px");
						return true;
					}
				});
			});
		},
		beforeSend:function(){
			$('.wrap-loading').removeClass('display-none');
		},
		complete:function(){
			$('.wrap-loading').addClass('display-none');
		}
	});
});

	function requestInvite(){
		var userId = $("#userId").val();
		
		if(userId!=''){
			$.ajax({
				type : "post",
				url : "${path}/collabo/inviteMember",
				dataType : "json",
				data : {
					userId : userId,
					collaboNo : collaboNo
				},
				success : function(data){
					if(data){
						alert('초대 메일을 발송했습니다.');
					}
					else{
						alert('초대 실패!');
					}
				},
				beforeSend:function(){
					$('.wrap-loading').removeClass('display-none');
				},
				complete:function(){
					$('.wrap-loading').addClass('display-none');
				}
			});
	}
}

// expulsion function
 $(function(){
	
	$("#expulsionUserId").autocomplete({
		minLength : 1,
		source : collaboMembersId,
		select : function (event, ui){
			$("#expulsionUserId").val(ui.item.value);
			return false;
		},
		focus : function (event, ui){
			$("#expulsionUserId").val(ui.item.value);
			return false;
		}
	}).autocomplete("instance")._renderItem = function(ul, item){
		var li = $("<li/>");
		var div = $("<div/>");
		var img = $("<img/>");
		var span = $("<span/>");
		
		div.css("display","flex");
		span.css("flex","1");
		
		collaboMembers.some(function(m){
			if(m.id == item.value){
				span.html(item.value+"<br/>"+m.nickname);
				
				div.append(span);
				if(!m.profile == ""){	
					img.attr("src","${path}/resources/images/"+ "teamwork.png");
					img.attr("width","40px");
					img.attr("hegiht","20px");
					div.append(img);
		  		}
				return true;
			}
		});
			
    return li.append(div).appendTo(ul);
	};
}); 


$(function(){
 	$("#userId").autocomplete({
 		minLength : 3,
		source : membersId,
		select : function (event, ui){
			$("#userId").val(ui.item.value);
			return false;
		},
		focus : function (event, ui){
			$("#userId").val(ui.item.value);
			return false;
		}
	}).autocomplete("instance")._renderItem = function( ul, item ) {
      	var li = $("<li/>");
	  	var div = $("<div/>");
	  	var span = $("<span/>");
	    var img = $("<img/>");
	    
	    div.css("display","flex");
	    span.css("flex","1");
	    
	    members.some(function(m){
	    	if(item.value == m.id){
    		  span.html(item.value+"<br/>"+m.nickname);
    		  div.append(span);
   		      if(!m.profile == ""){
   				img.attr("src","${path}/resources/images/"+ "teamwork.png");
   				img.attr("width","40px");
   				img.attr("hegiht","20px");
   				div.append(img);
    		  	}
   		      return true;
	    	}
	    })
	  
	    return li.append(div).appendTo(ul);
	}; 
});

function exitCollabo(exitMemberNo){
	if(confirm('정말 탈퇴 하시겠습니까?')){
		$.ajax({
			type : "post",
			url : "${path}/collabo/exitCollabo",
			dataType : "json",
			data : {
				userId : exitMemberNo,
				collaboNo : collaboNo
			},
			success : function(data){
				if(data){
					alert('탈퇴 성공!');
					location.href = "${path}/";
				}
				else{
					alert('탈퇴 실패!');
				}
			},
			beforeSend:function(){
				$('.wrap-loading').removeClass('display-none');
			},
			complete:function(){
				$('.wrap-loading').addClass('display-none');
			}
		});
	}
}

function requestCommentWrite(ele){
	var content = $("#editArea").val();
	if(content != ''){
		var cardNo = $("#modalCardNo").val();
		var userId = "${loginMember.id}";

		var sendData ={
			type : "comment",
			userId : userId,
			cardNo : cardNo,
			content : content,
			method : "write",
			collaboNo : collaboNo
			
		};
		sendMessage(sendData);
		$("#editArea").val('');
	}else{
		alert('내용을 입력해 주세요.');
	}
}
function responseCommentWrite(receive){
	if(isCardModalOpen){
		collaboMembers.some(function(v){
			if(v.id == receive.userId){
				receive.no = receive.commentNo;
				var div = createCommentContent(v,receive,true);
				$("#commentArea").append(div);
				return true;
			}
		});
	}
}

members = ${members};
membersId = new Array();
members.forEach(function(m){
	membersId.push(m.id);
});

collaboMembers = ${collaboMembers};
collaboMembersId = new Array();
collaboMembers.forEach(function(m){
	collaboMembersId.push(m.id);
});
function requestDeleteComment(ele){
// 	alert('댓글 삭제 기능 공사중');
// 	댓글삭제 일시 방어
	if(confirm('댓글을 삭제하시겠습니까?')){
		var commentNo = $(ele).parent().parent().attr("id").substring(10);
		var sendData ={
				type : "comment",
				userId : userId,
				method : "delete",
				commentNo : commentNo,
				collaboNo : collaboNo
			};
			sendMessage(sendData);
	}
}

function responseDeleteComment(receive){
	if(isCardModalOpen){
		$("#commentNo_"+receive.commentNo).remove();
	}
}

function parseDate(str) {
    var y = str.substr(8, 4);
    var m = str.substr(0, 2);
    var d = str.substr(4, 2);
    return new Date(y,m-1,d);
}

function responseReplyWrite(receive){
	if(isCardModalOpen){
		collaboMembers.some(function(m){
			if(m.no == receive.userId){
				
				var target = $("#commentNo_"+receive.targetNo);
				receive.no = receive.commentNo;
				var div = createReplyContent(m,receive,true);
				target.append(div);
				target.css("border-bottom","solid lightgrey 0.5px");
				return true;
			}
		});
	}
}

function requestCommentUpdate(ele){
	var content = $(ele).parent().children('textarea');
	if(!content.val() == ''){
		var commentNo = $(ele).parent().parent().attr('id').substring(13);
		var sendData = {
				type : "comment",
				method : "update",
				content : content.val(),
				commentNo : commentNo,
				collaboNo : collaboNo
		}
		sendMessage(sendData);
		content.val('');
		content.parent().parent().collapse('hide');
	}
	
}

function requestReplyWrite(ele,ev){
	var targetNo = $(ele).parent().parent().attr('id').substring(12);
	var content = $("#replyArea"+targetNo).val();
	if(!content == ''){
		var sendData = {
			collaboNo : collaboNo,
			targetNo : targetNo,
			content : content,
			userId : "${loginMember.no}",
			type : "reply",
			method : "write"
		};
		sendMessage(sendData);
		$("#replyArea"+targetNo).val('');
		$(ele).parent().parent().collapse('hide');
	}else{
		alert('내용을 입력해 주세요.');
	}
}

function responseUpdateComment(receive){
	if(isCardModalOpen){
		var contentArea = $("#commentNo_"+receive.commentNo).children('.commentArea').children('span');
		contentArea.text(receive.content);
	}
}

function createCommentEditCollapse(no){
	var commentUpdate = $("<div/>");
	commentUpdate.attr("class","panel-collapse collapse");
	commentUpdate.attr("name","commentUpdate");
	commentUpdate.attr("id","updateComment"+no);
	
	var panelBody = $("<div/>");
	panelBody.attr("class","panel-body");
	
	var UpdateTextArea = $("<textarea/>");
	UpdateTextArea.attr("id","updateCommentArea"+no);
	UpdateTextArea.attr("row","2");
	UpdateTextArea.attr("cols","86");
	
	
	var btnRequestReply = $("<button/>");
	btnRequestReply.attr("class","btn btn-sm btn-primary");
	btnRequestReply.attr("type","button");
	btnRequestReply.attr("onclick","requestCommentUpdate(this);");
	btnRequestReply.text("작성");
	
	panelBody.append(UpdateTextArea);
	panelBody.append($("<br/>"));
	panelBody.append(btnRequestReply);
	
	commentUpdate.append(panelBody);
	commentUpdate.append($("<hr/>"));
	
	return commentUpdate;
}

function createCommentContent(m,c,isResponse){
	var div = $("<div/>");
	div.attr("id","commentNo_"+c.no);
	div.css({
		"margin-bottom":"10px"
	});
	var img = $("<img/>");
	img.attr("width","30px");
	img.attr("hegiht","15px");
	if(!m.profile == ""){
		img.attr('src','${path}/resources/upload/member/'+m.profile);
	}else{
		img.attr("src","${path}/resources/images/"+ "teamwork.png");
	}
	div.append(img);
	var name = $("<span/>");
	var content = $("<div/>");
	var date = $("<span/>");
	
	var comment = $("<span/>");
	
	
	name.text(m.nickname);
	name.css("margin-right","30px");
	if(isResponse){
		date.html(new Date(parseDate(c.regdate)).format('yyyy-MM-dd')+"<br/>");
	}else{
		date.html(new Date(c.regdate).format('yyyy-MM-dd')+"<br/>");
	}
	
	date.css({
		"font-size":"13px"
	});
	comment.text(c.content);
	content.css({
		"padding":"10px 20px",
		"font-size":"16px",
		"width":"760px",
		"margin-bottom":"10px",
		"border-bottom":"solid lightgrey 0.5px",
		"display":"flex"
	});
	content.attr("class","commentArea");
	content.append(comment);
	comment.css("flex","1");
	//덧글 작성자 일시 수정,삭제버튼
	var isOwner = false;
	if(isResponse){
		collaboMembers.some(function (e){
			if(e.id == c.userId){
				c.writer = e.no;
				return true;
			}
		});
	}
	
	
	var reply = $("<button/>");
	reply.attr("type","button");
	reply.css("margin-right","3px");
	reply.attr("class","btn btn-sm btn-primary");
	reply.attr("data-toggle","collapse");
	reply.attr("data-target","#replyContent"+c.no);
	reply.attr("area-expanded","true");
	reply.text("답글");
	content.append(reply);
	
	if(c.writer == "${loginMember.no}"){
		var btnUpdate =$("<button/>");
		btnUpdate.attr("type","button");
		btnUpdate.attr("class","btn btn-sm btn-primary");
		btnUpdate.text('수정');
		btnUpdate.css("margin-right","3px");
		btnUpdate.attr("data-target","#updateComment"+c.no);
		btnUpdate.attr("data-toggle","collapse");
		btnUpdate.attr("area-expanded","true");
		content.append(btnUpdate);
		
		var btnDel = $("<button/>");
		btnDel.attr("type","button");
		btnDel.attr("class","btn btn-sm btn-secondary");
		btnDel.text("삭제");
		btnDel.css("margin-right","3px");
		btnDel.attr("onclick","requestDeleteComment(this);");
		content.append(btnDel);
		
		isOwner = true;
	}
	
	var replyContent = $("<div/>");
	replyContent.attr("class","panel-collapse collapse");
	replyContent.attr("id","replyContent"+c.no);
	replyContent.attr("name","replyWrite");
	
	var panelBody = $("<div/>");
	panelBody.attr("class","panel-body");
	
	var replyTextArea = $("<textarea/>");
	replyTextArea.attr("id","replyArea"+c.no);
	replyTextArea.attr("row","2");
	replyTextArea.attr("cols","86");
	
	
	var btnRequestReply = $("<button/>");
	btnRequestReply.attr("class","btn btn-sm btn-primary");
	btnRequestReply.attr("type","button");
	btnRequestReply.attr("onclick","requestReplyWrite(this);");
	btnRequestReply.text("작성");
	
	panelBody.append(replyTextArea);
	panelBody.append($("<br/>"));
	panelBody.append(btnRequestReply);
	
	replyContent.append(panelBody);
	replyContent.append($("<hr/>"));
	
						
	div.append(name);
	div.append(date);
	div.append(content);
	if(isOwner){
		div.append(createCommentEditCollapse(c.no));
	}
	div.append(replyContent);
	return div;
}

function createReplyContent(m,c,isResponse){
	var div = $("<div/>");
	div.attr("id","replyNo_"+c.no);
	
	var icon = $("<span/>");
	icon.attr("class","material-icons");
	icon.css("margin-left","15px");
	icon.text("subdirectory_arrow_right");
	
	var img = $("<img/>");
	img.attr('width',"30px");
	img.attr("hegiht","15px");
	if(!m.profile == ''){
		img.attr('src','${path}/resources/upload/member/'+m.profile);
	}else{
		img.attr("src","${path}/resources/images/"+ "teamwork.png");
	}
	
	var writer = $("<span/>");
	writer.css("margin-right","20px");
	writer.text(m.nickname);
	
	var regdate = $("<span/>");
	regdate.css("font-size","13px");
	if(isResponse){
		regdate.html(new Date(parseDate(c.regdate)).format('yyyy-MM-dd')+"<br/>");
	}else{
		regdate.html(new Date(c.regdate).format('yyyy-MM-dd')+"<br/>");
	}
	
	var content = $("<span/>");
	content.css('margin-left',"70px");
	content.attr("class","content");
	content.text(c.content);
	
	div.append(icon);
	div.append(img);
	div.append(writer);
	div.append(regdate);
	div.append(content);
	
	if(isResponse){
		collaboMembers.some(function (e){
			if(e.no == c.userId){
				c.writer = e.no;
				return true;
			}
		});
	}
	if(c.writer == "${loginMember.no}"){
		var btnUpdate = $("<button/>");
		btnUpdate.css({
			"font-size":"5px",
			"margin-left":"40px",
			"margin-bottom":"3px"
		});
		btnUpdate.attr("type","button");
		btnUpdate.attr("class","btn btn-sm btn-primary");
		btnUpdate.attr("onclick","requestReplyUpdate(this)");
		btnUpdate.text("수정");
		div.append(btnUpdate);
		
		var btnDel = $("<button/>");
		btnDel.css({
			"font-size":"5px",
			"margin-left":"10px",
			"margin-bottom":"3px"
		});
		btnDel.attr("type","button");
		btnDel.attr("class","btn btn-sm btn-secondary");
		btnDel.attr("onclick","requestReplyDelete(this)");
		btnDel.text("삭제");
		div.append(btnDel);
	}
	
	return div;
}

function requestReplyDelete(ele){
	if(confirm("덧글을 삭제하시겠습니까?")){
		var replyNo = $(ele).parent().attr('id').substring(8);
		var sendData = {
				commentNo : replyNo,
				collaboNo : collaboNo,
				type : "reply",
				method : "delete"
		};
		sendMessage(sendData);
	}
}

function responseReplyDelete(receive){
	if(isCardModalOpen){
		var target = $("#replyNo_"+receive.commentNo);
		target.remove();
	}
}

function requestReplyUpdate(ele){
	var content = prompt("수정할 내용을 입력하세요.");
	if(content != ''){
		var targetNo = $(ele).parent().attr('id').substring(8);
		var sendData = {
				commentNo : targetNo,
				content : content,
				collaboNo : collaboNo,
				type : "reply",
				method : "update"
		}
		sendMessage(sendData);
	}
}

function responseReplyUpdate(receive){
	if(isCardModalOpen){
		var target = $("#replyNo_"+receive.commentNo).children('.content');
		target.text(receive.content);
	}
}


function requestDeleteTeamwork(){
	var validate = $("#validate").val();
	if(validate=='삭제하겠습니다'){
		var sendData = {
			collaboNo : collaboNo,
			userId : ${loginMember.no},
			type : "collabo",
			method : "delete"
		};
		sendMessage(sendData);
	}else{
// 		$("#validate").val('잘못입력하셨습니다.');
		alert('잘못입력하셨습니다.');
	}
}

function responseDeleteTeamwork(){
	alert("팀워크가 삭제되었습니다.");
	location.href = '${path}/';
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
