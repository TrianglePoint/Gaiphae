package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberInfoAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDAO dao = new MemberDAO();
		MemberBean bean = new MemberBean();
		ActionForward forward = null;
		bean.setId(request.getParameter("id"));
		bean = dao.getMember(bean);
		dao.close();
		if(bean == null) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원 정보 불러오기 실패');"
					+ "location.href='./memberList.me';</script>");
			out.close();
			return null;
		}
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/Member_into.jsp");
		request.setAttribute("memberBean", bean);
		
		return forward;
	}

}
