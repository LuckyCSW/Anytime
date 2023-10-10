<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<title>애니타임</title>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/submenu.jsp" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/common.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/common.partial.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/container.article.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/container.community.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/container.modal.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/modal.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/post/postlist.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/post/postwrite.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/post/write.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/post/board.index.js"></script> --%>

</head>

<body>

	<div id="container" class="article">
<!-- 		<input type="hidden" id="isUser" value="1"> 
		<input type="hidden" id="boardId" value="385967">
		<input type="hidden" id="board_id" value="2"> -->
		
		<%-------------------------------- ▼제목▼ --------------------------------%> 
		<c:forEach items="${boardname}" var="b">
		    <c:set var="boardName" value="${b.NAME}" />
		    <c:set var="boardContent" value="${b.CONTENT}" />
		</c:forEach>
		 <div class="wrap title">
			
		 		<ol class="buttons" id="boardmanager" style="display: none;">
		 			<li>
		 				<a id="manageMoim">관리하기</a>
		 			</li>
		 		</ol>

			<h1>
				<c:choose>
					<c:when test="${allsearchcheck == 0}">
						<a href="list?board_id=${board_id}">${boardName}</a>
					</c:when>
					<c:when test="${allsearchcheck == 1}">
				'${search_word}'에 대한 검색 결과입니다.
				</c:when>
				</c:choose>
			</h1>
			
			<!-- 보드 설명이 있을때 출력 -->
			<c:if test="${boardContent != '없음'}">
			<p id="boardcontent">${boardContent}</p>
			</c:if>
			
			<hr>
		</div>
		
		<%-------------------------------- ▼글쓰기▼ --------------------------------%>
			<div id="board_id" style="display: none;"><%= session.getAttribute("board_id") %></div>
			<div id="user_id" style="display: none;"><%= session.getAttribute("user_id") %></div>
			<div class="wrap articles" id="writeBoardContainer">
			<c:if test="${allsearchcheck == 0}">	<!-- 천제 검색이 아닐 경우 -->
			<label class="postwriteform"> <!-- style="display: none;" -->
				     <%-- <jsp:include page="postlist_write.jsp" /> --%>  
			</label>	
			<a id="writeArticleButton">새 글을 작성해주세요! 
			<img src="${pageContext.request.contextPath}/resources/image/post/write.button.png">
			
			</a>
			</c:if>
		
		
		<%-------------------------------- ▼테스트 게시물 출력▼ --------------------------------%>
		
		<c:choose>
       	<c:when test="${allsearchcheck == 0}">	
		<c:forEach var="post" items="${postlist}">
         	<article>
         		<a class="article" href="detail?post_id=${post.POST_ID}">
         			<h2 class="medium">${post.SUBJECT}</h2>
         			<p class="small">${post.CONTENT}</p> 
         			
         			<time class="small">${post.POST_DATE}</time>
					<h3 class="small">${post.NICKNAME}</h3>
			<ul class="status">
			
				<c:set var="fileCount" value="0" />
               <%--  <c:forEach var="file" items="${post.POST_FILE.split(',')}">
                    <!-- 파일이 존재하면 fileCount 증가 -->
                    <c:if test="${not empty file}">
                        <c:set var="fileCount" value="${fileCount + 1}" />
                    </c:if>
                </c:forEach> --%>
                <li class="attach">${fileCount}</li>
                
				<li title="공감" class="vote">${post.LIKE_COUNT}</li>
				<li title="댓글" class="comment">${post.COMMENT_COUNT}</li>
			</ul>
			<hr>
			</a>
				<div class="comments"></div>
         	</article>
      	</c:forEach>
      	</c:when>




		<c:when test="${allsearchcheck == 1}">
      	<c:forEach var="post" items="${postlist}">
			<article>
				<a class="article" href="detail?post_id=${post.POST_ID}">
				<img src="https://cf-fpi.everytime.kr/0.png" class="picture medium">
				<h3 class="medium">${post.NICKNAME}</h3> 
				<time class="medium">${post.POST_DATE}</time>
				<hr>
				<h2 class="medium bold">${post.SUBJECT}</h2>
				<p class="medium">
					${post.CONTENT}<br>
				</p>
				<a href="list?board_num=1" class="boardname" style="padding-left:15px; padding-bottom:10px;">${post.BOARDNAME}</a>
				<ul class="status" style="padding-right:15px; padding-bottom:10px;">
					<li class="attach">${fileCount}</li>
					<li title="공감" class="vote">${post.LIKE_COUNT}</li>
					<li title="댓글" class="comment">${post.COMMENT_COUNT}</li>
				</ul>
				
				<hr> <input type="hidden" name="311145444_comment_anonym" value="0">
				</a>
				<div class="comments"></div>
			</article>
			</c:forEach>
      	</c:when>
      	</c:choose> 
<%--  	
		------------------------------ ▼제목▼ ------------------------------ 
		
		 <div class="wrap title">
			<h1>
				<c:choose>
					<c:when test="${allsearchcheck == 0}">
						<a href="PostList.bo?board_num=${board_num}">${board_name}</a>
					</c:when>
					<c:when test="${allsearchcheck == 1}">
				'${search_word}'에 대한 검색 결과입니다.
				</c:when>
				</c:choose>
			</h1>
			<hr>
		</div>
		
		------------------------------ ▼글쓰기▼ ------------------------------
			
			<div class="wrap articles">
			<c:if test="${allsearchcheck == 0}">	<!-- 천제 검색이 아닐 경우 -->
			<label class="postwriteform" style="display: none;">
				<jsp:include page="postlist_write.jsp" />
			</label>	
			<a id="writeArticleButton">새 글을 작성해주세요! 
			<img src="/Anytime/image/boardlist/write.button.png">

			</a>
			</c:if>
		
		
	
		------------------------------ ▼게시물▼ 메인검색 아닐떄, ------------------------------
		
		<c:choose>
       	<c:when test="${allsearchcheck == 0}">
      	<c:forEach var="post" items="${postlist}">
         	<article>
         		<a class="article" href="PostDetailAction.bo?post_num=${post.post_id}">
         			<h2 class="medium">${post.subject}</h2>
         			<p class="small">${post.content}</p> 
         			<c:if test="${allsearchcheck == 1}"><a class="boardname">${post.boardname}</a></c:if>	<!-- 전체검색일시 보드네임 추가 -->
         			<time class="small">${post.post_date}</time>
					<h3 class="small">${post.nickname}</h3>
			<ul class="status">
				<li class="attach">${post.post_file}</li>
				<li title="공감" class="vote">${post.like_count}</li>
				<li title="댓글" class="comment">${post.comment_count}</li>
			</ul>
			<hr>
			<input type="hidden" name="311208877_comment_anonym" value="0">
			</a>
				<div class="comments"></div>
         	</article>
      	</c:forEach>
  			</c:when>
      	
      	------------------------------ ▼게시물▼ 메인검색 일떄, ------------------------------
      	
      	<c:when test="${allsearchcheck == 1}">
      	<c:forEach var="post" items="${postlist}">
			<article>
				<a class="article" href="PostDetailAction.bo?post_num=${post.post_num}">
				<img src="https://cf-fpi.everytime.kr/0.png" class="picture medium">
				<h3 class="medium">${post.nickname}</h3> 
				<time class="medium">${post.post_date}</time>
				<hr>
				<h2 class="medium bold">${post.subject}</h2>
				<p class="medium">
					${post.content}<br>
				</p>
				<a href="PostList.bo?board_num=${post.board_num}" class="boardname" style="padding-left:15px; padding-bottom:10px;">${post.boardname}</a>
				<ul class="status" style="padding-right:15px; padding-bottom:10px;">
					<li class="attach">${post.file_count}</li>
					<li title="공감" class="vote">${post.like_count}</li>
					<li title="댓글" class="comment">${post.comment_count}</li>
				</ul>
				
				<hr> <input type="hidden" name="311145444_comment_anonym" value="0">
				</a>
				<div class="comments"></div>
			</article>
			</c:forEach>
      	</c:when>
      	</c:choose> 
      	
--%>

      	<%-------------------------------- ▼글이 없을때▼ --------------------------------%>
      	
      	<c:if test="${empty postlist}">
      		<c:choose>
      			<c:when test="${emptycheck == 1}">
      				<article>
    					<div class="empty_postlist">
    					<p>글이 없습니다 지금 작성 해보세요.</p>
    					</div>
    				</article>
      			</c:when>
      			<c:when test="${emptycheck == 2}">
      				<article>
    					<div class="empty_postlist">
    					<p>검색된 결과가 없습니다.</p>
    				</div>
    				</article>
      			</c:when>
      		</c:choose>
		</c:if>


		<%-------------------------------- ▼페이지네이션▼ 메인검색 아닐떄, --------------------------------%>
		
			<div class="clearBothOnly"></div>
			<div class="center-block">
				<c:choose>
					<c:when test="${allsearchcheck == 0 && searchcheck != 1}">
						<ul class="pagination justify-content-center">

							<c:if test="${page <= 1 }">
								<li class="page-item">
								<li class="page-item hidden"><a class="page-link gray">이전&nbsp;&nbsp;</a>
								</li>
							</c:if>
							<c:if test="${page > 1 }">
								<li class="page-item"><a
									href="list?board_id=${board_id}&page=${page-1}&search_field=${search_field}&search_word=${search_word}"
									class="page-link">&nbsp;&nbsp;&nbsp;이전</a></li>
							</c:if>


							<c:forEach var="a" begin="${startpage}" end="${endpage}">
								<c:if test="${a == page}">
									<li class="page-item  active"><a class="page-link">${a}</a>
									</li>
								</c:if>
								<c:if test="${a != page }">
									<c:url var="go" value="list">
										<c:param name="board_id" value="${board_id}" />
										<c:param name="search_field" value="${search_field}" />
										<c:param name="search_word" value="${search_word}" />
										<c:param name="page" value="${a}" />
									</c:url>
									<li class="page-item"><a href="${go}" class="page-link">${a}</a>
									</li>
								</c:if>
							</c:forEach>
							
							
							<c:if test="${page >= maxpage }">
								<li class="page-item hidden"><a class="page-link hidden">다음&nbsp;&nbsp;&nbsp;</a>
								</li>
							</c:if>
							<c:if test="${page < maxpage }">
								<c:url var="next" value="list">
									<c:param name="board_id" value="${board_id}" />
									<c:param name="search_field" value="${search_field}" />
									<c:param name="search_word" value="${search_word}" />
									<c:param name="page" value="${page+1}" />
								</c:url>
								<li class="page-item"><a href="${next}" class="page-link">다음&nbsp;&nbsp;&nbsp;</a>
								</li>
							</c:if>
						</ul>
					</c:when>
		
		<%-------------------------------- ▼페이지네이션▼ 포스트검색 일떄, --------------------------------%>
					
					<c:when test="${allsearchcheck == 0 && searchcheck == 1}">
						<ul class="pagination justify-content-center">

							<c:if test="${page <= 1 }">
								<li class="page-item">
								<li class="page-item hidden"><a class="page-link gray">이전&nbsp;&nbsp;</a>
								</li>
							</c:if>
							<c:if test="${page > 1 }">
								<li class="page-item"><a
									href="search?board_id=${board_id}&page=${page-1}&search_field=${search_field}&search_word=${search_word}"
									class="page-link">&nbsp;&nbsp;&nbsp;이전</a></li>
							</c:if>


							<c:forEach var="a" begin="${startpage}" end="${endpage}">
								<c:if test="${a == page}">
									<li class="page-item  active"><a class="page-link">${a}</a>
									</li>
								</c:if>
								<c:if test="${a != page }">
									<c:url var="go" value="search">
										<c:param name="board_id" value="${board_id}" />
										<c:param name="search_field" value="${search_field}" />
										<c:param name="search_word" value="${search_word}" />
										<c:param name="page" value="${a}" />
									</c:url>
									<li class="page-item"><a href="${go}" class="page-link">${a}</a>
									</li>
								</c:if>
							</c:forEach>
							
							
							<c:if test="${page >= maxpage }">
								<li class="page-item hidden"><a class="page-link hidden">다음&nbsp;&nbsp;&nbsp;</a>
								</li>
							</c:if>
							<c:if test="${page < maxpage }">
								<c:url var="next" value="search">
									<c:param name="board_id" value="${board_id}" />
									<c:param name="search_field" value="${search_field}" />
									<c:param name="search_word" value="${search_word}" />
									<c:param name="page" value="${page+1}" />
								</c:url>
								<li class="page-item"><a href="${next}" class="page-link">다음&nbsp;&nbsp;&nbsp;</a>
								</li>
							</c:if>
						</ul>
					</c:when>		
		
		<%-------------------------------- ▼페이지네이션▼ 메인검색 일떄, --------------------------------%>
		
					<c:when test="${allsearchcheck == 1}">
						<ul class="pagination justify-content-center">

							<c:if test="${page <= 1 }">
								<li class="page-item">
								<li class="page-item hidden"><a class="page-link gray">이전&nbsp;</a>
								</li>
							</c:if>
							<c:if test="${page > 1 }">
								<li class="page-item"><a
									href="search?&page=${page-1}&search_field=4&search_word=${search_word}"
									class="page-link">&nbsp;&nbsp;이전</a></li>
							</c:if>

							<c:forEach var="a" begin="${startpage}" end="${endpage}">
								<c:if test="${a == page }">
									<li class="page-item  active"><a class="page-link">${a}</a>
									</li>
								</c:if>
								<c:if test="${a != page }">
									<c:url var="go" value="search">
										<c:param name="page" value="${a}" />
										<c:param name="search_field" value="4" />
										<c:param name="search_word" value="${search_word}" />
									</c:url>
									<li class="page-item"><a href="${go}" class="page-link">${a}</a>
									</li>
								</c:if>
							</c:forEach>

							<c:if test="${page >= maxpage }">
								<li class="page-item hidden"><a class="page-link hidden">다음&nbsp;&nbsp;</a>
								</li>
							</c:if>
							<c:if test="${page < maxpage }">
								<c:url var="next" value="search">
									<c:param name="page" value="${page+1}" />
									<c:param name="search_field" value="4" />
									<c:param name="search_word" value="${search_word}" />
								</c:url>
								<li class="page-item"><a href="${next}" class="page-link">다음&nbsp;&nbsp;</a>
								</li>
							</c:if>
						</ul>
					</c:when>
				</c:choose>

			</div>
		</div>


		<hr>

		<%-------------------------------- ▼라이트사이드▼ 메인아닐때, 메인일떄, --------------------------------%>

		<c:choose>
			<c:when test="${allsearchcheck == 0}">
				<jsp:include page="../common/rightside2.jsp" />
			</c:when>
			<c:when test="${allsearchcheck == 1}">
				<jsp:include page="../common/rightside.jsp" />
			</c:when>
		</c:choose>
		


		<%-------------------------------- ▼모달▼ --------------------------------%>

		<form id="abuseForm" class="modal">
			<a title="닫기" class="close"></a>
			<h3>신고 사유 선택</h3>
			<ul>
				<li><a data-reason="1">게시판 성격에 부적절함</a></li>
				<li><a data-reason="2">욕설/비하</a></li>
				<li><a data-reason="3">음란물/불건전한 만남 및 대화</a></li>
				<li><a data-reason="4">상업적 광고 및 판매</a></li>
				<li><a data-reason="5">유출/사칭/사기</a></li>
				<li><a data-reason="6">낚시/놀람/도배</a></li>
				<li><a data-reason="7">정당/정치인 비하 및 선거운동</a></li>
			</ul>
		</form>



		<form id="manageMoimForm" class="modal" style="margin-left: -200px; margin-top: -92.5px; display: none;">
			<a title="닫기" class="close"></a>
			<h3>게시판 설정</h3>
			<p>
				<label>소개</label> <input type="text" name="info" class="text">
			</p>
			<p class="hide">
				<label>인기 글 금지</label> <input type="checkbox"
					id="manageMoimForm_is_not_selected_hot_article"
					name="is_not_selected_hot_article"><label
					for="manageMoimForm_is_not_selected_hot_article" class="checkbox">글이
					공감을 받아도 인기 글 및 HOT 게시물에 선정되지 않음</label>
			</p>
			<input type="button" id="transferButton" value="게시판 양도" class="button light floatLeft">
			<input type="button" id="deleteButton" value="게시판 삭제" class="button light floatLeft">
			<input type="submit" id="updateButton" value="수정" class="button">
		</form>
		
		
		
		<form id="transferMoimForm" class="modal"
			data-gtm-form-interact-id="0" style="margin-left: -200px; margin-top: -92.5px; display: none;">
			<a title="닫기" class="close"></a>
			<h3>게시판 양도</h3>
			<p>
				<label>양도인 비밀번호</label> <input type="password"
					name="transferer_password" class="text"
					data-gtm-form-interact-field-id="1">
			</p>
			<p>
				<label>피양도인 아이디</label> <input type="text" name="transferee_userid"
					class="text" data-gtm-form-interact-field-id="0">
			</p>
			<input type="submit" id="transferOfBoardButton" value="양도 요청" class="button">
		</form>



		<form id="attachThumbnailForm" class="modal">
			<a title="닫기" class="close"></a>
			<h3>첨부된 이미지</h3>
			<p>
				<label>설명 추가</label>
				<textarea name="caption" class="text"
					placeholder="이 이미지에 대한 설명을 입력하세요."></textarea>
			</p>
			<input type="button" value="첨부 삭제" class="button light floatLeft">
			<input type="submit" value="설명 저장" class="button">
		</form>




		<form id="messageSend" class="modal">
			<a title="닫기" class="close"></a>
			<h3>쪽지 보내기</h3>
			<p>
				<textarea name="message" class="text" placeholder="내용을 입력해주세요."></textarea>
			</p>
			<input type="submit" value="전송" class="button">
		</form>
		
		<form id="deleteCheckForm" class="modal" style="margin-left: -200px; margin-top: -92.5px; display: none;">
			<a title="닫기" class="close"></a>
			<h3>게시판 삭제</h3>
			<p>
				<label>게시판을 삭제하려면 삭제하려는 해당 <strong style="color: #7869E6;">게시판의 이름</strong>을 입력하세요</label>
				<input type="text" name="boardNameCheck" class="text" value="${boardName}" readonly>
				<label>입력</label>
				<input type="text" name="TrueDeleteCheck" class="text">
			</p>
			<input type="submit" id="deleteCheckButton" value="삭제" class="button">
		</form>
	</div>

	<jsp:include page="../common/footer.jsp" />
	
	<script>
	$(document).ready(function() {
		/* -------------------------------- ▼postDetail 임시작성용▼ -------------------------------- */
		$('#writeArticleButton').click(function() {
			$(this).hide();	
			$(".postwriteform").show();
			
		});
		
		const fileInput = document.getElementById('post_file');
		const fileNameElement = document.getElementById('file-name');
		let fileList = []; // 첨부파일 목록을 저장할 배열

		fileInput.addEventListener('change', (event) => {
		  const selectedFile = event.target.files[0]; // 한 번에 하나의 파일만 선택

		  if (selectedFile) {
		    if (fileList.length >= 5 && !fileList.includes(selectedFile.name)) { 
		      alert("최대 5개의 파일만 첨부할 수 있습니다.");
		      fileInput.value = ''; // 입력값 초기화
		      return;
		    }

		    if(fileList.includes(selectedFile.name)){
		        const index = fileList.indexOf(selectedFile.name);
		        fileList.splice(index,1);
		    }else{
		        fileList.push(selectedFile); // 선택된 파일을 목록에 추가
		    }

		    let fileNames = '';
		    for(let i=0; i<fileList.length; i++){
		      fileNames += fileList[i].name; // 실제 파일 이름 사용
		      if(i < fileList.length - 1){
		        fileNames += ', ';
		      }
		    }
		    
		    fileNameElement.textContent = fileNames;
		    
		  } else {
		    fileNameElement.textContent = '';
		  }
		});
			
		/* -------------------------------- ▲postDetail 임시작성용▲ -------------------------------- */
		
		boardManagerCheckAjax();
		
		$('#manageMoim').click(function(){
			getBoardContentAjax();
			$('form#manageMoimForm').css('display', 'block');
			$('form#manageMoimForm').before('<div class="modalwrap"></div>');
			$('#manageMoimForm').show();
		});
		
		$('#transferButton').click(function(){
			$('form#manageMoimForm').css('display', 'none');
			$('#transferMoimForm').show();
		});
		
		$('#deleteButton').click(function(){
			$('form#manageMoimForm').css('display', 'none');			
			$('#deleteCheckForm').show();
		});		
		
		$('#updateButton').click(function(){
			event.preventDefault()
			updateBoardContentAjax();
		});
		
		$('a.close').click(function() {
			$('#manageMoimForm').css('display', 'none');
			$('#transferMoimForm').css('display', 'none');
			$('#deleteCheckForm').css('display', 'none');
			$('div.modalwrap').remove();
		});
		
		$('#deleteCheckButton').click(function(){
			event.preventDefault()
			boardDeleteAjax();
		});
		
		$('#transferOfBoardButton').click(function(){
			event.preventDefault()
			transferOfBoardAjax();
		})
		
		
	});		
	function getBoardContentAjax(){
		var infoInput = $("input[name='info']");
		var urlParams = new URLSearchParams(window.location.search);
		var board_id = urlParams.get('board_id');

		$.ajax({
			url: "${pageContext.request.contextPath}/getboardcontent",
			data: {
				"board_id": board_id,
			},
			dataType: "json",
			success: function (boardContentData){
				infoInput.val(boardContentData);
			}
		});
	}
	
	function updateBoardContentAjax(){
		var TrueDeleteCheck = $("input[name='info']");
		var contentvalue = TrueDeleteCheck.val();
		var urlParams = new URLSearchParams(window.location.search);
		var board_id = urlParams.get('board_id');

		$.ajax({
			url: "${pageContext.request.contextPath}/updateboardcontent",
			data: {
				"board_id": board_id,
				"content": contentvalue
			},
			dataType: "json",
			success: function (updateData){
				if(updateData == 1){
					
				alert("게시판 설명이 수정되었습니다.");
				location.reload();	
				}
				
			},
			error: function(xhr, status, error){
				console.error("에러 발생" + error);
			}
		})

	    
	}
	
	function boardManagerCheckAjax(){
		var urlParams = new URLSearchParams(window.location.search);
		var board_id = urlParams.get('board_id');

		$.ajax({
			url: "${pageContext.request.contextPath}/managercheck",
			data: {
				"board_id": board_id,
				LOGIN_ID: $('#login_id').val()
			},
			dataType: "json",
			success: function (managerCheck){
				if(managerCheck == 1){
					$('#boardmanager').show();				
				}else{
					console.log("권한이 없습니다");
				}
			}
		})
		
	}
	
	function boardDeleteAjax(){
		var board_name = $("input[name='TrueDeleteCheck']").val();
		var context = "${pageContext.request.contextPath}";
		
		var urlParams = new URLSearchParams(window.location.search);
		var board_id = urlParams.get('board_id');
		var school = "${school.domain}";
		
		if(board_name != ""){
		$.ajax({
			url: "${pageContext.request.contextPath}/deleteboard",
			data: {
				"board_id": board_id,
				board_name: board_name,
				LOGIN_ID: $('#login_id').val()
			},
			dataType: "json",
			success: function (deleteResult){
				if(deleteResult == 1){
					alert("게시판이 삭제되었습니다.");
					window.location.href = context + "/" + school;
				}else if(deleteResult == 2){
					alert("게시판 이름이 다릅니다.");
				}else {
					alert("게시판 삭제에 에러가 발생했습니다.");
				}
			},
			error: function(xhr, status, error){
				console.error("에러 발생" + error);
			}
		})
		}else{
			alert("빈칸을 입력하세요");
		}
	}
	
	function transferOfBoardAjax(){
		var inputpass = $("input[name='transferer_password']");
		var inputid = $("input[name='transferee_userid']");
		var pass = inputpass.val();
		var id = inputid.val();
		
		var urlParams = new URLSearchParams(window.location.search);
		var board_id = urlParams.get('board_id');
		
		$.ajax({
			url: "${pageContext.request.contextPath}/updatemanagerboard",
			data: {
				password: pass,
				userid: id,
				board_id: board_id
			},
			dataType: "json",
			success: function (updateManagerBoardResult){
				if(updateManagerBoardResult == 1){
					alert("게시판이 양도 되었습니다.");
					location.reload();
				}else if(updateManagerBoardResult == 2){
					alert("게시판 양도에 실패했습니다.");
				}else if(updateManagerBoardResult == 3){
					alert("비밀번호가 맞지 않습니다.");
				}else if(updateManagerBoardResult == 4){
					alert("양도할 유저가 해당 학교 학생이 아닙니다.");
				}else if(updateManagerBoardResult == 5){
					alert("양도할 유저 존재하지 않습니다.");
				}else{
					alert("게시판 양도에 실패했습니다 관리자에게 문의 바랍니다.");
				}
			},
			error: function(xhr, status, error){
				console.error("에러 발생" + error);
			}
			
		})
	}
	
	</script> 
	
</body>
</html>