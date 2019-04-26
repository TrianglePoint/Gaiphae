package net.member.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		List<MemberBean> beans = null;
		ActionForward forward = null;

		beans = dao.getMemberList();
		dao.close();
		if(beans == null) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원 목록 불러오기 실패');"
					+ "location.href='./BoardList.bo';</script>");
			out.close();
			return null;
		}
		request.setAttribute("memberBeanList", beans);
		forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/Member_list.jsp");
		return forward;
	}

}
