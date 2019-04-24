
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="javax.naming.*" %>
    <% request.setCharacterEncoding("UTF-8");%>
    <%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String email = request.getParameter("email");
    String name = request.getParameter("name");
    String num1 = request.getParameter("num1");
    String years = request.getParameter("years");
    String month = request.getParameter("month");
    String day = request.getParameter("day");
    String inter[] = request.getParameterValues("inter");
    String inte = "";
    for(int i= 0; i<inter.length;i++){
       if(i!=inter.length-1){
          inte= inte+inter[i]+",";
       }else{
          inte= inte+inter[i];
       }
    }
    String self = request.getParameter("self");
    String sql= "insert into member values (?,?,?,?,?,?,?,?,?,?)";
    String sql1= "select id from member";
    Connection conn= null;
    try{
       Context init = new InitialContext();
       DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
       conn= ds.getConnection();
       PreparedStatement pstmt= conn.prepareStatement(sql1);
       ResultSet rs= pstmt.executeQuery();
       while(rs.next()){
          String id1 = rs.getString(1);
          if (id.equals(id1)){
             out.println("<script>alert('아이디가 중복됩니다.');history.back(); </script>");
          }
       }
       pstmt= conn.prepareStatement(sql);
       pstmt.setString(1, id);
       pstmt.setString(2, pw);
       pstmt.setString(3, email);
       pstmt.setString(4, name);
       pstmt.setString(5, num1);
       pstmt.setString(6, years);
       pstmt.setString(7, month);
       pstmt.setString(8, day);
       pstmt.setString(9, inte);
       pstmt.setString(10, self);
       
       pstmt.executeUpdate();
       out.println("<script>alert('가입이 완료되었습니다.'); </script>");
       response.sendRedirect("loginForm.jsp");
       
    }catch(Exception e){
       
       e.printStackTrace();
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2><%=name %>님 환영합니다.</h2>
<a href="loginForm.jsp">로그인 하러가기</a>

</body>
</html>