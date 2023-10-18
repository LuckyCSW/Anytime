$(document).ready(function(){
	let token = $("meta[name='_csrf']").attr("content");
	let header = $("meta[name='_csrf_header']").attr("content");
	
	  // 졸업필요 학점 변경 
	  $('#requiredCreditForm').submit(function(e) {
	        e.preventDefault();  // 기본 폼 제출 동작을 막음

	        let newCreditValue = $('input[name="required_credit"]').val();

	        $.ajax({
	            url: 'updateGraduateCredit',  
	            type: 'POST',
	            data: {graduate_credit: newCreditValue},
	            beforeSend: function(xhr)
	            { 
	              xhr.setRequestHeader(header, token);
	            },
	            success: function(response) {
	                // 성공적으로 업데이트 되었을 때 처리
	                console.log('Update successful');
	                $('#requiredCreditForm').hide();
	                $('div.modalwrap').remove();
	                $('div.column.acquisition p.total').text('/ ' + newCreditValue);
	            },
	             error:function(request,status,error){
	                 alert("code:"+request.status+
	    +"message:"+request.responseText+"error:"+error)
	             }
	        });
	    });
	
	
     // 졸업필요학점 모달기능
	 $('#container > div > div.chart > article > div.column.acquisition > p.total').click(function(){
		  $('#requiredCreditForm').show();
		 $('#requiredCreditForm').before('<div class="modalwrap"></div>');
	  });
	  
	  $('.close').click(function(e) {
	      e.preventDefault();
	      $('#requiredCreditForm').hide();
	      $('div.modalwrap').remove();
	  });
	  
	
	// 메뉴 선택시 기본 semester_detail이랑 semester_id 불러오기
	var semester_id
	$(".menu li").click(function(){
			var $li = $(this);
			if ($li.data('id')) {
				$li.addClass('active').siblings().removeClass('active');
			scrollToActiveMenu();
			}
			
		semester_id = $(this).data('id');
	$.ajax({
	url: 'getsemester_detail',
	type: 'GET',
	data: {semester_id: semester_id},
	success: function(data) {
		
		var totalCredit = 0; //전체 학점의 합계
        var totalMajorCredit = 0; // 전공과목에 대한 학점의 합계
        var weightedSum = 0; // 모든 과목에 대한(과목점수 * 해당 과목 학점)의 총합
        var weightedMajorSum = 0; // 전공 과목에 대한 (과목점수 * 해당 전공과목 학점)의 총합 

        // 성적에 대응하는 숫자 값 맵
        var gradeValuesMap = {
            "A+":4.5, "A0":4.3, "A-":4,
            "B+":3.5, "B0":3.3, "B-":3,
            "C+":2.5, "C0":2.3, "C-":2,
            "D+":1.5, "D0":1.3, "D-":1,
            "F": 0, "P": 0, "NP": 0
        };

        $.each(data, function(i, detail) {
    		var credit = detail.credit;
    		
    		// 해당 성적에 대응하는 숫자 값 가져오기
    		var gradeValue = gradeValuesMap[detail.grade];

    		totalCredit += credit;
    		weightedSum += gradeValue * credit;

    		if (detail.major) {
    			totalMajorCredit += credit;
    			weightedMajorSum += gradeValue * credit;
    		}
    	});

    	var gpa = (totalCredit > 0) ? (weightedSum / totalCredit).toFixed(2) : "-";
    	
        var majorGpa = (totalMajorCredit > 0) ? (weightedMajorSum / totalMajorCredit).toFixed(2) : "-";
/*=========================================================================================================*/
        $('dd.gpa').text(gpa);
        $('dd.major').text(majorGpa);
        $('dd.acquisition').text(totalCredit);
		
		/* Update the chart data
		myChart.data.labels.push(); 
	    myChart.data.datasets[0].data.push(gpa); // Add new GPA to '전체' dataset
	    myChart.data.datasets[1].data.push(majorGpa); // Add new major GPA to '전공' dataset

		
	 myChart.update();	*/ 
		
        // 받아온 데이터로 subject테이블 만들기 
        var tbody = $('.subjects tbody');
        tbody.empty();  // 기존 행들 삭제
        
        var grades = ["A+", "A0", "A-", "B+", "B0", "B-", "C+", "C0", "C-", "D+", "D0", "D-", "F", "P", "NP"];
        
        $.each(data, function(i, detail) {
        $('#container > div > table > caption > h3').text(detail.semester_name);  
        	var gradeOptions = '';
            $.each(grades, function(i, grade) {
                gradeOptions += '<option value="' + grade + '"' + (grade === detail.grade ? ' selected' : '') + '>' + grade + '</option>';
            });
            var row = '<tr data-id="' + detail.semester_detail_id + '">' +
                '<td><input name="name" maxlength="50" value="' + detail.subject + '"></td>' +
                '<td><input name="credit" type="number" maxlength="4" min="0" value ="' + detail.credit + '" ></td>' +
                '<td><select name="grade"><option value="' + detail.grade + '" selected="selected">'+ gradeOptions + '</select></td>' +
                '<td><label><input name="major" type="checkbox"' +(detail.major ? ' checked' : '')+'><span></span></label></td>' +
            '</tr>';
            tbody.append(row);
	         });
            }
         });
	   });
	
  $(".menu li").first().trigger('click');
	
  // 더 입력하기 클릭
  $(".new").click(function() {
	    var tbody = $('.subjects tbody');
	    var grades = ["A+", "A0", "A-", "B+", "B0", "B-", "C+", "C0", "C-", 
	                  "D+", "D0",  "D-", "F", "P", "NP"];
	    
	    var gradeOptions = '';
	    $.each(grades, function(i, grade) {
	        gradeOptions += '<option value="' + grade + '">' + grade + '</option>';
	    });
	    
	    var row = '<tr>' +
	        '<td><input name="name" maxlength="50"></td>' +
	        '<td><input name="credit" type="number" maxlength="4" min="0" value ="0"></td>' +
	        '<td><select name="grade">' + gradeOptions + '</select></td>' +
	        '<td><label><input name="major" type ="checkbox"><span></span></label></td>' +
	    '</tr>';
	    
	    tbody.append(row);
	});	
	
   
  // subject 항목 변경될때 
  function updateField(e) {
      var $target = $(e.target);
      var $row = $target.closest('tr');
      
      var semester_detail_id = $row.data('id');
      
      var subject = $row.find('input[name="name"]').val();
      var credit = $row.find('input[name="credit"]').val();
      var grade = $row.find('select[name="grade"]').val();
      var major = $row.find('input[name="major"]').prop('checked');
      
 
      $.ajax({
          url: 'updatesemester_detail',
          type: 'POST',
          async: false, // 동기적으로 일어나라 
          data: {
        	  semester_detail_id: semester_detail_id,
              semester_id: semester_id,
              subject: subject,
              credit: credit,
              grade: grade,
              major: major
          },
          dataType:"json",
          beforeSend: function(xhr)
          { // 데이터를 전송하기 전에 헤더에 csrf 값을 설정합니다.
            xhr.setRequestHeader(header, token);
          },
          success: function(data) {
              console.log(data);
              
              // 성적 업데이트 후 평균 점수 다시 계산
              var totalCredit = 0;
              var totalMajorCredit = 0;
              var weightedSum = 0;
              var weightedMajorSum = 0;
              
              var gradeValueMap = 
            	  { "A+":4.5, "A0":4.3, "A-":4, "B+":3.5, "B0":3.3, "B-":3,
            		"C+":2.5, "C0":2.3, "C-":2, "D+":1.5, "D0":1.3, "D-":1,
            		"F":0, "P":0, "NP":0};
              
              $('.subjects tbody tr').each(function() {
                  var $row = $(this);
                  var credit = Number($row.find('input[name="credit"]').val());
                  var gradeValue = gradeValueMap[$row.find('select[name="grade"]').val()];
                  var major = $row.find('input[name="major"]').prop('checked');
                  
                  totalCredit += credit;
                  weightedSum += gradeValue * credit;

                  if (major){
                      totalMajorCredit += credit;
                      weightedMajorSum += gradeValue * credit;
                  }
              });
              var gpa = (totalCredit > 0) ? (weightedSum / totalCredit).toFixed(2) : "-";
              var majorGpa = (totalMajorCredit > 0) ? (weightedMajorSum / totalMajorCredit).toFixed(2) : "-";

  	        $('dd.gpa').text(gpa);
  	        $('dd.major').text(majorGpa);
  	        $('dd.acquisition').text(totalCredit);
  	        
	  	    $('.column.gpa .value').text(data.totalgpa);
	        $('.column.major .value').text(data.totalmajor);
	        $('.column.acquisition .value').text(data.totalAcquisition);
          }
     });
  }
//초기화 버튼 클릭 이벤트 핸들러
  $('.reset').click(function() {

      // 알림 창 표시 
      var confirmReset = confirm("해당 학기의 정보가 모두 초기화됩니다. 계속하시겠습니까?");
      
      if(confirmReset) {
      $('.subjects tbody tr').each(function() {
          var $row = $(this);
          var semester_detail_id = $row.data('id');

          // 초기값 설정
          var subject = "";
          var credit = "0";
          var grade = "A+";
          var major = false; 

          $.ajax({
              url: 'updatesemester_detail',
              type: 'POST',
              async: false,
              data: {
                  semester_detail_id: semester_detail_id,
                  semester_id: semester_id,
                  subject: subject,
                  credit: credit,
                  grade: grade,
                  major: major
              },
              beforeSend:function(xhr){
                 xhr.setRequestHeader(header,token);
              },
              success: function(data) {
                  console.log(data);
                  
                  // 성적 업데이트 후 평균 점수 다시 계산
                  var totalCredit = 0;
                  var totalMajorCredit = 0;
                  var weightedSum = 0;
                  var weightedMajorSum = 0;
                  
                  var gradeValueMap = 
                	  { "A+":4.5, "A0":4.3, "A-":4, "B+":3.5, "B0":3.3, "B-":3,
                		"C+":2.5, "C0":2.3, "C-":2, "D+":1.5, "D0":1.3, "D-":1,
                		"F":0, "P":0, "NP":0};
                  
                  $('.subjects tbody tr').each(function() {
                      var $row = $(this);
                      var credit = Number($row.find('input[name="credit"]').val());
                      var gradeValue = gradeValueMap[$row.find('select[name="grade"]').val()];
                      var major = $row.find('input[name="major"]').prop('checked');
                      
                      totalCredit += credit;
                      weightedSum += gradeValue * credit;

                      if (major){
                          totalMajorCredit += credit;
                          weightedMajorSum += gradeValue * credit;
                      }
                  });
                  var gpa = (totalCredit > 0) ? (weightedSum / totalCredit).toFixed(2) : "-";
                  var majorGpa = (totalMajorCredit > 0) ? (weightedMajorSum / totalMajorCredit).toFixed(2) : "-";

      	        $('dd.gpa').text(gpa);
      	        $('dd.major').text(majorGpa);
      	        $('dd.acquisition').text(totalCredit);
      	        
    	  	    $('.column.gpa .value').text(data.totalgpa);
    	        $('.column.major .value').text(data.totalmajor);
    	        $('.column.acquisition .value').text(data.totalAcquisition);
    	   
    	   
    	        location.reload();
    	        }
             });
         });
     }
  });
  
  
  // 각 입력 필드에 change 이벤트 핸들러 추가
  $('.subjects').on('change', 'input, select', updateField);
  updateField();
  
});
	
	function scrollToActiveMenu() {
        console.log("scrollTo");
        var $menu = $('.menu');
        if (!$menu.is(':has(li.active)')) {
            return false;
        }
        $menu.scrollLeft(0);
       var left = Math.floor($menu.find('li.active').position().left) - 50;
       $menu.scrollLeft(left);
   }

	