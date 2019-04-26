package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDAO dao = new MemberDAO();
		MemberBean bean = new MemberBean();
		bean.setId(request.getParameter("id"));
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(dao.deleteMember(bean)) {
			dao.close();
			out.println("<script>alert('삭제 끝!');"
					+ "location.href='./memberList.me';</script>");
			out.close();
			return null;
		}
		dao.close();
		out.println("<script>alert('삭제가 안됩니다');"
				+ "location.href='./memberList.me';</script>");
		out.close();
		return null;
	}

}
