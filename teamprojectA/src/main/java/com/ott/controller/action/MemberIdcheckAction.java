package com.ott.controller.action;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ott.dao.MemberDAO;


public class MemberIdcheckAction implements Action {

	@Override
	public void exeute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("테스트");
		
		String userid = request.getParameter("userid");
		
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.confirmID(userid);
		System.out.println(">>>" + result);
		
		request.setAttribute("userid",userid);
		request.setAttribute("result",result);
		
		request.getRequestDispatcher("member/idcheck.jsp").forward(request, response);
		
	}

}
