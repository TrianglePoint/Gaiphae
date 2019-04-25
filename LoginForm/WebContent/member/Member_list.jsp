<%@page import="net.member.db.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

position: absolute; top: 200px; left: 235px; right: 30px;
text-align:center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class = "entry">
<h1 class = "title"/>

<%
List<MemberBean> beans = (List<MemberBean>)request.getAttribute("memberBeanList");
%><table border="1" cellspacing="0">
<tr>
<td>ID</td>
<td>Name</td>
<td>삭제</td>
</tr>
<%
    for(MemberBean bean : beans) {
%><tr>

<td><a href ="./memberInfo.me?id=<%= bean.getId() %>"><%= bean.getId() %></a></td>
<td><%=bean.getName()%></td>
<td>
<a href ="./memberDelete.me?id=<%= bean.getId() %>">삭제하기</a></a> 
</td>
</tr>
<%
    }
%></table></div>

</body>
</html>