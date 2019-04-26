package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		MemberBean bean = new MemberBean();
		
		bean.setId(request.getParameter("id"));
		bean.setPw(request.getParameter("pw"));
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		if(dao.checkLogin(bean)) {;
			dao.close();
			HttpSession session = request.getSession();
			session.setAttribute("id", bean.getId());
			
			out.println("<script>alert('환영! " + bean.getId() + "');"
					+ "location.href='./BoardList.bo';</script>");
			out.close();
			return null;
		}
		dao.close();
		out.println("<script>alert('로그인 실패!');"
				+ "location.href='./memberLogin.me';</script>");
		out.close();
		return null;
	}

}
