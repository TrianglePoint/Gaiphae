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
	background-image : url('login.JPG'); 
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
String sql = "select id,name from member";
Connection conn= null;
ResultSet rs   = null;
PreparedStatement pstmt =null;

try { 
   Context init = new InitialContext();
    DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
    conn = ds.getConnection();
    pstmt= conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
%><table border="1" cellspacing="0">
<tr>
<td>ID</td>
<td>Name</td>
<td>삭제</td>
</tr>
<%
    while(rs.next()) {
%><tr>

<td><a href ="./Member_into.jsp?id=<%= rs.getString("id") %>"><%= rs.getString("id") %></a></td>
<td><%=rs.getString("name")%></td>
<td>
<a href ="./Member_delete.jsp?id=<%= rs.getString("id") %>">삭제하기</a></a> 
</td>
</tr>
<%
    }
%></table></div>
<%
} catch (SQLException e) { // 예외처리
      out.println("err:"+e.toString());
} 
%>

</body>
</html>