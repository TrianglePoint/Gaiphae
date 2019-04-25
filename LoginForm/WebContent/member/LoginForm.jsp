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
	background-image : url('./image/login.JPG'); 
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
table {

position: absolute; top: 250px; left: 170px; right: 30px;
text-align:center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class = "entry">
<h1 class = "title"/>
</div>
<form action="memberLoginAction.me" method="post">
<table width="620" height="50" border="0"  cellspacing="1">
<tr>
 <td align="center" colspan="2"><font color=white size="5em"><p class="np">로그인</p></font></td>
</tr>

<tr>
<td>아이디</td>
<td><input type="text" name="id" style="width:250px" autofocus></td>
</tr>

<tr>
<td>비밀번호</td>
<td><input type="password" name="pw" style="width:250px"></td>
</tr>


<tr>
<td colspan="2"><br><br>
<input type="submit" value="로그인"><br><br>
<a href="./memberJoin.me">회원가입</a></td>
</tr>
</table>
</form>
</body>
</html>