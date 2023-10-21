<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/common/nav.logo.png">
  <title>애니타임</title>
<link type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/resources/css/common/common.partial.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/resources/css/common/container.modal.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/resources/css/timetable/timetable.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/resources/css/timetable/timetable.subjects.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-latest.js"></script>

  <script type="text/javascript" src="/js/extensions.jquery-1.10.2.min.js"></script>
  <script type="text/javascript" src="/js/extensions.underscore-min.js"></script>
  <script type="text/javascript" src="/js/common.js"></script>
  <script type="text/javascript" src="/js/timetable.tableload.js"></script>
  <script type="text/javascript" src="/js/timetable.tablesave.js"></script>
  <script type="text/javascript" src="/js/timetable.subjects.js"></script>
  <script type="text/javascript" src="/js/timetable.customsubjects.js"></script>
  <script type="text/javascript" src="/js/timetable.index.js"></script>
  <script type="text/javascript" src="/js/timetable.subjectcolumninfo.js"></script>
  <script type="text/javascript" src="/js/timetable.imagegenerator.js"></script>
</head>
<body style="">
<jsp:include page="../common/header.jsp" />

<script type="text/javascript">
    var _timetableGridInfo = [{"no":"1","rows":[96,108],"hidden":false},{"no":"2","rows":[108,126],"hidden":false},{"no":"3","rows":[126,144],"hidden":false},{"no":"4","rows":[144,162],"hidden":false},{"no":"5","rows":[162,180],"hidden":false},{"no":"6","rows":[180,198],"hidden":false},{"no":"7","rows":[198,216],"hidden":false},{"no":"8","rows":[216,234],"hidden":false},{"no":"9","rows":[234,252],"hidden":false},{"no":"10","rows":[252,270],"hidden":false},{"no":"","rows":[270,288],"hidden":false}];
  </script>
  <div id="container" class="timetable" style="height: 635px;">
    <hr>
    <aside>
      <form class="select">
        <select id="semesters"><option>2023년 겨울학기</option><option>2023년 2학기</option><option>2023년 여름학기</option><option>2023년 1학기</option><option>2022년 겨울학기</option><option>2022년 2학기</option><option>2022년 여름학기</option><option>2022년 1학기</option><option>2021년 겨울학기</option><option>2021년 2학기</option><option>2021년 여름학기</option><option>2021년 1학기</option><option>2020년 겨울학기</option><option>2020년 2학기</option><option>2020년 여름학기</option><option>2020년 1학기</option><option>2019년 겨울학기</option><option>2019년 2학기</option><option>2019년 여름학기</option><option>2019년 1학기</option><option>2018년 겨울학기</option><option>2018년 2학기</option><option>2018년 여름학기</option><option>2018년 1학기</option><option>2017년 겨울학기</option><option>2017년 2학기</option><option>2017년 여름학기</option><option>2017년 1학기</option><option>2016년 겨울학기</option><option>2016년 2학기</option><option>2016년 여름학기</option><option>2016년 1학기</option><option>2015년 겨울학기</option><option>2015년 2학기</option><option>2015년 여름학기</option><option>2015년 1학기</option><option>2014년 겨울학기</option><option>2014년 2학기</option><option>2014년 여름학기</option><option>2014년 1학기</option><option>2013년 겨울학기</option><option>2013년 2학기</option><option>2013년 여름학기</option><option>2013년 1학기</option><option>2012년 겨울학기</option><option>2012년 2학기</option><option>2012년 여름학기</option><option>2012년 1학기</option><option>2011년 겨울학기</option><option>2011년 2학기</option><option>2011년 여름학기</option><option>2011년 1학기</option><option>2010년 겨울학기</option><option>2010년 2학기</option><option>2010년 여름학기</option><option>2010년 1학기</option></select>
      </form>
      <div class="title">
        <a class="hamburger"></a>
        <h1 id="tableName">시간표 1</h1>
        <div class="description">
          <ul class="info">
            <li style="display: none;"><span id="tableCredit">0</span> 학점</li>
            <li><time id="tableUpdatedAt">09/11 16:48</time> 변경</li>
          </ul>
        </div>
        <hr>
        <ol class="buttons threecols">
          <li data-modal="tableExport"><a class="light image export">이미지</a></li>
          <li data-modal="tableSetting"><a class="light image setting">설정</a></li>
          <li class="mobileonly"><a id="semestersButton">학기변경</a></li>
        </ol>
        <hr>
      </div>
      <div class="menu">
        <ol><li class="active"><a href="/timetable/2023/겨울/42644511" class="primary">시간표 1</a></li><li><a href="/timetable/2023/겨울/42645010">시간표 2</a></li><li class="extension"><a class="create">새 시간표 만들기</a></li></ol>
      </div>
    </aside>
    <div class="wrap" style="width: 469px;">
      <div class="tablehead"><table class="tablehead"><tbody><tr><th></th><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td style="display: none;">토</td><td style="display: none;">일</td><th></th></tr></tbody></table></div>
      <div class="tablebody"><table class="tablebody" style="margin-top: -402px;"><tbody><tr><th><div class="hours"><div class="hour" style="height: 50px; top: 400px; line-height: 50px;">1교시</div><div class="hour" style="height: 75px; top: 450px; line-height: 75px;">2교시</div><div class="hour" style="height: 75px; top: 525px; line-height: 75px;">3교시</div><div class="hour" style="height: 75px; top: 600px; line-height: 75px;">4교시</div><div class="hour" style="height: 75px; top: 675px; line-height: 75px;">5교시</div><div class="hour" style="height: 75px; top: 750px; line-height: 75px;">6교시</div><div class="hour" style="height: 75px; top: 825px; line-height: 75px;">7교시</div><div class="hour" style="height: 75px; top: 900px; line-height: 75px;">8교시</div><div class="hour" style="height: 75px; top: 975px; line-height: 75px;">9교시</div><div class="hour" style="height: 75px; top: 1050px; line-height: 75px;">10교시</div><div class="hour" style="height: 75px; top: 1125px; line-height: 75px;"></div></div></th><td><div class="cols" style="width: 68px;"><div class="subject color1" style="height: 51px; top: 500px;"><ul class="status"><li title="변경" class="edit"></li><li title="삭제" class="del"></li></ul><h3>1231232</h3><p><em>1231232</em><span></span></p></div></div><div class="grids"><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div></div></td><td><div class="cols" style="width: 68px;"></div><div class="grids"><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div></div></td><td><div class="cols" style="width: 68px;"></div><div class="grids"><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div></div></td><td><div class="cols" style="width: 68px;"></div><div class="grids"><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div></div></td><td><div class="cols" style="width: 68px;"></div><div class="grids"><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div></div></td><td style="display: none;"><div class="cols"></div><div class="grids"><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div></div></td><td style="display: none;"><div class="cols"></div><div class="grids"><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div><div class="grid"></div></div></td><th><div class="times"><div class="time">오전 0시</div><div class="time">오전 1시</div><div class="time">오전 2시</div><div class="time">오전 3시</div><div class="time">오전 4시</div><div class="time">오전 5시</div><div class="time">오전 6시</div><div class="time">오전 7시</div><div class="time">오전 8시</div><div class="time">오전 9시</div><div class="time">오전 10시</div><div class="time">오전 11시</div><div class="time">오후 12시</div><div class="time">오후 1시</div><div class="time">오후 2시</div><div class="time">오후 3시</div><div class="time">오후 4시</div><div class="time">오후 5시</div><div class="time">오후 6시</div><div class="time">오후 7시</div><div class="time">오후 8시</div><div class="time">오후 9시</div><div class="time">오후 10시</div><div class="time">오후 11시</div></div></th></tr></tbody></table><div class="nontimes"></div></div>
    </div>
    <form id="tableExport" class="modal">
      <a title="닫기" class="close"></a>
      <h3>시간표 이미지 저장</h3>
      <p>
        <label>이미지 옵션</label>
        <label class="checkbox"><input type="radio" name="is_mobile" value="false" checked=""> PC용</label>
        <label class="checkbox"><input type="radio" name="is_mobile" value="true"> 모바일용</label>
      </p>
      <input type="hidden" name="id">
      <input type="submit" value="저장하기" class="button">
    </form>
    <form id="tableSetting" class="modal">
      <a title="닫기" class="close"></a>
      <h3>시간표 설정</h3>
      <p>
        <label>이름</label>
        <input type="text" name="name" value="" maxlength="40" class="text">
      </p>
      <p>
        <label>공개 범위</label>
        <input type="radio" id="tableSetting_priv0" name="priv" value="0"><label for="tableSetting_priv0" class="checkbox">전체공개</label>
        <input type="radio" id="tableSetting_priv1" name="priv" value="1"><label for="tableSetting_priv1" class="checkbox">친구공개</label>
        <input type="radio" id="tableSetting_priv2" name="priv" value="2"><label for="tableSetting_priv2" class="checkbox">비공개</label>
      </p>
      <p>
        <label>기본</label>
        <input type="checkbox" id="tableSetting_is_primary" name="is_primary"><label for="tableSetting_is_primary" class="checkbox">기본시간표 설정</label>
      </p>
      <input type="button" value="삭제" class="button light floatLeft">
      <input type="submit" value="설정 저장" class="button">
    </form>
    <form id="subjectCampusFilter" class="modal">
      <a title="닫기" class="close"></a>
      <h3>캠퍼스</h3>
      <div class="filter"></div>
      <input type="submit" value="적용" class="button">
    </form>
    <form id="subjectCategoryFilter" class="modal">
      <a title="닫기" class="close"></a>
      <h3>전공/영역</h3>
      <div class="filter"></div>
    </form>
    <form id="subjectKeywordFilter" class="modal">
      <a title="닫기" class="close"></a>
      <h3>검색어</h3>
      <div class="filter"></div>
      <input type="submit" value="검색" class="button">
    </form>
    <form id="subjectOrderFilter" class="modal">
      <a title="닫기" class="close"></a>
      <h3>정렬</h3>
      <div class="filter"></div>
      <input type="submit" value="적용" class="button">
    </form>
    <form id="subjectTimeFilter" class="modal">
      <a title="닫기" class="close"></a>
      <h3>시간</h3>
      <div class="filter"></div>
      <input type="submit" value="적용" class="button">
    </form>
    <form id="subjectGradeFilter" class="modal">
      <a title="닫기" class="close"></a>
      <h3>학년</h3>
      <div class="filter"></div>
      <input type="button" value="전체 선택" class="button light floatLeft" data-action="select">
      <input type="button" value="전체 취소" class="button light floatLeft" data-action="deselect">
      <input type="submit" value="적용" class="button">
    </form>
    <form id="subjectTypeFilter" class="modal">
      <a title="닫기" class="close"></a>
      <h3>구분</h3>
      <div class="filter"></div>
      <input type="button" value="전체 선택" class="button light floatLeft" data-action="select">
      <input type="button" value="전체 취소" class="button light floatLeft" data-action="deselect">
      <input type="submit" value="적용" class="button">
    </form>
    <form id="subjectCreditFilter" class="modal">
      <a title="닫기" class="close"></a>
      <h3>학점</h3>
      <div class="filter"></div>
      <input type="button" value="전체 선택" class="button light floatLeft" data-action="select">
      <input type="button" value="전체 취소" class="button light floatLeft" data-action="deselect">
      <input type="submit" value="적용" class="button">
    </form>
    <ul class="floating" style="left: 544.2px;"><li class="button custom only">새 수업 추가</li></ul>
  </div>
  <form id="customsubjects" style="display: none;">
    <input type="hidden" name="id" value="">
    <a title="닫기" class="close"></a>
    <h2></h2>
    <dl>
      <dt>과목명 (필수)</dt>
      <dd><input type="text" name="name" placeholder="예) 경제학입문" maxlength="40" class="text"></dd>
      <dt>교수명</dt>
      <dd><input type="text" name="professor" placeholder="예) 홍길동" maxlength="40" class="text"></dd>
      <dt>시간/장소</dt>
      <dd class="timeplaces">
        <div class="timeplace"><ol class="weeks"><li class="active">월</li><li>화</li><li>수</li><li>목</li><li>금</li><li>토</li><li>일</li></ol><p><select class="starthour"><option value="0">오전 0시</option><option value="1">오전 1시</option><option value="2">오전 2시</option><option value="3">오전 3시</option><option value="4">오전 4시</option><option value="5">오전 5시</option><option value="6">오전 6시</option><option value="7">오전 7시</option><option value="8">오전 8시</option><option value="9" selected="selected">오전 9시</option><option value="10">오전 10시</option><option value="11">오전 11시</option><option value="12">오후 12시</option><option value="13">오후 1시</option><option value="14">오후 2시</option><option value="15">오후 3시</option><option value="16">오후 4시</option><option value="17">오후 5시</option><option value="18">오후 6시</option><option value="19">오후 7시</option><option value="20">오후 8시</option><option value="21">오후 9시</option><option value="22">오후 10시</option><option value="23">오후 11시</option></select><select class="startminute"><option value="0">0분</option><option value="5">5분</option><option value="10">10분</option><option value="15">15분</option><option value="20">20분</option><option value="25">25분</option><option value="30">30분</option><option value="35">35분</option><option value="40">40분</option><option value="45">45분</option><option value="50">50분</option><option value="55">55분</option></select><span>~</span><select class="endhour"><option value="0">오전 0시</option><option value="1">오전 1시</option><option value="2">오전 2시</option><option value="3">오전 3시</option><option value="4">오전 4시</option><option value="5">오전 5시</option><option value="6">오전 6시</option><option value="7">오전 7시</option><option value="8">오전 8시</option><option value="9">오전 9시</option><option value="10" selected="selected">오전 10시</option><option value="11">오전 11시</option><option value="12">오후 12시</option><option value="13">오후 1시</option><option value="14">오후 2시</option><option value="15">오후 3시</option><option value="16">오후 4시</option><option value="17">오후 5시</option><option value="18">오후 6시</option><option value="19">오후 7시</option><option value="20">오후 8시</option><option value="21">오후 9시</option><option value="22">오후 10시</option><option value="23">오후 11시</option></select><select class="endminute"><option value="0">0분</option><option value="5">5분</option><option value="10">10분</option><option value="15">15분</option><option value="20">20분</option><option value="25">25분</option><option value="30">30분</option><option value="35">35분</option><option value="40">40분</option><option value="45">45분</option><option value="50">50분</option><option value="55">55분</option></select><input type="text" placeholder="예) 종303" class="text place"></p></div><a class="new"><strong>+</strong> 더 입력</a>
      </dd>
    </dl>
    <div class="clearBothOnly"></div>
    <div class="submit"><input type="submit" value="저장" class="button"></div>
  </form>
  <div id="subjects"></div>
<div id="bottom">
    <ul class="links">
      <li><a href="/page/serviceagreement">이용약관</a></li>
      <li class="privacy"><a href="/page/privacy">개인정보처리방침</a></li>
      <li><a href="/page/youthpolicy">청소년보호정책</a></li>
      <li><a href="/page/rules">커뮤니티이용규칙</a></li>
      <li><a href="/notice">공지사항</a></li>
      <li><a href="/page/faq">문의하기</a></li>
      <li class="copyright"><a href="/">© 에브리타임</a></li>
    </ul>
    <span>직업정보제공사업 신고번호 : J1204020230008</span>
  </div>
  <script type="text/javascript">
    var _serverTime = 1697890887482;
    var _clientTime = new Date().getTime();
    var _diffTime = _clientTime - _serverTime;
    var _apiServerUrl = 'https://api.everytime.kr';
    window._screenName = '시간표 - 시간표 탭';
  </script>
  <script async="" src="https://www.googletagmanager.com/gtag/js?id=G-85ZNEFVRGL"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'G-85ZNEFVRGL', { 'send_page_view': false });
    _gfn.logPageView();
  </script>

</body></html>