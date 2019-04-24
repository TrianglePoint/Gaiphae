<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style>

.entry{
	width : 846px;
	height :648px;  
	overflow: hidden; 
	background-image : url('member.jpg'); 
	margin-top: 50;
	}
h1.title{
	max-width : 100%;
	height : auto;
	text-shadow : 1px 1px 2px #666666;
	color : black; 
	padding-top : 300px; 
	text-align : center;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class = "entry">
<h1 class = "title"><%=session.getAttribute("id")%>님 안녕하세요?</h1>
</div>

<!-- <img src="sky.jpg"  style="max-width: 100%; height: auto; text-shadow: ">
background="sky.jpg" style="text-align: center;" width="1500" height="700" -->



</body>
</html>