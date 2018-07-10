<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setDateHeader("Expires", 0);
	response.setHeader("Cache-Control", "no-Cache");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="resources/css/order.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    	var list;
    	
    	$(function(){
    		list = ${anaList};
    		$("#startMonth").val("20"+String("<%=request.getParameter("startDate")%>").replace("/", "-"));
    		$("#endMonth").val("20"+String("<%=request.getParameter("endDate")%>").replace("/", "-"));
    		$("#startMonthLocal").val("20"+String("<%=request.getParameter("startDate")%>").replace("/", "-"));
    		$("#endMonthLocal").val("20"+String("<%=request.getParameter("endDate")%>").replace("/", "-"));
    		drawChart();
    	})
    	
    	function test(){
    		alert($("#startMonth").val());
    	}
    	
    	google.charts.load('current', {'packages':['corechart']});
    	google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  if(list[0] == null){
    		  $("#chart").text("해당 데이터가 없습니다.");
    	  } else {
    	  var array = new Array();
    	  
    	  for(var i=0 ; i<=list.length ; i++){
    		  if(i == 0){
    			  array[i] = ['Year&month', '판매량'];
    		  } else {
    			  array[i] = [String(list[i-1].search_date), Number(list[i-1].search_avg)];
    		  }
    	  }
    	  
          var data = google.visualization.arrayToDataTable(array);

          var options = {
            title: '${g_name}',
            legend: { position: 'bottom' }
          };

          var chart = new google.visualization.LineChart(document.getElementById('chart'));

          chart.draw(data, options);
    	  }
      }
      
      function myAna(){
    	  var startDate = String($("#startMonth").val()).substring(2, 7).replace("-", "/");
    	  var endDate = String($("#endMonth").val()).substring(2, 7).replace("-", "/");
    	  
    	  $.ajax({
    		  url: "myStoreAnalysis.order?g_name=${g_name}&i_id=${loginPerson.i_id}&startDate="+startDate+"&endDate="+endDate,
    		  success: function(res){
    			  list = JSON.parse(String(res));
    			  drawChart();
    		  },
    		  error: function(){
    			  alert("통신 에러");
    		  }
    	  })
      }
      
      function localAna(){
    	  var startDate = String($("#startMonthLocal").val()).substring(2, 7).replace("-", "/");
    	  var endDate = String($("#endMonthLocal").val()).substring(2, 7).replace("-", "/");
    	  
    	  $.ajax({
    		  url: "localStoreAnalysis.order?g_name=${g_name}&i_id=${loginPerson.i_id}&startDate="+startDate+"&endDate="+endDate,
    		  success: function(res){
    			  list = JSON.parse(String(res));
    			  drawChart();
    		  },
    		  error: function(){
    			  alert("통신 에러");
    		  }
    	  })
      }
      
      function toggleAna(){
    	  $("#myAna").toggle();
    	  $("#localAna").toggle();
      }
      
      function showLocal(){
    	  toggleAna();
    	  localAna();
      }
      
      function showMy(){
    	  toggleAna();
    	  myAna();
      }
    </script>
    <style type="text/css">
    	#chart{
    		margin: auto;
    	}
    	
    	h1, h2{
    		display: inline-block;
    	}
    	
    	#btn_localAna, #btn_myAna{
    		float: right;
    		margin-top: 20px;
    	}
    	
    	.anaMonth{
    		margin-left: 10px;
    		margin-right: 10px;
    	}
    	
    	#localAna{
    		display: none;
    	}
    </style>
<title>판매 분석</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<div id="area">
		<div id="myAna">
		<h1>${g_name}</h1><h2>의 기간별 분석</h2>
		<input type="month" class="anaMonth" id="startMonth" onchange="myAna()"> <b>~</b> <input type="month" class="anaMonth" id="endMonth" onchange="myAna()">
		<button class="btn btn-primary btn-lg" id="btn_localAna" onclick="showLocal()">동일 지역 판매 분석</button>
		</div>
		<div id="localAna">
		<h1>${g_name}</h1><h2>의 동일 지역 분석</h2>
		<input type="month" class="anaMonth" id="startMonthLocal" onchange="localAna()"> <b>~</b> <input type="month" class="anaMonth" id="endMonthLocal" onchange="localAna()">
		<button class="btn btn-primary btn-lg" id="btn_myAna" onclick="showMy()">내 점포 기간별 분석</button>
		</div>
		<div id="chart" style="width: 900px; height: 500px"></div>
	</div>
	
</body>
</html>