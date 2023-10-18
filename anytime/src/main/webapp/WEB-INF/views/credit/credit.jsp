<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<head>
<title>애니타임</title>
<meta charset="utf-8">
<link type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.partial.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/resources/css/common/container.modal.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/resources/css/calculator/calculator.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/credit/extensions.jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/credit/extensions.underscore-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/credit/credit.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body style="">

	<jsp:include page="../common/header.jsp" />

	<div id="container" class="calculator">
		<input type="hidden" id="userId" value="542509"> <input
			type="hidden" id="userRequiredCredit" value="150"> <input
			type="hidden" id="userGradeType" value="">
		<aside class="none">
			<div class="title">
				<a class="hamburger"></a>
				<h1>학점 계산기</h1>
			</div>
		</aside>
		<div class="section">
			<div class="chart">
				<article class="overview">
					<div class="column gpa">
						<h4>전체 평점</h4>
						<p class="value">${totalgpa}</p>
						<p class="total">/ ${school.credit}</p>
					</div>
					<div class="column major">
						<h4>전공 평점</h4>
						<p class="value">${totalmajor}</p>
						<p class="total">/ ${school.credit}</p>
					</div>
					<div class="column acquisition">
						<h4>취득 학점</h4>
						<p class="value">${totalAcquisition}</p>
						<p class="total" title="졸업 학점 설정">/ ${credit.graduate_credit}
						</p>
					</div>
				</article>
				<article class="semester">
					<div class="series">
						<div class="legend">
							<table style="font-size: smaller; color: #545454">
								<tbody>
									<tr>
										<td class="legendColorBox"><div
												style="border: 1px solid transparent; padding: 1px">
												<div
													style="width: 4px; height: 0; border: 5px solid #7869e6; overflow: hidden"></div>
											</div></td>
										<td class="legendLabel"><span style="color: #7869e6">전체</span></td>
										<td class="legendColorBox"><div
												style="border: 1px solid transparent; padding: 1px">
												<div
													style="width: 4px; height: 0; border: 5px solid rgb(166, 166, 166); overflow: hidden"></div>
											</div></td>
										<td class="legendLabel"><span
											style="color: rgb(166, 166, 166)">전공</span></td>
									</tr>
								</tbody>
							</table>
						</div>

						<div id="plot" class="plot"
							style="padding: 0px; position: relative;">
							<div class="chart-view" data-v-6a145b43="">
								<canvas id="myChart" width="365" height="150"
									style="display: block; box-sizing: border-box; height: 274px; width: 100px;"></canvas>
							</div>
							<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
							<script>
								
								
								
							    var labeldata =[
							   	<c:forEach var="semestername" items="${semestername}" varStatus="i">
					            '${semestername.semester_name}'<c:if test="${!i.last}">,</c:if>
					            </c:forEach>
					            ]
							  
							
							  var gpaData = [
							        <c:forEach var="gpaMap" items="${gpa}" varStatus="i">
							            '${gpaMap.Gpa}'<c:if test="${!i.last}">,</c:if>
							        </c:forEach>
							    ];

							    var majorData = [
							        <c:forEach var="gpaMap" items="${gpa}" varStatus="i">
							            '${gpaMap.Major}'<c:if test="${!i.last}">,</c:if>
							        </c:forEach>
							    ];
							    
								var ctx = document.getElementById('myChart')
										.getContext('2d');
                                console.log(labeldata);
								// 실제 데이터와 설정을 추가하여 data 변수 정의
								var data = {
									labels : labeldata, // X축 레이블
									datasets : [
											{
												label : '전체',
												data : [ 
													gpaData
						                        ], // Y축 데이터
												borderColor : '#7869e6',
												backgroundColor : '#7869e6',
												yAxisID : 'y'
											},
											{
												label : '전공',
												data : [ 
													majorData
							                 ], // Y축 데이터
												borderColor : 'rgb(166, 166, 166)',
												backgroundColor : 'rgb(166, 166, 166)',
												yAxisID : 'y'
											} ]
								};

								var myChart = new Chart(ctx, {
									type : 'line',
									data : data,
									options : {
										responsive : true,
										interaction : {
											mode : 'index',
											intersect : false
										},
										stacked : false,
										plugins : {
										},
										scales : {
											y : {
												type : 'linear',
												display : true,
												position : 'left'
											},
											y1 : {
												type : 'linear',
												display : false,
												position : 'right',
												grid : {
													drawOnChartArea : false
												}
											}
										}
									}
								});
							</script>
						</div>
					</div>
					<ul class="ratioplot">
						<li><span class="grade">A+</span>
							<div class="ratiowrapper">
								<div class="ratiobar"
									style="width: calc(68.4211%); height: 4px; background-color: rgb(242, 133, 114);"></div>
								<span class="ratiotext"
									style="left: calc(68.4211%); color: rgb(242, 133, 114);">34%</span>
							</div></li>
						<li><span class="grade">B+</span>
							<div class="ratiowrapper">
								<div class="ratiobar"
									style="width: calc(52.6316%); height: 4px; background-color: rgb(236, 197, 92);"></div>
								<span class="ratiotext"
									style="left: calc(52.6316%); color: rgb(236, 197, 92);">26%</span>
							</div></li>
						<li><span class="grade">P</span>
							<div class="ratiowrapper">
								<div class="ratiobar"
									style="width: calc(26.3158%); height: 4px; background-color: rgb(160, 198, 97);"></div>
								<span class="ratiotext"
									style="left: calc(26.3158%); color: rgb(160, 198, 97);">13%</span>
							</div></li>
						<li><span class="grade">A-</span>
							<div class="ratiowrapper">
								<div class="ratiobar"
									style="width: calc(15.7895%); height: 4px; background-color: rgb(130, 209, 194);"></div>
								<span class="ratiotext"
									style="left: calc(15.7895%); color: rgb(130, 209, 194);">8%</span>
							</div></li>
						<li><span class="grade">B0</span>
							<div class="ratiowrapper">
								<div class="ratiobar"
									style="width: calc(10.5263%); height: 4px; background-color: rgb(122, 158, 224);"></div>
								<span class="ratiotext"
									style="left: calc(10.5263%); color: rgb(122, 158, 224);">5%</span>
							</div></li>
					</ul>
				</article>


			</div>

			<div class="menu">
				<ol>
					<c:forEach var="semester" items="${semesters}">
						<li class="" data-id="${semester.semester_id}"><a>${semester.semester_name}</a></li>
					</c:forEach>
				</ol>
			</div>

			<table class="subjects">
				<caption>
					<h3></h3>
					<dl class="information">
						<dt>평점</dt>
						<dd class="gpa"></dd>
						<dt>전공</dt>
						<dd class="major"></dd>
						<dt>취득</dt>
						<dd class="acquisition"></dd>
					</dl>
					<a class="import" style="display: inline;">시간표 불러오기</a>
				</caption>
				<thead>
					<tr>
						<th class="name">과목명</th>
						<th class="credit">학점</th>
						<th class="grade">성적</th>
						<th class="major">전공</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4"><a class="new">더 입력하기</a> <a class="reset">초기화</a>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<hr>
		<form id="importForm" class="modal"
			style="margin-left: -200px; margin-top: -93px; display: none;"
			data-gtm-form-interact-id="0">
			<a title="닫기" class="close"></a>
			<h3>내 시간표 가져오기</h3>
			<p>
				<label>시간표 선택</label> <select name="semester"
					data-gtm-form-interact-field-id="0"><option
						value="42644511">2023년 겨울학기 (시간표 1)</option>
					<option value="42662455">2023년 2학기 (시간표 1)</option>
					<option value="40480064">2023년 여름학기 (시간표 1)</option>
					<option value="40480070">2023년 1학기 (시간표 1)</option>
					<option value="42644510">2011년 1학기 (시간표 1)</option></select>
			</p>
			<input type="submit" value="가져오기" class="button">
		</form>
		<form id="requiredCreditForm" class="modal"
			style="display: none; margin-left: -200px; margin-top: -92.5px;">
			<a title="닫기" class="close"></a>
			<h3>졸업 학점 설정</h3>
			<p>
				<label>졸업 학점</label> <input type="number" name="required_credit"
					maxlength="3" class="text" value="${credit.graduate_credit}">
			</p>
			<input type="submit" value="저장" class="button">
		</form>
	</div>
	<div id="bottom">
		<ul class="links">
			<li><a href="/page/serviceagreement">이용약관</a></li>
			<li class="privacy"><a href="/page/privacy">개인정보처리방침</a></li>
			<li><a href="/page/youthpolicy">청소년보호정책</a></li>
			<li><a href="/page/rules">커뮤니티이용규칙</a></li>
			<li><a href="/notice">공지사항</a></li>
			<li><a href="/page/faq">문의하기</a></li>
			<li class="copyright"><a href="/">© 애니타임</a></li>
		</ul>
		<span>직업정보제공사업 신고번호 : J1204020230008</span>
	</div>

</body>
</html>