<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String sql = "delete member where id=?";
Connection conn= null;
ResultSet rs   = null;
PreparedStatement pstmt =null;
try { 
   Context init = new InitialContext();
    DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
    conn = ds.getConnection();
    pstmt= conn.prepareStatement(sql);
    pstmt.setString(1, request.getParameter("id"));
    rs = pstmt.executeQuery();
      rs.next();
  
}catch(SQLException e){
   out.println("err:"+e.toString());
   
}
    %>
<style>

.entry{
	width : 842px;
	height :653px;  
	overflow: hidden; 
	background-image : url('admin.JPG'); 
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
a.title{
	max-width : 100%;
	height : auto;
	text-shadow : 1px 1px 2px ;
	color : black; 
	padding-top : 300px; 
	text-align : center;
}
a.table {

position: absolute; top: 450px; left : 0px; right:100px;
text-align:center;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class = "entry">
    <h1 class="title">삭제완료되었습니다</h1><br>
   <a href="Member_list.jsp" class="table">돌아가기</a>
    </div>
</body>
</html>