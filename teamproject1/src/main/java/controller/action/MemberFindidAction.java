package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberVO;

public class MemberFindidAction implements Action {

	@Override
	public void exeute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		MemberDAO mDao = MemberDAO.getInstance();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		String userid = mDao.findId(name, email);
		
		request.setAttribute("userid", userid);
		
		System.out.println("userid " + userid);
		
		request.getRequestDispatcher("member/findIdResult.jsp").forward(request, response);
	}

}
