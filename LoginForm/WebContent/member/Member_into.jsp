<%@page import="net.member.db.MemberBean"%>
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
MemberBean bean = (MemberBean)request.getAttribute("memberBean");
%>


<table width="700" height="400" border="2"  align="center" cellspacing="0">

       <tr height="10" align="center">

           <td colspan="2" style="background:pink;" ><font color=white font size="4"><b>회원기본정보</b></font></td>

       </tr>

       <tr>

           <td><b>아이디:</b></td>

           <td><%=bean.getId()%></td>

       </tr>

       <tr>

           <td><b>비번:</b></td>

           <td><%=bean.getPw()%></td>

       </tr>

       <tr>

           <td><b>메일주소:</b></td>

           <td><%=bean.getEmail()%></td>

       </tr>

       <tr>

           <td><b>이름:</b></td>

           <td><%=bean.getName()%></td>

       </tr>

       <tr  height="10" align="center">

           <td colspan="2" style="background:pink;"><font color=white font size="4"><b>개인정보</b></font></td>

       </tr>

       <tr>

           <td><b>주민등록번호:</td>

           <td><%=bean.getNum1()%> </td>

       </tr>

       <tr>

           <td><b>생일:</b></td>

           <td>
	<%=bean.getYears() %>
	<%=bean.getMonth()%>
	<%=bean.getDay()%>

           </td>

       </tr>

       <tr>

           <td><b>관심분야:</b></td>

           <td>

             <%=bean.getInter()%>

           </td>

       </tr>

       <tr>

           <td>

               <b>자기소개:</b>

           </td>
<td>
           <%=bean.getSelf()%>
</td>
       </tr>

   </table>

</body>
</html>