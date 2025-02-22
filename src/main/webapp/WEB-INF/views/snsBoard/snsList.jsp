﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>인덱스를 만들어 보자</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	<style type="text/css">
	section {
		margin-top: 70px;
	}
	
	/*부트스트랩 li의 drophover클래스 호버시에 드롭다운 적용코드*/
	ul.nav li.drophover:hover>ul.dropdown-menu {
		display: block;
		margin: 0;
	}
	
	.aside-inner {
		position: fixed;
		top: 70px;
		width: 180px;
	}
	
	.section-inner {
		border-right: 1px solid #ddd;
		border-left: 1px solid #ddd;
		background-color: white;
	}
	
	.section-inner p, .aside-inner p {
		margin: 0;
	}
	
	.title-inner {
		position: relative;
		padding: 15px 0;
	}
	
	.title-inner .profile {
		position: absolute; /*부모기준으로 위치지정 릴레이티브*/
		top: 15px;
		left: 0;
	}
	
	.title-inner .title {
		padding-left: 50px;
	}
	/*내용*/
	.content-inner {
		padding: 10px 0;
	}
	/* 이미지영역  */
	.image-inner img {
		width: 100%;
	}
	/*좋아요*/
	.like-inner {
		padding: 10px 0;
		border-bottom: 1px solid #ddd;
		border-top: 1px solid #ddd;
		margin-top: 10px;
	}
	
	.like-inner img {
		width: 20px;
		height: 20px;
	}
	
	.link-inner {
		overflow: hidden;
		padding: 10px 0;
	}
	
	.link-inner a {
		float: left;
		width: 33.3333%;
		text-align: center;
		text-decoration: none;
		color: #333333;
	}
	
	.link-inner i {
		margin: 0 5px;
	}
	
	/*767미만 사이즈에서 해당 css가 적용됨*/
	/*xs가 767사이즈   */
	@media ( max-width :767px) {
		aside {
			display: none;
		}
	}
	/* 파일업로드 버튼 바꾸기 */
	.filebox label {
		display: inline-block;
		padding: 6px 10px;
		color: #fff;
		font-size: inherit;
		line-height: normal;
		vertical-align: middle;
		background-color: #5cb85c;
		cursor: pointer;
		border: 1px solid #4cae4c;
		border-radius: none;
		-webkit-transition: background-color 0.2s;
		transition: background-color 0.2s;
	}
	
	.filebox label:hover {
		background-color: #6ed36e;
	}
	
	.filebox label:active {
		background-color: #367c36;
	}
	
	.filebox input[type="file"] {
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip: rect(0, 0, 0, 0);
		border: 0;
	}
	
	/* sns파일 업로드시 미리보기  */
	.fileDiv {
		height: 100px;
		width: 200px;
		display: none;
		margin-bottom: 10px;
	}
	
	.fileDiv img {
		width: 100%;
		height: 100%;
	}
	/* 모달창 조절 */
	.modal-body {
		padding: 0px;
	}
	
	.modal-content>.row {
		margin: 0px;
	}
	
	.modal-body>.modal-img {
		padding: 0px;
	}
	
	.modal-body>.modal-con {
		padding: 15px;
	}
	
	.modal-inner {
		position: relative;
	}
	
	.modal-inner .profile {
		position: absolute; /*부모기준으로 위치지정 릴레이티브*/
		top: 0px;
		left: 0px;
	}
	
	.modal-inner .title {
		padding-left: 50px;
	}
	
	.modal-inner p {
		margin: 0px;
	}
	</style>
	
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<section>
		<div class="container">
			<div class="row">
				<aside class="col-sm-2">
					<div class="aside-inner">
						<div class="menu1">
							<c:choose>
								<c:when test="${login != null }">
									<p>
										<img src="../resources/img/profile.png">&nbsp;&nbsp;${login.userName }님
									</p>
									<ul>
										<li>내정보</li>
										<li>내쿠폰</li>
										<li>내 좋아요 게시물</li>
									</ul>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-info" onclick="location.href='<c:url value="/user/userLogin" />'">로그인</button>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="menu2">
							<p>둘러보기</p>
							<ul>
								<li>기부 캠페인</li>
								<li>페이지</li>
								<li>그룹</li>
								<li>이벤트</li>
								<li>친구리스트</li>
							</ul>
						</div>
					</div>
				</aside>
				<div class="col-xs-12 col-sm-8 section-inner">
					<h4>게시물 만들기</h4>
					<!-- 파일 업로드 폼입니다 -->
					<div class="fileDiv">
						<img id="fileImg" src="../resources/img/img_ready.png">
					</div>
					<div class="reply-content">
						<textarea class="form-control" rows="3" name="content"
							id="content" placeholder="무슨 생각을 하고 계신가요?"></textarea>
						<div class="reply-group">
							<div class="filebox pull-left">
								<label for="file">이미지업로드</label> 
								<input type="file" name="file" id="file">
							</div>
							<button type="button" class="right btn btn-info" id="uploadBtn">등록하기</button>
						</div>
					</div>


					<!-- 파일 업로드 폼 끝 -->
					<div id="contentDiv">
					<div class="title-inner">
						<!--제목영역-->
						<div class="profile">
							<img src="../resources/img/profile.png">
						</div>
						<div class="title">
							<p>테스트</p>
							<small>21시간</small>
						</div>
					</div>
					<div class="content-inner">
						<!--내용영역-->
						<p>삶이 우리를 끝없이 시험하기에 고어텍스는 한계를 테스트합니다</p>
					</div>
					<div class="image-inner">
						<!-- 이미지영역 -->
						<img src="../resources/img/facebook.jpg">
						
					</div>
					<div class="like-inner">
						<!--좋아요-->
						<img src="../resources/img/icon.jpg"> <span>522</span>
					</div>
					<div class="link-inner">
						<a href="##"><i class="glyphicon glyphicon-thumbs-up"></i>좋아요</a>
						<a href="##"><i class="glyphicon glyphicon-comment"></i>댓글달기</a> 
						<a href="##"><i class="glyphicon glyphicon-remove"></i>삭제하기</a>
					</div>
					</div>
				</div>
				<!--우측 어사이드-->
				<aside class="col-sm-2">
					<div class="aside-inner">
						<div class="menu1">
							<p>목록</p>
							<ul>
								<li>목록1</li>
								<li>목록2</li>
								<li>목록3</li>
								<li>목록4</li>
								<li>목록5</li>
							</ul>
						</div>
					</div>
				</aside>
			</div>
		</div>
	</section>
	<%@ include file="../include/footer.jsp" %>
	<!-- 모달 -->
	<div class="modal fade" id="snsModal" role="dialog">
			<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body row">
					<div class="modal-img col-sm-8 col-xs-6" >
						<img src="../resources/img/img_ready.png" id="snsImg" width="100%">
					</div>
					<div class="modal-con col-sm-4 col-xs-6">
						<div class="modal-inner">
						<div class="profile">
							<img src="../resources/img/profile.png">
						</div>
						<div class="title">
							<p id="snsWriter">테스트</p>
							<small id="snsRegdate">21시간전</small>
						</div>
						<div class="content-inner">
							<p id="snsContent">다람쥐 헌 쳇바퀴에 타고파. sns Content 내용입니다.</p>
						</div>
						<div class="link-inner">
							<a href="##"><i class="glyphicon glyphicon-thumbs-up"></i>좋아요</a>
							<a href="##"><i class="glyphicon glyphicon-comment"></i>댓글달기</a> 
							<a href="##"><i class="glyphicon glyphicon-share-alt"></i>공유하기</a>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<script>
	
		$(function() {
			
			//등록 버튼 이벤트
			$('#uploadBtn').click(function() {
				regist();
			});
			
			//등록 담당 함수
			function regist() {
				//세션 아이디
				const user_id = '${login.userId}';
				
				//자바스크립트 파일 확장자 체크 검색
				let file = $('#file').val();
				
				console.log(user_id);
				console.log(file);
				//.을 제거한 확장자만 얻어낸 후 그것을 소문자로 변경
				file.slice(file.indexOf('.') + 1).toLowerCase(); //file 확장자
				if(file !== 'jpg' && file !== 'png' && file!== 'bmp') {
					alert('이미지파일(jpg, png, bmp)만 등록이 가능합니다.');
					$('#file').val('');
					return;
				} else if(user_id === '') { //세션 데이터 없음(로그인 x)
					alert('로그인이 필요한 서비스입니다.');
					return;
				} 
				
				//ajax 폼 전송의 핵심 FormData객체.
				const formData = new FormData();
				const data = $('#file');
				
				//data[index] -> 파일 업로드 버튼이 여러개 존재 할 수 있음
				//files[index] -> 파일이 여러개 전송될 수 있기 때문에, 몇 번째 파일인지 지목해야 함
				
				//폼데이터 객체에 사용자가 업로드한 파일의 정보들이 들어있는 객체를 전달
				formData.append("file", data[0].files[0]);
				//content(글 내용) 값을 얻어와서 폼 데이터에 추가
				const content = $('#content').val();
				formData.append("content", content);
				
				//비동기 방식으로 파일 업로드 및 게시글 등록
				$.ajax({
					url: "<c:url value='/snsBoard/upload' />",
					proccessData: false, //폼 데이터를 &변수=값 형식으로 자동으로 변경되는 것을 막는 요소
					contentType: false, //ajax방식에서는 반드시 false로 처리 -> "multipart/form-data"로 선언됨.
					data: formData, //formData 객체 넘김
					type: "post",
					success: function(result) {
						if(result === 'success'){
							$('#file').val('');
							$('#content').val('');
							$('.fileDiv').css('display', 'none'); //미리보기 감추기
							getList(true);
						} else {
							alert('업로드에 실패했습니다. 관리자에게 문의하세요.');
						}
					},
					error: function(request, status, error) {
						alert('code: ' + request + "\n" + 'message' + request.response(status));
						alert('업로드에 실패했습니다. 관리자에게 문의하세요.');
					}
				}); //ajax end
				
			} //end regist()
			
			
			//리스트 작업
			getList(true);
			let str = '';
			function getList() {
				if(reset == true) {
					str = ''; //리셋여부 true라면 str을 초기화
				}
			}
			
			$.getJSON(
					'<c:url value="/snsBoard/getList" />',
					function(list) {
						
						for(let i=0; i<list.length; i++) {
							str += "<div class='title-inner'>";
		                     str += "<div class='profile'>";
		                     str += "<img src='../resources/img/profile.png' >";    
		                     str += "</div>";
		                     str += "<div class='title'>";
		                     str += "<p>"+ list[i].writer +"</p>";
		                     str += "<small>"+ timeStamp(list[i].regdate) +"</small>";
		                     //파일다운로드
		                     str += "<a href='download?fileLoca="+list[i].fileLoca +"&fileName="+list[i].fileName +"'>이미지다운로드</a>";
		                     //파일다운로드끝
		                     str += "</div>";
		                     str += "<div class='content-inner'>"
		                     str += "<p>"+ (list[i].content== null?'':list[i].content)  +"</p>";
		                     str += "</div>";
		                     /* 이미지 영역 */
		                     str += "<div class='image-inner'>";
		                     str += "<a href='" + list[i].bno + "'>"; ///////추가
		                     str += "<img src='display?fileLoca="+list[i].fileLoca +"&fileName="+list[i].fileName +"'>";
		                     str += "</a>" ////////추가
		                     str += "</div>";
		                     str += "<div class='like-inner'>";                   
		                     str += "<img src='../resources/img/icon.jpg'><span>522</span>";                  
		                     str += "</div>";
		                     str += "<div class='link-inner'>";                     
		                     str += "<a href='##'><i class='glyphicon glyphicon-thumbs-up'></i>좋아요</a>";
		                     str += "<a href='##'><i class='glyphicon glyphicon-comment'></i>댓글달기</a>";
		                     str += "<a href='"+ list[i].bno +"'><i class='glyphicon glyphicon-remove'></i>삭제하기</a>";
		                     str += "</div>";
		                     $("#contentDiv").html(str);
						}
					} //end getList
					
					//상세보기 처리(모달창 열어 주기)
					$('#contentDiv').on('click', 'image-inner a', function() {
						e.preventDefault();
						
						//글 번호 얻어오기
						const bno = $(this).attr('href');
						
						$.getJSON(
							"<c:url value='/snsBoard/getDetail' />" + "/" + bno;	
							function(data) {
								console.log(data);
								
								const img = 'display?fileLoca=' + data.fileloca + '&fileName=' + data.filename;
								$('#snsImg').attr('src', img); //이미지 경로 처리
								$('#snsWriter').html(data.writer); //작성자
								$('#snsRegdate').html(timeStamp(data.regdate)); //날짜 
								$('#snsContent').html(data.content);
								$('#snsModal').modal('show');
								
							}
						); //end getJSON
						
					});
					
					
			); //getJSON end 
			
		}); //등록 버튼 이벤트 끝
	
		
		//날짜 처리 함수
		function timeStamp(millis) {
			const date = new Date(); //현재 날짜
			//현재 날짜를 밀리초로 변환 - 등록일 밀리초 -> 시간차
			const gap = date.getTime() - millis;
			
			let time; //리턴할 시간
			if(gap < 60* 60 * 24 * 1000) { //1일 미만인 경우
				if(gap < 60 * 60 * 1000) { //1시간 미만인 경우
					time = '방금 전'
				} else { //1시간 이상일 경우
					time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
				}
			} else { //1일 이상일 경우
				const today = new Date(millis);
				const year = today.getFullYear();
				const month = today.getMonth() + 1;
				const day = today.getDate();
				const hour = today.getHours();
				const minute = today.getMinutes();
				
				time = year + '년 ' + month + '월' + day + '일 ' + hour + '시' + minute + '분';
			}
			
			return time;
		}
	
		//자바 스크립트 파일 미리보기 기능
		function readURL(input) {
        	if (input.files && input.files[0]) {
        		
            	var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
            	//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
	        	reader.readAsDataURL(input.files[0]); 
            	//파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
	            $(".fileDiv").css("display", "block");
            	
            	reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
                	$('#fileImg').attr("src", event.target.result); 
                	console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
	        	}
        	}
	    }
		$("#file").change(function() {
	        readURL(this); //this는 #file자신 태그를 의미
	        
	    });
	</script>
	
	
	
</body>
</html>