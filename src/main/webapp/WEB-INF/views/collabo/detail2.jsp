<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value=""/>
</jsp:include>


<!-- Popper -->
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Google material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- collabo/detail.css -->
<link href="${path }/resources/css/collabo/detail.css?ver=1.5" rel="stylesheet"/>
<!-- Noto Sans -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans&display=swap" rel="stylesheet">
<!-- Socket -->
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> 
<section class="container-fluid" id="content">
	<div class="row collabo-header" >
		<span style="font-size:18px;color:white;font-weight:bold;">대충 트렐로 메뉴</span>
		<button type="button" data-toggle="modal" data-target="#cardModal">모달테스트</button>
	</div>
	<div class="board" >
		<c:if test="${loginMember != null}">
			<c:if test="${collaboLists != null}">
				<c:forEach items="${collaboLists }" var="list">
					<div class="list-wrapper">
						<div class="list-content">
							<div class="list-header">
								<span class="list-title">
									${list.title }
								</span>
									<button type="button" class="fa fa-align-justify btn-menu" data-toggle="dropdown"></button>
									<div class="dropdown-menu">
										<div class="dropdown-item">
											<span style="text-align:center;margin-left:17px">List Actions</span>
											<hr>
											<button type="button" class="btn btn-sm btn-primary">Edit</button>
											<button type="button" onclick="requestDeleteList(this)" class="btn btn-sm btn-primary">Remove</button>
										</div>
									</div>
							</div>
						<div id="listNo_${list.listNo }" name="listNo_${list.listNo }" class="list-cards"  ondrop="requestMoveCard(this,event)" ondragover="return false;">
							<c:if test="${collaboCards != null }">
								<c:forEach items="${collaboCards }" var="card">
									<c:if test="${list.listNo == card.listNo }">
										<div id="cardNo_${card.cardNo }" name="cardNo_${card.cardNo }" class="list-card" ondrop="return false;" draggable="true" ondragstart="cardDrag(this,event)">
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
							<span onclick="requestCreateCard(this);" class="fa fa-plus btn-createCard" >Add another card</span>
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
						<span class="fa fa-plus" >Add another list</span>
					</button>
					<div class="dropdown-menu">
						<div class="dropdown-item">
							<input type="text" id="listTitle" placeholder="Input List Name"/>
							<Button class="btn-createList btn-sm btn btn-primary" type="button" name="btn_cList" onclick="requestCreateList();" >Create</Button>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		</c:if>
		<!-- END  -->
		 <!-- The Modal -->
 
</div>
  <!-- The Modal -->
  <div class="modal fade" id="cardModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h3 class="modal-title"><span class="material-icons">dvr</span>[Title]<span id="modal-title"></span></h3>
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
          				<textarea id="editContent" rows="3" cols="92"></textarea>
          				<br>
          				<button onclick="requestUpdateCard(this);"type="button" class="btn btn-sm btn-primary" style="margin-top:10px;">Update!</button>
          			</div>
          		</div>
          	</div>
          </div>
          <div style="float:right;margin-top:30px;">
	          <button id="btnEdit" class="btn btn-sm btn-primary" type="button" data-toggle="collapse" data-target="#modifyContent">edit</button>
	          <!-- <button class="btn btn-sm btn-primary" type="button">move</button> -->
	          <button id="btnDelete" class="btn btn-sm btn-primary" onclick="requestDeletCard(this);" type="button">delete</button>
          </div>
          <div style="margin-top:70px;padding:10px 2px;">
          	<h5>Comments</h5>
          	<hr>
          		<textarea id="editArea" rows="3" cols="92"></textarea>
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button name="btnModalClose" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</section>
<script>
function requestDeleteList(target){
	if(confirm("Are you Delete This List?")){
		var targetList = $(target).parent().parent().parent().parent().children(".list-cards").attr("id").substring(7);
		sendData={
			type : "list",
			method : "delete",
			collaboNo : collaboNo,
			userId : userId,
			listNo : targetList
		};
		sendMessage(sendData);
	}
}


function requestDeletCard(target){
	var isDelete = confirm("Are you delete this card?");
	if(isDelete){
		var cardNo = $("#modalCardNo").val();
		var sendData ={
			type:"card",
			method:"delete",
			userId:userId,
			collaboNo:collaboNo,
			cardNo:cardNo
		};
		sendMessage(sendData);
	}
}


function requestUpdateCard(target){
	var content = $(target).parent().children("#editContent").val();
	var cardNo = $("#modalCardNo").val();
	var sendData ={
		type:"card",
		userId:userId,
		method : "update",
		collaboNo : collaboNo,
		content : content,
		cardNo : cardNo
	};
	
	sendMessage(sendData);
}

var userId =  "${loginMember.id}";
var collaboNo = 1;
let sock = new SockJS("<c:url value="/collabo/soc"/>");
sock.onmessage = onMessage;
sock.onclose = onClose;

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
      console.log(receive);
      if(receive.type == 'list'){
    	  if(receive.method == 'create'){
    		  responseCreateList(receive);
    	  }
    	  if(receive.method == 'delete'){
    		  responseDeleteList(receive);
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
}
// 서버와 연결을 끊었을 때
function onClose(evt) {
	
}

</script>

<script>
function responseDeleteList(receive){
	
}


function responseDeleteCard(receive){
	var card = $('#cardNo_'+receive.cardNo).children('.card-content').parent();
	card.remove();
	
	var btnClose = $("button[name=btnModalClose]");
	btnClose.click();
}

function responseUpdateCard(receive){
	var card = $('#cardNo_'+receive.cardNo).children('.card-content');
	var modalCard = $("#modalContent");
	
	modalCard.text(receive.content);
	card.text(receive.content);
	
	var btnEdit = $("#btnEdit");
	btnEdit.click();
	
}

$("#modifyContent").on('show.bs.collapse',function(){
	/* var editArea = document.getElementById('edit').innerHTML = ""; */
	var editContent = $("#editContent");
	editContent.val('');
});


$("#cardModal").on('show.bs.modal',function(e){
	var data=$(e.relatedTarget).data('test');
	var cardNo = $(e.relatedTarget).data('test').substring(7);
	var card = $("#"+data);
	var title = $("#modal-title");
	var content = $("#modalContent");
	var writer = $("#modal-writer");
	$("#editArea").val('');
	
	//$("#modalCardNo").val(cardNo);
	$("#modalCardNo").val(cardNo);
	title.text(card.children('.card-content').parent().parent().parent().children('.list-header').children('.list-title').text());
	content.text(card.children('.card-content').text());
	 
	<c:forEach items="${collaboMembers}" var="m">
		if(${m.no} == (parseInt(card.children('input[name=cardWriter]').val()))){
			writer.text("${m.nickname}");
		}
	</c:forEach>
});

function createWrapper(ele){
	var wrapper=$("<div/>");
	wrapper.attr("class","list-wrapper");
	
	var content=$("<div/>");
	content.attr("class","list-content");
	
	var dropdiv=$("<div/>");
	dropdiv.attr("class","dropdown div-drop");
	
	var btndrop=$("<button/>");
	btndrop.attr("class","dropdown btn-addList");
	btndrop.attr("type","button");
	btndrop.attr("onclick",'$("#listTitle").val(" ");');
	btndrop.attr("name","btn_addList");
	btndrop.attr("data-toggle","dropdown");
	
	var faplus =$("<span/>");
	faplus.text("Add another list");
	faplus.attr("class","fa fa-plus");
	
	btndrop.append(faplus);
	dropdiv.append(btndrop);
	
	var dropmenu=$("<div/>");
	dropmenu.attr("class","dropdown-menu");
	dropdiv.append(dropmenu);
	
	var listTitle = $("<input/>");
	listTitle.attr("type","text");
	listTitle.attr("id","listTitle");
	listTitle.attr("placeholder","Input List Name");
	
	
	var btncList = $("<button/>");
	btncList.text("Create");
	btncList.attr("class","btn btn-sm btn-primary");
	btncList.attr("type","button");
	btncList.attr("name","btn_cList");
	btncList.attr("onclick","requestCreateList();");
	

	var dropItem=$("<div/>");
	dropItem.attr("class","dropdown-item");
	
	dropItem.append(listTitle);
	dropItem.append(btncList);
	
	dropmenu.append(dropItem);
	
	content.append(dropdiv);
	
	wrapper.append(content);
	
	
	console.log(ele);
	ele.append(wrapper);
}



function responseCreateCard(receive){
	var listCards = $('div[name=listNo_'+receive.listNo+']');
	
	
	var card = $('<div/>');
	var content = $('<span/>');
	var button = $("<span/>");
	button.attr("class",'material-icons btn-edit');
	button.attr("data-toggle","modal");
	button.attr("data-test","cardNo_"+receive.cardNo);
	button.attr("data-target","#cardModal");
	button.text("edit");
	
	
	
	content.text(receive.content);
	
	card.attr("class","list-card");
	card.attr("ondrop","return false");
	card.attr("draggable","true");
	card.attr("ondragstart","cardDrag(this,event)");
	card.attr("id","cardNo_"+receive.cardNo);
	card.attr("name","cardNo_"+receive.cardNo);
	
	content.attr("class","card-content");
	
	card.append(content);
	card.append(button);
	listCards.append(card);
}
function requestCreateCard(ele){
	var content = prompt("Card's Title ? ");
	var listNo = parseInt($(ele).parent().parent().children('.list-cards').attr('id').substring(7));
	if(content!=''){
		var sendData = {
				type : "card",
				method : "create",
				content : content,
				userId : userId,
				collaboNo : collaboNo,
				listNo : listNo
		};
		sendMessage(sendData);
	}
}

function requestCreateList(){
	var listTitle= $("#listTitle").val();
	if(listTitle!=''){
	
		var sendData = {
			type : "list",
			method : "create",
			content : listTitle,
			userId : userId,
			collaboNo : collaboNo
		};
		sendMessage(sendData);
	}
}

function responseCreateList(receive){
		var content = $("button[name=btn_cList]").parent().parent().parent();
		var board = $("button[name=btn_cList]").parent().parent().parent().parent().parent().parent();
		console.log(board);
		content.empty();
		
		var listHeader = $('<div/>');
		listHeader.attr("class","list-header");
		
		var listTitle = $('<span/>');
		listTitle.attr("class","list-title");
		listTitle.text(receive.content);
	
		var btnMenu = $('<button>');
		btnMenu.attr("type","button");
		btnMenu.attr("class","fa fa-align-justify btn-menu");
		
		
		var listCards = $('<div/>');
		listCards.attr("class","list-cards");
		listCards.attr("ondrop","requestMoveCard(this,event)");
		listCards.attr("ondragover","return false;");
		listCards.attr("name","listNo_"+receive.listNo);
		listCards.attr("id","listNo_"+receive.listNo);
		
		
		var openCard = $('<div/>');
		openCard.attr("class","open-card");
	
		var faplus = $('<span/>');
		faplus.text("Add another card");
		faplus.attr("onclick","requestCreateCard(this);");
		faplus.attr("class","fa fa-plus");
	
		openCard.append(faplus);
		
		listHeader.append(listTitle);
		listHeader.append(btnMenu);
		
		content.append(listHeader);
		content.append(listCards);
		content.append(openCard);
		
		createWrapper(board);
	
}
function requestMoveCard(element, ev){
	var cardNo = parseInt(ev.dataTransfer.getData("text").substring(7));
	var listNo = parseInt(element.id.substring(7));
	var sendData = {
			type : "card",
			method : "move",
			userId : userId,
			collaboNo : collaboNo,
			cardNo : cardNo,
			listNo : listNo
	};
	sendMessage(sendData);
}

function responseMoveCard(receive){
	var listNo = receive.listNo+"";
	var cardNo = receive.cardNo+"";
	
	/* $("#listNo").append(document.getElementById(cardNo)); */
	document.getElementById("listNo_"+listNo).appendChild(document.getElementById("cardNo_"+cardNo));
}

function allowDrop(ev) {
	  ev.preventDefault();
	}

function cardDrag(element, ev) {
  ev.dataTransfer.setData("text",element.id);
}


function cardDrop(element, ev) {
	 var id = ev.dataTransfer.getData("text");
	 console.log(id + " -> " + element.id);
	 element.appendChild(document.getElementById(id));
	 ev.preventDefault();
}
</script>
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> 
 --%>