<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String sql = "select * from member where id=?";
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
    
}catch (SQLException e) { // 예외처리
    out.println("err:"+e.toString());
} 
%>


<table width="700" height="400" border="2"  align="center" cellspacing="0">

       <tr height="10" align="center">

           <td colspan="2" style="background:pink;" ><font color=white font size="4"><b>회원기본정보</b></font></td>

       </tr>

       <tr>

           <td><b>아이디:</b></td>

           <td><%=rs.getString("id") %></td>

       </tr>

       <tr>

           <td><b>비번:</b></td>

           <td><%=rs.getString("pw") %></td>

       </tr>

       <tr>

           <td><b>메일주소:</b></td>

           <td><%=rs.getString("email") %></td>

       </tr>

       <tr>

           <td><b>이름:</b></td>

           <td><%=rs.getString("name") %></td>

       </tr>

       <tr  height="10" align="center">

           <td colspan="2" style="background:pink;"><font color=white font size="4"><b>개인정보</b></font></td>

       </tr>

       <tr>

           <td><b>주민등록번호:</td>

           <td><%=rs.getString("num1") %> </td>

       </tr>

       <tr>

           <td><b>생일:</b></td>

           <td>
	<%=rs.getString("years") %>
	<%=rs.getString("month") %>
	<%=rs.getString("day") %>

           </td>

       </tr>

       <tr>

           <td><b>관심분야:</b></td>

           <td>

             <%=rs.getString("inter") %>

           </td>

       </tr>

       <tr>

           <td>

               <b>자기소개:</b>

           </td>
<td>
           <%=rs.getString("self") %>
</td>
       </tr>

   </table>

</body>
</html>