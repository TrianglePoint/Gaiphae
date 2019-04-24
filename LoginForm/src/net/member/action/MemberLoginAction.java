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
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(dao.checkLogin(bean)) {
			forward.setRedirect(true);
			forward.setPath("./BoardList.bo");
			HttpSession session = request.getSession();
			session.setAttribute("id", bean.getId());
			dao.close();
			return forward;
		}
		
		forward.setRedirect(true);
		forward.setPath("./memberLogin.me");
		
		dao.close();
		return forward;
	}

}
