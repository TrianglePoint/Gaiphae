package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		MemberBean bean = new MemberBean();
		
		request.setCharacterEncoding("UTF-8");
		
		bean.setId(request.getParameter("id"));
		bean.setPw(request.getParameter("pw"));
		bean.setEmail(request.getParameter("email"));
		bean.setName(request.getParameter("name"));
		bean.setNum1(request.getParameter("num1"));
		bean.setYears(Integer.parseInt(request.getParameter("years")));
		bean.setMonth(Integer.parseInt(request.getParameter("month")));
		bean.setDay(Integer.parseInt(request.getParameter("day")));
		String[] inters = request.getParameterValues("inter");
		String inter = "";
		for(int i = 0; i < inters.length-1; i++) {
			inter += inters[0] + ", ";
		}
		inter += inters[inters.length-1];
		bean.setInter(inter);
		bean.setSelf(request.getParameter("self"));
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(dao.insertMember(bean)) {
			dao.close();
			out.println("<script>alert('회원가입 끝!'); "
					+ "location.href='./memberLogin.me'</script>");
			out.close();
			return null;
		}
		dao.close();
		out.println("<script>alert('회원가입이 안됩니다');"
				+ "location.href='./memberJoin.me';</script>");
		out.close();
		return null;
	}

}
