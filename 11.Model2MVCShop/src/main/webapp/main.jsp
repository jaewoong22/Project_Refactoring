<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
  
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
	<!-- font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
	<!-- Fullcalendar -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
	
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
	
<style>
body>div.container{
	padding-top : 100px;
	font-family: 'Nanum Myeongjo', serif;
}
div.carousel{
	font-family: 'Nanum Myeongjo', ser
}
</style>  	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->

<script>
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridMonth', // �ʱ� �ε� �ɶ� ���̴� Ķ���� ȭ��(�⺻ ����: ��)
		events:[
			{
				title:'��� Ʈ���� �԰�',
				start:'2022-05-04',
				end:'2022-05-05'
			},
			{
				title:'���� �Ǹ� �̺�Ʈ',
				start:'2022-05-20',
				end:'2022-05-25'
			}
		],
	headerToolbar : { // ����� ǥ���� �� ��
			start : 'prev next today',
			center : 'title',
			left:'addEventButton',


			end : 'dayGridMonth,dayGridWeek,dayGridDay'
		},
		titleFormat : function(date) {
			return date.date.year + '�� ' + (parseInt(date.date.month) + 1) + '��';
		}, customButtons: {
            addEventButton: { // �߰��� ��ư ����
                text : "���� �߰�",  // ��ư ����
                click : function(){ // ��ư Ŭ�� �� �̺�Ʈ �߰�
                    $("#calendarModal").modal("show"); // modal ��Ÿ����

                    $("#addCalendar").on("click",function(){  // modal�� �߰� ��ư Ŭ�� ��
                        var content = $("#calendar_content").val();
                        var start_date = $("#calendar_start_date").val();
                        var end_date = $("#calendar_end_date").val();
                        
                        //���� �Է� ���� Ȯ��
                        if(content == null || content == ""){
                            alert("������ �Է��ϼ���.");
                        }else if(start_date == "" || end_date ==""){
                            alert("��¥�� �Է��ϼ���.");
                        }else if(new Date(end_date)- new Date(start_date) < 0){ // date Ÿ������ ���� �� Ȯ��
                            alert("�������� �����Ϻ��� �����Դϴ�.");
                        }else{ // �������� �Է� ��
                            var obj = {
                                "title" : content,
                                "start" : start_date,
                                "end" : end_date
                            }//������ ��ü ����

                            console.log(obj); //������ �ش� ��ü�� �����ؼ� DB ���� ����
                        }
                    });
                }
            }
        },


		//initialDate: '2021-07-15', // �ʱ� ��¥ ���� (�������� ������ ���� ��¥�� ���δ�.)
		selectable : true, // �޷� ���� �巡�� ��������
		droppable : true,
		editable : true,
		nowIndicator: true, // ���� �ð� ��ũ
		locale: 'ko' // �ѱ��� ����
	});
	calendar.render();
});
</script>	 	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
<div class="container">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
		<li data-target="#myCarousel" data-slide-to="4"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <img class="first-slide" src="/images/homedeco/main30.jpg"  alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h2 align="left"><strong>���̺� ��<br/>���� ��ȭ</strong></h2>
              <h4 align="left">TABLEWARE</h4>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="/images/homedeco/main32.jpg" alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h2 align="left" ><strong>����ϰ�<br/>�ǿ�����<br/>����</strong></h2>
              <h4 align="left" >RITTEN</h4>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="/images/homedeco/main09.jpg" alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
             <h2 align="left" ><strong>��ä��<br/>Ȯ��� �帧</strong></h2>
              <h4 align="left" >POTTERY</h4>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="fourth-slide" src="/images/homedeco/main04.jpg" alt="fourth slide">
          <div class="container">
            <div class="carousel-caption">
              <h2 align="left"><strong>�� �� �ȿ�<br/>���� ������</strong></h2>
              <h4 align="left">LAMP</h4>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="fifth-slide" src="/images/homedeco/main31.jpg" alt="fifth slide">
          <div class="container">
            <div class="carousel-caption">
              <h2 align="left"><strong>�Բ� ������<br/>���� ����</strong></h2>
              <h4 align="left">LUG</h4>
            </div>
          </div>
        </div>
        
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->
    
    <hr/>
    <c:if test="${user.role=='admin' }">
      <div id='calendar'></div>
		 <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		        aria-hidden="true">
		        <div class="modal-dialog" role="document">
		            <div class="modal-content">
		                <div class="modal-header">
		                    <h5 class="modal-title" id="exampleModalLabel">������ �Է��ϼ���.</h5>
		                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                        <span aria-hidden="true">&times;</span>
		                    </button>
		                </div>
		                <div class="modal-body">
		                    <div class="form-group">
		                        <label for="taskId" class="col-form-label">���� ����</label>
		                        <input type="text" class="form-control" id="calendar_content" name="calendar_content">
		                        <label for="taskId" class="col-form-label">���� ��¥</label>
		                        <input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date">
		                        <label for="taskId" class="col-form-label">���� ��¥</label>
		                        <input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
		                    </div>
		                </div>
		                <div class="modal-footer">
		                    <button type="button" class="btn btn-warning" id="addCalendar">�߰�</button>
		                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
		                        id="sprintSettingModalClose">���</button>
		                </div>
		
		            </div>
		        </div>
		    </div>
		    
		    <hr/>
    </c:if>

</div>


</body>

</html>