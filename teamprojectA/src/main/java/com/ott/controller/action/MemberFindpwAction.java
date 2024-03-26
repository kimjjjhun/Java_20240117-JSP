package com.ott.controller.action;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ott.dao.MemberDAO;


public class MemberFindpwAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		MemberDAO mDao = MemberDAO.getInstance();
		
		String userid = request.getParameter("userid");
		String email = request.getParameter("email");
		
		String pwd = mDao.findPw(userid, email);
		
		request.setAttribute("pwd", pwd);
		
		System.out.println(" pwd " + pwd);
		
		request.getRequestDispatcher("member/FindPwResult.jsp").forward(request, response);
	}

}
